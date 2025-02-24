local module = 'nyo_dealership'
local traceback = debug.traceback()
local valid_traceback = string.format('@nfw/modules/%s/server.lua', module)

if traceback:find(valid_traceback) then
    Nfw.registerNyoModule(module, "1.0.2", {"nyo_core"}, false, function()

        local module_funcs = Nfw.getModuleFunctions()

        NyoFw.querySync([[
            CREATE TABLE IF NOT EXISTS `nyo_dealership` (
                `dealership_index` varchar(20) NOT NULL,
                `vehicle` varchar(30) NOT NULL,
                `category` varchar(20) NOT NULL DEFAULT 'car',
                `price` int(20) NOT NULL DEFAULT 0,
                `amount` int(10) NOT NULL DEFAULT 0
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
        ]],nil,nil,'query')
        NyoFw.querySync([[
            CREATE TABLE IF NOT EXISTS `nyo_dealership_sell` (
                `id` int(11) NOT NULL,
                `user_id` int(6) NOT NULL,
                `vehicle` varchar(30) NOT NULL,
                `price` int(15) NOT NULL
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
        ]],nil,nil,'query')
        NyoFw.query([[
            ALTER TABLE `nyo_dealership`
                ADD UNIQUE KEY IF NOT EXISTS `dealership` (`dealership_index`,`vehicle`),
                ADD KEY IF NOT EXISTS `dealership_index` (`dealership_index`);
        ]],nil,nil,'query')
        NyoFw.query([[
            ALTER TABLE `nyo_dealership_sell`
                ADD PRIMARY KEY IF NOT EXISTS (`id`),
                ADD UNIQUE KEY IF NOT EXISTS `u_vehicle` (`user_id`,`vehicle`),
                MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;  
        ]],nil,nil,'query')

        NyoFw.prepare('dealership/select_vehicles', 'SELECT * FROM nyo_dealership WHERE amount > 0')
        NyoFw.prepare('dealership/insert_vehicle', 'REPLACE INTO nyo_dealership(dealership_index, vehicle, amount) VALUES (@dealershipIndex, @vehicle, @amount)')
        NyoFw.prepare('dealership/update_vehicle', 'UPDATE nyo_dealership SET amount = @amount WHERE vehicle = @vehicle AND dealership_index = @dealershipIndex')

        NyoFw.prepare('dealership/select_sell_vehicle', 'SELECT * FROM nyo_dealership_sell')
        NyoFw.prepare('dealership/insert_sell_vehicle', 'INSERT INTO nyo_dealership_sell(user_id, vehicle, price) VALUES(@user_id, @vehicle, @price)')
        NyoFw.prepare('dealership/delete_sell_vehicle', 'DELETE FROM nyo_dealership_sell WHERE user_id = @user_id AND vehicle  = @vehicle')


        NyoFw.prepare('nfw/nyo_dealership/select_player_vehicles', [[
            SELECT vehname, custom, plate
            FROM nyo_users_vehicles
            WHERE impounded = 0
                AND scrapped = 0
                AND engine >= 0
                AND body >= 0
                AND fuel >= 0
                AND char_id = @char_id
                AND work = 0
        ]])
       

        NyoFw.prepare('nfw/nyo_dealership/select_vehicle', 'SELECT char_id FROM nyo_users_vehicles WHERE char_id = @char_id AND vehname = @vehicle LIMIT 1')
        
        NyoFw.prepare('nfw/nyo_dealership/add_vehicle', 'INSERT INTO nyo_users_vehicles(char_id, vehname, plate) VALUES(@char_id, @vehicle, @plate)')
        NyoFw.prepare('nfw/nyo_dealership/rem_vehicle', 'DELETE FROM nyo_users_vehicles WHERE char_id = @char_id AND vehname = @vehicle AND plate = @plate')
        NyoFw.prepare('nfw/nyo_dealership/rem_vehicleNotPlate', 'DELETE FROM nyo_users_vehicles WHERE char_id = @char_id AND vehname = @vehicle')

        local dealershipData = { sellVehicles = {} }
        Nfw.onReady(function()
            local dealershipRows = NyoFw.querySync('dealership/select_vehicles')
            for k, v in pairs(dealershipRows) do
                if not dealershipData[v.dealership_index] then dealershipData[v.dealership_index] = {} end
                if not dealershipData[v.dealership_index][v.category] then dealershipData[v.dealership_index][v.category] = {} end
                dealershipData[v.dealership_index][v.category][v.vehicle] = {price = v.price, qtd = v.amount, name = NyoFw.getVehicleName(v.vehicle), trunk = NyoFw.getVehicleTrunk(v.vehicle), nil, nil, index = v.vehicle}
            end
            dealershipRows = nil

            local dealershipSellRows = NyoFw.querySync('dealership/select_sell_vehicle')
            for k,v in pairs(dealershipSellRows) do
                table.insert(dealershipData.sellVehicles, {})
            end
        end)

        RPC.addHandler('dealership-getVehicles', function(src)
            return dealershipData
        end)

        RPC.addHandler('dealership-getPlayerVehicles', function(src)
            local user_id = NyoFw.getCharId(src)
            return module_funcs.getPlayerVehicles(user_id)
        end)

        SafeEvents.register('dealership-startTestDrive', function(src)
            module_funcs.changePlayerRoutingBucket(src)
        end)

        SafeEvents.register('dealership-stopTestDrive', function(src)
            module_funcs.changePlayerToDefaultRoutingBucket(src)
        end)

        RPC.addHandler('dealership-buyVehicle', function(src, dealershipConfigIndex, vehicle, category)
            if not vehicle or not category or not dealershipConfigIndex then return false, "invalidRequestParams" end
            local user_id = NyoFw.getCharId(src)
            local dealershipConfig = NfwConfigs[dealershipConfigIndex]
            if not dealershipConfig then return false, "dealershipNotFound" end

            local vehData = dealershipData[dealershipConfig.dealershipConfig.index] and dealershipData[dealershipConfig.dealershipConfig.index][category] and dealershipData[dealershipConfig.dealershipConfig.index][category][vehicle]
            if not vehData then return false, "vehicleNotFound" end
            local errorReason = "vehicleOutOfStock"
            if vehData.qtd > 0 then
                errorReason = "unableToBuyVehicle"
                if module_funcs.checkCanBuyVehicle(user_id, vehicle) then
                    errorReason = "insufficientMoney"
                    if NfwGlobalFunctions.tryPayment(user_id, vehData.price, dealershipConfig.paymentType) then
                        module_funcs.onPlayerBuyVehicle(user_id, vehicle, category, vehData.price, vehData.qtd - 1)
                        dealershipData[dealershipConfig.dealershipConfig.index][category][vehicle].qtd -= 1
                        local vehiclePlate = NyoFw.generatePlate()
                        -- if Nfw.isModuleActive("nyo_garages") then
                        --     exports["nfw"]:addVehicleToPlayer(user_id, vehicle, vehiclePlate)
                        -- else             
                            module_funcs.addVehicle(user_id, vehicle, vehiclePlate)
                        --end                       
                        NyoFw.query('dealership/update_vehicle',{vehicle = vehicle, amount = vehData.qtd, dealershipIndex = dealershipConfig.dealershipConfig.index})                  
                        TriggerClientEvent("dealership-update", -1, dealershipConfig.dealershipConfig.index, category, vehicle, vehData.qtd)                   
                        return true
                    end
                end
            end
            module_funcs.onPlayerFailureToBuyVehicle(errorReason, user_id, vehicle, category, vehData.price, vehData.qtd)
            return false, errorReason
        end)

        RPC.addHandler('dealership-sellVehicle', function(src, vehicle, dealershipConfigIndex, plate)
            if not vehicle or not dealershipConfigIndex then return false, "invalidRequestParams" end
            local user_id = NyoFw.getCharId(src)
            local errorReason = "unableToSellVehicle"
            local tax = NfwConfigs[dealershipConfigIndex].dealershipConfig.playerVehicleSellTax
            local sellPrice = NyoFw.getVehiclePrice(vehicle) * ( 1 - tax )
            if module_funcs.checkCanSellVehicle(user_id, vehicle) then
                -- if Nfw.isModuleActive("nyo_garages") then
                --     exports["nfw"]:remVehicleFromPlayer(user_id, vehicle)
                -- else
                    module_funcs.remVehicle(user_id, vehicle, plate)
                --end
                module_funcs.onPlayerSellVehicle(user_id, vehicle, sellPrice)
                NyoFw.giveMoney(user_id, sellPrice)
                return true, sellPrice
            end
            module_funcs.onPlayerFailureToSellVehicle(errorReason, user_id, vehicle, sellPrice)
            return false, errorReason
        end)

    end)
else
    error 'Module name has been modified'
    Nfw.preventCheat()
end