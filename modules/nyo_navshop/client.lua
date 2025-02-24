Nfw.registerNyoModule('nyo_navshop', {}, false, function()
    
    NfwClient.registerInterface(1)

    local navShopConfig = {} 

    NfwClient.registerNUICallback("close",function(data,cb)
        NfwClient.enableMarkerType(1)
        local ped = PlayerPedId()
        SetNuiFocus(false, false)
        ClearPedTasks(ped)
    end)

    NfwClient.registerNUICallback("navShopNuiAction", function(data,cb)
        SafeEvents.triggerServer('navShopAction', navShopConfig, data.index, data.item)
    end)

    NfwClient.registerKeyPress(function(v,k)
        NfwClient.disableMarkerType(1)
        local config = NfwConfigs[v.config].shopConfig
        navShopConfig = config
        SetNuiFocus(true, true)
        NfwClient.openUI({config = config})
    end)

    AddEventHandler("nfw:closeUi", function()
        NfwClient.closeUI()
    end)
end)