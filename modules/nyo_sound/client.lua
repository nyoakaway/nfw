Nfw.registerNyoModule('nyo_sound', {}, false, function()
    NfwClient.registerInterface(2)


    RegisterNetEvent("nfw:sounds:playSound", function(file, vol)
        NfwClient.sendNUIMessage('playSound',{file = file, volume = vol})
    end)

    RegisterNetEvent("nfw:sounds:playSoundDistance", function(file, vol, player, maxDistance)
        local lCoords = GetEntityCoords(PlayerPedId())
	    local eCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerid)))
        if #(lCoords - eCoords) < maxDistance then 
            NfwClient.sendNUIMessage('playSound',{file = file, volume = vol})
        end
    end)

    RegisterNetEvent("nfw:sounds:playSoundCoord", function(file, vol, x, y, z, maxDistance)
        local ped = PlayerPedId()
        local coord = GetEntityCoords(ped)
        if #(vector3(x,y,z) - coord) < maxDistance then 
            NfwClient.sendNUIMessage('playSound',{file = file, volume = vol})
        end
    end)    
end)