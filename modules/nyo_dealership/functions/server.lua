Nfw.registerFunctions('nyofw',function()


    Nfw.onReady(function()
       
    end)

    return {
        getPlayerVehicles = function(char_id)
            local rows = NyoFw.querySync('nfw/nyo_dealership/select_player_vehicles', { char_id = char_id})
            local response = {}
            for k,v in pairs(rows) do
                response[#response+1] = {price = NyoFw.getVehiclePrice(v.vehname), qtd = nil, name = NyoFw.getVehicleName(v.vehname), trunk = NyoFw.getVehicleTrunk(v.vehname), custom = v.custom, plate = v.plate, index = v.vehname}
            end
            return response
        end,
        checkCanBuyVehicle = function(char_id, vname)

            local dealerConfig = NfwConfigs['configConceGeneral']
            local totalVehicle = 0
            if not dealerConfig.enableSimilarVehicles then 
                local rows = NyoFw.querySync('nfw/nyo_dealership/select_vehicle', { char_id = char_id, vehicle = vname})
                totalVehicle = #rows
            end            

            local vagas = 3
            local permissions = {
                {"admin.permissao", 1999}
            }
            for k,v in pairs(permissions) do
                if NyoFw.hasPermission(char_id, v[1]) then
                    vagas += v[2]
                end
            end
            local rows2 = NyoFw.querySync('nfw/num_vehicles', { char_id = char_id })
   

            return totalVehicle == 0 and rows2[1].num_vehs < vagas
        end,
        checkCanSellVehicle = function(char_id, vname)
            return true
        end,
        addVehicle = function(char_id, vname, plate)
            NyoFw.querySync('nfw/nyo_dealership/add_vehicle', {char_id = char_id, vehicle = vname, plate = plate})
        end,
        remVehicle = function(char_id, vname, plate)
            plate = plate:gsub(" ", '')
            NyoFw.querySync('nfw/nyo_dealership/rem_vehicle', {char_id = char_id, vehicle = vname, plate = plate})
        end,
        changePlayerRoutingBucket = function(src)
            local char_id = NyoFw.getCharId(src)
            SetPlayerRoutingBucket(src, char_id + 500)
        end,
        changePlayerToDefaultRoutingBucket = function(src)
            SetPlayerRoutingBucket(src, 0)
        end,

        onPlayerFailureToBuyVehicle = function(reason, char_id, vehicle, category, price, remainingStock)
        end,
        onPlayerBuyVehicle = function(char_id, vname, category, price, remainingStock)
        end,
        onPlayerFailureToSellVehicle = function(reason, char_id, vname, price)
        end,
        onPlayerSellVehicle = function(char_id, vname, price)
        end
    }
end)