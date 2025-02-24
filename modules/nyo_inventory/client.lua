Nfw.registerNyoModule('nyo_inventory', {}, false, function()

    NfwClient.registerInterface(1)
    local invGConfig = NfwConfigs['inventoryGeneralConfig']
    local invConfig = NfwConfigs['inventoryItensConfig'] 

    CreateThread(function()
        --SetPedConfigFlag(PlayerPedId(), 48, false)
        SetWeaponsNoAutoswap(1)
        if invGConfig.disableAutoReload then 
            SetWeaponsNoAutoreload(true)
        else 
            SetWeaponsNoAutoreload(false)
        end
        
    end)
    CreateThread(function()
        while true do
            Wait(1)
            BlockWeaponWheelThisFrame()
            --HudWeaponWheelIgnoreSelection()
        end
    end)
    
    NyoFw.getItemName = function(index) 
        if invConfig[index] then 
            if type(invConfig[index].name) == 'string' then 
                return invConfig[index].name
            else 
                return invConfig[index].name(args)
            end
        end
        return 'UNKNOW'
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

    NyoFw.getItemPermissionTo = function(index, typeReq, args)
        if invConfig[index] then 
            if type(invConfig[index][typeReq]) == 'boolean' then 
                return invConfig[index][typeReq]
            else 
                return invConfig[index][typeReq](args)
            end
        end
        return false
    end

    NyoFw.getItemImg = function(index) 
        if invConfig[index] then 
            return invConfig[index].img
        end
        return 'unknow'
    end

    NyoFw.changeInventoryData = function(inventory)
        local retInv = {i = {}, w = {}}
        if inventory then 
            for k,v in pairs(inventory) do            
                if k == 'w' then 
                    if v then 
                        for k2, v2 in pairs(v) do
                            local itemData = {}
                            if v2.d then 
                                itemData = v2.d
                            end

                            if itemData.a then 
                                for k3,v3 in pairs(itemData.a) do 
                                    itemData.a[k3] = {i = NyoFw.getItemIndex(k3), n = NyoFw.getItemName(k3), img = NyoFw.getItemImg(k3)}
                                end
                            end
                            retInv.w[k2] = {i = v2.i, h = v2.h, d = itemData, n = NyoFw.getItemName(v2.i), img = NyoFw.getItemImg(v2.i)}
                        end                   
                    end
                elseif k == 'i' then 
                    if v then 
                        for k2, v2 in pairs(v) do 
                            retInv.i[#retInv.i + 1] = {i = v2.i, a = v2.a, h = v2.h, img = NyoFw.getItemImg(v2.i), n = NyoFw.getItemName(v2.i), w = NyoFw.getItemWeight(v2.i), t = NyoFw.getItemType(v2.i), use = invConfig[v2.i].use, send = invConfig[v2.i].send, drop = invConfig[v2.i].drop }
                        end
                    end
                end     
            end
        end
        return retInv
    end

    RegisterNetEvent("inventory:open", function(type, inventory, weight, maxWeight, inventory2, weight2, maxWeight2)
        NfwClient.openUI({
            type = type,
            inventory = inventory,
            weight = weight, 
            maxWeight = maxWeight,
            inventory2 = inventory2,
            weight2 = weight2, 
            maxWeight2 = maxWeight2
        })
    end)

    SafeEvents.register('Nfw/inventory/updateInventory', function (inventory, weight, maxWeight, inventory2, weight2, maxWeight2)
        local retInv = NyoFw.changeInventoryData(inventory)
        local retInv2 = NyoFw.changeInventoryData(inventory2)

        NfwClient.sendNUIMessage('inventoryUpdate', { 
            inventory = retInv,
            weight = weight, 
            maxWeight = maxWeight,
            inventory2 = retInv2,
            weight2 = weight2, 
            maxWeight2 = maxWeight2
        })
    end)

    NfwClient.registerNUICallback("close",function(data,cb)
        NfwClient.enableMarkerType(1)
        local ped = PlayerPedId()
        SetNuiFocus(false, false)
        TriggerScreenblurFadeOut(0)
        SafeEvents.triggerServer("Nfw/inventory/closeInventory")
    end)


    -- HotKey KeyMapping
    local hotKeyTime = 0
    for x=1,6,1 do 
        if x < 4 then 
            RegisterCommand("nfw:inventory:hot"..x, function()
                if hotKeyTime == 0 then 
                    hotKeyTime = invGConfig.hotKeyBlockTime
                    startHotKeyCoolDown()
                    local ped = PlayerPedId() 
                    local selectedWeapon = GetSelectedPedWeapon(ped)
                    local selectedWeaponAmmo = GetAmmoInPedWeapon(ped, selectedWeapon)
                    SafeEvents.triggerServer("Nfw:inventory:getHotKeydata", x, selectedWeapon, selectedWeaponAmmo)
                end                
            end)
            RegisterKeyMapping("nfw:inventory:hot"..x, 'Inventory Hot Key '..x, 'KEYBOARD', x)
        else 
            RegisterCommand("nfw:inventory:hot"..x, function()
                if hotKeyTime == 0 then 
                    hotKeyTime = invGConfig.hotKeyBlockTime
                    startHotKeyCoolDown()
                    local ped = PlayerPedId() 
                    SafeEvents.triggerServer("Nfw:inventory:getHotKeydata", x)
                end
            end)
            RegisterKeyMapping("nfw:inventory:hot"..x, 'Inventory Hot Key '..x, 'KEYBOARD', x)        
        end
    end

    function startHotKeyCoolDown()
        CreateThread(function()
            while hotKeyTime > 0 do 
                Wait(1000)
                hotKeyTime = hotKeyTime - 1
            end
        end)
    end
    RegisterCommand("nfw:inventory:open", function()   
        if not LocalPlayer.state.handCuffed and not LocalPlayer.state.blockAnim then 
            local success, inventory, weight, maxWeight = RPC.trigger('Nfw:getInventory', 'inventory')
            if success then 
                local retInv = NyoFw.changeInventoryData(inventory)
    
                TriggerScreenblurFadeIn(0)
                TriggerEvent("inventory:open", 'inventory', retInv, weight, maxWeight)  
            end   
        end        
    end) 
    RegisterKeyMapping("nfw:inventory:open", 'Inventory', 'KEYBOARD', "i")

    RegisterCommand("nfw:inventory:vehicles_chest", function()
        if not LocalPlayer.state.handCuffed and not LocalPlayer.state.blockAnim then 
            local chestType = 'carchest'
            if IsPedInAnyVehicle(PlayerPedId(), false) then 
                chestType = 'midcarchest'
            end
            local success, inventory, weight, maxWeight, inventory2, weight2, maxWeight2 = RPC.trigger('Nfw:getInventory', chestType)        
            if success then 
                local retInv = NyoFw.changeInventoryData(inventory)
                local retInv2 = NyoFw.changeInventoryData(inventory2)
                
                TriggerScreenblurFadeIn(0)
                TriggerEvent("inventory:open", 'carchest', retInv, weight, maxWeight, retInv2, weight2, maxWeight2)
            else 
                print('erro')
            end
        end        
    end)
    RegisterKeyMapping("nfw:inventory:vehicles_chest", 'Inventory - Vehicles Chest', 'KEYBOARD', "PAGEUP")

    NfwClient.registerNUICallback('inventory:taskAction', function(data,cb)
        if data.type == 'hotkey' or data.type == 'takeHotKey' or data.type == 'removeHotKeyAttach' or data.type == 'removeAmmo' then local selWeapon = GetSelectedPedWeapon(PlayerPedId()) data.selectedWeapon = selWeapon data.selectedWeaponAmmo = GetAmmoInPedWeapon(PlayerPedId(), selWeapon) end

        if (data.type == 'storage' or data.type == 'take') and not NyoFw.getItemPermissionTo(data.item, 'store') then 
            TriggerEvent("nyo_notify:lang", 'nyo_inventory', 'action-error', 'action-error-invalid-action', '#FF0000', 5000)
            return
        end

        if data.type == 'use' and not NyoFw.getItemPermissionTo(data.item, 'use') then 
            TriggerEvent("nyo_notify:lang", 'nyo_inventory', 'action-error', 'action-error-invalid-action', '#FF0000', 5000)
            return
        end

        if data.type == 'drop' then 
            local ped = PlayerPedId()
            local lObj = nil 
            for k,v in pairs(invGConfig.trashProps) do 
                if v then 
                    local obj = GetClosestObjectOfType(GetEntityCoords(ped),5.0,k)
                    if DoesEntityExist(obj) then  
                        local distance = #(GetEntityCoords(ped) - GetEntityCoords(obj)) 
                        if distance <= 5.0 then 
                            lObj = true 
                            break
                        end
                    end
                end
            end
            if not lObj then 
                TriggerEvent("nyo_notify:lang", 'nyo_inventory', 'action-error', 'action-error-invalid-trash', '#FF0000', 5000)
                return 
            end
        end
        
        local success, error = RPC.trigger("Nfw:inventoryTaskAction", data)
    end)

    NyoFw.openChest = function(chestId)
        if not LocalPlayer.state.handCuffed then 
            local success, inventory, weight, maxWeight, inventory2, weight2, maxWeight2 = RPC.trigger('Nfw:getInventory', 'chest', chestId)  
            if success then 
                local retInv = NyoFw.changeInventoryData(inventory)
                local retInv2 = NyoFw.changeInventoryData(inventory2)
                TriggerScreenblurFadeIn(0)
                TriggerEvent("inventory:open", 'chest', retInv, weight, maxWeight, retInv2, weight2, maxWeight2)
            else 
                print('erro')
            end
        end        
    end

    NyoFw.openHomeChest = function(homeId)
        if not LocalPlayer.state.handCuffed then 
            local success, inventory, weight, maxWeight, inventory2, weight2, maxWeight2 = RPC.trigger('Nfw:getInventory', 'homes', homeId)  
            if success then 
                local retInv = NyoFw.changeInventoryData(inventory)
                local retInv2 = NyoFw.changeInventoryData(inventory2)
                TriggerScreenblurFadeIn(0)
                TriggerEvent("inventory:open", 'homes', retInv, weight, maxWeight, retInv2, weight2, maxWeight2)
            else 
                print('erro')
            end
        end     
    end

    RPC.addHandler("nfw:inventory:close_ui", function()
        NfwClient.enableMarkerType(1)
        local ped = PlayerPedId()
        SetNuiFocus(false, false)
        TriggerScreenblurFadeOut(0)
        NfwClient.closeUI()
        return true
    end)

    SafeEvents.register('nfw:inventory:openRevistar', function (inventory, weight, maxWeight, inventory2, weight2, maxWeight2)
        local retInv = NyoFw.changeInventoryData(inventory)
        local retInv2 = NyoFw.changeInventoryData(inventory2)

        if retInv and retInv2 then 
            TriggerScreenblurFadeIn(0)
            TriggerEvent("inventory:open", 'inspect', retInv, weight, maxWeight, retInv2, weight2, maxWeight2)
        else 
            print('erro')
        end
    end)

    -- Sync Weapon Ammo Thread
    if not LocalPlayer.state.sW then 
        LocalPlayer.state.sW = -1569615261
    end
    
    local atualWeapon = nil 
    local oldWeapon = nil
    local atualAmmo = 0
    local oldAmmo = 0
    
    CreateThread(function()
        while true do 
            local ped = PlayerPedId()
            local pWeapon = GetSelectedPedWeapon(PlayerPedId())
            
            if pWeapon == atualWeapon then 
                local pAmmo = GetAmmoInPedWeapon(ped, atualWeapon) 
                if pAmmo ~= atualAmmo then 
                    atualAmmo = pAmmo
                    oldAmmo = pAmmo
                    SafeEvents.triggerServer("Nfw:inventoryUpdateAmmo", pWeapon, pAmmo)
                end
            else 
                if oldAmmo ~= atualAmmo then  
                    SafeEvents.triggerServer("Nfw:inventoryUpdateAmmo", oldWeapon, oldAmmo)
                end
                atualWeapon = pWeapon 
                oldWeapon = pWeapon
                atualAmmo = GetAmmoInPedWeapon(ped, atualWeapon)
                oldAmmo = atualAmmo
            end
            Wait(invGConfig.ammoSyncThreadTime)
        end
    end)

    AddEventHandler("nfw:closeUi", function()
        NfwClient.closeUI()
        SafeEvents.triggerServer("Nfw/inventory/closeInventory")
    end)
end)
