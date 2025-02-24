local module = 'nyo_bennys'
local traceback = debug.traceback()
local valid_traceback = string.format('@nfw/modules/%s/server.lua', module)

if traceback:find(valid_traceback) then
    Nfw.registerNyoModule(module, "2.0.0", {"nyo_core"}, false, function()

        NyoFw.prepare('nfw/set_vehicle_custom', 'UPDATE nyo_users_vehicles SET custom = @custom WHERE char_id = @char_id AND vehname = @vehicle AND plate = @plate AND work = @work')
        NyoFw.prepare('nfw/get_vehicle_custom', 'SELECT custom FROM nyo_users_vehicles WHERE char_id = @char_id AND vehname = @vehicle AND plate = @plate AND work = @work') 
        --  NyoFwc.prepare('nfw/get_vehicle_custom', 'SELECT custom FROM WHERE char_id = @char_id AND vehicle = @vehicle')
        
       
        RPC.addHandler('bennys-checkIsWork', function(src, netveh)
            return Entity(NetworkGetEntityFromNetworkId(netveh)).state.work
        end)

        RPC.addHandler('bennys-tryPayment', function(source, vehicleModel, oldCustom, newCustom, bennysConfig, plate, paymentType, netid)
            local char_id = NyoFw.getCharId(source)
            local owner_id = nil
            plate = plate:gsub(" ", '')
            local res = NyoFw.querySync("nfw/garages/getVehicleByPlate", {plate = plate})
            if res[1] then 
                owner_id = res[1].char_id
            else 
                return false, 'Veiculo não localizado'
            end
          
            console.debug('^3[ BENNYS ] ^7Try payment from '..char_id)

            local entity = NetworkGetEntityFromNetworkId(netid)

            local payPrice = 0
            local neededItems = {}

            for k,v in pairs(newCustom) do
                local kCfg = bennysConfig[k]
                local typeV = type(v)
                if k == 'wheelType' then
                elseif k == 23 then
                    if v ~= oldCustom[k] or newCustom.wheelType ~= oldCustom.wheelType then
                        if kCfg.price then
                            payPrice = payPrice + (kCfg.price + (kCfg.increaseBy * v))
                        end
                        if kCfg.requireItem then
                            neededItems[kCfg.item.index] = neededItems[kCfg.item.index] or 0 + kCfg.item.qtd
                        end
                    end
                elseif k == 'neon' then
                    for i = 0,3 do
                        if v[i] ~= oldCustom[k][i] then
                            if kCfg.toggle.price then
                                payPrice = payPrice + (kCfg.toggle.price)
                            end
                            if kCfg.toggle.requireItem then
                                neededItems[kCfg.toggle.item.index] = neededItems[kCfg.toggle.item.index] or 0 + kCfg.toggle.item.qtd
                            end
                        end
                    end
                    if not table.compare(v.color,oldCustom[k].color) then
                        if kCfg.color.price then
                            payPrice = payPrice + (kCfg.color.price)
                        end
                        if kCfg.color.requireItem then
                            neededItems[kCfg.color.item.index] = neededItems[kCfg.color.item.index] or 0 + kCfg.color.item.qtd
                        end
                    end
                elseif k == 'customTires1' or k == 'customTires2' then
                    if typeV == 'table' and not table.compare(v,oldCustom[k]) or v ~= oldCustom[k] and typeV ~= 'table' then
                        kCfg = bennysConfig.customTires
                        if kCfg.price then
                            payPrice = payPrice + (kCfg.price)
                        end
                        if kCfg.requireItem then
                            neededItems[kCfg.item.index] = (neededItems[kCfg.item.index] or 0) + kCfg.item.qtd
                        end
                    end
                else
                    if typeV == 'table' and not table.compare(v,oldCustom[k]) or v ~= oldCustom[k] and typeV ~= 'table' then
                        if kCfg.price then
                            if typeV == 'table' or typeV == 'boolean' then                                 
                                payPrice = payPrice + kCfg.price
                            else                                 
                                payPrice = payPrice + (kCfg.price + (kCfg.increaseBy * v))
                            end
                        end
                        if kCfg.requireItem then
                            neededItems[kCfg.item.index] = (neededItems[kCfg.item.index] or 0) + kCfg.item.qtd
                        end
                    end
                end
            end

            for k,v in pairs(neededItems) do
                if NyoFw.getInventoryItemAmount(char_id, k) < v then
                    return false, 'Itens insuficientes!'
                end
            end
            if NfwGlobalFunctions.tryPayment(char_id,payPrice,paymentType) then
                for k,v in pairs(neededItems) do
                    NyoFw.tryGetInventoryItem(char_id, k, v)
                end
              
                local work = NyoFw.getVehicleWork(entity)

                NyoFw.querySync('nfw/set_vehicle_custom', {custom = json.encode(newCustom), char_id = owner_id, vehicle = vehicleModel, work = work or false, plate = plate})
                return true
            else
                return false, 'Dinheiro insuficiente'
            end

        end)

        RegisterNetEvent("nfw:applyVehicleCustomization",function(netid)
            local entity = NetworkGetEntityFromNetworkId(netid)
            local work = Entity(entity).state.work
            local plate = GetVehicleNumberPlateText(entity)
            plate = plate:gsub(" ", '')
            local char_id = nil
            local res = NyoFw.querySync("nfw/garages/getVehicleByPlate", {plate = plate})
            if res[1] then 
                char_id = res[1].char_id
            else 
                return false, 'Veiculo não localizado'
            end

            local vehicleModel = NyoFw.getVehicleModelName(GetEntityModel(entity))
            local rows = NyoFw.querySync('nfw/get_vehicle_custom', {char_id = char_id, vehicle = vehicleModel, work = work, plate = plate})
            local vehCustom = rows[1] and rows[1].custom
            console.debug('^3[ BENNYS ] ^7Apply vehicle custom '..char_id..' | '..vehicleModel..' | '..plate)
            if vehCustom then
                local data = json.decode(vehCustom)
                if data then
                    TriggerClientEvent('nfw:applyVehicleCustomization', NetworkGetEntityOwner(entity), netid, data)
                end
            end
        end)
    end)
else
    error 'Module name has been modified'
    Nfw.preventCheat()
end