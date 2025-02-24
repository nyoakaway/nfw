Nfw.registerFunctions('nyofw',function() 

    return {
        checkIsVehicleOwner = function(vehicle)
            return NyoFw.getRegistrationNumber():upper() == GetVehicleNumberPlateText(vehicle)
        end,
        onVehicleLock = function(vehicle, lock)
            TriggerEvent('nfw:sounds:playSound', 'lock', 0.5)
            NyoFw.playAnim(true,{{"anim@mp_player_intmenu@key_fob@","fob_click"}},false)
            if lock then
                NfwGlobalFunctions.notify("Importante", "Veículo trancado com sucesso!","#ffffff", 8000)
            else
                NfwGlobalFunctions.notify("Importante", "Veículo destrancado com sucesso!","#ffffff", 8000)
            end
            SetVehicleLights(veh, 2)
            Wait(200)
            SetVehicleLights(veh, 0)
            Wait(200)
            SetVehicleLights(veh, 2)
            Wait(200)
            SetVehicleLights(veh, 0)
        end,
        onVehicleSpawn = function(veh, netVeh, custom, damage, extras, livery, plate, engine, body, fuel, modelName, mods)

        end,


        -- ======================================================================================================================================= --
        onSuccessToSpawnVehicle = function()

        end,
        onFailToSpawnVehicle = function()

        end
    }
end)