Nfw.registerNyoModule('nyo_queue', {}, false, function()

    -- Queue Codes 
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1)
            if NetworkIsSessionStarted() then
                TriggerServerEvent("Queue:playerActivated")
                return
            end
        end
    end)

end)