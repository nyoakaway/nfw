Nfw.registerNyoModule('nyo_fuel', {}, false, function()

    NfwClient.registerInterface(1)

    local cfg = {}
    local pumpOffSet = {
        [-2007231801] = {0.0, 0.0, 2.11},
        [1339433404] = {0.0, 0.0, 2.11},
        [1933174915] = {0.0, 0.0, 2.21},
        [1694452750] = {0.0, 0.0, 2.21}
    }
    local fuelConfig = {
        index = nil,
        isFueling = false,
        canFuel = false,
        abastecer = false,
        config = {},
        pumpId = nil,
        pumpBrand = nil,
        pumpPrice = nil,
        vehicleId = nil,
        vehicleFuel = 0,
        userMoney = 0,
        currentFuel = 0,
        totalFuel = 0,
        totalVehicleFuel = 0,
        totalPrice = 0,
    }
    local configFuelI = NfwConfigs.fuelGeneralConfig
    local dataVehicle2, dataVnetId2, dataVPlaca2, dataVName2
    DecorRegister(configFuelI.FuelDecor, 1)

    if Nfw.isModuleActive('carSystem') then
        AddEventHandler("nyoModule:CarSystem", function(vehicle)
            CreateThread(function()
                ped = PlayerPedId()
                while IsPedInAnyVehicle(ped) do
                    ped = PlayerPedId()
                    Wait(1000)
                    local vehicle = GetVehiclePedIsIn(ped)
                    if GetPedInVehicleSeat(vehicle, -1) == ped then
                        fuelUsage(vehicle)
                    else
                        updateSyncFuel(vehicle)
                    end
                end
            end)

            CreateThread(function()
                ped = PlayerPedId()
                while IsPedInAnyVehicle(ped) do
                    ped = PlayerPedId()
                    sleep = 4
                    local vehicle = GetVehiclePedIsIn(ped)
                    if GetPedInVehicleSeat(vehicle, -1) == ped then
                        local fuel = GetVehicleFuelLevel(vehicle)
                        if fuel <= 0.0 then
                            SetVehicleUndriveable(vehicle, true)
                        end
                    end
                    Wait(sleep)
                end
            end)
        end)
    else
        CreateThread(function()
            ped = PlayerPedId()
            while true do
                ped = PlayerPedId()
                Wait(1000)
                if IsPedInAnyVehicle(ped) then
                    local vehicle = GetVehiclePedIsIn(ped)
                    if GetPedInVehicleSeat(vehicle, -1) == ped then
                        fuelUsage(vehicle)
                    else
                        updateSyncFuel(vehicle)
                    end
                end
            end
        end)

        CreateThread(function()
            ped = PlayerPedId()
            while true do
                ped = PlayerPedId()
                sleep = 1000
                if IsPedInAnyVehicle(ped) then
                    sleep = 4
                    local vehicle = GetVehiclePedIsIn(ped)
                    if GetPedInVehicleSeat(vehicle, -1) == ped then
                        local fuel = GetVehicleFuelLevel(vehicle)
                        if fuel <= 0.0 then
                            SetVehicleUndriveable(vehicle, true)
                        end
                    end
                end
                Wait(sleep)
            end
        end)
    end

    function updateSyncFuel(vehicle)
        -- sync player
    end

    AddEventHandler("nyoModule:CarSystem:LeftCar", function(vehicle)
        if Entity(vehicle).state.fuel then 
            Entity(vehicle).state.fuel = false 
            Entity(vehicle).state.syncFuel = false
        end
    end)

    function fuelUsage(vehicle)
        if IsVehicleEngineOn(vehicle) then
            local atualFuel = 0
            if not Entity(vehicle).state.fuel then             
                atualFuel = GetVehicleFuelLevel(vehicle)
            else 
                atualFuel = Entity(vehicle).state.fuel                
            end
            
            local newFuel = atualFuel - configFuelI.FuelUsage[Round(GetVehicleCurrentRpm(vehicle), 1)] *
                              (configFuelI.Classes[GetVehicleClass(vehicle)] or 1.0) / 10
            if newFuel > 100.00 then
                newFuel = 99.99
            elseif newFuel < 0.00 then 
                newFuel = 0.00
            end
           
            Entity(vehicle).state:set("fuel", newFuel, true)

            SetVehicleFuelLevel(vehicle, newFuel)
            DecorSetFloat(vehicle, configFuelI.FuelDecor, GetVehicleFuelLevel(vehicle))
        else
            local atualFuel = 0
            if not Entity(vehicle).state.fuel then             
                atualFuel = GetVehicleFuelLevel(vehicle)
            else 
                atualFuel = Entity(vehicle).state.fuel                
            end

            SetVehicleFuelLevel(vehicle, atualFuel + 0.0)
            DecorSetFloat(vehicle, configFuelI.FuelDecor, GetVehicleFuelLevel(vehicle))
        end
    end

    local drawingMarker = false
    NfwClient.registerMarkerFunction(function(v,k)
        if drawingMarker then return end
        fuelConfig.index = v.id
        local fuelPumps = {}
        local config = NfwConfigs[v.config].configFuel

        CreateThread(function()
            drawingMarker = true
            while fuelConfig.index ~= nil do
                local pool = {}
                dataVehicle2 = GetClosestVehicleFromPlayer(3)
                dataVName2 = GetEntityModel(dataVehicle2)
                for k, v in pairs(GetGamePool('CObject')) do
                    for k2, v2 in pairs(config.fuelPumps) do
                        if GetEntityModel(v) == v2.hash then
                            table.insert(pool,
                              {GetOffsetFromEntityInWorldCoords(v, 0.0, -1.0, 0.0),
                               GetOffsetFromEntityInWorldCoords(v, 0.0, 1.0, 0.0), GetEntityCoords(v), v, v2.type,
                               v2.price, v2.paymentType, v2.sellGalao, v2.sellBateria})
                        end
                    end
                end
                fuelPumps = pool
                if #(plyCoords - v.coord) > v.markerDistance then
                    fuelConfig.index = nil
                end
                Wait(2000)
            end
            drawingMarker = false
        end)

        CreateThread(function()
            drawingMarker = true
            while fuelConfig.index ~= nil do
                local ped = PlayerPedId()
                local cds = GetEntityCoords(ped)
                local nyoSleep = 1000
                if configFuelI.vehicleEletrical ~= nil then
                    if not fuelConfig.canFuel then
                        fuelConfig.abastecer = false
                        local dataVehicle = GetPlayersLastVehicle()
                        local vehicleCoords = GetEntityCoords(dataVehicle)
                        for k, v in pairs(fuelPumps) do
                            nyoSleep = 4
                            local pumpType = v[5]

                            local abType = 0
                            local pumpDist = 3.0
                            if dataVehicle ~= nil then
                                if pumpType == 'eletrical' and checkVehicleClass(GetVehicleClass(dataVehicle), pumpType) then
                                    if configFuelI.vehicleEletrical[dataVName2] then
                                        fuelConfig.abastecer = true
                                        pumpDist = 3.0
                                        abType = 1
                                    end
                                elseif pumpType == 'car' and checkVehicleClass(GetVehicleClass(dataVehicle), pumpType) then
                                    if not configFuelI.vehicleEletrical[dataVName2] then
                                        fuelConfig.abastecer = true
                                        pumpDist = 3.0
                                        abType = 1
                                    end
                                elseif pumpType == 'heli' and checkVehicleClass(GetVehicleClass(dataVehicle), pumpType) then
                                    fuelConfig.abastecer = true
                                    pumpDist = 8.0
                                    abType = 1
                                elseif pumpType == 'plane' and checkVehicleClass(GetVehicleClass(dataVehicle), pumpType) then
                                    fuelConfig.abastecer = true
                                    pumpDist = 8.0
                                    abType = 1
                                elseif pumpType == 'boat' and checkVehicleClass(GetVehicleClass(dataVehicle), pumpType) then
                                    fuelConfig.abastecer = true
                                    pumpDist = 8.0
                                    abType = 1
                                end
                            else
                                fuelConfig.abastecer = true
                                pumpDist = 1.5
                            end

                            local distance = #(cds - v[3])
                            if distance <= pumpDist then
                                if fuelConfig.abastecer then
                                    if abType == 1 then
                                        if IsPedInAnyVehicle(ped) and GetPedInVehicleSeat(GetVehiclePedIsIn(ped), -1) ==
                                          ped then
                                            if pumpType == 'eletrical' then
                                                DrawText3Ds(v[3].x, v[3].y, v[3].z + 1.2,
                                                  "SAIA DO ~y~VEÍCULO ~w~PARA RECARREGAR")
                                            else
                                                DrawText3Ds(v[3].x, v[3].y, v[3].z + 1.2,
                                                  "SAIA DO ~y~VEÍCULO ~w~PARA ABASTECER")
                                            end
                                        else
                                            distAnalise = 3.5
                                            if pumpType == 'heli' then
                                                distAnalise = 4.0
                                            end
                                            if DoesEntityExist(dataVehicle) and (#(cds - vehicleCoords) < distAnalise) then
                                                if not DoesEntityExist(GetPedInVehicleSeat(dataVehicle, -1)) then
                                                    local vFuel = GetVehicleFuelLevel(dataVehicle)
                                                    if vFuel < 99 then
                                                        if pumpType == 'eletrical' then
                                                            DrawText3Ds(v[3].x, v[3].y, v[3].z + 1.2,
                                                              "PRESSIONE ~g~E ~w~PARA RECARREGAR")
                                                        else
                                                            DrawText3Ds(v[3].x, v[3].y, v[3].z + 1.2,
                                                              "PRESSIONE ~g~E ~w~PARA ABASTECER")
                                                        end
                                                        if IsControlJustPressed(0, 38) then
                                                            fuelConfig.pumpId = v[4]
                                                            fuelConfig.canFuel = true
                                                            fuelConfig.pumpPrice = v[6]
                                                            fuelConfig.pumpBrand = config.fuelBrand
                                                            fuelConfig.vehicleId = dataVehicle
                                                            fuelConfig.vehicleFuel = vFuel
                                                            fuelConfig.paymentType = v[7]
                                                            fuelConfig.userMoney = RPC.trigger('fuel-svGetUserMoney', fuelConfig.paymentType)
                                                            Wait(50)
                                                            SetNuiFocus(true, true)
                                                            TriggerEvent('cancelando', true)
                                                            NfwClient.openUI({
                                                                brand = config.fuelBrand,
                                                                type = pumpType,
                                                                price = fuelConfig.pumpPrice,
                                                                vfuel = vFuel,
                                                                sGalao = v[8] or false,
                                                                pGalao = configFuelI.itensPrice.galao,
                                                                iGalao = NyoFw.getItemImg('galao'),
                                                                sBateria = v[9] or false,
                                                                pBateria = configFuelI.itensPrice.bateria,
                                                                iBateria = NyoFw.getItemImg('bateria'),
                                                            })
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    else
                                        -- caso não for AB1
                                    end
                                end
                            end
                        end
                    end
                end
                Wait(nyoSleep)
            end
            drawingMarker = false
        end)
    end)

    function checkVehicleClass(vehicle, type)
        local valid = false
        if type == 'car' or type == 'eletrical' or type == 'bike' then
            if vehicle <= 7 or vehicle == 8 or vehicle == 9 or vehicle == 10 or vehicle == 11 or vehicle == 12 or
              vehicle == 17 or vehicle == 18 or vehicle == 20 then
                valid = true
            end
        elseif type == 'boat' then
            if vehicle == 14 then
                valid = true
            end
        elseif type == 'heli' then
            if vehicle == 15 then
                valid = true
            end
        elseif type == 'plane' then
            if vehicle == 16 then
                valid = true
            end
        end

        return valid
    end

    NfwClient.registerNUICallback("close", function(data, cb)
        NfwClient.enableMarkerType(1)
        local ped = PlayerPedId()
        if fuelConfig.isFueling then
            stopFuel()
            fuelConfig.isFueling = false
        end
        fuelConfig.isFueling = false
        fuelConfig.index = nil
        fuelConfig.canFuel = nil
        fuelConfig.pumpId = nil
        fuelConfig.totalPrice = 0
        TriggerEvent('cancelando', false)
        SetNuiFocus(false, false)
        ClearPedTasks(ped)
    end)

    NfwClient.registerNUICallback("fuelSet", function(data, cb)
        if data[1] == 'start' then
            fuelConfig.isFueling = true
            startFuel()
        elseif data[1] == 'stop' then
            NfwClient.enableMarkerType(1)
            stopFuel()
            if fuelConfig.isFueling then
                fuelConfig.isFueling = false
            end
            fuelConfig.canFuel = false
            fuelConfig.totalFuel = 0
            fuelConfig.totalPrice = 0
            fuelConfig.vehicleId = nil
            fuelConfig.vehicleFuel = 0
        end
    end)

    NfwClient.registerNUICallback("fuelBuy", function(data, cb)
        if data[1] then
            SafeEvents.triggerServer("nfw:fuel:buy", data[1], fuelConfig.paymentType)
        end
    end)

    function startFuel()
        ped = PlayerPedId()
        if pumpOffSet[GetEntityModel(fuelConfig.pumpId)] ~= nil then
            startFuelRope()
        end
        TaskTurnPedToFaceEntity(ped, fuelConfig.vehicleId, 5000)
        CreateThread(function()
            while fuelConfig.isFueling do
                local fuelAdd = math.random(20, 20) / 100.0
                fuelConfig.totalFuel = fuelConfig.totalFuel + fuelAdd
                fuelConfig.currentFuel = (fuelConfig.vehicleFuel + fuelConfig.totalFuel) + 0.0000001
                fuelConfig.totalPrice = fuelConfig.totalPrice + (fuelAdd * fuelConfig.pumpPrice)

                if fuelConfig.currentFuel >= 100 then
                    fuelConfig.currentFuel = 99.9999
                    SetVehicleFuelLevel(fuelConfig.vehicleId, fuelConfig.currentFuel)
                    stopFuel()
                else
                    if fuelConfig.totalPrice < fuelConfig.userMoney then
                        SetVehicleFuelLevel(fuelConfig.vehicleId, fuelConfig.currentFuel)
                        NfwClient.sendNUIMessage('fuelUpdate',{
                            vfuel = fuelConfig.currentFuel,
                            totalprice = fuelConfig.totalPrice,
                            totalfuel = fuelConfig.totalFuel
                        })
                    else
                        stopFuel()
                    end
                end
                Wait(100)
            end
        end)
        CreateThread(function()
            ped = PlayerPedId()
            TaskTurnPedToFaceEntity(ped, vehicleId, 5000)
            if not HasAnimDictLoaded("timetable@gardener@filling_can") then
                RequestAnimDict("timetable@gardener@filling_can")
                while not HasAnimDictLoaded("timetable@gardener@filling_can") do
                    Wait(10)
                end
            end
            TaskPlayAnim(ped, "timetable@gardener@filling_can", "gar_ig_5_filling_can", 2.0, 8.0, -1, 50, 0, 0, 0, 0)
            while true do
                local nyoSleep = 300
                if fuelConfig.isFueling then
                    nyoSleep = 1
                    for k, v in pairs(configFuelI.DisableKeys) do
                        DisableControlAction(0, v)
                    end
                else
                    ClearPedTasks(ped)
                    RemoveAnimDict("timetable@gardener@filling_can")
                    break
                end
                Wait(nyoSleep)
            end
        end)
    end

    function stopFuel()
        if pumpOffSet[GetEntityModel(fuelConfig.pumpId)] ~= nil then
            stopFuelRope()
        end
        ped = PlayerPedId()
        fuelConfig.isFueling = false
        fuelConfig.index = nil
        fuelConfig.canFuel = nil
        fuelConfig.pumpId = nil
        SetNuiFocus(false, false)
        NfwClient.closeUI()
        TriggerEvent('cancelando', false)
        ClearPedTasks(ped)
        RemoveAnimDict("timetable@gardener@filling_can")
        local finishFuelVar = RPC.trigger('fuel-finishFuel', VehToNet(fuelConfig.vehicleId), fuelConfig.vehicleFuel,
          fuelConfig.totalFuel, fuelConfig.totalPrice, fuelConfig.paymentType)
        if not finishFuelVar then
            SetVehicleFuelLevel(fuelConfig.vehicleId, fuelConfig.vehicleFuel)
        end
        fuelConfig.totalFuel = 0
    end

    fuelRope = nil
    fuelProp = nil
    fuelModel = GetHashKey('prop_cs_fuel_nozle')

    function startFuelRope()
        local ped = PlayerPedId()
        local plycds = GetEntityCoords(ped)
        local obj = fuelConfig.pumpId
        local objcds = GetEntityCoords(obj)
        local offset = pumpOffSet[GetEntityModel(obj)]
        RequestModel(fuelModel)
        RopeLoadTextures()
        while not RopeAreTexturesLoaded() do
            Wait(10)
        end
        while not HasModelLoaded(fuelModel) do
            Wait(10)
        end
        fuelProp = CreateObject(fuelModel, plycds, true, true)
        SafeEvents.triggerServer("nfw:نص عربي لترجمة قرن! إذا كنت تقرأ هذا ... أنت ديوث!", ObjToNet(fuelProp))
        AttachEntityToEntity(fuelProp, ped, GetPedBoneIndex(ped, 60309), 0.03, 0.05, 0.03, 95.0, 0.0, 170.0, false,
          false, false, false, 0, true)
        local propcds = GetEntityCoords(fuelProp)
        FreezeEntityPosition(fuelProp, true)
        fuelRope = AddRope(objcds, 0.0, 0.0, 0.0, 0.0, 4, 0.0, 0.0, 0.0, 0, 0, 0, 0.0, false)
        AttachEntitiesToRope(fuelRope, fuelProp, obj, GetOffsetFromEntityInWorldCoords(fuelProp, 0.0, 0.0, -0.2),
          GetOffsetFromEntityInWorldCoords(obj, offset[1], offset[2], offset[3]), 0.0, 0, 0, nil, nil)
        StartRopeWinding(fuelRope)
        RopeForceLength(fuelRope, #(GetOffsetFromEntityInWorldCoords(fuelProp, 0.0, 0.0, -0.2) -
          GetOffsetFromEntityInWorldCoords(obj, offset[1], offset[2], offset[3])))
    end

    function stopFuelRope()
        local ped = PlayerPedId()
        DeleteEntity(fuelProp)
        DeleteRope(fuelRope)
        RopeUnloadTextures()
        SetModelAsNoLongerNeeded(fuelModel)
    end

    AddEventHandler("nfw:closeUi", function()
        NfwClient.closeUI()
    end)

    -- RegisterCommand("testS", function(source, args)
    --     local veh = NetToVeh(7)
    --     print(Entity(veh).state.fuel3)
    --     Entity(veh).state:set("fuel3", tonumber(args[1]), true)
    --     print(Entity(veh).state.fuel3)
    -- end)

    -- RegisterCommand("testS2", function(source, args)
    --     local veh = NetToVeh(7)
    --     print(Entity(veh).state.fuel3)
    -- end)

 
end)
