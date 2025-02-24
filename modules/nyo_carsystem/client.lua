Nfw.registerNyoModule('nyo_carsystem', {}, false, function()

    RegisterNetEvent("nyoModule:CarSystem")
    RegisterNetEvent('nyoModule:CarSystem:LeftCar')

    AddEventHandler("gameEventTriggered", function(eventName, args)
        if eventName == "CEventNetworkPlayerEnteredVehicle" and args[1] == PlayerId() then
            console.debug('^3[ CAR SYSTEM ] ^7Entered car')
            TriggerEvent("nyoModule:CarSystem", tonumber(args[2]))
            while IsPedInAnyVehicle(plyPed) do
                Wait(100)
            end
            TriggerEvent('nyoModule:CarSystem:LeftCar', tonumber(args[2]))
            console.debug('^3[ CAR SYSTEM ] ^7Left car')
        end
    end)

    CreateThread(function()
        Wait(5000)
        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped) then 
            local vehicle = GetVehiclePedIsIn(ped)
            TriggerEvent("nyoModule:CarSystem",vehicle)
        end
    end)

end)