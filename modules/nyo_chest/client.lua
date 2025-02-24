Nfw.registerNyoModule('nyo_chest', {}, false, function()
    
    NfwClient.registerKeyPress(function(v,k)
        local ped = PlayerPedId()
        local isInVehicle = IsPedInAnyVehicle(ped) 
        local chestId = v.id

        if not isInVehicle then 
            NyoFw.openChest(chestId)
        end
    end)
end)