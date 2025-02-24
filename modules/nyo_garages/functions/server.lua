Nfw.registerFunctions('nyofw',function()
    
    return {
        checkHomeGarage = function(char_id,home_name)
            local data = NyoFw.querySync("nfw/garages/getGaragemPerm",{charId = char_id, homesId = home_name})
            return data[1] and true or false
        end,
        getVehiclePrice = NyoFw.getVehiclePrice,
        getVehicleName = NyoFw.getVehicleName,
        checkCanBuyVehicle = function(char_id, owner_id, vehicle, price)
            local vagas = 3
            local permissions = {
                {"admin.permissao", 2}
            }
            for k,v in pairs(permissions) do
                if NyoFw.hasPermission(char_id, v[1]) then
                    vagas += v[2]
                end
            end
            local rows =  NyoFw.querySync('nfw/num_vehicles', { char_id = char_id })
            return rows[1].num_vehs < vagas
        end,
        checkCanSellVehicle = function(char_id, vehicleName)
            return vRP.vehicleType(vehicleName) ~= 'vip'
        end,
        checkCanSpawnVehicle = function(char_id, vehicleName)
            return true
        end
    }

end)