local module = 'nyo_jobintermed'
local traceback = debug.traceback()
local valid_traceback = string.format('@nfw/modules/%s/server.lua', module)

if traceback:find(valid_traceback) then
    Nfw.registerNyoModule(module, "1.0.2", {"nyo_core"}, false, function()

        local activedUsers = {}

        local function jobPayment(user_id, emp)
            if activedUsers[user_id] == nil then 
                activedUsers[user_id] = true
                cfgJob = NfwConfigs.jobIntermedGeneralConfig[emp..'Config']
    
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
        end

        if NfwConfigs.jobIntermedGeneralConfig.garbageman then
            local cfgGarbageV2 = NfwConfigs.jobIntermedGeneralConfig.garbagemanConfig

            local garbageV2Players = {}
            local coordsGarbageV2 = {}

            RPC.addHandler('garbagev2/addPlayerToEmp', function(source)
                local user_id = NyoFw.getCharId(source)
                garbageV2Players[source] = {
                    user_id = user_id,
                    startTime = os.date('%c')
                }
                local res = {}
                for k,v in pairs(coordsGarbageV2) do
                    res[#res+1] = v[1]
                end
                return res
            end)

            RegisterNetEvent('nfw:garbagev2/remPlayerFromEmp', function()
                local source = source
                if garbageV2Players[source] then
                    garbageV2Players[source] = nil
                end
            end)

            AddEventHandler('playerDropped',function()
                local source = source
                if garbageV2Players[source] then
                    garbageV2Players[source] = nil
                end
            end)

            SafeEvents.register('garbagev2/UpCheckCoords',function(source, cds)
                table.insert(coordsGarbageV2,{cds,cfgGarbageV2['resetTime']})
                jobPayment(NyoFw.getCharId(source), 'garbageman')
                updatePlayersGarbage(cds, true)
            end)

            CreateThread(function()
                while true do
                    for k,v in pairs(coordsGarbageV2) do
                        if v[2] then
                            v[2] = v[2] - 1
                            if v[2] == 0 then
                                coordsGarbageV2[k] = nil
                                updatePlayersGarbage(v[1], false)
                            end
                        end
                    end
                    Wait(60000)
                end
            end)

            function updatePlayersGarbage(cds, status)
                for k,v in pairs(garbageV2Players) do
                    TriggerClientEvent('nfw:garbagev2/updateCoords',k,cds, status)
                end
            end
        end
    
        if NfwConfigs.jobIntermedGeneralConfig.farmer then

            local cfgFarmer = NfwConfigs.jobIntermedGeneralConfig.farmerConfig

            RPC.addHandler('farmer:checkItem', function(source, data)
                local user_id = NyoFw.getCharId(source)
                for k2,v2 in pairs(data) do 
                    if NyoFw.getInventoryItemAmount(user_id, v2.item) < v2.qtd then 
                        return false
                    end
                end
                for k2,v2 in pairs(data) do 
                    NyoFw.tryGetInventoryItem(user_id, v2.item, v2.qtd)
                end
                return true
            end)

            local farmerPlayer = {}
            local function updateFarmerCfg(l,status)
                for k,v in pairs(farmerPlayer) do
                    TriggerClientEvent('nfw:farmer/updateConfig',k,l,status)
                end
            end

            RPC.addHandler('farmer/addPlayerTofarmerEmp', function(source)
                local user_id = NyoFw.getCharId(source)
                farmerPlayer[source] = {
                    user_id = user_id,
                    startTime = os.date('%c')
                }
                return cfgFarmer
            end)

            RegisterNetEvent('nfw:farmer/remPlayerFromfarmerEmp', function()
                local source = source
                farmerPlayer[source] = nil
            end)

            AddEventHandler('playerDropped',function()
                local source = source
                farmerPlayer[source] = nil
            end)

            SafeEvents.register('checkFarmerCoords', function(source, k, type)
                cfgFarmer['collectFarmerLocations'][k]['status'] = true
                cfgFarmer['collectFarmerLocations'][k]['time'] = cfgFarmer['resetLocationTime']
                local user_id = NyoFw.getCharId(source)
                if activedUsers[user_id] == nil then 
                    activedUsers[user_id] = true
                    local cfgFarmerPayment = cfgFarmer['requirePayment'][type]

                    if cfgFarmerPayment.paymentType.money then 
                        local jobMoney = math.random(cfgFarmerPayment.paymentMoney.min, cfgFarmerPayment.paymentMoney.max)
                        -- aqui efetua o pagamento com dinheiro
                        NyoFw.giveMoney(user_id, jobMoney)
                    end
                    
                    if cfgFarmerPayment.paymentType.itens then 
                        local jobItemType = cfgFarmerPayment.paymentItemType
                        if jobItemType == 1 then 
                            for k,v in pairs(cfgFarmerPayment.paymentItem) do 
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
                            local jobItemSort = math.random(#cfgFarmerPayment.paymentItem)
                            local jobSendItem = cfgFarmerPayment.paymentItem[jobItemSort].item 
                            local jobSendQtd = math.random(cfgFarmerPayment.paymentItem[jobItemSort].min, cfgFarmerPayment.paymentItem[jobItemSort].max)
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
                updateFarmerCfg(k,true)
            end)

            CreateThread(function()
                while true do
                    for k,v in pairs(cfgFarmer['collectFarmerLocations']) do
                        if v.status then
                            v.time = v.time - 1
                            if v.time <= 0 then
                                v.time = nil
                                v.status = false
                                updateFarmerCfg(k,false)
                            end
                        end
                    end
                    Wait(60000)
                end
            end)

        end
    
        if NfwConfigs.jobIntermedGeneralConfig.scubaDiver then
            local cfgScuba = NfwConfigs.jobIntermedGeneralConfig.scubaDiverConfig
            local scubaDiverPlayers = {}

            local function updateConfig(l,status)
                for k,v in pairs(scubaDiverPlayers) do
                    TriggerClientEvent('nfw:scubaDiver/updateConfig',k,l,status)
                end
            end

            RPC.addHandler('scubaDiver/addPlayerToScubaDiverEmp', function(source)
                local user_id = NyoFw.getCharId(source)
                scubaDiverPlayers[source] = {
                    user_id = user_id,
                    startTime = os.date('%c')
                }
                return cfgScuba
            end)

            RegisterNetEvent('scubaDiver/remPlayerFromScubaDiverEmp', function()
                local source = source
                if scubaDiverPlayers[source] then
                    scubaDiverPlayers[source] = nil
                end
            end)

            AddEventHandler('playerDropped',function()
                local source = source
                if scubaDiverPlayers[source] then
                    scubaDiverPlayers[source] = nil
                end
            end)

            SafeEvents.register('scubaDiver/upCheckCoords',function(source, k)
                cfgScuba['collectLocations'][k][2] = true
                cfgScuba['collectLocations'][k][3] = cfgScuba['resetTime']
                jobPayment(NyoFw.getCharId(source), 'scubaDiver')
                updateConfig(k,true)
            end)

            CreateThread(function()
                while true do
                    for k,v in pairs(cfgScuba['collectLocations']) do
                        if v[3] then
                            v[3] = v[3] - 1
                            if v[3] <= 0 then
                                v[3] = nil
                                v[2] = false
                                updateConfig(k,false)
                            end
                        end
                    end
                    Wait(1000)
                end
            end)
        end
    end)
else
    error 'Module name has been modified'
    Nfw.preventCheat()
end