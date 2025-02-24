Nfw.extendModule(function()

    local funcs = {}

    RPC.addHandler('garages-getClosestVehiclesFromPlayer', function(radius)
        return GetClosestVehiclesFromPlayer(radius)
    end)

    RPC.addHandler('garages-getClosestVehicleFromPlayer', function(radius)
        return VehToNet(GetClosestVehicleFromPlayer(radius))
    end)

    RPC.addHandler('garages-getClosestVehiclesFromCoords', function(coords, radius)
        return GetClosestVehiclesFromCoords(coords, radius)
    end)

    RPC.addHandler('garages-getClosestVehicleFromCoords', function(coords, radius)
        return GetClosestVehicleFromCoords(coords, radius)
    end)

    RPC.addHandler('garages-getClosestVehicleInfo', function(radius)
       return NyoFw.getClosestVehiclesInfo(radius)
    end)

    funcs.getClosestVehiclesInfo = function(radius)
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsUsing(ped)
        if not IsPedInAnyVehicle(ped) then
            veh = NyoFw.getClosestEntity('vehicle', nil, radius, 'all')
        end
        if IsEntityAVehicle(veh) then
            local lock = GetVehicleDoorLockStatus(veh)
            local trunk = GetVehicleDoorAngleRatio(v,5)
            local x,y,z = table.unpack(GetEntityCoords(ped))
            local tuning = { GetNumVehicleMods(veh,13),GetNumVehicleMods(veh,12),GetNumVehicleMods(veh,15),GetNumVehicleMods(veh,11),GetNumVehicleMods(veh,16) }
            local vehModel = GetEntityModel(veh)
            local info = NyoFw.getVehicleInfo(vehModel)
            return veh,VehToNet(veh),GetVehicleNumberPlateText(veh),info.modelname,lock,info.banned,trunk,GetDisplayNameFromVehicleModel(vehModel),GetStreetNameFromHashKey(GetStreetNameAtCoord(x,y,z)),tuning
        end
    end

    funcs.getClosestVehiclesFromPlayer = function(radius)
        return GetClosestVehiclesFromPlayer(radius)
    end

    funcs.getClosestVehicleFromPlayer = function(radius)
        return GetClosestVehicleFromPlayer(radius)
    end

    funcs.getClosestVehiclesFromCoords = function(coords, radius)
        return GetClosestVehiclesFromCoords(coords, radius)
    end

    funcs.getClosestVehicleFromCoords = function(coords, radius)
        return GetClosestVehicleFromCoords(coords, radius)
    end

    for exportName, exportHandler in pairs(funcs) do
        exports(exportName, exportHandler)
        NyoFw[exportName] = exportHandler
    end

end)