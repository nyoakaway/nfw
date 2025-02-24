Nfw.registerNyoModule('nyo_core', {}, true, function()

    CreateThread(function()
        AddTextEntry("FE_THDR_GTAO","POWER BY: NYO")
    end)

    AddEventHandler("playerSpawned",function()
        TriggerServerEvent("nyoModule/core/playerSpawned")
    end)

    function NyoFw.getRegistrationNumber()
        return LocalPlayer.state.userRegistration or ''
    end     

    function NyoFw.getClosestEntity(type, coords, range, targets)
        local playerPed = PlayerPedId()
        local closestEntity = nil 
        local closestDistance = nil
        local targets = targets or 'all'
        local netId = nil
        if type then 
            local entities = {}
            if type == "ped" or type == 1 then 
                entities = GetGamePool("CPed")
            elseif type == "vehicle" or type == 2 then 
                entities = GetGamePool("CVehicle")
            elseif type == "object" or type == 3 then 
                entities = GetGamePool("CObject")
            end

            if coords then 
                coords = type(coords) ~= "vector3" and vector3(coords.x, coords.y, coords.z) or coords
            else 
                coords = GetEntityCoords(playerPed)
            end

            if not range then 
                range = 2.0
            end

            for _, entity in ipairs(entities) do 
                local aliveCheck = true
               
                if type == 'ped' and (entity == playerPed or (targets == 'players' and not IsPedAPlayer(entity))) then 
                    aliveCheck = false
                end
                local d = #(coords - GetEntityCoords(entity))
                if aliveCheck and (not closestEntity or d < closestDistance) and d < range then 
                    closestEntity = entity
                    closestDistance = d
                    if IsPedAPlayer(entity) then 
                        netId = nil
                        for _,player in ipairs(GetActivePlayers()) do 
                            if GetPlayerPed(player) == entity then 
                                netId = GetPlayerServerId(player)
                            end                            
                        end
                    end

                    if IsEntityAVehicle(entity) then 
                        netId = VehToNet(entity)
                    end
                end
            end
        end
        return closestEntity, closestDistance, netId
    end

    NyoFw.getCamDirection = function()
        local heading = GetGameplayCamRelativeHeading()+GetEntityHeading(PlayerPedId())
        local pitch = GetGameplayCamRelativePitch()
        local x = -math.sin(heading*math.pi/180.0)
        local y = math.cos(heading*math.pi/180.0)
        local z = math.sin(pitch*math.pi/180.0)
        local len = math.sqrt(x*x+y*y+z*z)
        if len ~= 0 then
            x = x/len
            y = y/len
            z = z/len
        end
        return x,y,z
    end

    NyoFw.playSound = function(dict, name)
        PlaySoundFrontend(-1,dict,name,false)
    end

    SafeEvents.register("nfw:core:playSound", function(d, n)
        NyoFw.playSound(d, n)
    end)

    NyoFw.playScreenEffect = function(name, duration)
        if duration < 0 then
            StartScreenEffect(name,0,true)
        else
            StartScreenEffect(name,0,true)
    
            CreateThread(function()
                Wait(math.floor((duration+1)*1000))
                StopScreenEffect(name)
            end)
        end
    end

    SafeEvents.register("nfw:core:playScreenEffect", function(n, d)
        NyoFw.playScreenEffect(n, d)
    end)

    RPC.addHandler('core-getNearestPlayer', function(radius)
        local nPlayer = nil 
        local dPlayer, distance, playerId = NyoFw.getClosestEntity('ped', nil, radius, 'player')
        if playerId then return playerId end
        return nil
    end)

    local IDGenerator = {}

    NyoFw.generateId = function()
        local newId = #IDGenerator + 1
        IDGenerator[newId] = true 
        return newId
    end 

    NyoFw.removeId = function(id)
        IDGenerator[id] =  nil
    end

    exports('getCamDirection', NyoFw.getCamDirection) 
    exports('getClosestEntity', NyoFw.getClosestEntity) 
    exports('getRegistrationNumber', NyoFw.getRegistrationNumber)
    exports('generateId', NyoFw.generateId)
    exports('removeId', NyoFw.removeId)
    exports('playSound', NyoFw.playSound)
    exports('playScreenEffect', NyoFw.playScreenEffect)

end)