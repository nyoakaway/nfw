Nfw.registerNyoModule('nyo_elevator', {}, false, function()

    local functions = Nfw.getModuleFunctions()
    
    NfwClient.registerInterface(1)

    local elevadorLocs = {}

    NfwClient.registerNUICallback("elevadorMove", function(data, cb)
        local i = data.i    
        local ped = PlayerPedId()
        NfwClient.closeUI()         
        DoScreenFadeOut(1000)
        functions.onElevatorUse(elevadorLocs[i].coord, elevadorLocs[i].heading)
        Wait(1000)
        SetEntityCoords(ped, elevadorLocs[i].coord, false, false, false, true)
        SetEntityHeading(ped, elevadorLocs[i].heading)
        Wait(1000)
        SetNuiFocus(false, false)
        NfwClient.enableMarkerType(1)
        DoScreenFadeIn(1000)
        elevadorLocs = {}
    end)

    NfwClient.registerNUICallback("close",function(data,cb)
        NfwClient.enableMarkerType(1)
        ped = PlayerPedId()
        SetNuiFocus(false, false)
        ClearPedTasks(ped)
        FreezeEntityPosition(ped, false)
        SetEntityInvincible(ped, false)
    end)

    NfwClient.registerKeyPress(function(v,k)
        NfwClient.disableMarkerType(1)
        local gconfig = NfwConfigs[v.config]
        elevadorLocs = gconfig.locs
        SetNuiFocus(true, true)
        NfwClient.openUI({ locs = gconfig.locs, elevadorName = gconfig.eName})
    end)

    AddEventHandler("nfw:closeUi", function()
        NfwClient.closeUI()
    end)
end)