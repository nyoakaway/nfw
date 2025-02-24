local module = 'nyo_garages'

Nfw.registerNyoModule(module, {}, false, function()

    local functions = Nfw.getModuleFunctions()
    local UIOpen = false
    local currentGarageType
    local currentGarageConfig

    NfwClient.registerInterface(1)

    local vehicleClasses = {
        [0] = "carro",
        [1] = "carro",
        [2] = "carro",
        [3] = "carro",
        [4] = "carro",
        [5] = "carro",
        [6] = "carro",
        [7] = "carro",
        [8] = "carro",
        [9] = "carro",
        [10] = "carro",
        [11] = "carro",
        [12] = "carro",
        [13] = "carro",
        [14] = "barco",
        [15] = "helicoptero",
        [16] = "helicoptero",
        [17] = "carro",
        [18] = "carro",
        [19] = "carro",
        [20] = "carro",
        [21] = "carro",
    }
    local locData
    local VehsData = {}
    local garageTypesNames = {
        home = 'Garagem de Casa',
        public = 'Garagem Pública',
        work = 'Garagem de Trabalho'
    }

    -- NfwClient.sendNUIMessage('setVehicleList', NfwConfigs.garagesGeneralConfig.vehicleList)

    local function openNuiGarage(locindex, loc)
        locData = loc
        local vehicles = RPC.trigger('garage-open',loc.config, loc.homeName)

        if vehicles then 
            local config = NfwConfigs[loc.config]
            currentGarageConfig = config
            local categories = {}
            local selectedCategories = {}
            local findWorkVehicleModels = {}
            local work = config.garagemConfig.garagemType == 'work'

            for k,v in pairs(vehicles) do
                local vehicleClass = GetVehicleClassFromName(v[2])
                local className = vehicleClasses[vehicleClass]
                local vehtype = NyoFw.getVehicleType(v[2])

                if not selectedCategories[vehtype] then
                    categories[#categories + 1] = vehtype
                    selectedCategories[vehtype] = true
                end

                vehicles[k].info = {
                    model = NyoFw.getVehicleModelName(v[2]),
                    name = NyoFw.getVehicleName(v[2]),
                    category = vehtype,
                    maxSpeed = NyoFw.getVehicleAttribute(v[2], 'maxSpeed') or math.floor(GetVehicleModelEstimatedMaxSpeed(v[2]) * 3.6),
                    maxBraking = NyoFw.getVehicleAttribute(v[2], 'maxBraking') or GetVehicleModelMaxBraking(v[2]),
                    maxTraction = NyoFw.getVehicleAttribute(v[2], 'maxTraction') or GetVehicleModelMaxTraction(v[2]),
                    class = NyoFw.getVehicleAttribute(v[2], 'class') or GetLabelText('VEH_CLASS_'..vehicleClass),
                    taxPrice = GaragesFunctions.getVehicleTax(v[2], nil, work),
                    scrappedVehicleInsuranceTax = GaragesFunctions.getScrappedVehicleInsuranceTax(v[2], nil, work),
                    detentionTax = GaragesFunctions.getVehicleDetentionTax(v[2], nil, work),
                    explodedVehicleInsuranceTax = GaragesFunctions.getVehicleExplodedVehicleInsuranceTax(v[2], nil, work),
                    garageTax = GaragesFunctions.getVehicleGarageTax(vehHash, nil, work, loc.config),
                    allowed = true
                }
                
                if work then
                    findWorkVehicleModels[v[2]] = true
                    for l,w in pairs(config.garagemConfig.vehicles) do
                        if GetHashKey(w.vehicle) == v[2] then
                            local allowed = false 
                            if (not v.upgrade or v.upgrade and NyoFw.checkUpgrade(v.upgrade)) and NyoFw.hasPermission(v.perm) then 
                                allowed = true
                            end
                            vehicles[k].info.allowed = allowed
                            vehicles[k].workConfig = l
                            break
                        end
                        --vehicles[k] = nil
                    end
                end
            end

            if work then
                for k,v in pairs(config.garagemConfig.vehicles) do
                    local vehHash = GetHashKey(v.vehicle)
                    local vehtype = NyoFw.getVehicleType(vehHash)
                    if not findWorkVehicleModels[vehHash] and config.garagemConfig.garagemMenu[vehtype] then
                        local insertId = #vehicles + 1
                        vehicles[insertId] = {nil,vehHash,'Não cadastrado', workConfig = k}
                        
                        local vehicleClass = GetVehicleClassFromName(vehHash)
                        local className = vehicleClasses[vehicleClass]
            
                        if not selectedCategories[vehtype] then
                            categories[#categories + 1] = vehtype
                            selectedCategories[vehtype] = true
                        end

                        local allowed = false 
                        if (not v.upgrade or v.upgrade and NyoFw.checkUpgrade(v.upgrade)) and NyoFw.hasPermission(v.perm) then 
                            allowed = true
                        end
                    
                        vehicles[insertId].info = {
                            model = NyoFw.getVehicleModelName(vehHash),
                            name = NyoFw.getVehicleName(vehHash),
                            category = vehtype,
                            maxSpeed = NyoFw.getVehicleAttribute(vehHash, 'maxSpeed') or math.floor(GetVehicleModelEstimatedMaxSpeed(vehHash) * 3.6),
                            maxBraking = NyoFw.getVehicleAttribute(vehHash, 'maxBraking') or GetVehicleModelMaxBraking(vehHash),
                            maxTraction = NyoFw.getVehicleAttribute(vehHash, 'maxTraction') or GetVehicleModelMaxTraction(vehHash),
                            class = NyoFw.getVehicleAttribute(vehHash, 'class') or GetLabelText('VEH_CLASS_'..vehicleClass),
                            taxPrice = GaragesFunctions.getVehicleTax(vehHash, nil, true),
                            scrappedVehicleInsuranceTax = GaragesFunctions.getScrappedVehicleInsuranceTax(vehHash, nil, true),
                            detentionTax = GaragesFunctions.getVehicleDetentionTax(vehHash, nil, true),
                            explodedVehicleInsuranceTax = GaragesFunctions.getVehicleExplodedVehicleInsuranceTax(vehHash, nil, true),
                            garageTax = GaragesFunctions.getVehicleGarageTax(vehHash, nil, true, loc.config),
                            allowed = allowed
                        }

                        findWorkVehicleModels[vehHash] = true

                    end
                end
            end

            VehsData = vehicles

            NfwClient.openUI({
                categories = categories,
                vehicles = vehicles, 
                config = config
            })
        else
            NfwClient.enableMarkerType(1)
        end
        

    end

    NfwClient.registerKeyPress(function(v,k)
        NfwClient.disableMarkerType(1)
        currentGarageType = NfwConfigs[v.config].garagemConfig.garagemType
        openNuiGarage(k, v)
    end)

    Nfw.registerCommand(function(v)
        NfwClient.disableMarkerType(1)
        currentGarageType = NfwConfigs[v.config].garagemConfig.garagemType
        openNuiGarage(nil, v)
    end)

    NfwClient.registerNUICallback('getVehicleInfo', function(data,cb)
        if not data.id then
            local formattedInfo = {
                taxLate = false,
                impounded = false,
                scrapped = false,
                body = 1000,
                engine = 1000,
                fuel = 100,
                spawned = false,
                exploded = false,
                nextTax = NfwConfigs.garagesGeneralConfig.taxTime
            }
            cb(formattedInfo)
            VehsData[data.vehIndex].info = table.merge(VehsData[data.vehIndex].info, formattedInfo)
            return
        end
        local info = RPC.trigger('garage-getVehicleInfo', data.id)
        local formattedInfo = {
            taxLate = info[1],
            impounded = info[2],
            scrapped = info[3],
            body = info[4],
            engine = info[5],
            fuel = info[6],
            spawned = info[7],
            nextTax = info[8]
        }
        VehsData[data.vehIndex].info = table.merge(VehsData[data.vehIndex].info, formattedInfo)
        cb(formattedInfo)
    end)
    local timeout = false

    NfwClient.registerNUICallback('StoreClosestVehicle', function(data,cb)
        if timeout then return cb({}) end
        timeout = true
        local ClosestVeh = NyoFw.getClosestVehicleFromPlayer(NfwConfigs[locData.config].garagemConfig.deleteVehicleDistance or 30.0)
        if ClosestVeh and ClosestVeh ~= 0 then
            TriggerServerEvent('nyo_module:delete_vehicle', GetPlayerServerId(PlayerId()), VehToNet(ClosestVeh), NyoFw.getVehicleModelName(GetEntityModel(ClosestVeh)))
        end
        cb({})
        Wait(1500)
        timeout = false
    end)

    NfwClient.registerNUICallback('SellVehicle', function(data,cb)
        if timeout then return cb({}) end
        timeout = true
        local success = RPC.trigger('garage-sellVehicle', data.vehId, data.id, data.value)
        cb({success = success})
        Wait(1500)
        timeout = false
    end)

    NfwClient.registerNUICallback('PayVehicleTax', function(data,cb)
        if timeout then return cb({}) end
        timeout = true
        local success = RPC.trigger('garage-payVehicleTax', data.vehId)
        cb({success = success, nextTax = NfwConfigs.garagesGeneralConfig.taxTime})
        Wait(1500)
        timeout = false
    end)

    NfwClient.registerNUICallback('PayDetentionTax', function(data,cb)
        if timeout then return cb({}) end
        timeout = true
        local success = RPC.trigger('garage-payDetentionTax', data.vehId)
        cb({success = success})
        Wait(1500)
        timeout = false
    end)

    NfwClient.registerNUICallback("PayScrappedVehicleInsuranceTax", function(data,cb)
        if timeout then return cb({}) end
        timeout = true
        local success = RPC.trigger('garage-payScrappedVehicleInsuranceTax', data.vehId)
        cb({success = success})
        Wait(1500)
        timeout = false
    end)

    NfwClient.registerNUICallback("SpawnVehicle", function(data,cb)
        if timeout then return cb({}) end
        timeout = true
        local config = NfwConfigs[locData.config]
        local spawnCoords
        if config.garagemConfig.allowPlayerSelectVehicleSpawnLocation then
            local offsetCoords = GetOffsetFromEntityInWorldCoords(plyPed, 10.0, 0.0, 0.0)
            local heading = GetEntityHeading(plyPed)
            spawnCoords = vector4(offsetCoords.x, offsetCoords.y, offsetCoords.z, heading)
        else
            for k,v in pairs(locData.spawn) do
                if not NyoFw.getClosestVehicleFromCoords(vec3(v.x,v.y,v.z), 5.0) then
                    spawnCoords = v
                    break
                end
            end
        end
        if not spawnCoords then
            cb({success = false})
            NfwGlobalFunctions.notify("Negado", "Todas vagas estão ocupadas", "#FF0000",  8000, "fa-heartbeat")
            timeout = false
            return
        end
        local success, netVehId, vehId, plate, custom, damage = RPC.trigger('garage-spawnVehicle', data.vehId, data.workConfig, spawnCoords)
        cb({success = success, vehId = vehId, plate = plate})
        if success then
            if config.garagemConfig.closeUIAfterVehicleSpawn then
                NfwClient.closeUI({})
            end
            local vehicle
            for k,v in pairs(VehsData) do
                if data.vehId then
                    if data.vehId == v[1] then
                        vehicle = v
                        break
                    end
                else
                    if data.workConfig == v.workConfig then
                        VehsData[k][1] = vehId
                        VehsData[k][3] = plate
                        vehicle = VehsData[k]
                        break
                    end
                end
            end
            local extras, livery, mods
            if config.garagemConfig.garagemType == 'work' then
                local vehConfig = config.garagemConfig.vehicles[vehicle.workConfig]
                extras = vehConfig.extras
                livery = vehConfig.livery
                mods = vehConfig.mods
            end
 
            while not NetworkDoesEntityExistWithNetworkId(netVehId) do print("a") Wait(100) end
            local localVehId = NetToVeh(netVehId)
            while not DoesEntityExist(localVehId) do print "b" Wait(100) end
            SetVehicleModKit(localVehId,0)
            SetVehicleNumberPlateText(localVehId, vehicle[3])
            SetVehicleEngineHealth(localVehId, vehicle.info.engine + 0.0)
            SetVehicleBodyHealth(localVehId, vehicle.info.body + 0.0)
            Wait(50)
            local vehFuel = Entity(localVehId).state.fuel
            SetVehicleFuelLevel(localVehId, vehFuel + 0.0)

            SetVehicleIsConsideredByPlayer(localVehId, true)
            SetVehicleIsStolen(localVehId, false)
            SetVehicleHasBeenOwnedByPlayer(localVehId, true)
            SetVehicleNeedsToBeHotwired(localVehId,false)
            SetVehicleOnGroundProperly(localVehId)
            SetEntityAsMissionEntity(localVehId,true,true)
            SetVehRadioStation(localVehId,"OFF")
            SetVehicleEngineOn(localVehId, false, true, true)
            SetVehicleDoorsLocked(localVehId, 2)

            local ped = GetPedInVehicleSeat(localVehId, -1)
            if ped ~= 0 then
                NetworkRequestControlOfEntity(ped)
                while not NetworkHasControlOfEntity(ped) do
                    Wait(100)
                end
                SetEntityAsNoLongerNeeded(ped)
                SetEntityAsMissionEntity(ped, false)
                DeleteEntity(ped)
            end

            if extras then
                for k,v in pairs(extras) do
                    SetVehicleExtra(localVehId, k, not v)
                end
            end

            if livery then
                SetVehicleLivery(localVehId, livery)
            end

            if Nfw.isModuleActive('nyo_bennys') then -- bennys
                if custom then
                    TriggerEvent('nfw:applyVehicleCustomization', netVehId, custom)
                end
            end

            if not custom and mods then
                if mods.wheelType then
                    SetVehicleWheelType(localVehId,mods.wheelType)
                end
                for i = 0, 49 do
                    if mods[i] then
                        if type(mods[i]) == "boolean" then
                            ToggleVehicleMod(localVehId,i,mods[i])
                        else
                            SetVehicleMod(localVehId,i,mods[i])
                        end
                    end
                end
                if mods.neon then
                    for i = 0, 3 do
                        SetVehicleNeonLightEnabled(localVehId, i, mods.neon[tostring(i)])
                    end
                    SetVehicleNeonLightsColour(localVehId,mods.neon.color.r,mods.neon.color.g,mods.neon.color.b)
                end
                if mods.primaryPaintType then
                    SetVehicleModColor_1(localVehId, mods.primaryPaintType, 0, mods.pearlescentColour or 0)
                end
                if mods.secondaryColour then
                    SetVehicleModColor_2(localVehId, mods.secondaryPaintType, 0)
                end
                if mods.primaryColour then
                    SetVehicleCustomPrimaryColour(localVehId, mods.primaryColour.r, mods.primaryColour.g, mods.primaryColour.b)
                end
                if mods.secondaryColour then
                    SetVehicleCustomSecondaryColour(localVehId, mods.secondaryColour.r, mods.secondaryColour.g, mods.secondaryColour.b)
                end
                if mods.tyreSmokeColour then
                    SetVehicleTyreSmokeColor(localVehId, mods.tyreSmokeColour.r, mods.tyreSmokeColour.g, mods.tyreSmokeColour.b)
                end
                if mods.pearlescentColour or mods.wheelColour then
                    SetVehicleExtraColours(localVehId, mods.pearlescentColour or 0, mods.wheelColour or 0)
                end
                if mods.windowTint then
                    SetVehicleWindowTint(localVehId, mods.windowTint)
                end
                if mods.xenonColour then
                    SetVehicleXenonLightsColor(localVehId, mods.xenonColour)
                end
                if mods.plate then
                    SetVehicleNumberPlateTextIndex(localVehId, mods.plate)
                end
            end
            
            if damage then

                if damage.doors then
                    for i = 0, 5 do
                        if damage.doors[tostring(i)] then
                            SetVehicleDoorBroken(localVehId,i,true)
                        end
                    end
                end

                if damage.windows then
                    for i = 0, 7 do
                        if damage.windows[tostring(i)] then
                            SmashVehicleWindow(localVehId, i)
                        end
                    end
                end

                if damage.tyres then

                    for i = 0, 5 do
                        if damage.tyres[tostring(i)] then
                            SetVehicleTyreBurst(localVehId, i, true, 1000)
                        end
                    end

                    if damage.tyres[45] then
                        SetVehicleTyreBurst(localVehId, 45, true, 1000)
                    end

                    if damage.tyres[47] then
                        SetVehicleTyreBurst(localVehId, 47, true, 1000)
                    end

                end

                if damage.dirtLevel then
                    SetVehicleDirtLevel(localVehId, damage.dirtLevel)
                end
                
            end

            functions.onVehicleSpawn(localVehId, netVehId, custom, damage, extras, livery, vehicle.info[3], vehicle.info.engine, vehicle.info.body, vehicle.info.fuel, vehicle.info.model, mods)
        end
        Wait(3500)
        timeout = false
    end)

    RegisterNetEvent("nfw:nyo_garages:safeCustomization", function(entity)
        local veh = NetToVeh(entity)
        if DoesEntityExist(veh) then 
            Wait(50)
            local custom = Entity(veh).state.customization
            local damage = Entity(veh).state.damage 
            local plate = Entity(veh).state.plate 

            if custom then 
               TriggerEvent('nfw:applyVehicleCustomization', entity, custom)                  
            end

            if damage then
                if damage.doors then
                    for i = 0, 5 do
                        if damage.doors[tostring(i)] then
                            SetVehicleDoorBroken(veh,i,true)
                        end
                    end
                end

                if damage.windows then
                    for i = 0, 7 do
                        if damage.windows[tostring(i)] then
                            SmashVehicleWindow(veh, i)
                        end
                    end
                end

                if damage.tyres then

                    for i = 0, 5 do
                        if damage.tyres[tostring(i)] then
                            SetVehicleTyreBurst(veh, i, true, 1000)
                        end
                    end

                    if damage.tyres[45] then
                        SetVehicleTyreBurst(veh, 45, true, 1000)
                    end

                    if damage.tyres[47] then
                        SetVehicleTyreBurst(veh, 47, true, 1000)
                    end

                end

                if damage.dirtLevel then
                    SetVehicleDirtLevel(veh, damage.dirtLevel)
                end
                
            end

            if plate then 
                SetVehicleNumberPlateText(veh, plate)
            end
        end
    end)

    NfwClient.registerNUICallback("StoreVehicle", function(data,cb)
        if timeout then return cb({}) end
        timeout = true
        local success = RPC.trigger('garage-storeVehicle', data.vehId, currentGarageConfig.garagemConfig.deleteVehicleDistance or 30.0)
        cb({success = success})
        Wait(3500)
        timeout = false
    end)

    NfwClient.registerNUICallback("GetVehicleKeys", function(data,cb)
        local keys = RPC.trigger('garage-getVehicleKeys',data.vehId)
        cb(keys)
    end)

    NfwClient.registerNUICallback('RemoveKey', function(data,cb)
        SafeEvents.triggerServer('garage-removeKey', data.id, data.vehId)
        cb({})
    end)

    NfwClient.registerNUICallback('garageClose', function(data,cb)
        NfwClient.enableMarkerType(1)
        SetNuiFocus(false,false)
        TriggerServerEvent('nyo_module:close_garage')
        locData, VehsData = nil, nil
        cb({})
    end)

    NfwClient.registerNUICallback('AddKey', function(data,cb)
        local name = RPC.trigger('garage-addKey', data.vehId, data.id)
        cb({success = true, name = name})
    end)

    RPC.addHandler('garage-getVehicleDamage', function(netid)
        local veh = NetToVeh(netid)
        local damage = { doors = {}, windows = {}, tyres = {}}

        for i = 0, 5 do
            damage.doors[tostring(i)] = IsVehicleDoorDamaged(veh,i)
        end

        if not AreAllVehicleWindowsIntact(veh) then
            for i = 0, 7 do
                damage.windows[tostring(i)] = IsVehicleWindowIntact(veh, i)
            end
        end

        for i = 0, 5 do
            damage.tyres[tostring(i)] = IsVehicleTyreBurst(veh,i,false)
        end

        damage.tyres['45'] = IsVehicleTyreBurst(veh,45,false)
        damage.tyres['47'] = IsVehicleTyreBurst(veh,47,false)

        local engine = math.floor(GetVehicleEngineHealth(veh))
        local body = math.floor(GetVehicleBodyHealth(veh))
        local fuel = math.floor(GetVehicleFuelLevel(veh))

        damage.exploded = engine <= -100
        damage.dirtLevel = GetVehicleDirtLevel(veh)
        damage.petrolTankHealth = GetVehiclePetrolTankHealth(veh)
        damage.oilLevel = GetVehicleOilLevel(veh)

        return engine, body, fuel, damage
    end)

    local timeoutLockVehicle
    RegisterCommand("nyo_module:vehicleLock2", function()
        if timeoutLockVehicle then return end
        timeoutLockVehicle = true
        local ped = plyPed
        local cds = plyCoords
        local veh = GetClosestVehicleFromPlayer(5.0)
        if veh and veh ~= 0 then
            local vehLock = GetVehicleDoorLockStatus(veh)
            local plate = GetVehicleNumberPlateText(veh)
            local success = RPC.trigger('garages-lockVehicle', VehToNet(veh), vehLock, plate)
            if success then
                functions.onVehicleLock(veh, vehLock == 1)
            end
        else
            console.debug('^3[ GARAGES ] ^7Did not find vehicle to lock')
        end 
        Wait(3000)
        timeoutLockVehicle = false
    end)

    RegisterKeyMapping("nyo_module:vehicleLock2", 'Trancar / Destrancar veículos', 'KEYBOARD', "l")

    RegisterNetEvent("nfw:garagem:playVehicleAlarm", function(vehicle, time)
        if vehicle then 
            local veh = NetToVeh(vehicle)
            if NetworkHasControlOfEntity(veh) then                
                SetVehicleAlarm(veh, true)
                SetVehicleAlarmTimeLeft(veh, time or 10000)
            end
        end
    end)

    RegisterCommand("doors", function(source, args)
        local veh = NyoFw.getClosestEntity('vehicle', nil, radius, 'all')
        if veh then 
            if NetworkHasControlOfEntity(veh) then              
                if args[1] then 
                    local door = tonumber(args[1])
                    if door == 5 then 
                        local isopen = GetVehicleDoorAngleRatio(veh,5)
                        if isopen == 0 then
                            SetVehicleDoorOpen(veh,5,0,0)
                        else
                            SetVehicleDoorShut(veh,5,0)
                        end
                    else 
                        local isopen = GetVehicleDoorAngleRatio(veh,door - 1)
                        if isopen == 0 then
                            SetVehicleDoorOpen(veh,door - 1,0,0)
                        else
                            SetVehicleDoorShut(veh,door - 1,0)
                        end
                    end
                else                     
                    local isopen = GetVehicleDoorAngleRatio(veh,0) and GetVehicleDoorAngleRatio(veh,1)   
                    if isopen == 0 then
						SetVehicleDoorOpen(veh,0,0,0)
						SetVehicleDoorOpen(veh,1,0,0)
						SetVehicleDoorOpen(veh,2,0,0)
						SetVehicleDoorOpen(veh,3,0,0)
					else
						SetVehicleDoorShut(veh,0,0)
						SetVehicleDoorShut(veh,1,0)
						SetVehicleDoorShut(veh,2,0)
						SetVehicleDoorShut(veh,3,0)
					end
                end
            end            
        end        
    end)

    RegisterCommand("hood", function(source, args)
        local veh = NyoFw.getClosestEntity('vehicle', nil, radius, 'all')
        if veh then 
            if NetworkHasControlOfEntity(veh) then   
                local isopen = GetVehicleDoorAngleRatio(veh,4)
                if isopen == 0 then
                    SetVehicleDoorOpen(veh,4,0,0)
                else
                    SetVehicleDoorShut(veh,4,0)
                end
            end
        end
    end)

    RegisterCommand("wins", function(source, args)
    
    end)

    AddEventHandler("nfw:closeUi", function()
        NfwClient.closeUI()
    end)
end)
