Nfw.registerNyoModule('nyo_identity', {}, false, function()
    NfwClient.registerInterface(1)
    RegisterCommand("nfw:identity:openIdentity", function()
        local data = RPC.trigger("nfw:identity:getData")    
        NfwClient.openUI({
            data = data
        })
    end)
    RegisterKeyMapping("nfw:identity:openIdentity", 'Identity - Open', 'KEYBOARD', "F11")

    NfwClient.registerNUICallback("close",function(data,cb)
        SetNuiFocus(false, false)     
    end)
end)