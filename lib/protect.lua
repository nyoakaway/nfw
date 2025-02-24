IsServer  = IsDuplicityVersion()

if IsServer then 
    local playerKick = {}
    RegisterServerEvent("nfw/protect", function()
        local source = source
        local charId = exports['nfw']:getCharId(source)
        if not playerKick[charId] then 
            playerKick[charId] = true
            print(charId..' - Stopou o nfw!')
            DropPlayer(source, 'Tentativa de burlar o Module! Tente novamente mais tarde!')
            playerKick[charId] = false
        end      
    end)
else 
    AddEventHandler('onClientResourceStop', function (resourceName)
        if resourceName == 'nfw' then
            Wait(15000)
            local resourceState = GetResourceState('nfw')
            if resourceState == 'started' or resourceState == 'starting' then
            else 
                TriggerServerEvent("nfw/protect")
            end        
        end
    end)
end

  