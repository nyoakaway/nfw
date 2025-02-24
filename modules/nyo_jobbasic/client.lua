Nfw.registerNyoModule('nyo_jobbasic', {}, false, function()

    --- Core do Blip
    local jobfunctions = {}
    local jobstopfunctions = {}
    local blipEmprego = nil
    local working = false
    local function criarBlipEmprego(x, y, z, type, color, scale, routeColor, text)
        blipEmprego = AddBlipForCoord(x, y, z)
        SetBlipSprite(blipEmprego, type)
        SetBlipColour(blipEmprego, color)
        SetBlipScale(blipEmprego, scale)
        SetBlipAsShortRange(blipEmprego, false)
        SetBlipRoute(blipEmprego, true)
        SetBlipRouteColour(blipEmprego, routeColor)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(text)
        EndTextCommandSetBlipName(blipEmprego)
    end

    local function removerBlipEmprego()
        if DoesBlipExist(blipEmprego) then
            RemoveBlip(blipEmprego)
        end
    end

    NfwClient.setMarkerType(2)
    NfwClient.registerInterface(3)

    NfwClient.registerKeyPress(function(v, k)
        NfwClient.disableMarkerType(2)
        NfwClient.openUI({
            job = NfwConfigs[v.config].displayName
        }, false, false)
        working = NfwConfigs[v.config].jobtype
        jobfunctions[NfwConfigs[v.config].jobtype]()
    end)

    RegisterCommand('nfw:jobBasic:stopWorking', function()
        if working then
            removerBlipEmprego()
            NfwClient.closeUI()
            NfwClient.enableMarkerType(2)
            jobstopfunctions[working]()
            working = false
        end
    end)
    RegisterKeyMapping('nfw:jobBasic:stopWorking', 'Leave the current job', 'KEYBOARD', 'F7')

    if NfwConfigs.jobBasicGeneralConfig.busDriver then

        local onibusTrabalhando = false
        local rotaAtualOnibus = 1
        local cfgOnibus = NfwConfigs.jobBasicGeneralConfig.busDriverConfig

        jobfunctions.busdriver = function()
            onibusTrabalhando = true
            rotaAtualOnibus = 1
            criarBlipEmprego(cfgOnibus['route'][1].x, cfgOnibus['route'][1].y, cfgOnibus['route'][1].z,
              cfgOnibus.blipConfig['blipId'], cfgOnibus.blipConfig['blipColor'], cfgOnibus.blipConfig['blipScale'],
              cfgOnibus.blipConfig['routeColor'], "Rota de Motorista")
            CreateThread(function()
                while onibusTrabalhando do
                    local nyoSleep = 500
                    local ped = plyPed

                    if IsPedInAnyVehicle(ped) then
                        local distance = #(plyCoords - cfgOnibus['route'][rotaAtualOnibus])
                        if distance <= 50 then
                            nyoSleep = 4
                            DrawMarker(cfgOnibus.markerConfig.markerId, cfgOnibus['route'][rotaAtualOnibus].x,
                              cfgOnibus['route'][rotaAtualOnibus].y, cfgOnibus['route'][rotaAtualOnibus].z + 0.20, 0, 0,
                              0, cfgOnibus.markerConfig.markerRotationXYZ[1],
                              cfgOnibus.markerConfig.markerRotationXYZ[2], cfgOnibus.markerConfig.markerRotationXYZ[3],
                              cfgOnibus.markerConfig.markerScale[1], cfgOnibus.markerConfig.markerScale[2],
                              cfgOnibus.markerConfig.markerScale[3], cfgOnibus.markerConfig.markerColor[1],
                              cfgOnibus.markerConfig.markerColor[2], cfgOnibus.markerConfig.markerColor[3],
                              cfgOnibus.markerConfig.markerColor[4], cfgOnibus.markerConfig.markerUpDown,
                              cfgOnibus.markerConfig.markerFace, 0, cfgOnibus.markerConfig.markerRotation)
                            if distance <= 4 then
                                if IsControlJustPressed(0, 38) then
                                    local vehicle = GetVehiclePedIsIn(ped)
                                    local vehiclePedIsUsing = GetVehiclePedIsUsing(GetPlayerPed(-1))
                                    if cfgOnibus.jobVehicles or cfgOnibus.jobVehicles[GetEntityModel(GetVehiclePedIsIn(ped))] then
                                        removerBlipEmprego()
                                        if rotaAtualOnibus == #cfgOnibus['route'] then
                                            rotaAtualOnibus = 1
                                        else
                                            rotaAtualOnibus = rotaAtualOnibus + 1
                                        end
                                        RPC.trigger('jobbasic-payment', 'busDriver')
                                        criarBlipEmprego(cfgOnibus['route'][rotaAtualOnibus].x,
                                          cfgOnibus['route'][rotaAtualOnibus].y, cfgOnibus['route'][rotaAtualOnibus].z,
                                          cfgOnibus.blipConfig['blipId'], cfgOnibus.blipConfig['blipColor'],
                                          cfgOnibus.blipConfig['blipScale'], cfgOnibus.blipConfig['routeColor'],
                                          "Rota de Motorista")
                                    end
                                end
                            end
                        end
                    end
                    Wait(nyoSleep)
                end
            end)
        end

        jobstopfunctions.busdriver = function()
            onibusTrabalhando = false
            removerBlipEmprego()
        end

    end

    -------------- START EMP MINER 
    if NfwConfigs.jobBasicGeneralConfig.miner then
        local workingAsMiner = false
        local cfgMiner = NfwConfigs.jobBasicGeneralConfig.minerConfig
        local activeWorkingMinerLocation = nil
        local animDictMiner = 'amb@world_human_const_drill@male@drill@base'
        local animNameMiner = 'base'
        local minerObj = GetHashKey('prop_tool_jackham')

        local function playMinerAnim()
            local ped = plyPed
            local prop = CreateObject(minerObj, GetEntityCoords(ped), true, true, false)
            SafeEvents.triggerServer("nfw:نص عربي لترجمة قرن! إذا كنت تقرأ هذا ... أنت ديوث!", ObjToNet(prop))
            AttachEntityToEntity(prop, ped, GetPedBoneIndex(ped, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false,
              false, false, 2, true)
            TaskPlayAnim(ped, animDictMiner, animNameMiner, 8.0, 8.0, -1, 15, 1.0, 0, 0, 0)
            Wait(cfgMiner.timerMining)
            ClearPedTasks(ped)
            DeleteEntity(prop)
        end

        jobfunctions.miner = function()
            workingAsMiner = true
            RequestAnimDict(animDictMiner)
            RequestModel(minerObj)
            while not HasAnimDictLoaded(animDictMiner) and not HasModelLoaded(minerObj) do
                Wait(10)
            end
            activeWorkingMinerLocation = math.random(#cfgMiner.mineLocations)
            CreateThread(function()
                while workingAsMiner do
                    local nyoSleep = 1000
                    local ped = plyPed
                    local distance = #(plyCoords - cfgMiner.mineLocations[activeWorkingMinerLocation])
                    if distance <= 50.0 then
                        nyoSleep = 4
                        DrawMarker(cfgMiner.markerConfig.markerId, cfgMiner.mineLocations[activeWorkingMinerLocation].x,
                          cfgMiner.mineLocations[activeWorkingMinerLocation].y,
                          cfgMiner.mineLocations[activeWorkingMinerLocation].z + 0.20, 0, 0, 0,
                          cfgMiner.markerConfig.markerRotationXYZ[1], cfgMiner.markerConfig.markerRotationXYZ[2],
                          cfgMiner.markerConfig.markerRotationXYZ[3], cfgMiner.markerConfig.markerScale[1],
                          cfgMiner.markerConfig.markerScale[2], cfgMiner.markerConfig.markerScale[3],
                          cfgMiner.markerConfig.markerColor[1], cfgMiner.markerConfig.markerColor[2],
                          cfgMiner.markerConfig.markerColor[3], cfgMiner.markerConfig.markerColor[4],
                          cfgMiner.markerConfig.markerUpDown, cfgMiner.markerConfig.markerFace, 0,
                          cfgMiner.markerConfig.markerRotation)
                        if distance <= 1.0 then
                            if IsControlJustPressed(0, 38) then
                                if not cfgMiner.jobVehicles or cfgMiner.jobVehicles[GetEntityModel(GetPlayersLastVehicle())] then
                                    playMinerAnim()
                                    RPC.trigger('jobbasic-payment', 'miner')
                                    activeWorkingMinerLocation = math.random(#cfgMiner.mineLocations)
                                end
                            end
                        end
                    end
                    Wait(nyoSleep)
                end
            end)
        end

        jobstopfunctions.miner = function()
            workingAsMiner = false
            RemoveAnimDict(animDictMiner)
            SetModelAsNoLongerNeeded(minerObj)
        end

    end

    ------------- START EMP GARBAGE
    if NfwConfigs.jobBasicGeneralConfig.garbageman then
        local workingAsGarbageMan = false
        local activeGarbageLocation = 1
        local cfgGarbage = NfwConfigs.jobBasicGeneralConfig.garbagemanConfig

        jobfunctions.garbageman = function()
            workingAsGarbageMan = true
            criarBlipEmprego(cfgGarbage.garbageLocations[activeGarbageLocation].x,
              cfgGarbage.garbageLocations[activeGarbageLocation].y,
              cfgGarbage.garbageLocations[activeGarbageLocation].z, cfgGarbage.garbageCollectBlipConfig.sprite,
              cfgGarbage.garbageCollectBlipConfig.colour, cfgGarbage.garbageCollectBlipConfig.scale,
              cfgGarbage.garbageCollectBlipConfig.routeColor, cfgGarbage.garbageCollectBlipConfig.text)
            CreateThread(function()
                while workingAsGarbageMan do
                    local nyoSleep = 1000
                    local ped = plyPed
                    local pedcds = plyCoords
                    local distance = #(pedcds - cfgGarbage.garbageLocations[activeGarbageLocation])
                    if distance <= 20.0 then
                        nyoSleep = 4
                        DrawMarker(cfgGarbage.markerConfig.markerId,
                          cfgGarbage.garbageLocations[activeGarbageLocation].x,
                          cfgGarbage.garbageLocations[activeGarbageLocation].y,
                          cfgGarbage.garbageLocations[activeGarbageLocation].z + 0.20, 0, 0, 0,
                          cfgGarbage.markerConfig.markerRotationXYZ[1], cfgGarbage.markerConfig.markerRotationXYZ[2],
                          cfgGarbage.markerConfig.markerRotationXYZ[3], cfgGarbage.markerConfig.markerScale[1],
                          cfgGarbage.markerConfig.markerScale[2], cfgGarbage.markerConfig.markerScale[3],
                          cfgGarbage.markerConfig.markerColor[1], cfgGarbage.markerConfig.markerColor[2],
                          cfgGarbage.markerConfig.markerColor[3], cfgGarbage.markerConfig.markerColor[4],
                          cfgGarbage.markerConfig.markerUpDown, cfgGarbage.markerConfig.markerFace, 0,
                          cfgGarbage.markerConfig.markerRotation)

                        if distance <= 3.0 then
                            if IsControlJustPressed(0, 38) then
                                if not cfgGarbage.jobVehicles or cfgGarbage.jobVehicles[GetEntityModel(GetVehiclePedIsIn(ped))] then
                                    removerBlipEmprego()
                                    activeGarbageLocation = activeGarbageLocation + 1
                                    if activeGarbageLocation > #cfgGarbage.garbageLocations then
                                        activeGarbageLocation = 1
                                    end
                                    RPC.trigger('jobbasic-payment', 'garbageman')
                                    criarBlipEmprego(cfgGarbage.garbageLocations[activeGarbageLocation].x,
                                      cfgGarbage.garbageLocations[activeGarbageLocation].y,
                                      cfgGarbage.garbageLocations[activeGarbageLocation].z,
                                      cfgGarbage.garbageCollectBlipConfig.sprite,
                                      cfgGarbage.garbageCollectBlipConfig.colour,
                                      cfgGarbage.garbageCollectBlipConfig.scale,
                                      cfgGarbage.garbageCollectBlipConfig.routeColor,
                                      cfgGarbage.garbageCollectBlipConfig.text)
                                end
                            end
                        end
                    end
                    Wait(nyoSleep)
                end
            end)
        end

        jobstopfunctions.garbageman = function()
            workingAsGarbageMan = false
            activeGarbageLocation = 1
        end
    end

    ------------ START EMP FISHER 
    if NfwConfigs.jobBasicGeneralConfig.fisherman then
        local workingAsFisher = false
        local remainingFishingSeconds = 0
        local animDictFisher = 'amb@world_human_stand_fishing@idle_a'
        local animNameFisher = 'idle_c'
        local fisherPr = GetHashKey('prop_fishing_rod_01')
        local cfgFisher = NfwConfigs.jobBasicGeneralConfig.fishermanConfig
        local fisherBlips = {}

        local function createFisherBlips()
            for k, v in pairs(cfgFisher.locations) do
                local blip = AddBlipForCoord(v[1].x, v[1].y, v[1].z)
                SetBlipCoords(blip, v[1].x, v[1].y, v[1].z)
                SetBlipSprite(blip, cfgFisher.fisherBlipConfig.sprite)
                SetBlipColour(blip, cfgFisher.fisherBlipConfig.colour)
                SetBlipScale(blip, cfgFisher.fisherBlipConfig.scale)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(cfgFisher.fisherBlipConfig.text)
                EndTextCommandSetBlipName(blip)
                SetBlipAsShortRange(blip, cfgFisher.fisherBlipConfig.shortRange)
                SetBlipRoute(blip, false)
                table.insert(fisherBlips, blip)
            end
        end

        local function deleteFisherBlips()
            for k, v in pairs(fisherBlips) do
                RemoveBlip(v)
            end
            fisherBlips = {}
        end

        jobfunctions.fisherman = function()
            workingAsFisher = true
            RequestAnimDict(animDictFisher)
            RequestModel(fisherPr)
            while not HasAnimDictLoaded(animDictFisher) and not HasModelLoaded(fisherPr) do
                Wait(10)
            end
            createFisherBlips()
            CreateThread(function()
                while workingAsFisher do
                    local nyoSleep = 1000
                    ped = PlayerPedId()
                    local cds = GetEntityCoords(ped)
                    for k, v in pairs(cfgFisher.locations) do
                        local distance = #(cds - v[1])
                        if distance <= (v[2] + 50) then
                            nyoSleep = 4
                            DrawMarker(cfgFisher.markerConfig.markerId, v[1] - 1.0, 0, 0, 0,
                              cfgFisher.markerConfig.markerRotationXYZ[1], cfgFisher.markerConfig.markerRotationXYZ[2],
                              cfgFisher.markerConfig.markerRotationXYZ[3], v[2], v[2], v[2],
                              cfgFisher.markerConfig.markerColor[1], cfgFisher.markerConfig.markerColor[2],
                              cfgFisher.markerConfig.markerColor[3], cfgFisher.markerConfig.markerColor[4],
                              cfgFisher.markerConfig.markerUpDown, cfgFisher.markerConfig.markerFace, 0,
                              cfgFisher.markerConfig.markerRotation)
                            if distance <= v[2] then
                                if IsControlJustPressed(0, 38) and not IsPedInAnyVehicle(ped) and not IsPedSwimming(ped) and
                                  not IsPedSwimmingUnderWater(ped) then
                                    local liberaPesca = true
                                    if cfgFisher.requestItem.require then
                                        liberaPesca = RPC.trigger('jobbasic-getItem', cfgFisher.requestItem.item, cfgFisher.requestItem.qtd)
                                    end
                                    if liberaPesca then
                                        local prop = CreateObject(fisherPr, GetEntityCoords(ped), true, true, false)
                                        SafeEvents.triggerServer("nfw:نص عربي لترجمة قرن! إذا كنت تقرأ هذا ... أنت ديوث!", ObjToNet(prop))
                                        AttachEntityToEntity(prop, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0,
                                          0.0, 0.0, false, false, false, false, 2, true)
                                        TaskPlayAnim(ped, animDictFisher, animNameFisher, 8.0, 8.0, -1, 15, 1.0, 0, 0, 0)
                                        local fishReward = false
                                        if cfgFisher.fishingTipe == 2 then
                                            local exp = exports['nfw']:skillBarStart()
                                            if exp then
                                                fishReward = true
                                            end
                                        else
                                            remainingFishingSeconds = cfgFisher.fishingTime
                                            TriggerEvent('progress', tonumber(cfgFisher.fishingTime * 1000), 'Pescando')
                                            repeat
                                                remainingFishingSeconds = remainingFishingSeconds - 1
                                                Wait(1000)
                                            until remainingFishingSeconds == 0
                                            fishReward = true
                                        end
                                        DetachEntity(prop)
                                        DeleteEntity(prop)
                                        ClearPedTasks(ped)
                                        if fishReward then
                                            RPC.trigger('jobbasic-payment', 'fisherman')
                                        end
                                    end
                                end
                            end
                        end
                    end
                    Wait(nyoSleep)
                end
            end)
        end

        jobstopfunctions.fisherman = function()
            workingAsFisher = false
            deleteFisherBlips()
        end

    end

end)
