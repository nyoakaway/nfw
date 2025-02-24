Nfw.registerNyoModule('nyo_races', {}, false, function()

    local module_funcs = Nfw.getModuleFunctions()
    local module_lang = Nfw.getModuleLanguage()
    local configIndex, preparingRace, playerVeh, currentCheckpoint, currentLap, currentPosition, checkpointDistance, raceTime, raceId

    local function DrawHudText(text,colour,coordsx,coordsy,scalex,scaley)
        SetTextFont(7)
        SetTextProportional(7)
        SetTextScale(scalex, scaley)
        local colourr,colourg,colourb,coloura = table.unpack(colour)
        SetTextColour(colourr,colourg,colourb, coloura)
        SetTextDropshadow(0, 0, 0, 0, coloura)
        SetTextEdge(1, 0, 0, 0, coloura)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(coordsx,coordsy)
    end

    local function replaceTable(str, table)
        return str:gsub("$(%w+)%s", function(n) return table[n] end)
    end

    local function cancelRace(triggerServer)
        preparingRace = false
        FreezeEntityPosition(playerVeh, false)
        NfwClient.enableMarkerType(1)
        if triggerServer then SafeEvents.triggerServer('races:cancel', configIndex) end
    end

    NfwClient.registerInterface(2)

    NfwClient.registerKeyPress(function(v, k)
        configIndex = v.config
        local config = NfwConfigs[v.config]
        local raceConfig = config.raceConfig
        local veh = GetVehiclePedIsIn(plyPed, false)
        if veh == 0 then
            return
        end
        local vehModel = GetEntityModel(veh)
        local vehClass = GetVehicleClass(veh)
        if raceConfig.disabledVehicleClasses[vehClass] then
            module_funcs.onFailToStartRace(3, {vehClass})
            return
        end
        if raceConfig.disabledVehicleModels[vehModel] then
            module_funcs.onFailToStartRace(4, {vehModel})
            return
        end
        local err, data = RPC.trigger('races:start', v.config)
        if err then
            return module_funcs.onFailToStartRace(err,data)
        else
            preparingRace = true
            playerVeh = veh
            local startPositionIndex = data[1]
            local startRaceWaitTime = data[2]
            local startPosition = raceConfig.startPositions and raceConfig.startPositions[startPositionIndex]
            NfwClient.disableMarkerType(1)
            if startPosition then
                SetEntityCoords(veh, startPosition.x, startPosition.y, startPosition.z)
                SetEntityHeading(veh, startPosition.w)
            end
            FreezeEntityPosition(veh, true)
            local drawTxt = module_lang['text-waitingForRace']
            local drawTxt2 = module_lang['text-cancelRace']
            CreateThread(function()
                while preparingRace do
                    drawTxt2D(replaceTable(drawTxt,{time = startRaceWaitTime}), 4, 0.5, 0.9, 0.5, 255, 255, 255, 255)
                    drawTxt2D(drawTxt2, 4, 0.5, 0.93, 0.4, 255, 255, 255, 150)
                    if IsControlJustPressed(0,168) then
                        cancelRace(true)
                    end
                    for k,v in pairs(raceConfig.disabledControlsDuringPrepareFase) do
                        DisableControlAction(0, v, true)
                    end
                    Wait(4)
                end
            end)
            CreateThread(function()
                while preparingRace do
                    startRaceWaitTime -= 1
                    Wait(1000)
                end
            end)
        end
    end)

    SafeEvents.register('races:cancel', function()
        cancelRace(false)
    end)

    SafeEvents.register('races:start', function(numPlayers, current_position, race_id)
        local raceConfig = NfwConfigs[configIndex].raceConfig
        preparingRace = false
        currentCheckpoint = 1
        currentLap = 0
        raceId = race_id
        currentPosition = current_position
        local startTime = 5
        NfwClient.openUI({
            numPlayers = numPlayers,
            numLaps = raceConfig.lapsAmount,
            numCheckpoints = #raceConfig.checkpoints,
            currentPosition = currentPosition
        }, false, false)

        CreateThread(function()
            Wait(1000)
            PlaySoundFrontend(-1, "5S", 'MP_MISSION_COUNTDOWN_SOUNDSET', false)
            while startTime > 0 do
                startTime -= 1
                Wait(1000)
            end
        end)
        while true do
            DrawHudText(startTime, {255,191,0,255},0.5,0.4,4.0,4.0)
            if startTime == 0 then break end
            Wait(4)
        end
        FreezeEntityPosition(playerVeh, false)
        local raceStartTime = GetGameTimer()
        local maxRaceTime = raceConfig.raceMaxTime
        local lapMaxTime = raceConfig.lapMaxTime
        local function checkpoint()
            sCheck, sCheck2 = raceConfig.checkpoints[currentCheckpoint], raceConfig.checkpoints[currentCheckpoint + 1] or raceConfig.checkpoints[1]
            if currentCheckpoint == #raceConfig.checkpoints and currentLap == raceConfig.lapsAmount then
                SetNewWaypoint(sCheck[1].x ,sCheck[1].y )
                checkP = CreateCheckpoint(raceConfig.lastCheckpointConfig.type, sCheck[1] + vec3(0.0,0.0,3.0), sCheck2[1] + vec3(0.0,0.0,3.0), raceConfig.lastCheckpointConfig.height, raceConfig.lastCheckpointConfig.primaryColor[1],raceConfig.lastCheckpointConfig.primaryColor[2], raceConfig.lastCheckpointConfig.primaryColor[3], raceConfig.lastCheckpointConfig.primaryColor[4], 0)
                SetCheckpointRgba(checkP, raceConfig.lastCheckpointConfig.secondaryColor[1],raceConfig.lastCheckpointConfig.secondaryColor[2],raceConfig.lastCheckpointConfig.secondaryColor[3],raceConfig.lastCheckpointConfig.secondaryColor[4])
            else
                SetNewWaypoint(sCheck[1].x ,sCheck[1].y )
                checkP = CreateCheckpoint(raceConfig.checkpointConfig.type, sCheck[1] + vec3(0.0,0.0,3.0), sCheck2[1] + vec3(0.0,0.0,3.0), raceConfig.checkpointConfig.height, raceConfig.checkpointConfig.primaryColor[1],raceConfig.checkpointConfig.primaryColor[2], raceConfig.checkpointConfig.primaryColor[3], raceConfig.checkpointConfig.primaryColor[4], 0)
                SetCheckpointRgba(checkP, raceConfig.checkpointConfig.secondaryColor[1],raceConfig.checkpointConfig.secondaryColor[2],raceConfig.checkpointConfig.secondaryColor[3],raceConfig.checkpointConfig.secondaryColor[4])
            end
            if sCheck[2] then
                SetNewWaypoint(sCheck[1].x ,sCheck[1].y )
                checkP2 = CreateCheckpoint(raceConfig.repairCheckpointConfig.type, sCheck[2] + vec3(0.0,0.0,3.0), sCheck2[1] + vec3(0.0,0.0,3.0), raceConfig.repairCheckpointConfig.height, raceConfig.repairCheckpointConfig.primaryColor[1],raceConfig.repairCheckpointConfig.primaryColor[2], raceConfig.repairCheckpointConfig.primaryColor[3], raceConfig.repairCheckpointConfig.primaryColor[4], 0)
                SetCheckpointRgba(checkP, raceConfig.repairCheckpointConfig.secondaryColor[1],raceConfig.repairCheckpointConfig.secondaryColor[2],raceConfig.repairCheckpointConfig.secondaryColor[3],raceConfig.repairCheckpointConfig.secondaryColor[4])
            end
        end
        local playingSound = false
        for lap = 1, raceConfig.lapsAmount do
            currentLap = lap 
            checkpoint()
            while true do
                local currentTime = GetGameTimer()
                NfwClient.sendNUIMessage('update', {
                    numPlayers = numPlayers,
                    numLaps = raceConfig.lapsAmount,
                    numCheckpoints = #raceConfig.checkpoints,
                    currentPosition = currentPosition,
                    currentLap = currentLap,
                    currentCheckpoint = currentCheckpoint - 1,
                    time = currentTime - raceStartTime,
                    maxRaceTime = maxRaceTime,
                })
                plyCoords = GetEntityCoords(plyPed)
                checkpointDistance = #(plyCoords - sCheck[1])
                raceTime = currentTime - raceStartTime
                if sCheck[2] and #(plyCoords - sCheck[2]) < raceConfig.checkpointDistance then
                    local fuel = GetVehicleFuelLevel(playerVeh)
                    if DoesEntityExist(playerVeh) then
                        if IsEntityAVehicle(playerVeh) then
                            SetVehicleFixed(playerVeh)
                            SetVehicleDirtLevel(playerVeh,0.0)
                            SetVehicleUndriveable(playerVeh,false)
                            Citizen.InvokeNative(0xAD738C3085FE7E11,playerVeh,true,true)
                            SetVehicleOnGroundProperly(playerVeh)
                            SetVehicleFuelLevel(playerVeh,fuel)
                        end
                    end
                    PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", false)
                    currentCheckpoint += 1
                    DeleteCheckpoint(checkP)
                    DeleteCheckpoint(checkP2)
                    if maxRaceTime and sCheck[4] then maxRaceTime += sCheck[4] end
                    if not raceConfig.checkpoints[currentCheckpoint] then currentCheckpoint = 1 break end
                    checkpoint()
                end
                if checkpointDistance < raceConfig.checkpointDistance then
                    PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", false)
                    currentCheckpoint += 1
                    DeleteCheckpoint(checkP)
                    if sCheck[2] then DeleteCheckpoint(checkP2) end
                    if maxRaceTime and sCheck[3] then maxRaceTime += sCheck[3] end
                    if not raceConfig.checkpoints[currentCheckpoint] then currentCheckpoint = 1 break end
                    checkpoint()
                end
                if maxRaceTime and maxRaceTime - (currentTime - raceStartTime) <= 0 then
                    DeleteCheckpoint(checkP)
                    DeleteCheckpoint(checkP2)
                    NfwClient.closeUI({})
                    NfwClient.enableMarkerType(1)
                    if raceConfig.explodeAtRaceTimerEnd then
                        PlaySoundFromEntity(1, "Explosion_Countdown", playerVeh, "GTAO_FM_Events_Soundset", true, 25)
                        Wait(10000)
                        NetworkExplodeVehicle(playerVeh, true, false, false)
                    end
                    SafeEvents.triggerServer('races:quit', raceId, 1)
                    return
                end
                if GetVehiclePedIsIn(plyPed, false) ~= playerVeh then
                    DeleteCheckpoint(checkP)
                    DeleteCheckpoint(checkP2)
                    NfwClient.closeUI({})
                    NfwClient.sendNUIMessage('raceCloseUi',{})
                    NfwClient.enableMarkerType(1)
                    if raceConfig.explodeWhenLeftingCar then
                        PlaySoundFromEntity(1, "Explosion_Countdown", playerVeh, "GTAO_FM_Events_Soundset", true, 25)
                        Wait(10000)
                        NetworkExplodeVehicle(playerVeh, true, false, false)
                    end
                    SafeEvents.triggerServer('races:quit', raceId, 2)
                    return
                end
                if maxRaceTime and not playingSound and maxRaceTime - (currentTime - raceStartTime) <= 5000 then
                    playingSound = GetSoundId()
                    PlaySoundFrontend(playingSound, "5S", 'MP_MISSION_COUNTDOWN_SOUNDSET', false)
                end
                if maxRaceTime and playingSound and maxRaceTime - (currentTime - raceStartTime) > 5000 then
                    StopSound(playingSound)
                    playingSound = false
                end
                Wait(4)
            end
        end
        NfwClient.enableMarkerType(1)
        SafeEvents.triggerServer('races:finish', raceId, raceTime)
        Wait(500)
    end)

    RegisterNetEvent('races:update', function(newPos)
        currentPosition = newPos
        TriggerServerEvent('races:update', raceId, checkpointDistance, currentLap, currentCheckpoint, raceTime)
    end)

    SafeEvents.register('races:finishStatus', function(data)
        NfwClient.sendNUIMessage('finishStatus', data)
        --SetNuiFocus(true, true)
        startRaceCloseUi()
    end)

    NfwClient.registerNUICallback('close', function(data,cb)
        --SetNuiFocus(false, false)
        NfwClient.enableMarkerType(1)
        SafeEvents.triggerServer('races:quit', raceId, 3)
        NfwClient.sendNUIMessage('raceCloseUi',{})
    end)

    local raceCloseUiOpen = false
    startRaceCloseUi = function()        
        if not raceCloseUiOpen then 
            raceCloseUiOpen = true
            CreateThread(function()
                while raceCloseUiOpen do 
                    if IsControlJustPressed(0, 168) then 
                        raceCloseUiOpen = false
                        NfwClient.enableMarkerType(1)
                        SafeEvents.triggerServer('races:quit', raceId, 3)
                        NfwClient.sendNUIMessage('raceCloseUi',{})
                    end
                    Wait(1)
                end
            end)
        end
        
    end

    SafeEvents.register('races:policeAlert', function(cfg)
        module_funcs.policeAlert(NfwConfigs[cfg].raceConfig)
    end)

end)