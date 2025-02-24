Nfw.registerNyoModule('nyo_dealership', {}, false, function()

    if config.development then GlobalState.nyo_dealership = nil end
    local module_funcs = Nfw.getModuleFunctions()
    local nuiOpen = false
    local currentDealership
    local currentDealershipIndex
    local currentConfig
    local spawnedVehicle
    local currentVehicle
    local currentVehicleData
    local testDrive
    local dontDisableFocus
    local cam
    local resetCoord
    
    NfwClient.registerInterface(1)

    RegisterNetEvent("dealership-update", function(index, category, vehicle, amount)
        local dealershipData = GlobalState.nyo_dealership
        if dealershipData[index] and dealershipData[index][category] and dealershipData[index][category][vehicle] then
            dealershipData[index][category][vehicle][2] = amount
        end
        GlobalState.nyo_dealership = dealershipData
    end)

    if not GlobalState.nyo_dealership then
        local dealershipData = RPC.trigger('dealership-getVehicles')
        for dindex, categories in pairs(dealershipData) do
            for cindex, vehicles in pairs(categories) do
                for vehicle,info in pairs(vehicles) do
                    dealershipData[dindex][cindex][vehicle].maxSpeed = math.floor(GetVehicleModelEstimatedMaxSpeed(vehicle) * 3.6)
                    dealershipData[dindex][cindex][vehicle].maxBraking = GetVehicleModelMaxBraking(vehicle)
                    dealershipData[dindex][cindex][vehicle].maxTraction = GetVehicleModelMaxTraction(vehicle)
                    dealershipData[dindex][cindex][vehicle].maxSeats = GetVehicleModelNumberOfSeats(vehicle)
                end
            end
        end
        GlobalState.nyo_dealership = dealershipData
    end

    local function open(v,k)
        local config = NfwConfigs[v.config]
        resetCoord = k and v.coord or plyCoords
        dontDisableFocus = false
        currentDealership = GlobalState.nyo_dealership[config.dealershipConfig.index] or {}
        currentDealershipIndex = v.config
        currentConfig = config
        NfwClient.disableMarkerType(1)
        nuiOpen = true
        if config.dealershipConfig.playerSell or config.dealershipConfig.playerVehicle then
            currentDealership.playerVehicles = RPC.trigger('dealership-getPlayerVehicles')
            for k,v in pairs(currentDealership.playerVehicles) do
                currentDealership.playerVehicles[k].maxSpeed = math.floor(GetVehicleModelEstimatedMaxSpeed(v.index) * 3.6)
                currentDealership.playerVehicles[k].maxBraking = GetVehicleModelMaxBraking(v.index)
                currentDealership.playerVehicles[k].maxTraction = GetVehicleModelMaxTraction(v.index)
                currentDealership.playerVehicles[k].maxSeats = GetVehicleModelNumberOfSeats(v.index)
                currentDealership.playerVehicles[k].plate = v.plate
            end
        end
        cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
        SetCamActive(cam, true)
        RenderScriptCams(true, true, 500, true, true)   
        SetCamCoord(cam, currentConfig.dealershipConfig.vehicleCamCords)
        PointCamAtCoord(cam, currentConfig.dealershipConfig.showroomVehicleCoords)
        NfwClient.openUI({dealershipData = currentDealership, config = config.dealershipConfig})
        SetNuiFocus(true, true)
    end

    NfwClient.registerKeyPress(open)
    Nfw.registerCommand(open)

    NfwClient.registerNUICallback('close', function(data,cb)
        nuiOpen =
        NfwClient.enableMarkerType(1)
        if not dontDisableFocus then
            SetNuiFocus( false, false )
        end
        SetCamActive(cam, false)
        RenderScriptCams(false, true, 0, true, true)
        cam = nil
        dontDisableFocus = false
        if not testDrive then currentDealership = nil end
        if spawnedVehicle then DeleteEntity(spawnedVehicle); spawnedVehicle = nil end
        cb({})
    end)

    NfwClient.registerNUICallback('setVehicle', function(data,cb)
        if spawnedVehicle then DeleteEntity(spawnedVehicle) end
        currentVehicle = data.vehicle
        currentVehicleData = data
        local hash = GetHashKey(data.vehicle)
        RequestModel(hash)
        while not HasModelLoaded(hash) do
            Wait(0)
        end
        local veh = CreateVehicle(hash,currentConfig.dealershipConfig.showroomVehicleCoords.x,currentConfig.dealershipConfig.showroomVehicleCoords.y,currentConfig.dealershipConfig.showroomVehicleCoords.z, currentConfig.dealershipConfig.showroomVehicleCoords.w, false, true)
        spawnedVehicle = veh
        FreezeEntityPosition(veh, true)
        local rot = GetEntityRotation(veh)
        local minDim, maxDim = GetModelDimensions(hash)
        local modelSize = maxDim - minDim
        local fovval = modelSize.x * modelSize.y * modelSize.z
        fov = fovval + 20
        SetCamFov(cam, fov)
        print(json.encode(currentDealership.playerVehicles,{indent=true}))
        if data.category == 'playerVehicles' and Nfw.isModuleActive('nyo_bennys') and currentDealership.playerVehicles[tonumber(data.vId) + 1].custom then
            TriggerEvent('nfw:applyVehicleCustomization', nil, json.decode(currentDealership.playerVehicles[tonumber(data.vId) + 1].custom), veh)
        end
        cb(true)
        while DoesEntityExist(veh) do
            rot = vec3(rot.x, rot.y, rot.z + 0.1)
            SetEntityRotation(veh, rot)
            Wait(10)
        end
    end)

    NfwClient.registerNUICallback('startTestDrive', function(data,cb)
        SafeEvents.triggerServer('dealership-startTestDrive')
        DeleteEntity(spawnedVehicle)
        local hash = GetHashKey(currentVehicle)
        RequestModel(hash)
        while not HasModelLoaded(hash) do
            Wait(0)
        end
        local veh = CreateVehicle(hash,currentConfig.dealershipConfig.testDriveStartCoords.x,currentConfig.dealershipConfig.testDriveStartCoords.y,currentConfig.dealershipConfig.testDriveStartCoords.z, currentConfig.dealershipConfig.testDriveStartCoords.w, false, true)
        SetPedIntoVehicle(plyPed, veh, -1)
        -- NfwClient.closeUI()
        SetNuiFocus(false, false)
        SetCamActive(cam, false)
        RenderScriptCams(false, true, 0, true, true)

        if currentVehicleData then 
            if currentVehicleData.category == 'playerVehicles' and Nfw.isModuleActive('nyo_bennys') and currentDealership.playerVehicles[tonumber(currentVehicleData.vId) + 1].custom then
                TriggerEvent('nfw:applyVehicleCustomization', nil, json.decode(currentDealership.playerVehicles[tonumber(currentVehicleData.vId) + 1].custom), veh)
            end
        end
        testDrive = true
        while testDrive do
            if IsControlJustPressed(0,38) or not IsPedInAnyVehicle(PlayerPedId(), false) then
                testDrive = false
            end
            Wait(10)
        end
        SetCamActive(cam, true)
        RenderScriptCams(true, true, 500, true, true)   
        DeleteEntity(veh)
        SetEntityCoords(PlayerPedId(), resetCoord)
        NfwClient.sendNUIMessage('stopTestDrive', {})
        -- NfwClient.openUI({dealershipData = currentDealership, config = currentConfig.dealershipConfig})
        SetNuiFocus(true, true)
        SafeEvents.triggerServer('dealership-stopTestDrive')
        local veh = CreateVehicle(hash,currentConfig.dealershipConfig.showroomVehicleCoords.x,currentConfig.dealershipConfig.showroomVehicleCoords.y,currentConfig.dealershipConfig.showroomVehicleCoords.z, currentConfig.dealershipConfig.showroomVehicleCoords.w, false, true)
        spawnedVehicle = veh
        if currentVehicleData then 
            if currentVehicleData.category == 'playerVehicles' and Nfw.isModuleActive('nyo_bennys') and currentDealership.playerVehicles[tonumber(currentVehicleData.vId) + 1].custom then
                TriggerEvent('nfw:applyVehicleCustomization', nil, json.decode(currentDealership.playerVehicles[tonumber(currentVehicleData.vId) + 1].custom), veh)
            end
        end
        FreezeEntityPosition(veh, true)
        local rot = GetEntityRotation(veh)
        local minDim, maxDim = GetModelDimensions(hash)
        local modelSize = maxDim - minDim
        local fovval = modelSize.x * modelSize.y * modelSize.z
        fov = fovval + 20
        SetCamFov(cam, fov)
        if data.category == 'playerVehicles' and Nfw.isModuleActive('nyo_bennys') and currentDealership.playerVehicles[data.vehicle].custom then
            TriggerEvent('nfw:applyVehicleCustomization', nil, json.decode(currentDealership.playerVehicles[data.vehicle][5]), veh)
        end
        while DoesEntityExist(veh) do
            rot = vec3(rot.x, rot.y, rot.z + 0.1)
            SetEntityRotation(veh, rot)
            Wait(10)
        end
    end)

    NfwClient.registerNUICallback('buyVehicle', function(data,cb)
        local vehData = currentDealership[data.category][data.vehicle]
        local success, errorReason = RPC.trigger('dealership-buyVehicle', currentDealershipIndex, data.vehicle, data.category)
        if success then
            module_funcs.onPlayerBuyVehicle(data.vehicle, data.category, vehData.price, vehData.qtd - 1)
        else
            module_funcs.onPlayerFailureToBuyVehicle(errorReason, data.vehicle, data.category, vehData.price, vehData.qtd)
        end
    end)

    NfwClient.registerNUICallback('sellVehicle', function(data,cb)
        local success, errorReason = RPC.trigger('dealership-sellVehicle', data.vehicle, currentDealershipIndex, data.plate)
        if success then
            module_funcs.onPlayerSellVehicle(data.vehicle, errorReason)
            for k,v in pairs(currentDealership.playerVehicles) do 
                if v.plate == data.plate then 
                    currentDealership.playerVehicles[k] = nil
                end
            end            
            NfwClient.sendNUIMessage('updateUI', {dealershipData = currentDealership, config = currentConfig.dealershipConfig})
        else
            module_funcs.onPlayerFailureToSellVehicle(errorReason, data.vehicle)
        end
    end)

    AddEventHandler("nfw:closeUi", function()
        NfwClient.closeUI()
    end)
end)