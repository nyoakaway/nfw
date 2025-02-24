local module = 'nyo_fuel'
local traceback = debug.traceback()
local valid_traceback = string.format('@nfw/modules/%s/server.lua', module)

if traceback:find(valid_traceback) then
    Nfw.registerNyoModule(module, "1.0.4", {"nyo_core"}, false, function()

        local configIndiv = NfwConfigs.fuelGeneralConfig

        local vehicleGlobal = {}

        AddEventHandler('entityRemoved', function(entity)
            local entityType = GetEntityType(entity)
            if entityType == 2 then
                local netid = NetworkGetNetworkIdFromEntity(entity)
                vehicleGlobal[netid] = nil
            end
        end)

        RPC.addHandler('fuel-svGetUserMoney',function(source, type)
            local user_id = NyoFw.getCharId(source)
            if type == 1 then
                return NyoFw.getMoney(user_id)
            elseif type == 2 then
                return NyoFw.getBankMoney(user_id) + NyoFw.getMoney(user_id)
            end
        end)

       
        RPC.addHandler('fuel-finishFuel',function(source, veh, atualFuel, newFuel, price, paymentType)
            local charId = NyoFw.getCharId(source)
            if NfwGlobalFunctions.tryPayment(charId, math.floor(tonumber(price)), paymentType) then
                NfwGlobalFunctions.notify(source, 'Sucesso', 'Você fez um pagamento de: ' .. math.floor(tonumber(price)) .. '!',
                  "#00FF00", 5000)
                local nFuel = atualFuel + newFuel
                if nFuel > 99.99 then
                    nFuel = 99.99
                end
                vehicleGlobal[veh] = nFuel
                -- TriggerClientEvent('syncfuel',-1,veh,nFuel)
                return true
            else
                NfwGlobalFunctions.notify(source, 'Erro', 'Dinheiro insuficiente!', "#FF0000", 5000)
                return false
            end
        end)

        SafeEvents.register("nfw:fuel:buy", function(src, t, paymentType)
            if t then 
                local charId = NyoFw.getCharId(src)
                local price = tonumber(configIndiv.itensPrice[t])
                local dataInventory = NyoFw.getUserTable(charId).inventory
                local new_weight = NyoFw.computerItensWeight(dataInventory)+NyoFw.getItemWeight(t)
                if new_weight <= NyoFw.getInventoryMaxWeight(charId) then 
                    if NfwGlobalFunctions.tryPayment(charId, price, paymentType) then 
                        NyoFw.giveInventoryItem(charId, t, 1) 
                        NfwGlobalFunctions.notify(src, 'Sucesso', 'Você comprou 1 '..NyoFw.getItemName(t)..'!')
                    else 
                        NfwGlobalFunctions.notify(src, 'Erro', 'Dinheiro insuficiente!', "#FF0000", 5000)
                    end
                else 
                    NfwGlobalFunctions.notify(src, 'Erro', 'Espaço insuficiente na mochila!', "#FF0000", 5000)
                end                
            end
        end)

        NyoFw.fuelCheckCar = function(type, dataVName)
            if type == 'car' and dataVName then
                if not NfwConfigs.fuelGeneralConfig.vehicleEletrical[dataVName] then
                    return true
                end
            elseif type == 'eletrical' and dataVName then
                if NfwConfigs.fuelGeneralConfig.vehicleEletrical[dataVName] then
                    return true
                end
            end
            return false
        end        

        NyoFw.fuelSetFuel = function(veh, fuel)
            local veh = Entity(NetworkGetEntityFromNetworkId(veh))
            if veh then
                local newFuel = (veh.state.fuel + fuel) + 0.000001
                if newFuel > 100 then newFuel = 99.99 end
                -- vehicleGlobal[veh] = newFuel
                
                veh.state:set('fuel', newFuel, true)
            else
                --vehicleGlobal[veh] = fuel + 0.000001
                local veh = Entity(NetworkGetEntityFromNetworkId(veh))
                veh.state:set('fuel', fuel + 0.000001, true)
            end
        end

        NyoFw.fuelCheckFuel = function(veh)
            local veh = Entity(NetworkGetEntityFromNetworkId(veh))
            if veh then
                if veh.state.fuel < 75 then
                    return true
                end
            end
            return false
        end

        exports("fuelCheckCar", NyoFw.fuelCheckCar)
        exports("fuelSetFuel", NyoFw.fuelSetFuel)
        exports("fuelCheckFuel", NyoFw.fuelCheckFuel)
    end)
else
    error 'Module name has been modified'
    Nfw.preventCheat()
end
