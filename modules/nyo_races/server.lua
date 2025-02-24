local module = 'nyo_races'
local traceback = debug.traceback()
local valid_traceback = string.format('@nfw/modules/%s/server.lua', module)

if traceback:find(valid_traceback) then
    Nfw.registerNyoModule(module, "1.0.0", {"nyo_core"}, false, function()

        local module_funcs = Nfw.getModuleFunctions()
        local preparingRaces = {}
        local runningRaces = {}

        local errorMessages = {
            insufficientItems = 1,
            insufficientMoney = 2,
            vehicleClassNotAllowed = 3,
            vehicleModelNotAllowed = 4,
            maxAmountOfRunnersReached = 5,
        }

        RPC.addHandler('races:start', function(src, configIndex)
            local config = NfwConfigs[configIndex]
            local user_id  = NyoFw.getCharId(src)
            if config then
                local raceConfig = config.raceConfig
                for k,v in pairs(raceConfig.requiredItems) do
                    if NyoFw.getInventoryItemAmount(user_id,v[1]) < v[2] then
                        return errorMessages.insufficientItems, {v[1],v[2]}
                    end
                end
                if not NfwGlobalFunctions.tryPayment(user_id, raceConfig.entryPrice, raceConfig.entryPaymentType) then
                    return errorMessages.insufficientMoney, {raceConfig.entryPrice}
                end
                for k,v in pairs(raceConfig.requiredItems) do
                    NyoFw.tryGetInventoryItem(user_id,v[1],v[2])
                end
                local insertIndex
                if preparingRaces[configIndex] then
                    if (not raceConfig.startPositions and not raceConfig.maxAmountOfRunners) or ((raceConfig.startPositions and #raceConfig.startPositions or raceConfig.maxAmountOfRunners) > #preparingRaces[configIndex].players) then
                        insertIndex = #preparingRaces[configIndex].players + 1
                        preparingRaces[configIndex].players[insertIndex] = src
                    else
                        return errorMessages.maxAmountOfRunnersReached, {}
                    end
                else
                    preparingRaces[configIndex] = {
                        owner = src,
                        players = {src},
                        startRaceWaitTime = raceConfig.startRaceWaitTime
                    }
                    insertIndex = 1
                end
                return false, {insertIndex, preparingRaces[configIndex].startRaceWaitTime}
            end
        end)

        SafeEvents.register("races:cancel", function(src, configIndex)
            if preparingRaces[configIndex] then
                if preparingRaces[configIndex].owner == src then
                    for k,v in pairs(preparingRaces[configIndex].players) do
                        SafeEvents.triggerClient("races:cancel", v)
                    end
                    preparingRaces[configIndex] = nil
                    return
                else
                    for k,v in pairs(preparingRaces[configIndex].players) do
                        if v == src then
                            preparingRaces[configIndex].players[k] = nil
                            break
                        end
                    end
                    if #preparingRaces[configIndex].players <= 0 then
                        preparingRaces[configIndex] = nil
                    end
                end
            end
        end)

        CreateThread(function()
            while true do
                for k,v in pairs(preparingRaces) do
                    preparingRaces[k].startRaceWaitTime -= 1
                    if preparingRaces[k].startRaceWaitTime <= 0 then
                        local raceId = #runningRaces + 1
                        runningRaces[raceId] = {
                            configIndex = k,
                            players = {},
                            list = {},
                            numPlayers = 0,
                            started = false
                        }
                        for l,w in pairs(v.players) do
                            SafeEvents.triggerClient('races:start', w, #v.players, l, raceId)
                            table.insert(runningRaces[raceId].list, { src = w, distance = 0, lap = 0, checkpoint = 0, time = 0 })                            
                            runningRaces[raceId].players[w] = { finished = false, quited = false, quitReason = nil }
                            runningRaces[raceId].numPlayers += 1
                        end
                        local config = NfwConfigs[k]
                        local raceConfig = config.raceConfig
                        if raceConfig.callPolice then
                            for l,w in pairs(NyoFw.getUsersByPermission(raceConfig.policePermission)) do
                                local src = NyoFw.getUserSource(w)
                                SafeEvents.triggerClient('races:policeAlert', src, k)
                            end
                        end
                        SetTimeout(5000, function() runningRaces[raceId].started = true end)
                        preparingRaces[k] = nil
                    end
                end
                Wait(1000)
            end
        end)

        local function sorttable(raceId)
            table.sort(runningRaces[raceId].list, function(a,b)
                if runningRaces[raceId].players[a.src].finished and runningRaces[raceId].players[b.src].finished then
                    return a.time < b.time
                end        
                if runningRaces[raceId].players[a.src].finished then 
                    return true
                end        
                if runningRaces[raceId].players[b.src].finished then 
                    return false
                end                        
                if a.lap ~= b.lap then
                    return a.lap > b.lap
                end        
                if a.checkpoint ~= b.checkpoint then
                    return a.checkpoint > b.checkpoint
                end        
                return a.distance < b.distance
            end)
        end

        CreateThread(function()
            while true do
                for k,v in pairs(runningRaces) do
                    sorttable(k)
                end
                for k,v in pairs(runningRaces) do
                    if v.started then
                        local rn = 1
                        for l,w in pairs(v.list) do
                            if not v.players[w.src].finished and not v.players[w.src].quited then
                                TriggerClientEvent('races:update', w.src, l)
                            end
                            if v.players[w.src].finished then
                                rn += 1
                            end
                            if v.players[w.src].quited then
                                table.remove(runningRaces[k].list, l)
                            end
                        end
                        -- runningRaces[k].list = {}
                    end
                end
                Wait(500)
            end
        end)

        RegisterNetEvent('races:update', function(raceId, distance, lap, checkpoint, time)
            local source = source           
            if runningRaces[raceId] and runningRaces[raceId].players[source] then
                for k,v in pairs(runningRaces[raceId].list) do
                    if v.src == source then
                        runningRaces[raceId].list[k] = { src = source, distance = distance, lap = lap, checkpoint = checkpoint, time = time }
                    end
                end
            end
        end)

        SafeEvents.register('races:quit', function(src, raceId, quitReason)
            if runningRaces[raceId] and runningRaces[raceId].players[src] then                
                runningRaces[raceId].players[src].quited = true
                runningRaces[raceId].numPlayers -= 1
                runningRaces[raceId].players[src].quitReason = quitReason
            end
        end)

        SafeEvents.register('races:finish', function(src, raceId, time)
            if runningRaces[raceId] and runningRaces[raceId].players[src] and not runningRaces[raceId].players[src].finished and not runningRaces[raceId].players[src].quited then
                local raceConfig = NfwConfigs[runningRaces[raceId].configIndex].raceConfig
                local user_id = NyoFw.getCharId(src)
                runningRaces[raceId].players[src].finished = true
                local find
                for k,v in pairs(runningRaces[raceId].list) do
                    if v.src == src then
                        runningRaces[raceId].list[k].time = time
                        find = true
                        break
                    end
                end
                if not find then
                    Wait(200)
                    for k,v in pairs(runningRaces[raceId].list) do
                        if v.src == src then
                            runningRaces[raceId].list[k].time = time
                            find = true
                            break
                        end
                    end
                end
                sorttable(raceId)
                local rTable = {[2] = {}}
                for k,v in pairs(runningRaces[raceId].list) do if v.src == src then rTable[1] = k break end end
                for i = 1, 5 do
                    if runningRaces[raceId].list[i] and runningRaces[raceId].players[runningRaces[raceId].list[i].src].finished then
                        local identity = NyoFw.getCharacterIdentity(NyoFw.getCharId(runningRaces[raceId].list[i].src))
                        rTable[2][i] = {runningRaces[raceId].list[i].time, identity.name..' '.. identity.last_name}
                    else
                        break
                    end
                end
                local allFinished = true
                for k,v in pairs(runningRaces[raceId].players) do
                    if not v.quited and v.finished then
                        SafeEvents.triggerClient('races:finishStatus', k, rTable)
                    end
                    if not v.quited and not v.finished then
                        allFinished = false
                    end
                end
                if allFinished then
                    runningRaces[raceId] = nil
                end
                for k,v in pairs(raceConfig.rewards[rTable[1]] or raceConfig.rewards['*']) do
                    local amount = math.random(v.min, v.max)
                    if v.type == 'item' then
                        if NfwGlobalFunctions.checkInventoryWeight(user_id, v.item, amount) then
                            NyoFw.giveInventoryItem(user_id, v.item, amount)
                        end
                    else
                        NyoFw.giveMoney(user_id, amount)
                    end
                end
            end
        end)
        
    end)
else
    error 'Module name has been modified'
    Nfw.preventCheat()
end

