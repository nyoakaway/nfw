Nfw.registerNyoModule('nyo_doors', {}, false, function()
    local doorsGeneral = RPC.trigger('nfw:doors:getConfig')  

    for k,v in pairs(doorsGeneral) do 
        AddDoorToSystem('door_'..k, tonumber(v.model), v.coord)
        local doorLock = v.lock and 1 or 0
        DoorSystemSetDoorState('door_'..k, doorLock)
    end

    for k,v in pairs(NfwCoords) do
        if v.id and doorsGeneral[v.id] then
            doorsGeneral[v.id].k_index = k
            NfwCoords[k].text = doorsGeneral[v.id].lock and 'TRANCADO' or 'DESTRANCADO'
        end
    end

    SafeEvents.register('nyoModule:UpdateDoorStatus', function(id, typeClose, lock)               
        if doorsGeneral[id] then 
            local newStatus = true
            if typeClose then
                newStatus = lock
            else
                newStatus = true
            end

            local group = doorsGeneral[id].group
            doorsGeneral[id].lock = newStatus
            NfwCoords[doorsGeneral[id].k_index].text = doorsGeneral[id].lock and 'TRANCADO' or 'DESTRANCADO'
            DoorSystemSetDoorState('door_'..id, newStatus)

            if typeClose then 
                for k,v in pairs(doorsGeneral) do 
                    if v.group == group and group ~= '' then 
                        if k ~= id then 
                            doorsGeneral[k].lock = newStatus
                            NfwCoords[v.k_index].text = v.lock and 'TRANCADO' or 'DESTRANCADO'
                            DoorSystemSetDoorState('door_'..k, newStatus) 
                        end
                    end
                end
            end
        end
    end)

    local openDoorAction = false

    NfwClient.registerKeyPress(function(v,k)
        local ped = PlayerPedId()
        local isInVehicle = IsPedInAnyVehicle(ped) 
        local doorCfg = doorsGeneral[v.id]
        local gConfig = NfwConfigs[v.config]
        local dMinigame = doorCfg.lock and gConfig.dataOpen.miniGame or gConfig.dataClose.miniGame
        local doorTime = doorCfg.lock and gConfig.dataOpen.openTime or gConfig.dataClose.openTime
        local doorAnimDict = doorCfg.lock and 
                                (isInVehicle and gConfig.dataOpen.animDictVehicle or gConfig.dataOpen.animDict)
                            or
                                (isInVehicle and gConfig.dataClose.animDictVehicle or gConfig.dataClose.animDict)

        local doorAnim = doorCfg.lock and
                                (isInVehicle and gConfig.dataOpen.animVehicle or gConfig.dataOpen.anim)
                            or
                                (isInVehicle and gConfig.dataClose.animVehicle or gConfig.dataClose.anim)

        local doorAction = doorCfg.lock and gConfig.dataOpen.enableAction or gConfig.dataClose.enableAction
        local doorItem = doorCfg.lock and gConfig.dataOpen.requestItem or gConfig.dataClose.requestItem

        if doorAction and not openDoorAction then 
            local enableAction = false 

            if doorItem then 
                enableAction = RPC.trigger("nfw:doors:requestItem", v.config, doorCfg.lock)
            else 
                enableAction = true
            end
            
            if enableAction then 
                openDoorAction = true
                if doorAnimDict ~= '' then 
                    RequestAnimDict(doorAnimDict)
                    while not HasAnimDictLoaded(doorAnimDict) do
                        Wait(10)
                    end
                    TaskPlayAnim(ped,doorAnimDict,doorAnim,8.0,8.0,-1,49,1.0,0,0,0)
                    
                    RemoveAnimDict(doorAnimDict)
                end                                                      

                local dStart = false

                if dMinigame == 'nptask' then 
                    local exp = exports["np-taskbarskill"]:taskBar(1200,7)
                    if exp == 100 then 
                        dStart = true 
                    end
                elseif dMinigame == 'skillbar' then 
                    local exp = exports['nfw']:skillBarStart()
                    if exp then 
                        dStart = true
                    end
                elseif dMinigame == 'keymaster' then 
                    local exp = exports['cd_keymaster']:StartKeyMaster()
                    if exp then 
                        dStart = true
                    end
                elseif dMinigame == 'pdsafe' then 
                    local exp = exports["pd-safe"]:createSafe({math.random(0,99)})
                    if exp then 
                        dStart = true 
                    end
                else 
                    dStart = true
                    Wait(doorTime * 1000)
                end
                
                if dStart then
                    ClearPedTasks(ped)
                    SafeEvents.triggerServer('nyo_module:OpenDoor', v.id)
                end
                openDoorAction = false
            end
            
        end
            
    end)

end)