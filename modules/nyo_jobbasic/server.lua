local module = 'nyo_jobbasic'
local traceback = debug.traceback()
local valid_traceback = string.format('@nfw/modules/%s/server.lua', module)

if traceback:find(valid_traceback) then
    Nfw.registerNyoModule(module, "1.0.1", {"nyo_core"}, false, function()
        local activedUsers = {}

        RPC.addHandler('jobbasic-payment', function(source, emp)
            local user_id = NyoFw.getCharId(source)

            if activedUsers[user_id] == nil then 
                activedUsers[user_id] = true
                cfgJob = NfwConfigs.jobBasicGeneralConfig[emp..'Config']
    
                if cfgJob.paymentType.money then 
                    local jobMoney = math.random(cfgJob.minMoney, cfgJob.maxMoney)
                    -- aqui efetua o pagamento com dinheiro
                    NyoFw.giveMoney(user_id, jobMoney)
                end
        
                if cfgJob.paymentType.itens then 
                    local jobItemType = cfgJob.paymentItensType
                    if jobItemType == 1 then 
                        for k,v in pairs(cfgJob.paymentItens) do 
                            local jobItem = v.item
                            local jobItemRand = math.random(v.min, v.max)
                            -- da o item
                            if NfwGlobalFunctions.checkInventoryWeight(user_id, jobItem, jobItemRand) then
                                NyoFw.giveInventoryItem(user_id, jobItem, jobItemRand)
                            else 
                                NfwGlobalFunctions.notify(source, 'Erro', 'Você não possui espaço na mochila!', "#FF0000", 5000)
                            end
                        end
                    elseif jobItemType == 2 then 
                        local jobItemSort = math.random(#cfgJob.paymentItens)
                        local jobSendItem = cfgJob.paymentItens[jobItemSort].item 
                        local jobSendQtd = math.random(cfgJob.paymentItens[jobItemSort].min, cfgJob.paymentItens[jobItemSort].max)
                        -- da o item
                        if NfwGlobalFunctions.checkInventoryWeight(user_id, jobSendItem, jobSendQtd) then
                            NyoFw.giveInventoryItem(user_id, jobSendItem, jobSendQtd)
                        else 
                            NfwGlobalFunctions.notify(source, 'Erro', 'Você não possui espaço na mochila!', "#FF0000", 5000)
                        end
                    end
                end 

                activedUsers[user_id] = nil
            end
        end)

        RPC.addHandler('jobbasic-getItem', function(source, item, qtd)
            local user_id = NyoFw.getCharId(source)
            return NyoFw.tryGetInventoryItem(user_id, item, qtd)
        end)
    end)
else
    error 'Module name has been modified'
    Nfw.preventCheat()
end