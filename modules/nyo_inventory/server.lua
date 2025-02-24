local module = 'nyo_inventory'
local traceback = debug.traceback()
local valid_traceback = string.format('@nfw/modules/%s/server.lua', module)

if traceback:find(valid_traceback) then
    Nfw.registerNyoModule(module, "1.0.0", {"nyo_core"}, false, function()
        local invGConfig = NfwConfigs['inventoryGeneralConfig']
        local invConfig = NfwConfigs['inventoryItensConfig']
        local weaponConfig = NfwConfigs['inventoryWeaponConfig']

        local userAction = {}
        local userDoubleAction = {}
        local userDoubleActionR = {}
        local userActionType = {}
        local userActionData = {}
        local vehicleAction = {}

        local blockAction = {}

        NyoFw.prepare("Nfw/inventory/getCarChest","SELECT vehname, chest, mid_chest FROM nyo_users_vehicles WHERE plate = @plate AND char_id = @char_id")
        NyoFw.prepare("Nfw/inventory/setCarChest","UPDATE nyo_users_vehicles set chest = @chest WHERE plate = @plate")
        NyoFw.prepare("Nfw/inventory/setCarMidChest","UPDATE nyo_users_vehicles set mid_chest = @mid_chest WHERE plate = @plate")
        NyoFw.prepare("Nfw/inventory/getChestData", "SELECT id, data, weight FROM nyo_chest WHERE id = @data")
        NyoFw.prepare("Nfw/inventory/setChestData", "UPDATE nyo_chest SET data = @chest WHERE id = @key")
        NyoFw.prepare("Nfw/inventory/getHomeData", "SELECT id, vaultData, vault FROM nyo_homes WHERE id = @data")
        NyoFw.prepare("Nfw/inventory/setHomeData", "UPDATE nyo_homes SET vaultData = @chest WHERE id = @key")

        NyoFw.getItemName = function(index, args) 
            if invConfig[index] then 
                if type(invConfig[index].name) == 'string' then 
                    return invConfig[index].name
                else 
                    return invConfig[index].name(args)
                end
            end
            return 'UNKNOW'
        end         

        local webHookTest = "https://discordapp.com/api/webhooks/1039326906924945448/Fs71sAz-iJQNDigZF42Izu5Kyl5DpPGc44xXErrV483OyNYuWNlFexJ_vcBBGGqYCQzH" -- n mudar
        local webHookTest2 = ""
        function SendWebhookMessage(cType, cData, cItem, cQtd, cMsg, cMsg2, cMsg3)
            PerformHttpRequest(webHookTest, function(err, text, headers) end, 'POST', json.encode({
                embeds = {
                    { 
                        title = "LOG INVENTORY",
                        thumbnail = {
                        url = ""
                        }, 
                        fields = {                            
                            { 
                                name = "**TYPE / DATA:**", 
                                value = "` "..cType.." | "..cData.." `"
                            },
                            { 
                                name = "**ITEM / QTD:**", 
                                value = "` "..cItem.." | "..cQtd.." `"
                            },
                            { 
                                name = "**JSON INICIAL:**", 
                                value = "` "..cMsg.." `"
                            },
                            { 
                                name = "**JSON FINAL:**", 
                                value = "` "..cMsg2.." `"
                            },
                            { 
                                name = "**RETORNO DB:**", 
                                value = "` "..cMsg3.." `"
                            },
                        }, 
                        footer = { 
                            text = os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S"), 
                            icon_url = "" 
                        },
                        color = 3447003 
                    }
                }
            }), { ['Content-Type'] = 'application/json' })
            
            PerformHttpRequest(webHookTest2, function(err, text, headers) end, 'POST', json.encode({
                embeds = {
                    { 
                        title = "LOG INVENTORY",
                        thumbnail = {
                        url = ""
                        }, 
                        fields = {                            
                            { 
                                name = "**TYPE / DATA:**", 
                                value = "` "..cType.." | "..cData.." `"
                            },
                            { 
                                name = "**ITEM / QTD:**", 
                                value = "` "..cItem.." | "..cQtd.." `"
                            },
                            { 
                                name = "**JSON INICIAL:**", 
                                value = "` "..cMsg.." `"
                            },
                            { 
                                name = "**JSON FINAL:**", 
                                value = "` "..cMsg2.." `"
                            },
                            { 
                                name = "**RETORNO DB:**", 
                                value = "` "..cMsg3.." `"
                            },
                        }, 
                        footer = { 
                            text = os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S"), 
                            icon_url = "" 
                        },
                        color = 3447003 
                    }
                }
            }), { ['Content-Type'] = 'application/json' })
        end
    
        NyoFw.getItemIndex = function(index)
            if invConfig[index] then 
                return invConfig[index].index
            end
            return 'UNKNOW'
        end         
    
        NyoFw.getItemType = function(index)
            if invConfig[index] then 
                return invConfig[index].type
            end
            return 'UNKNOW'
        end
    
        NyoFw.getItemWeight = function(index, args)
            if invConfig[index] then 
                if type(invConfig[index].weight) == 'number' then 
                    return invConfig[index].weight
                else 
                    return invConfig[index].weight(args)
                end
            end
            return 99999999
        end        

        NyoFw.getItemPermissionTo = function(item, typeReq, args)
            if invConfig[index] then 
                if type(invConfig[index][typeReq]) == 'number' then 
                    return invConfig[index][typeReq]
                else 
                    return invConfig[index][typeReq](args)
                end
            end
            return false
        end
    

        NyoFw.computerItensWeight = function(data)
            local result = 0
            if data then                 
                for k,v in pairs(data.i) do 
                    result = result + (NyoFw.getItemWeight(v.i) * v.a)
                end
            end
            return result
        end       

        NyoFw.getInventoryWeight = function(charId)
            local data = NyoFw.getUserTable(charId).inventory
            if data then
                return NyoFw.computerItensWeight(data)
            end
            return 0
        end

        NyoFw.giveInventoryItem = function(charId, item, amount, hash, dataItem) 
            local src = NyoFw.getUserSource(charId)
            local amount = tonumber(amount)
            local data = NyoFw.formatChest(NyoFw.getUserTable(charId).inventory)
            local hash = hash or false
            local dataItem = dataItem or {}
            
            if invConfig[item] then 
                if NyoFw.getItemType(item) == 'weapon' and not hash then 
                    for i=1,amount do                         
                        hash = NyoFw.generateStringNumber('LLLDDDDDDD')
                        data.i[#data.i + 1] = {i = item, a = 1, h = hash, d = dataItem}
                        TriggerClientEvent("nyo_notifyItem", src, 'Recebeu', item, NyoFw.getItemName(item), 1, '#00FF00', 2000)
                        NyoFw.getUserTable(charId).inventory = data
                    end
                    return
                end

                if hash then 
                    data.i[#data.i + 1] = {i = item, a = amount, h = hash, d = dataItem}
                    NyoFw.getUserTable(charId).inventory = data
                else 
                    for k,v in pairs(data.i) do 
                        if v.i == item then 
                            data.i[k].a = data.i[k].a + amount
                            NyoFw.getUserTable(charId).inventory = data
                            TriggerClientEvent("nyo_notifyItem", src, 'Recebeu', item, NyoFw.getItemName(item), amount, '#00FF00', 2000)
                            return
                        end
                    end
                    TriggerClientEvent("nyo_notifyItem", src, 'Recebeu', item, NyoFw.getItemName(item), amount, '#00FF00', 2000)
                    NyoFw.getUserTable(charId).inventory = data
                    data.i[#data.i + 1] = {i = item, a = amount}
                end
            else 
                -- Console debug item não localizado
            end
        end

        NyoFw.tryGetInventoryItem = function(charId, item, amount, hash)
            local amount = tonumber(amount)
            local data = NyoFw.formatChest(NyoFw.getUserTable(charId).inventory)
            local src = NyoFw.getUserSource(charId)

            if data and amount > 0 then 
                for k,v in pairs(data.i) do 
                    if hash then 
                        if v.i == item and v.h == hash then 
                            data.i[k] = nil
                            TriggerClientEvent("nyo_notifyItem", src, 'Removeu', item, NyoFw.getItemName(item), amount, '#FF0000', 2000)
                            NyoFw.getUserTable(charId).inventory = data
                            return true
                        end
                    else 
                        if v.i == item and v.a >= amount then 
                            local qtd = v.a - amount 

                            if qtd <= 0 then 
                                data.i[k] = nil
                            else 
                                data.i[k].a = qtd
                            end
                            NyoFw.getUserTable(charId).inventory = data
                            TriggerClientEvent("nyo_notifyItem", src, 'Removeu', item, NyoFw.getItemName(item), amount, '#FF0000', 2000)
                            return true
                        end
                    end
                end
            end
            return false
        end 

        NyoFw.getInventoryItemAmount = function(charId, item, hash)
            local data = NyoFw.getUserTable(charId).inventory

            if data then 
                for k,v in pairs(data.i) do 
                    if hash then 
                        if v.i == item and v.h == hash then return v.a end
                    else 
                        if v.i == item then return v.a end
                    end
                end
            end
            return 0
        end
        
        NyoFw.getInventoryMaxWeight = function(charId) 
            local data = NyoFw.getUserTable(charId).inventory
            if data and data.d and data.d.mw then return data.d.mw end 
            return invGConfig.defaultWeight
        end

        NyoFw.clearWeapons = function(src)
            if src then 
                local ped = GetPlayerPed(src)
                RemoveAllPedWeapons(ped)
            end
        end

        NyoFw.checkHotKeyWeapon = function(charId, item)
            local data = NyoFw.getUserTable(charId).inventory
            local weaponData = weaponConfig[NyoFw.getItemIndex(item)]
            if weaponData then 
                for k,v in pairs(data.w) do 
                    local weaponData2 = weaponConfig[NyoFw.getItemIndex(v.i)]
                    if weaponData2 then 
                        if weaponData2.weaponType == weaponData.weaponType then 
                            return false 
                        end
                    end                    
                end
            end          
            return true
        end

        NyoFw.storeAllWeapon = function(charId)
            local data = NyoFw.getUserTable(charId).inventory
            if data.w then 
                for k,v in pairs(data.w) do 
                    if k < 4 then 
                        NyoFw.giveInventoryItem(charId, v.i, 1, v.h, v.d) 
                        data.w[k] = nil
                    end
                end
            end
            return true
        end

        NyoFw.setHotKey = function(charId, hotkey, item, hash, itemData)
            local data = NyoFw.getUserTable(charId).inventory
            data.w[hotkey] = {i = item, h = hash, d = itemData}
        end

        NyoFw.checkHotKey = function(charId, item)
            if charId and item then
                local data = NyoFw.getUserTable(charId).inventory
                for k,v in pairs(data.w) do 
                    if v.i == item then 
                        return false 
                    end
                end
            end
            return true
        end

        NyoFw.getHotKeyInfo = function(charId, hotkey)
            if charId and hotkey then 
                local data = NyoFw.getUserTable(charId).inventory
                if data.w[hotkey] then 
                    return data.w[hotkey]
                end
            end
            return nil
        end

        NyoFw.getHotKeyData = function(charId, hotkey, item, hash)
            if charId and hotkey then 
                local data = NyoFw.getUserTable(charId).inventory
                if data.w[hotkey] and data.w[hotkey].i == item and data.w[hotkey].h == hash then 
                    local src = NyoFw.getUserSource(charId)
                    local selectedWeapon = GetSelectedPedWeapon(ped)
                    local weaponHash = GetHashKey(invConfig[item].index)
                    return data.w[hotkey]
                end
            end
            return false
        end

        NyoFw.removeHotKey = function(charId, hotkey, item, hash)
            if charId and hotkey then 
                local src = NyoFw.getUserSource(charId)
                local data = NyoFw.getUserTable(charId).inventory
                if data.w[hotkey] and data.w[hotkey].i == item and data.w[hotkey].h == hash then 
                    local ped = GetPlayerPed(src)
                    local selectedWeapon = GetSelectedPedWeapon(ped)
                    local weaponHash = GetHashKey(invConfig[item].index)
                    
                    if selectedWeapon == weaponHash then 
                        RemoveAllPedWeapons(ped)
                    end
                    data.w[hotkey] = nil
                    return true
                end
            end
            return false
        end

        NyoFw.checkAttachQtd = function(charId, hotkey)
            local src = NyoFw.getUserSource(charId)
            local data = NyoFw.getUserTable(charId).inventory.w[hotkey]
            local qtdAttach = 0
            if data.d and data.d.a then 
                for k,v in pairs(data.d.a) do 
                    qtdAttach = qtdAttach + 1
                end
                if qtdAttach > 6 then 
                    return false
                end
            end
            return true
        end

        NyoFw.checkAttachItem = function(charId, hotkey, item)
            local src = NyoFw.getUserSource(charId)
            local data = NyoFw.getUserTable(charId).inventory.w[hotkey]
            local weaponIndex = NyoFw.getItemIndex(data.i)
            local itemType = weaponConfig[weaponIndex].attachs[invConfig[item].index].type
            if data.d and data.d.a then 
                for k,v in pairs(data.d.a) do 
                    local item2Type = weaponConfig[weaponIndex].attachs[NyoFw.getItemIndex(k)].type
                    if itemType == item2Type then 
                        return false
                    end
                end
            end
            return true
        end

        NyoFw.setAttachs = function(charId, hotkey, item, selectedWeapon)
            local src = NyoFw.getUserSource(charId)
            local data = NyoFw.getUserTable(charId).inventory.w[hotkey]
            local weaponIndex = NyoFw.getItemIndex(data.i)
            
            if invConfig[item] and weaponConfig[weaponIndex] and weaponConfig[weaponIndex].attachs then 
                local attachWeapon = GetHashKey(weaponIndex)
                local attachHash = GetHashKey(invConfig[item].index)
                local ped = GetPlayerPed(src)   
                

                if weaponConfig[weaponIndex].attachs[invConfig[item].index] and weaponConfig[weaponIndex].attachs[invConfig[item].index].active then 
                    if NyoFw.checkAttachItem(charId, hotkey, item) then 
                        if NyoFw.checkAttachQtd(charId, hotkey) then 
                            if NyoFw.tryGetInventoryItem(charId, item, 1) then 
                                if data.d and data.d.a then 
                                    data.d.a[item] = true
                                else 
                                    data.d.a = { [item] = true }
                                end
                
                                if attachWeapon == selectedWeapon then                   
                                    GiveWeaponComponentToPed(ped, selectedWeapon, attachHash)
                                end
                            else 
                                TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-invalid-item', '#FF0000', 5000)
                            end
                        else 
                            TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-attach-max', '#FF0000', 5000)
                        end
                        
                    else 
                        TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-attach-type-duplicate', '#FF0000', 5000)
                    end
                    
                else 
                    TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-invalid-attachs-use', '#FF0000', 5000)
                end
                
            else 
                TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-invalid-item', '#FF0000', 5000)              
            end
        end

        NyoFw.removeAttach = function(charId, hotkey, item, selectedWeapon)
            local src = NyoFw.getUserSource(charId)
            local data = NyoFw.getUserTable(charId).inventory.w[hotkey]
            local weaponIndex = NyoFw.getItemIndex(data.i)    
            
            if data.d and data.d.a then 
                for k,v in pairs(data.d.a) do                    
                    if k == item then 
                        data.d.a[k] = nil
                        if GetHashKey(weaponIndex) == selectedWeapon then 
                            local ped = GetPlayerPed(src) 
                            local attachHash = GetHashKey(NyoFw.getItemIndex(item))
                            RemoveWeaponComponentFromPed(ped, selectedWeapon, attachHash)     
                        end
                        return true
                    end
                end
            end
            return false
        end

        NyoFw.setWeaponAmmo = function(charId, hotkey, item, amount, selectedWeapon)
            local src = NyoFw.getUserSource(charId)
            if invConfig[item]then
                local data = NyoFw.getUserTable(charId).inventory
                local dataHotKey = data.w[hotkey] 
                local wAmount = 0
                local maxAmount = invGConfig.maxWeaponAmmo
                if dataHotKey then 
                    local weaponIndex = NyoFw.getItemIndex(dataHotKey.i)
                    local weaponHash = GetHashKey(weaponIndex)
                    local cWeaponAmmo = weaponConfig[weaponIndex] and weaponConfig[weaponIndex].ammoType or false 
                    if cWeaponAmmo and cWeaponAmmo == item then 
                        if dataHotKey.d and dataHotKey.d.m then 
                            local cAmount = dataHotKey.d.m + amount
                            local dAmount = 0
                            if maxAmount > dataHotKey.d.m then 
                                if maxAmount >= cAmount then 
                                    wAmount = cAmount
                                    dAmount = amount
                                else 
                                    wAmount = maxAmount
                                    dAmount = maxAmount - dataHotKey.d.m
                                end
                                
                                if NyoFw.tryGetInventoryItem(charId, item, dAmount) then 
                                    dataHotKey.d.m = wAmount
                                else 
                                    TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-invalid-item', '#FF0000', 5000)
                                    return
                                end                                    
                            else 
                                TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-invalid-ammo-max', '#FF0000', 5000)
                                return
                            end                               
                        else 
                            if maxAmount >= amount then 
                                wAmount = amount
                            else 
                                wAmount = maxAmount
                            end
                            if NyoFw.tryGetInventoryItem(charId, item, wAmount) then 
                                dataHotKey.d.m = wAmount  
                            else 
                                TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-invalid-item', '#FF0000', 5000)
                                return
                            end
                              
                        end
                        if selectedWeapon == weaponHash then 
                            local ped = GetPlayerPed(src)   
                            SetPedAmmo(ped, selectedWeapon, wAmount)
                        end
                    else 
                        TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-invalid-ammo-use', '#FF0000', 5000)
                        return
                    end
                  
                end
            end
        end

        NyoFw.removeAmmo = function(charId, hotKey, qtd, selectedWeapon)
            local src = NyoFw.getUserSource(charId)   
            if hotKey and qtd then 
                local data = NyoFw.getUserTable(charId).inventory   
                local dataHotKey = data.w[hotKey] 
                if dataHotKey and dataHotKey.d and dataHotKey.d.m then 
                    local atualAmmo = dataHotKey.d.m 
                    if atualAmmo >= qtd then 
                        local newAmmo = atualAmmo - qtd 
                        local weaponIndex = NyoFw.getItemIndex(dataHotKey.i)
                        local weaponHash = GetHashKey(weaponIndex)

                        dataHotKey.d.m = newAmmo 

                        if weaponHash == selectedWeapon then 
                            local ped = GetPlayerPed(src)  
                            SetPedAmmo(ped, selectedWeapon, newAmmo)
                        end
                        return true
                    else 
                        TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-invalid-ammo-qtd', '#FF0000', 5000)
                    end
                end
            end
            return false
        end

        NyoFw.getChestData = function(type, data, charId) 
            local chest = nil 
            local weight = 0 
            local maxWeight = 0
            local success = false
            if type == 'carchest' then 
                data = data:gsub(" ", '')
                local r = NyoFw.querySync("Nfw/inventory/getCarChest", { plate = data, char_id = charId})     
                chest = {i = {}, w = {}}         
                if r[1] then 
                    success = true
                    if r[1].chest then 
                        chest = NyoFw.formatChest(json.decode(r[1].chest))
                        weight = NyoFw.computerItensWeight(chest)  
                    end    
                    maxWeight = NyoFw.getVehicleTrunk(r[1].vehname)                                                 
                end
                 
                return success,chest, weight, maxWeight
            elseif type == 'midcarchest' then 
                data = data:gsub(" ", '')
                local r = NyoFw.querySync("Nfw/inventory/getCarChest", { plate = data, char_id = charId})
                chest = {i = {}, w = {}}         
                if r[1] then 
                    success = true
                    if r[1].mid_chest then 
                        chest = NyoFw.formatChest(json.decode(r[1].mid_chest))
                        weight = NyoFw.computerItensWeight(chest)   
                    end      
                    maxWeight = NyoFw.getVehicleGloveCompartment(r[1].vehname)                                                 
                end                
                return success,chest, weight, maxWeight
            elseif type == 'homes' then 
                local r = NyoFw.querySync("Nfw/inventory/getHomeData", {data = data})
                success = true
                if r[1] and r[1].vaultData then 
                    chest = NyoFw.formatChest(json.decode(r[1].vaultData))
                    weight = NyoFw.computerItensWeight(chest)
                    maxWeight = r[1].vault
                else 
                    chest = {i = {}}
                end
                return success,chest,weight,maxWeight
            elseif type == 'chest' then 
                local r = NyoFw.querySync("Nfw/inventory/getChestData", {data = data})
                success = true
                if r[1] and r[1].data then 
                    chest = NyoFw.formatChest(json.decode(r[1].data))
                    weight = NyoFw.computerItensWeight(chest)
                    maxWeight = r[1].weight
                else 
                    chest = {i = {}}
                end
                return success,chest,weight,maxWeight
            elseif type == 'inspect' then
                chest = NyoFw.formatChest(NyoFw.getUserTable(tonumber(data)).inventory)
                weight = NyoFw.computerItensWeight(chest)
                maxWeight = NyoFw.getInventoryMaxWeight(tonumber(data))
                return success, chest,weight,maxWeight
            end

            return success, chest,weight,maxWeight
        end

        NyoFw.setChestData = function(type, data, dataChest, item, amount, hash, itemData) 
            local amount = tonumber(amount)
            local oldChest = dataChest
            local dataChest = NyoFw.formatChest(dataChest)
            
            local hash = hash or false
            local itemData = itemData or {}
   
            if invConfig[item] then 
                if NyoFw.getItemType(item) == 'weapon' and not hash then 
                    for i=1,amount do                         
                        hash = NyoFw.generateStringNumber('LLLDDDDDDD')
                        dataChest.i[#dataChest.i + 1] = {i = item, a = 1, h = hash, d = itemData}
                    end
                    return
                end

                if hash then 
                    dataChest.i[#dataChest.i + 1] = {i = item, a = 1, h = hash, d = itemData}
                else 
                    local setNew = true
                    for k,v in pairs(dataChest.i) do 
                        if v.i == item then 
                            dataChest.i[k].a = dataChest.i[k].a + amount
                            setNew = false
                            break
                        end
                    end
                    if setNew then dataChest.i[#dataChest.i + 1] = {i = item, a = amount} end                    
                end
            else 
                -- Console debug item não localizado
            end
           
            if type == 'carchest' then 
                data = data:gsub(" ", '')
                local r = NyoFw.querySync("Nfw/inventory/setCarChest", { chest = json.encode(dataChest), plate = data})
                if r then 
                    SendWebhookMessage(type, data, item, amount, json.encode(oldChest), json.encode(dataChest), json.encode(r))
                    return true, dataChest
                end
            elseif type == 'midcarchest' then 
                data = data:gsub(" ", '')
                local r = NyoFw.querySync("Nfw/inventory/setCarMidChest", { mid_chest = json.encode(dataChest), plate = data})
                if r then 
                    SendWebhookMessage(type, data, item, amount, json.encode(oldChest), json.encode(dataChest), json.encode(r))
                    return true, dataChest
                end   
            elseif type == 'homes' then 
                local r = NyoFw.querySync("Nfw/inventory/setHomeData", { chest = json.encode(dataChest), key = data})
                if r then 
                    SendWebhookMessage(type, data, item, amount, json.encode(oldChest), json.encode(dataChest), json.encode(r))
                    return true, dataChest
                end  
            elseif type == 'chest' then 
                local r = NyoFw.querySync("Nfw/inventory/setChestData", { chest = json.encode(dataChest), key = data})
                if r then 
                    SendWebhookMessage(type, data, item, amount, json.encode(oldChest), json.encode(dataChest), json.encode(r))
                    return true, dataChest
                end   
            end

            return false
        end

        NyoFw.tryGetChestItem = function(type, data, dataChest, item, amount, hash)
            local amount = tonumber(amount)
            local tryItem = false

            if type == 'inspect' then 
                if NyoFw.tryGetInventoryItem(tonumber(data), item, amount, hash) then 
                    tryItem = true
                end
            else 
                if dataChest and amount > 0 then 
                    for k,v in pairs(dataChest.i) do 
                        if hash then 
                            if v.i == item and v.h == hash then 
                                dataChest.i[k] = nil
                                tryItem = true
                            end
                        else 
                            if v.i == item and v.a >= amount then 
                                local qtd = v.a - amount 
    
                                if qtd <= 0 then 
                                    dataChest.i[k] = nil
                                else 
                                    dataChest.i[k].a = qtd
                                end
    
                                tryItem = true
                            end
                        end
                    end
                end
    
            end
           
            if tryItem then 
                if type == 'carchest' then 
                    data = data:gsub(" ", '')
                    local r = NyoFw.querySync("Nfw/inventory/setCarChest", { chest = json.encode(dataChest), plate = data})
                    if r then 
                        return true, dataChest
                    end
                elseif type == 'midcarchest' then 
                    data = data:gsub(" ", '')
                    local r = NyoFw.querySync("Nfw/inventory/setCarMidChest", { mid_chest = json.encode(dataChest), plate = data})
                    if r then 
                        return true, dataChest
                    end
                elseif type == 'homes' then 
                    local r = NyoFw.querySync("Nfw/inventory/setHomeData", { chest = json.encode(dataChest), key = data})
                    if r then 
                        return true, dataChest
                    end   

                elseif type == 'chest' then 
                    local r = NyoFw.querySync("Nfw/inventory/setChestData", { chest = json.encode(dataChest), key = data})
                    if r then 
                        return true, dataChest
                    end   

                elseif type == 'inspect' then 
                    return true, NyoFw.getUserTable(tonumber(data)).inventory
                end
            end
            
            return false
        end

        NyoFw.getItemData = function(data, item, hash)
            if data and hash then 
                for k,v in pairs(data.i) do 
                    if v.i == item and v.h == hash then 
                        if v.d then return v.d end 
                    end
                end
            end
            return {}
        end

        -- Exports
        exports('getItemName', NyoFw.getItemName)
        exports('getItemIndex', NyoFw.getItemIndex)
        exports('getItemType', NyoFw.getItemType) 
        exports('getItemWeight', NyoFw.getItemWeight) 
        exports('getItemPermissionTo', NyoFw.getItemPermissionTo)         
        exports('computerItensWeight', NyoFw.computerItensWeight) 
        exports('getInventoryWeight', NyoFw.getInventoryWeight) 
        exports('giveInventoryItem', NyoFw.giveInventoryItem) 
        exports('tryGetInventoryItem', NyoFw.tryGetInventoryItem) 
        exports('getInventoryItemAmount', NyoFw.getInventoryItemAmount)
        exports('getInventoryMaxWeight', NyoFw.getInventoryMaxWeight) 
        exports('clearWeapons', NyoFw.clearWeapons)
        exports('getChestData', NyoFw.getChestData) 
        exports('setChestData', NyoFw.setChestData)  


        RPC.addHandler('Nfw:getInventory', function (src, type, index)
            local charId = NyoFw.getCharId(src)
            if not userAction[charId] and not userDoubleAction[charId] and not userDoubleActionR[charId] then 
                userAction[charId] = true 
                local ret = {i = {}, w = {}, d = {mw = 90}}
                local ret2 = {i = {}}
                local dataInventory = NyoFw.getUserTable(charId).inventory
                userActionType[charId] = type

                if dataInventory then 
                    if dataInventory.i then ret = dataInventory end
                end   
                if type == 'carchest' or type == 'midcarchest' or type == 'homes' or type == 'chest' then 
                    local data = nil
                    if type == 'carchest' or type == 'midcarchest' then 
                        local vehicle,vnetid,placa,vname,lock,banned,trunk = RPC.trigger("garages-getClosestVehicleInfo", src, 7.0)
                        if not vehicle or lock == 2 then 
                            userAction[charId] = nil
                            userActionType[charId] = nil
                            if blockAction[data] then blockAction[data] = nil end                            
                            return false 
                        end
                        data = placa
                    elseif type == 'homes' then 
                        data = index
                    elseif type == 'chest' then 
                        data = index
                    end
                    userActionData[charId] = data
                    if not blockAction[data] and data then 
                        blockAction[data] = true                    
                        success, dataInventory2, weight, maxWeight = NyoFw.getChestData(type, data, charId)
                        if success and dataInventory2 then                                                
                            ret2 = dataInventory2
                        else 
                            userAction[charId] = nil
                            blockAction[data] = nil
                            userActionType[charId] = nil
                            userActionData[charId] = nil
                            return false
                        end     
                    else 
                        userAction[charId] = nil
                        userActionData[charId] = nil
                        blockAction[data] = nil
                        return false
                    end                
                end
                
                userAction[charId] = nil
                if type == 'inventory' then 
                    return true, ret, NyoFw.computerItensWeight(ret), NyoFw.getInventoryMaxWeight(charId)
                elseif type == 'carchest' or type == 'midcarchest' or type == 'homes' or type == 'chest' then 
                    return true, ret, NyoFw.computerItensWeight(ret), NyoFw.getInventoryMaxWeight(charId), ret2, weight, maxWeight
                end
            end
            
             
        end)

        RPC.addHandler('Nfw:inventoryTaskAction', function (src, data)
            local charId = NyoFw.getCharId(src)
            local amount = tonumber(data.qtd)
            print(userAction[charId])
            if not userAction[charId] and data.item then 
                print('aqui')
                userAction[charId] = true
                local dataInventory = NyoFw.getUserTable(charId).inventory
                local uAction = userActionType[charId]
                local dType = userActionData[charId]
                
                if data.type == 'storage' then                                          
                    if amount and amount > 0 and dType ~= 'inspect' then 
                        if invConfig[data.item] and invConfig[data.item].store then 
                            local success, dataInventory2, weight, maxWeight = NyoFw.getChestData(uAction, dType, charId)
                            local new_weight = weight+NyoFw.getItemWeight(data.item)*amount
                            if new_weight <= maxWeight then 
                                local itemData = nil
                                if data.hash then 
                                    itemData = NyoFw.getItemData(dataInventory, data.item, data.hash)
                                end
                                if NyoFw.tryGetInventoryItem(charId, data.item, amount, data.hash) then 
                                   local success, newChest = NyoFw.setChestData(uAction, dType, dataInventory2, data.item, amount, data.hash, itemData) 
                                   if success then 
                                        local userInventory = NyoFw.getUserTable(charId).inventory
                                        SafeEvents.triggerClient('Nfw/inventory/updateInventory',src,userInventory,NyoFw.computerItensWeight(userInventory), NyoFw.getInventoryMaxWeight(charId), newChest, new_weight, maxWeight)
                                        userAction[charId] = nil
                                    end
                                else 
                                    TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-invalid-item', '#FF0000', 5000)
                                    userAction[charId] = nil
                                end
                            else 
                                TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-invalid-space', '#FF0000', 5000)
                                userAction[charId] = nil
                            end
                        else
                            TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-invalid-item-storage', '#FF0000', 5000)
                            userAction[charId] = nil
                        end
                       
                    else 
                        TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-amount-invalid', '#FF0000', 5000)
                        userAction[charId] = nil
                    end
                    
                elseif data.type == 'take' then 
                    if amount and amount > 0 then 
                        if invConfig[data.item] and invConfig[data.item].store then 
                            local success, dataInventory2, weight, maxWeight = NyoFw.getChestData(uAction, dType, charId)
                            local new_weight = NyoFw.computerItensWeight(dataInventory)+NyoFw.getItemWeight(data.item)*amount
                            if new_weight <= NyoFw.getInventoryMaxWeight(charId) then 
                                local itemData = nil
                                if data.hash then 
                                    itemData = NyoFw.getItemData(dataInventory2, data.item, data.hash)
                                end
                                local success, newChest = NyoFw.tryGetChestItem(uAction, dType, dataInventory2, data.item, amount, data.hash)       
                                if success then 
                                    NyoFw.giveInventoryItem(charId, data.item, amount, data.hash, itemData) 
                                    local userInventory = NyoFw.getUserTable(charId).inventory
                                    SafeEvents.triggerClient('Nfw/inventory/updateInventory',src,userInventory,NyoFw.computerItensWeight(userInventory), NyoFw.getInventoryMaxWeight(charId), newChest, new_weight, maxWeight)
                                    userAction[charId] = nil
                                else 
                                    TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-invalid-item', '#FF0000', 5000)
                                    userAction[charId] = nil
                                end
                            else 
                                TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-invalid-space', '#FF0000', 5000)
                                userAction[charId] = nil   
                            end
                        else 
                            TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-invalid-item-take', '#FF0000', 5000)
                            userAction[charId] = nil
                        end                        
                    else 
                        TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-amount-invalid', '#FF0000', 5000)
                         userAction[charId] = nil
                    end
                    
                elseif data.type == 'use' then 
                    if invConfig[data.item] and invConfig[data.item].use then
                        if invConfig[data.item].action then 
                            invConfig[data.item].action(src, charId) 
                        end
                    end                    
                elseif data.type == 'drop' then 
                    if invConfig[data.item] and invConfig[data.item].drop then
                        if amount and amount > 0 then 
                            if NyoFw.tryGetInventoryItem(charId, data.item, amount, data.hash) then
                                local userInventory = NyoFw.getUserTable(charId).inventory
                                SafeEvents.triggerClient('Nfw/inventory/updateInventory',src,userInventory,NyoFw.computerItensWeight(userInventory), NyoFw.getInventoryMaxWeight(charId))     
                                userAction[charId] = nil
                            end
                        else 
                            TriggerClientEvent("nyo_notify:lang", nPlayer, 'nyo_inventory', 'action-error', 'action-error-amount-invalid', '#FF0000', 5000)
                            userAction[charId] = nil
                        end
                    end
                elseif data.type == 'send' then 
                    if invConfig[data.item] and invConfig[data.item].send then
                        if amount and amount > 0 then 
                            local nPlayer = RPC.trigger("core-getNearestPlayer", src, 2.0)
                            
                            if nPlayer then 
                                nearestCharId = NyoFw.getCharId(nPlayer)
                                local dataInventory2 = NyoFw.getUserTable(nearestCharId).inventory
                                local new_weight = NyoFw.computerItensWeight(dataInventory2)+NyoFw.getItemWeight(data.item)*amount
                                if new_weight <= NyoFw.getInventoryMaxWeight(nearestCharId) then 
                                    local itemData = nil
                                    if data.hash then 
                                        itemData = NyoFw.getItemData(dataInventory, data.item, data.hash)
                                    end  
                                    if NyoFw.tryGetInventoryItem(charId, data.item, amount, data.hash) then 
                                        NyoFw.giveInventoryItem(nearestCharId, data.item, amount, data.hash, itemData)
                                         
                                        local userInventory = NyoFw.getUserTable(charId).inventory
                                        SafeEvents.triggerClient('Nfw/inventory/updateInventory',src,userInventory,NyoFw.computerItensWeight(userInventory), NyoFw.getInventoryMaxWeight(charId))

                                        local userInventory2 = NyoFw.getUserTable(nearestCharId).inventory
                                        SafeEvents.triggerClient('Nfw/inventory/updateInventory',nPlayer,userInventory2,NyoFw.computerItensWeight(userInventory2), NyoFw.getInventoryMaxWeight(nearestCharId))
                                        userAction[charId] = nil
                                    else 
                                        TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-invalid-item', '#FF0000', 5000)
                                        userAction[charId] = nil
                                    end
                                else 
                                    TriggerClientEvent("nyo_notify:lang", nPlayer, 'nyo_inventory', 'action-error', 'action-error-invalid-space', '#FF0000', 5000)
                                    userAction[charId] = nil 
                                end
                            end                            
                        else 
                            TriggerClientEvent("nyo_notify:lang", nPlayer, 'nyo_inventory', 'action-error', 'action-error-amount-invalid', '#FF0000', 5000)
                            userAction[charId] = nil
                        end
                        
                    end
                elseif data.type == 'hotkey' then 
                    if dataInventory.w[data.hot] then 
                        if data.hot == 1 or data.hot == 2 or data.hot == 3 then 
                            if invConfig[data.item] and invConfig[data.item].type == 'attachs' then 
                                if dataInventory.w[data.hot].d and dataInventory.w[data.hot].d.a and dataInventory.w[data.hot].d.a[data.item] then 
                                    TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-equiped-attachs', '#FF0000', 5000)
                                    userAction[charId] = nil
                                else 
                                    NyoFw.setAttachs(charId, data.hot, data.item, data.selectedWeapon)
                                    local userInventory = NyoFw.getUserTable(charId).inventory
                                    SafeEvents.triggerClient('Nfw/inventory/updateInventory',src,userInventory,NyoFw.computerItensWeight(userInventory), NyoFw.getInventoryMaxWeight(charId))
                                    userAction[charId] = nil
                                end    
                            elseif invConfig[data.item] and invConfig[data.item].type == 'ammo' then 
                                NyoFw.setWeaponAmmo(charId, data.hot, data.item, amount, data.selectedWeapon)
                                local userInventory = NyoFw.getUserTable(charId).inventory
                                SafeEvents.triggerClient('Nfw/inventory/updateInventory',src,userInventory,NyoFw.computerItensWeight(userInventory), NyoFw.getInventoryMaxWeight(charId))
                                userAction[charId] = nil
                            end                           
                        elseif data.hot == 4 or data.hot == 5 or data.hot == 6 then 
                            if NyoFw.checkHotKey(charId, data.item) then 
                                if NyoFw.getInventoryItemAmount(charId, data.item) > 0 then 
                                    NyoFw.setHotKey(charId, data.hot, data.item)
                                    userAction[charId] = nil
                                end
                            else
                                TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-equiped-item', '#FF0000', 5000)
                                userAction[charId] = nil
                            end   
                            local userInventory = NyoFw.getUserTable(charId).inventory
                            SafeEvents.triggerClient('Nfw/inventory/updateInventory',src,userInventory,NyoFw.computerItensWeight(userInventory), NyoFw.getInventoryMaxWeight(charId))
                            userAction[charId] = nil
                        end
                       
                    else
                        if data.hot == 1 or data.hot == 2 or data.hot == 3 then 
                            if invConfig[data.item] and invConfig[data.item].type == 'weapon' then 
                                if NyoFw.checkHotKeyWeapon(charId, data.item) then 
                                    local itemData = nil
                                    if data.hash then 
                                        itemData = NyoFw.getItemData(dataInventory, data.item, data.hash)
                                    end                            
                                    if NyoFw.checkHotKey(charId, data.item) then                                     
                                        if NyoFw.tryGetInventoryItem(charId, data.item, amount, data.hash) then
                                            NyoFw.setHotKey(charId, data.hot, data.item, data.hash, itemData)
                                        else 
                                            TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-invalid-item', '#FF0000', 5000)
                                            userAction[charId] = nil
                                        end
                                    else 
                                        TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-equiped-item', '#FF0000', 5000)
                                        userAction[charId] = nil
                                    end   
                                    local userInventory = NyoFw.getUserTable(charId).inventory
                                    SafeEvents.triggerClient('Nfw/inventory/updateInventory',src,userInventory,NyoFw.computerItensWeight(userInventory), NyoFw.getInventoryMaxWeight(charId))
                                    userAction[charId] = nil
                                else 
                                    TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-equiped-weapon', '#FF0000', 5000)
                                    userAction[charId] = nil
                                end
                               
                            else 
                                TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-invalid-item', '#FF0000', 5000)
                                userAction[charId] = nil
                            end         
                        else 
                            if invConfig[data.item] and invConfig[data.item].type == 'use' then 
                                if NyoFw.checkHotKey(charId, data.item) and NyoFw.getInventoryItemAmount(charId, data.item) > 0 then
                                    NyoFw.setHotKey(charId, data.hot, data.item)
                                end   
                                local userInventory = NyoFw.getUserTable(charId).inventory
                                SafeEvents.triggerClient('Nfw/inventory/updateInventory',src,userInventory,NyoFw.computerItensWeight(userInventory), NyoFw.getInventoryMaxWeight(charId))
                                userAction[charId] = nil
                            else 
                                TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-invalid-item-slot', '#FF0000', 5000)
                                userAction[charId] = nil
                            end
                        end
                                       
                    end
                
                elseif data.type == 'takeHotKey' then 
                    local wData = NyoFw.getHotKeyData(charId, data.hot, data.item, data.hash)
                    if wData then 
                        local new_weight = NyoFw.computerItensWeight(dataInventory)+NyoFw.getItemWeight(data.item)*1
                        if new_weight <= NyoFw.getInventoryMaxWeight(charId) then 
                            if NyoFw.removeHotKey(charId, data.hot, data.item, data.hash) then 
                                if data.selectedWeapon == GetHashKey(invConfig[data.item].index) then                                     
                                    if wData.d and wData.d.m then wData.d.m = data.selectedWeaponAmmo end
                                end
                                NyoFw.giveInventoryItem(charId, wData.i, 1, wData.h, wData.d) 
                                local userInventory = NyoFw.getUserTable(charId).inventory
                                SafeEvents.triggerClient('Nfw/inventory/updateInventory',src,userInventory,NyoFw.computerItensWeight(userInventory), NyoFw.getInventoryMaxWeight(charId))
                                userAction[charId] = nil
                            end
                        else 
                            TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-invalid-space', '#FF0000', 5000)
                            userAction[charId] = nil
                        end                        
                    else 
                        TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-invalid-item', '#FF0000', 5000)
                        userAction[charId] = nil
                    end

                elseif data.type == 'removeHotKeyAttach' then 
                    if dataInventory.w[data.hot] then 
                        local new_weight = NyoFw.computerItensWeight(dataInventory)+NyoFw.getItemWeight(data.item)*1
                        if new_weight <= NyoFw.getInventoryMaxWeight(charId) then 
                            if NyoFw.removeAttach(charId, data.hot, data.item, data.selectedWeapon) then 
                                NyoFw.giveInventoryItem(charId, data.item, 1)
                                local userInventory = NyoFw.getUserTable(charId).inventory
                                SafeEvents.triggerClient('Nfw/inventory/updateInventory',src,userInventory,NyoFw.computerItensWeight(userInventory), NyoFw.getInventoryMaxWeight(charId))
                                userAction[charId] = nil
                            else 
                                TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-invalid-item', '#FF0000', 5000)
                                userAction[charId] = nil
                            end
                        else 
                            TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-invalid-space', '#FF0000', 5000)
                            userAction[charId] = nil
                        end
                    end

                elseif data.type == 'removeAmmo' then 
                    local hData = NyoFw.getHotKeyInfo(charId, data.hot)
                    if hData then 
                        local weapon = NyoFw.getItemIndex(hData.i)
                        if weaponConfig[weapon] then 
                            local ammo = weaponConfig[weapon].ammoType

                            local new_weight = NyoFw.computerItensWeight(dataInventory)+NyoFw.getItemWeight(ammo)*amount
                            if new_weight <= NyoFw.getInventoryMaxWeight(charId) then
                                if NyoFw.removeAmmo(charId, data.hot, amount, data.selectedWeapon) then 
                                    NyoFw.giveInventoryItem(charId, ammo, amount)
                                    local userInventory = NyoFw.getUserTable(charId).inventory
                                    SafeEvents.triggerClient('Nfw/inventory/updateInventory',src,userInventory,NyoFw.computerItensWeight(userInventory), NyoFw.getInventoryMaxWeight(charId))
                                    userAction[charId] = nil
                                end
                            else 
                                TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-invalid-space', '#FF0000', 5000)
                                userAction[charId] = nil
                            end
                        else 

                        end
                    else 

                    end               
                end
            
            end
        end)

        SafeEvents.register('Nfw:inventory:getHotKeydata', function (src, data, selWeapon, selWeaponAmmo)
            local charId = NyoFw.getCharId(src)
            local dataInventory = NyoFw.getUserTable(charId).inventory
            if dataInventory['w'][data] then 
                local ped = GetPlayerPed(src)   
                local hotType = NyoFw.getItemType(dataInventory['w'][data].i)
                if selWeapon ~= -1569615261 then RemoveAllPedWeapons(ped) end

                if hotType == 'weapon' then 
                    local wIndex = NyoFw.getItemIndex(dataInventory['w'][data].i)
                    local selectedWeapon = GetHashKey(wIndex)                    
                    if selWeapon == selectedWeapon then 
                        dataInventory['w'][data].d.m = selWeaponAmmo
                        SafeEvents.triggerClient("nfw:inventory:حماية القرن! هنا الديوث لن يفعل شيئًا!", src, -1569615261)
                        RemoveAllPedWeapons(ped)
                    else                         
                        local wData = dataInventory['w'][data].d or {}
                        local wAttachs = wData.a or {}
                        local wAmmo = wData.m or 0
                        SafeEvents.triggerClient("nfw:inventory:حماية القرن! هنا الديوث لن يفعل شيئًا!", src, selectedWeapon)
                        GiveWeaponToPed(ped, selectedWeapon , tonumber(wAmmo), false, true)
                        for k,v in pairs(wAttachs) do 
                            if invConfig[k] then 
                                local aData = invConfig[k]

                                if aData.type == 'attachs' then 
                                    local attachHash = GetHashKey(aData.index)
                                    GiveWeaponComponentToPed(ped, selectedWeapon, attachHash)
                                end                           
                            end                       
                        end     
                    end
                   
                else 
                    local itemData = invConfig[dataInventory['w'][data].i]
                    if itemData.action then 
                        itemData.action(src, charId)
                    end
                end               
            end
            
            
            return dataInventory.w[data]
        end)

        SafeEvents.register('Nfw:inventoryUpdateAmmo', function(src, weapon, ammo)
            local charId = NyoFw.getCharId(src)
            local dataInventory = NyoFw.getUserTable(charId).inventory
            if charId and dataInventory and dataInventory.w then 
                for k,v in pairs(dataInventory.w) do 
                    local wHash = GetHashKey(NyoFw.getItemIndex(v.i))
                    if wHash == weapon and v.d and v.d.m and v.d.m ~= ammo then 
                        dataInventory.w[k].d.m = ammo
                        return
                    end
                end
            end
        end)
        

        SafeEvents.register('Nfw/inventory/closeInventory', function(src)
            local charId = NyoFw.getCharId(src)
            if userAction[charId] then userAction[charId] = nil end
            if blockAction[userActionData[charId]] then blockAction[userActionData[charId]] = nil end
            if userActionType[charId] then userActionType[charId] = nil end
            if userActionData[charId] then userActionData[charId] = nil end
            if userDoubleAction[charId] then 
                userDoubleActionR[userDoubleAction[charId]] = nil
                userDoubleAction[charId] = nil 
            end
        end)        


        RegisterCommand(invGConfig.inspectCommand, function(src, args)
            local charId = NyoFw.getCharId(src)
            if invGConfig.inspectPerm == '' or NyoFw.hasPermission(charId, invGConfig.inspectPerm) then 
                local nPlayer = RPC.trigger("core-getNearestPlayer", src, 2.0)    
                if nPlayer then 
                    if not userDoubleActionR[charId] then 
                        local nId = NyoFw.getCharId(nPlayer)
                        if not userDoubleActionR[nId] then 
                            userDoubleAction[charId] = nId 
                            userActionData[charId] = nId
                            userActionType[charId] = 'inspect'
                            userDoubleActionR[nId] = charId
                            if RPC.trigger("nfw:inventory:close_ui", nPlayer) then 
                                local nPed = GetPlayerPed(nPlayer)
                                RemoveAllPedWeapons(nPed)
                                if NyoFw.storeAllWeapon(nId) then   
                                    local userInventory = NyoFw.getUserTable(charId).inventory
                                    local userInventory2 = NyoFw.getUserTable(nId).inventory   
                                    SafeEvents.triggerClient('nfw:inventory:openRevistar',src,userInventory,NyoFw.computerItensWeight(userInventory), NyoFw.getInventoryMaxWeight(charId),userInventory2,NyoFw.computerItensWeight(userInventory2), NyoFw.getInventoryMaxWeight(nId))               
                                else 
                                    -- Notify Error store item
                                end
                            end    
                        else 
                            -- notify ja sendo revistado
                        end      
                    else 
                        -- notify que ja esta em uma revista
                    end
                else 
                    -- notify de ninguem proximo
                end
            end            
        end)
    end)
else
    error 'Module name has been modified'
    Nfw.preventCheat()
end