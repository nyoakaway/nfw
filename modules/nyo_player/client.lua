Nfw.registerNyoModule('nyo_player', {}, false, function()

    local prisioneiro = false
    local reducaopenal = false
    -- Hand Cuffed

    startHandcuffed = function()
        Citizen.CreateThread(function()
            while LocalPlayer.state.handCuffed do
                NyoFw.playAnim(true,{{"mp_arresting","idle"}},true)
                Citizen.Wait(15000)                
            end
        end)
    end

    NyoFw.toogleHandcuff = function()
        local oHand = true
        if LocalPlayer.state.handCuffed then 
            oHand = not LocalPlayer.state.handCuffed
        end
        LocalPlayer.state.handCuffed = oHand
        SetEnableHandcuffs(PlayerPedId(),oHand)
        if oHand then
            startHandcuffed()
        else
            NyoFw.stopAnim()
        end
    end

    NyoFw.setHandcuffed = function(u)
        LocalPlayer.state.handCuffed = u
        if u then 
            startHandcuffed()
        else 
            NyoFw.stopAnim()
        end
    end

    NyoFw.isHandcuffed = function()
        return LocalPlayer.state.handCuffed
    end

    SafeEvents.register("nfw:player:toogleHandcuff", function()
        NyoFw.toogleHandcuff()
    end)

    RPC.addHandler("nfw:player:isHandcuffed", function()
        return LocalPlayer.state.handCuffed
    end)    

    exports('toogleHandcuff', NyoFw.toogleHandcuff) 
    exports('setHandcuffed', NyoFw.setHandcuffed) 
    exports('isHandcuffed', NyoFw.isHandcuffed) 

    -- HANDCUFFED PLAYER (ALGEMAR)
    local handCuffedBlock = false
    RegisterCommand("nfw:player:handcuffed", function()   
        if not IsPedInAnyVehicle(PlayerPedId()) and not handCuffedBlock then
            handCuffedBlock = true
            SafeEvents.triggerServer("nfw:player:handcuffed")
            Wait(2000)
            handCuffedBlock = false
        end
    end) 
    RegisterKeyMapping("nfw:player:handcuffed", 'Algemar', 'KEYBOARD', "g")

    SafeEvents.register("nfw:player:setHandcuffed", function(type)
        if type == 'set' then 
            local ped = PlayerPedId()
            if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
                SetPedComponentVariation(ped,7,41,0,2)
            elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
                SetPedComponentVariation(ped,7,25,0,2)
            end
            NyoFw.setHandcuffed(true)
        elseif type == 'remove' then 
            SetPedComponentVariation(PlayerPedId(),7,0,0,2)
            NyoFw.setHandcuffed(false)
        end
    end)

    Citizen.CreateThread(function()
        while true do
            local idle = 1000
            if LocalPlayer.state.handCuffed or reducaopenal then
                idle = 5
                BlockWeaponWheelThisFrame()
                DisableControlAction(0,20,true)
                DisableControlAction(0,21,true)
                DisableControlAction(0,22,true)
                DisableControlAction(0,23,true)
                DisableControlAction(0,24,true)
                DisableControlAction(0,25,true)
                DisableControlAction(0,29,true)
                DisableControlAction(0,32,true)
                DisableControlAction(0,33,true)
                DisableControlAction(0,34,true)
                DisableControlAction(0,35,true)
                DisableControlAction(0,56,true)
                DisableControlAction(0,57,true)
                DisableControlAction(0,58,true)
                DisableControlAction(0,73,true)
                DisableControlAction(0,75,true)
                DisableControlAction(0,137,true)
                DisableControlAction(0,140,true)
                DisableControlAction(0,141,true)
                DisableControlAction(0,142,true)
                DisableControlAction(0,143,true)
                DisableControlAction(0,166,true)
                DisableControlAction(0,167,true)
                DisableControlAction(0,170,true)
                DisableControlAction(0,177,true)
                DisableControlAction(0,178,true)
                DisableControlAction(0,182,true)
                DisableControlAction(0,187,true)
                DisableControlAction(0,188,true)
                DisableControlAction(0,189,true)
                DisableControlAction(0,190,true)
                DisableControlAction(0,243,true)
                --DisableControlAction(0,245,true)
                --DisableControlAction(0,246,true)
                DisableControlAction(0,257,true)
                DisableControlAction(0,263,true)
                DisableControlAction(0,264,true)
                DisableControlAction(0,268,true)
                DisableControlAction(0,269,true)
                DisableControlAction(0,270,true)
                DisableControlAction(0,271,true)
                DisableControlAction(0,288,true)
                DisableControlAction(0,289,true)
                DisableControlAction(0,311,true)
                DisableControlAction(0,344,true)	
            end
            Citizen.Wait(idle)
        end
    end)

    -- HOLD PLAYER (CARREGAR)
    local holdBlock = false
    RegisterCommand("nfw:player:hold", function()   
        if not IsPedInAnyVehicle(PlayerPedId()) and not holdBlock then
            holdBlock = true
            SafeEvents.triggerServer("nfw:player:hold")
            Wait(2000)
            holdBlock = false
        end       
    end) 
    RegisterKeyMapping("nfw:player:hold", 'Segurar', 'KEYBOARD', "h")

    holdPlayer = nil
    drag = false
    hold = false

    SafeEvents.register("nfw:player:setHold", function(player)
        holdPlayer = player
        drag = not drag
        holdFunction()
    end)

    holdFunction = function()
        if drag and holdPlayer then 
            local ped = GetPlayerPed(GetPlayerFromServerId(holdPlayer))
            Citizen.InvokeNative(0x6B9BBD38AB0796DF,PlayerPedId(),ped,4103,11816,0.48,0.0,0.0,0.0,0.0,0.0,false,false,false,false,2,true)
            hold = true
        else 
            if hold then
                DetachEntity(PlayerPedId(),true,false)
                hold = false
            end
        end
    end

    local blacklistedWeapons = {
        "WEAPON_DAGGER",
        "WEAPON_BAT",
        "WEAPON_BALL",
        "WEAPON_SNOWBALL",
        "WEAPON_BOTTLE",
        "WEAPON_CROWBAR",
        "WEAPON_FLASHLIGHT",
        "WEAPON_GOLFCLUB",
        "WEAPON_HAMMER",
        "WEAPON_HATCHET",
        "WEAPON_KNUCKLE",
        "WEAPON_KNIFE",
        "WEAPON_MACHETE",
        "WEAPON_SWITCHBLADE",
        "WEAPON_NIGHTSTICK",
        "WEAPON_WRENCH",
        "WEAPON_BATTLEAXE",
        "WEAPON_POOLCUE",
        "WEAPON_STONE_HATCHET",
        "WEAPON_STUNGUN",
        "WEAPON_FLARE",
        "GADGET_PARACHUTE",
        "WEAPON_FIREEXTINGUISHER",
        "WEAPON_PETROLCAN",
        "WEAPON_RAYPISTOL",
        "WEAPON_FIREWORK",
        "WEAPON_BZGAS",
        "WEAPON_MUSKET"
    }
    
    Citizen.CreateThread(function()
        while true do
            local ot = 1000
            local ped = PlayerPedId()
            local blacklistweapon = false
            local plyCoords = GetEntityCoords(ped)
            local x,y,z = plyCoords[1],plyCoords[2],plyCoords[3]

            if IsPedArmed(ped, 6) then
                ot = 5
                for k,v in ipairs(blacklistedWeapons) do
                    if GetSelectedPedWeapon(ped) == GetHashKey(v) then
                        blacklistweapon = true
                    end
                end

                if IsPedShooting(ped) and not blacklistweapon then
                    SafeEvents.triggerServer("nfw:atirando",x,y,z)
                    Wait(20000)
                end
            end
    
            blacklistweapon = false
            Wait(ot)
        end
    end)

    local blips = {}

    SafeEvents.register("nfw:notificacao", function(x, y, z, idtype, idcolor, scale, time, text, route, r, g, b, sound, chat, chatnumber)
        local id = NyoFw.generateId()
        if not DoesBlipExist(blips[id]) then
            blips[id] = AddBlipForCoord(x,y,z)
            SetBlipScale(blips[id],scale)
            SetBlipSprite(blips[id],idtype)
            SetBlipColour(blips[id],idcolor)

            if route then
                SetBlipRoute(blips[id],true)
            end

            if sound then
                PlaySoundFrontend(-1,"Enter_1st","GTAO_FM_Events_Soundset",false)
            end

            if chat then
                TriggerEvent('chatMessage',chatnumber,{r,g,b},text)
            end

            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(text)
            EndTextCommandSetBlipName(blips[id])
            SetBlipAsShortRange(blips[id],false)
            SetTimeout(time,function()

                if DoesBlipExist(blips[id]) then
                    RemoveBlip(blips[id])
                    NyoFw.removeId(id)
                    blips[id] = nil
                end
            end)
        end
    end)

    -- /RMASCARA
    RegisterNetEvent("rmascara")
    AddEventHandler("rmascara",function()
        SetPedComponentVariation(PlayerPedId(),1,0,0,2)
    end)

    -- /RCHAPEU
    RegisterNetEvent("rchapeu")
    AddEventHandler("rchapeu",function()
        ClearPedProp(PlayerPedId(),0)
    end)

    SafeEvents.register("ejectVehicle", function(player)
        local ped = PlayerPedId()
        if IsPedSittingInAnyVehicle(ped) then
            TaskLeaveVehicle(ped,GetVehiclePedIsIn(ped),4160)
        end
    end)

    SafeEvents.register("putInNearestVehicleAsPassenger", function(radius)
        local veh = NyoFw.getClosestEntity('vehicle', nil, radius)
        if IsEntityAVehicle(veh) then
            for i=1,math.max(GetVehicleMaxNumberOfPassengers(veh),3) do
                if IsVehicleSeatFree(veh,i) then
                    SetPedIntoVehicle(PlayerPedId(),veh,i)
                    return true
                end
            end
        end
        return false
    end)

    RegisterKeyMapping("apertare","Cabeçada","keyboard","e")

    RegisterCommand("apertare",function(source,args)
        if IsPedJumping(PlayerPedId()) then
            if not IsPedInAnyVehicle(PlayerPedId()) then
                local cds = GetEntityForwardVector(PlayerPedId())
                local Tackled = {}

                SetEntityHealth(PlayerPedId(),GetEntityHealth(PlayerPedId())-50)
                SetPedToRagdollWithFall(PlayerPedId(),1500,2000,0,cds,1.0,0.0,0.0,0.0,0.0,0.0,0.0)

                while IsPedRagdoll(PlayerPedId()) do
                    Citizen.Wait(1)
                    for Key,Value in ipairs(GetTouchedPlayers()) do
                        if not Tackled[Value] then
                            Tackled[Value] = true
                            SafeEvents.triggerServer("nfw:apertare",GetPlayerServerId(Value),cds.x,cds.y,cds.z)
                        end
                    end
                end
            end
        end
    end)

    SafeEvents.register("nfw:apertarePlayer", function(x,y,z)
        SetPedToRagdollWithFall(PlayerPedId(),1500,1500,0,x,y,z,10.0,0.0,0.0,0.0,0.0,0.0,0.0)
    end)

    function GetPlayers()
        local Players = {}
        for i = 0,256 do
            if NetworkIsPlayerActive(i) then
                table.insert(Players,i)
            end
        end
        return Players
    end

    function GetTouchedPlayers()
        local TouchedPlayer = {}
        for Key,Value in ipairs(GetPlayers()) do
            if IsEntityTouchingEntity(PlayerPedId(),GetPlayerPed(Value)) then
                table.insert(TouchedPlayer,Value)
            end
        end
        return TouchedPlayer
    end

    SafeEvents.register("nfw:prisioneiro", function(status)
        prisioneiro = status
        reducaopenal = false
        local ped = PlayerPedId()
        if prisioneiro then
            iniciarcTrabalhos()
            iniciarcPrisao()
            SetEntityInvincible(ped,false) 
            FreezeEntityPosition(ped,true)
            SetEntityVisible(ped,false,false)
            SetTimeout(2000,function()
                SetEntityInvincible(ped,false)
                FreezeEntityPosition(ped,false)
                SetEntityVisible(ped,true,false)
            end)
        end
    end)

    function iniciarcPrisao()
        CreateThread(function()
            while prisioneiro do
                    local distance = #(GetEntityCoords(ped) - vector3(1700.5,2605.2,45.5))
                    if distance >= 150 then
                        SetEntityCoords(PlayerPedId(),1680.1,2513.0,45.5)
                        TriggerEvent("Notify","aviso","O agente penitenciário encontrou você tentando escapar.")
                    end
                Wait(2000)
            end
        end)
    end

    function iniciarcTrabalhos()
	    Citizen.CreateThread(function()
		    while prisioneiro do
                    local distance1 = #(GetEntityCoords(ped) - vector3(1691.59,2566.05,45.56))
                    local distance2 = #(GetEntityCoords(ped) - vector3(1669.51,2487.71,45.82))
                    
                    if GetEntityHealth(PlayerPedId()) <= 100 then
                        reducaopenal = false
                        NyoFw.deleteObject()
                    end
                    
                    if distance1 <= 100 and not reducaopenal then
                        DrawMarker(21,1691.59,2566.05,45.56,0,0,0,0,180.0,130.0,1.0,1.0,0.5,255,0,0,100,1,0,0,1)
                        if distance1 <= 1.2 then
                            drawTxt("PRESSIONE  ~r~E~w~  PARA PEGAR A CAIXA",4,0.5,0.93,0.50,255,255,255,180)
                            if IsControlJustPressed(0,38) then
                                reducaopenal = true
                                ResetPedMovementClipset(PlayerPedId(),0)
                                SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
                                NyoFw.carregarObjeto("anim@heists@box_carry@","idle","hei_prop_heist_box",50,28422)
                            end
                        end
                    end
                    
                    if distance2 <= 100 and reducaopenal then
                        DrawMarker(21,1669.51,2487.71,45.82,0,0,0,0,180.0,130.0,1.0,1.0,0.5,255,0,0,100,1,0,0,1)
                        if distance2 <= 1.2 then
                            drawTxt("PRESSIONE  ~r~E~w~  PARA ENTREGAR A CAIXA",4,0.5,0.93,0.50,255,255,255,180)
                            if IsControlJustPressed(0,38) then
                                reducaopenal = false
                                SafeEvents.triggerServer("nfw:diminuirpena")
                                NyoFw.deleteObject()
                            end
                        end
                    end
                Wait(5)
            end
        end)
	end

    function drawTxt(text,font,x,y,scale,r,g,b,a)
        SetTextFont(font)
        SetTextScale(scale,scale)
        SetTextColour(r,g,b,a)
        SetTextOutline()
        SetTextCentre(1)
        SetTextEntry("STRING")
        AddTextComponentString(text)
        DrawText(x,y)
    end

    -- -- Exemple RPC
    -- RPC.addHandler('', function()
    --     return 
    -- end)

    -- -- Exemple SafeEvents
    -- SafeEvents.register('', function()
    	
    -- end)

    
end)