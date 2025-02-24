Nfw.registerNyoModule('nyo_homeschest', {}, false, function()
    NfwClient.registerKeyPress(function(v,k)
        local ped = PlayerPedId()
        local isInVehicle = IsPedInAnyVehicle(ped) 
        local homeId = v.id

        if not isInVehicle then 
            if RPC.trigger("nfw:homeChest:validHome", homeId) then                          
                NyoFw.openHomeChest(homeId)
            end
        end
    end)
end)