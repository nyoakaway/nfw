Nfw.registerNyoModule('nyo_crosshair', {}, false, function()
    
    AddEventHandler("nfw:closeUi", function()
        NfwClient.closeUI()
    end)
end)