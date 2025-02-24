local module = 'nyo_robbery'
local traceback = debug.traceback()
local valid_traceback = string.format('@nfw/modules/%s/server.lua', module)

if traceback:find(valid_traceback) then
    Nfw.registerNyoModule(module, "1.0.3", {"nyo_core"}, false, function()
        local robberyWantedRobbery = {}
        local robberyWantedPerson = {}
        local blipsRobbery = {}

        NyoFw.checkWanted = function(user_id)
            if robberyWantedPerson[user_id] then
                NfwGlobalFunctions.notify(source, 'Erro',
                  'Você esta sendo procurado por mais: ' .. robberyWantedPerson[user_id] .. ' segundos.', "#FF0000",
                  5000)
                return true
            else
                return false
            end
        end

        NyoFw.setWanted = function(user_id, time)
            if robberyWantedPerson[user_id] then
                robberyWantedPerson[user_id] = tonumber(robberyWantedPerson[user_id] + tonumber(time))
            else
                robberyWantedPerson[user_id] = tonumber(time)
            end
        end

        exports("checkWanted", NyoFw.checkWanted)
        exports("setWanted", NyoFw.setWanted)

        RPC.addHandler('robbery-getModuleItem', function (src, item, qtd)
            return NyoFw.tryGetInventoryItem(NyoFw.getCharId(src), item, qtd)
        end)

        RPC.addHandler('robbery-robberyResetCooldown', function (source, config, index)
            local stbType = config.robberyStandByType
            if robberyWantedRobbery[config.robberyIndex] then
                if stbType == 1 then
                    if robberyWantedRobbery[config.robberyIndex][index] then
                        robberyWantedRobbery[config.robberyIndex][index] = nil
                    end

                elseif stbType == 2 then
                    if robberyWantedRobbery[config.robberyIndex] then
                        robberyWantedRobbery[config.robberyIndex] = nil
                    end
                else
                    NfwGlobalFunctions.notify(source, 'Erro', 'Erro no sistema de segurança! Contate a prefeitura.', "#FF0000", 5000)
                end
            end
        end)

        RPC.addHandler('robbery-robberySvCheck', function (source, config, index)
            local user_id = NyoFw.getCharId(source)
            local stbType = config.robberyStandByType
            local stbCheckStand = config.robberyCheckStandBy
            local standyPerson = false
            if stbCheckStand then
                if robberyWantedPerson[user_id] then
                    NfwGlobalFunctions.notify(source, 'Erro',
                      'Você esta sendo procurado por mais: ' .. robberyWantedPerson[user_id] .. ' segundos.',
                      "#FF0000", 5000)
                    standyPerson = true
                end
            end

            if not standyPerson then
                if robberyWantedRobbery[config.robberyIndex] then
                    if stbType == 1 then
                        if robberyWantedRobbery[config.robberyIndex][index] then
                            NfwGlobalFunctions.notify(source, 'Erro',
                              'Um roubo ja ocorreu! Impossivel efetuar outro roubo! Volte em: ' ..
                                robberyWantedRobbery[config.robberyIndex][index] .. ' segundos.', "#FF0000", 5000)
                            return false
                        else
                            robberyWantedRobbery[config.robberyIndex][index] = tonumber(config.robberyStandByRobbery)
                            return true
                        end

                    elseif stbType == 2 then
                        if robberyWantedRobbery[config.robberyIndex] then
                            NfwGlobalFunctions.notify(source, 'Erro',
                              'Um roubo ja ocorreu! Impossivel efetuar outro roubo! Volte em: ' ..
                                robberyWantedRobbery[config.robberyIndex] .. ' segundos.', "#FF0000", 5000)
                        else
                            robberyWantedRobbery[config.robberyIndex] = tonumber(config.robberyStandByRobbery)
                            return true
                        end
                    else
                        NfwGlobalFunctions.notify(source, 'Erro', 'Erro no sistema de segurança! Contate a prefeitura.', "#FF0000", 5000)
                        return false
                    end
                else
                    if stbType == 1 then
                        if not robberyWantedRobbery[config.robberyIndex] then
                            robberyWantedRobbery[config.robberyIndex] = {}
                        end
                        robberyWantedRobbery[config.robberyIndex][index] = tonumber(config.robberyStandByRobbery)
                    elseif stbType == 2 then
                        robberyWantedRobbery[config.robberyIndex] = tonumber(config.robberyStandByRobbery)
                    end
                    return true
                end
            else
                return false
            end
        end)

        RPC.addHandler('robbery-robberySetStandby', function (source, config, index)
            local user_id = NyoFw.getCharId(source)
            local stbType = config.robberyStandByType
            if robberyWantedRobbery[config.robberyIndex] then
                if stbType == 1 then
                    if robberyWantedRobbery[config.robberyIndex][index] then

                    else
                        robberyWantedRobbery[config.robberyIndex][index] = tonumber(config.robberyStandByRobbery)
                    end

                elseif stbType == 2 then
                    if robberyWantedRobbery[config.robberyIndex] then

                    else
                        robberyWantedRobbery[config.robberyIndex] = tonumber(config.robberyStandByRobbery)
                    end
                end
            else
                if stbType == 1 then
                    robberyWantedRobbery[config.robberyIndex][index] = tonumber(config.robberyStandByRobbery)
                elseif stbType == 2 then
                    robberyWantedRobbery[config.robberyIndex] = tonumber(config.robberyStandByRobbery)
                end
            end
            local  robbery = 'Webhook'

            function SendWebhookMessage(webhook,message)
                if webhook ~= nil and webhook ~= "" then
                    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
                end
            end
            
            SendWebhookMessage(robbery,
              "```prolog\nRoubo Iniciado.\n[INDEX]: " .. config.robberyIndex .. "\n[LOCATE ID]" .. index ..
                "\n[USER ID]: " .. user_id .. " " .. os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S") .. " \r```")
        end)

        CreateThread(function()
            while true do
                Wait(1000)
                for k, v in pairs(robberyWantedRobbery) do
                    local type = type(robberyWantedRobbery[k])
                    if type == 'number' then
                        robberyWantedRobbery[k] = robberyWantedRobbery[k] - 1
                        if robberyWantedRobbery[k] == 0 then
                            robberyWantedRobbery[k] = nil
                        end
                    elseif type == 'table' then
                        for k2, v2 in pairs(robberyWantedRobbery[k]) do
                            robberyWantedRobbery[k][k2] = robberyWantedRobbery[k][k2] - 1
                            if robberyWantedRobbery[k][k2] == 0 then
                                robberyWantedRobbery[k][k2] = nil
                            end
                        end
                    end
                end
            end
        end)

        CreateThread(function()
            while true do
                Wait(1000)
                for k, v in pairs(robberyWantedPerson) do
                    if v > 0 then
                        robberyWantedPerson[k] = robberyWantedPerson[k] - 1
                    else
                        robberyWantedPerson[k] = nil
                    end
                end
            end
        end)

        RPC.addHandler('robbery-robberyCheckPolice',function (source, config)
            local policia = NyoFw.getUsersByPermission(NfwConfigs.robberyGeneralConfig.policePermission)
            if config.qtdPolice <= #policia then
                return true
            else
                NfwGlobalFunctions.notify(source, 'Erro', 'Numero insuficiente de policiais.', "#FF0000", 5000)
                return false
            end
        end)

        SafeEvents.register('robbery-robberyAlertPolice', function (source, config, x, y, z)
            local source = source
            local policia = NyoFw.getUsersByPermission(NfwConfigs.robberyGeneralConfig.policePermission)
            local chamaPolicia = math.random(0, 100)
            if chamaPolicia <= config.policeChance then
                for l, w in pairs(policia) do
                    local player = NyoFw.getUserSource(w)
                    if player then
                        SafeEvents.triggerClient('nfw:notificacao', player, x, y, z, 1, 59, 0.5, 20000, config.policeText, true, 5, 144, 242, true, true,"COPOM:")
                        NfwGlobalFunctions.notify(player, 'Importante',config.policeText..'</b>.', '#00FF00', 10000)
                    end
                end
            end
        end)

        RPC.addHandler('robbery-robberyPayment', function (source, config, time)
            local source = source
            local user_id = NyoFw.getCharId(source)
            local timeR = config.robberyTime
            local porcent = math.floor(tonumber((time * 100) / timeR))

            if config.robberySetStandBy then
                setStandBy(user_id, tonumber(config.robberyWantedPerson))
            end

            if config.paymentType.money then
                local rMoney = math.random(config.paymentMoney.min, config.paymentMoney.max)
                local reward = math.floor(tonumber((rMoney / 100) * porcent))
                if reward > 0 then
                    NyoFw.giveMoney(user_id, reward)
                end
            end

            if config.paymentType.item then
                if config.paymentItemType == 1 then
                    local rItem = math.random(#config.paymentItem)
                    local rItem2 = math.random(config.paymentItem[rItem].min, config.paymentItem[rItem].max)
                    local reward = math.floor(tonumber((rItem2 / 100) * porcent))
                    if NfwGlobalFunctions.checkInventoryWeight(user_id, config.paymentItem[rItem].item, reward) then
                        NyoFw.giveInventoryItem(user_id, config.paymentItem[rItem].item, reward)
                    else
                        NfwGlobalFunctions.notify(source, 'Erro', 'Você não possui espaço na mochila!', "#FF0000", 5000)
                    end
                elseif config.paymentItemType == 2 then
                    for k, v in pairs(config.paymentItem) do
                        local rItem2 = math.random(v.min, v.max)
                        local reward = math.floor(tonumber((rItem2 / 100) * porcent))
                        if NfwGlobalFunctions.checkInventoryWeight(user_id, v.item, reward) then
                            NyoFw.giveInventoryItem(user_id, v.item, reward)
                        else
                            NfwGlobalFunctions.notify(source, 'Erro', 'Você não possui espaço na mochila!', "#FF0000", 5000)
                        end
                    end
                end
            end

        end)
    end)
else
    error 'Module name has been modified'
    Nfw.preventCheat()
end
