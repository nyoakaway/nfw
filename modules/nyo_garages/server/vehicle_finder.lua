Nfw.extendModule(function()

    local funcs = {}

    funcs.getClosestVehiclesFromPlayerServer = function(player, radius)
        return RPC.trigger('garages-getClosestVehiclesFromPlayer', player, radius)
    end
    
    funcs.getClosestVehicleFromPlayerServer = function(player, radius)
        return RPC.trigger('garages-getClosestVehicleFromPlayer', player, radius)
    end

    funcs.getClosestVehiclesFromCoordsServer = function(player, coords, radius)
        return RPC.trigger('garages-getClosestVehiclesFromCoords', player, coords, radius)
    end

    funcs.getClosestVehicleFromCoordsServer = function(player, coords, radius) 
        return RPC.trigger('garages-getClosestVehicleFromCoords', player, coords, radius)
    end

    funcs.addVehicleToPlayer = function(char_id, vehname, garage_id, plate, tax)
        garage_id = garage_id or 'g-public'
        plate = plate or NyoFw.generatePlate()
        tax = tax or 0
        local row = NyoFw.querySync('INSERT INTO nyo_users_vehicles(char_id, garage_id, vehname, plate, tax) VALUES(?,?,?,?,?)',{char_id,garage_id,vehname,plate,tax})
        return row.insertId
    end

    funcs.remVehicleFromPlayer = function(char_id, vehname)
        if not vehname then
            NyoFw.querySync("DELETE FROM nyo_users_vehicles WHERE id = ?", {char_id})
        else
            NyoFw.querySync('DELETE FROM nyo_users_vehicles WHERE char_id = ? AND vehname = ?',{char_id,vehname})
        end
    end

    for exportName, exportHandler in pairs(funcs) do
        exports(exportName, exportHandler)
        NyoFw[exportName] = exportHandler
    end

end)