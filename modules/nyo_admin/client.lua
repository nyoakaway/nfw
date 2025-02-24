Nfw.registerNyoModule('nyo_admin', {}, false, function()

    -- GET CURRENT INTERIOR
    RPC.addHandler('admin:getCurrentInterior', function()
        return GetInteriorAtCoords(GetEntityCoords(PlayerPedId()))
    end)

    -- TELEPORT WAYPOINT
    SafeEvents.register('admin:TELEPORT_WAYPOINT', function()
    	local ped = PlayerPedId()
        local veh = GetVehiclePedIsUsing(ped)
        if IsPedInAnyVehicle(ped) then
            ped = veh
        end

        local waypointBlip = GetFirstBlipInfoId(8)
        local x,y,z = table.unpack(Citizen.InvokeNative(0xFA7C7F0AADF25D09,waypointBlip,Citizen.ResultAsVector()))

        local ground
        local groundFound = false
        local groundCheckHeights = { 0.0,50.0,100.0,150.0,200.0,250.0,300.0,350.0,400.0,450.0,500.0,550.0,600.0,650.0,700.0,750.0,800.0,850.0,900.0,950.0,1000.0,1050.0,1100.0 }

        for i,height in ipairs(groundCheckHeights) do
            SetEntityCoordsNoOffset(ped,x,y,height,0,0,1)

            RequestCollisionAtCoord(x,y,z)
            while not HasCollisionLoadedAroundEntity(ped) do
                RequestCollisionAtCoord(x,y,z)
                Citizen.Wait(1)
            end
            Citizen.Wait(20)

            ground,z = GetGroundZFor_3dCoord(x,y,height)
            if ground then
                z = z + 1.0
                groundFound = true
                break;
            end
        end

        if not groundFound then
            z = 1200
            GiveDelayedWeaponToPed(PlayerPedId(),0xFBAB5776,1,0)
        end

        RequestCollisionAtCoord(x,y,z)
        while not HasCollisionLoadedAroundEntity(ped) do
            RequestCollisionAtCoord(x,y,z)
            Citizen.Wait(1)
        end

        SetEntityCoordsNoOffset(ped,x,y,z,0,0,1)
    end)

    -- CUFF / UNCUFF
    SafeEvents.register('admin:cuff', function(cuff)
        NyoFw.setHandcuffed(source,cuff)
    end)

    -- CLEAR AREA
    SafeEvents.register('admin:CLEAR_AREA', function(cds)
        ClearAreaOfVehicles(cds,2000.0,false,false,false,false,false)
        ClearAreaOfEverything(cds,2000.0,false,false,false,false)
    end)

    -- DEBUG
    local dickheaddebug = false
    SafeEvents.register('admin:DEBUG', function()
        dickheaddebug = not dickheaddebug
        local Keys = {
            ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
            ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
            ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
            ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
            ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
            ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
            ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
            ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
            ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
        }
        local inFreeze = false

        local function drawTxtS(x,y ,width,height,scale, text, r,g,b,a)
            SetTextFont(0)
            SetTextProportional(0)
            SetTextScale(0.25, 0.25)
            SetTextColour(r, g, b, a)
            SetTextDropShadow(0, 0, 0, 0,255)
            SetTextEdge(1, 0, 0, 0, 255)
            SetTextDropShadow()
            SetTextOutline()
            SetTextEntry("STRING")
            AddTextComponentString(text)
            DrawText(x - width/2, y - height/2 + 0.005)
        end
    
        local function DrawText3Ds(x,y,z, text)
            local onScreen,_x,_y=World3dToScreen2d(x,y,z)
            local px,py,pz=table.unpack(GetGameplayCamCoords())
            
            SetTextScale(0.35, 0.35)
            SetTextFont(4)
            SetTextProportional(1)
            SetTextColour(255, 255, 255, 215)
            SetTextEntry("STRING")
            SetTextCentre(1)
            AddTextComponentString(text)
            DrawText(_x,_y)
            local factor = (string.len(text)) / 370
            DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
        end

        local function canPedBeUsed(ped)
            if ped == nil then
                return false
            end
            if ped == GetPlayerPed(-1) then
                return false
            end
            if not DoesEntityExist(ped) then
                return false
            end
            return true
        end
    

        local function GetVehicle()
            local playerped = GetPlayerPed(-1)
            local playerCoords = GetEntityCoords(playerped)
            local handle, ped = FindFirstVehicle()
            local success
            local rped = nil
            local distanceFrom
            repeat
                local pos = GetEntityCoords(ped)
                local distance = GetDistanceBetweenCoords(playerCoords, pos, true)
                if canPedBeUsed(ped) and distance < 30.0 and (distanceFrom == nil or distance < distanceFrom) then
                    distanceFrom = distance
                    rped = ped
                -- FreezeEntityPosition(ped, inFreeze)
                    if IsEntityTouchingEntity(GetPlayerPed(-1), ped) then
                        DrawText3Ds(pos["x"],pos["y"],pos["z"]+1, "Veh: " .. ped .. " Model: " .. GetEntityModel(ped) .. " IN CONTACT" )
                    else
                        DrawText3Ds(pos["x"],pos["y"],pos["z"]+1, "Veh: " .. ped .. " Model: " .. GetEntityModel(ped) .. "" )
                    end
                end
                success, ped = FindNextVehicle(handle)
            until not success
            EndFindVehicle(handle)
            return rped
        end
    
        local function GetObject()
            local playerped = GetPlayerPed(-1)
            local playerCoords = GetEntityCoords(playerped)
            local handle, ped = FindFirstObject()
            local success
            local rped = nil
            local distanceFrom
            repeat
                local pos = GetEntityCoords(ped)
                local distance = GetDistanceBetweenCoords(playerCoords, pos, true)
                if distance < 10.0 then
                    distanceFrom = distance
                    rped = ped
                    --FreezeEntityPosition(ped, inFreeze)
                    if IsEntityTouchingEntity(GetPlayerPed(-1), ped) then
                        DrawText3Ds(pos["x"],pos["y"],pos["z"]+1, "Obj: " .. ped .. " Model: " .. GetEntityModel(ped) .. " IN CONTACT" )
                    else
                        DrawText3Ds(pos["x"],pos["y"],pos["z"]+1, "Obj: " .. ped .. " Model: " .. GetEntityModel(ped) .. "" )
                    end
                end
                success, ped = FindNextObject(handle)
            until not success
            EndFindObject(handle)
            return rped
        end
    
        local function getNPC()
            local playerped = GetPlayerPed(-1)
            local playerCoords = GetEntityCoords(playerped)
            local handle, ped = FindFirstPed()
            local success
            local rped = nil
            local distanceFrom
            repeat
                local pos = GetEntityCoords(ped)
                local distance = GetDistanceBetweenCoords(playerCoords, pos, true)
                if canPedBeUsed(ped) and distance < 30.0 and (distanceFrom == nil or distance < distanceFrom) then
                    distanceFrom = distance
                    rped = ped
    
                    if IsEntityTouchingEntity(GetPlayerPed(-1), ped) then
                        DrawText3Ds(pos["x"],pos["y"],pos["z"], "Ped: " .. ped .. " Model: " .. GetEntityModel(ped) .. " Relationship HASH: " .. GetPedRelationshipGroupHash(ped) .. " IN CONTACT" )
                    else
                        DrawText3Ds(pos["x"],pos["y"],pos["z"], "Ped: " .. ped .. " Model: " .. GetEntityModel(ped) .. " Relationship HASH: " .. GetPedRelationshipGroupHash(ped) )
                    end
    
                    FreezeEntityPosition(ped, inFreeze)
                end
                success, ped = FindNextPed(handle)
            until not success
            EndFindPed(handle)
            return rped
        end

        while dickheaddebug do 
            
           Wait(1)
            
            if dickheaddebug then
                local pos = GetEntityCoords(GetPlayerPed(-1))

                local forPos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 1.0, 0.0)
                local backPos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, -1.0, 0.0)
                local LPos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 1.0, 0.0, 0.0)
                local RPos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), -1.0, 0.0, 0.0) 

                local forPos2 = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 2.0, 0.0)
                local backPos2 = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, -2.0, 0.0)
                local LPos2 = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 2.0, 0.0, 0.0)
                local RPos2 = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), -2.0, 0.0, 0.0)    

                local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                local currentStreetHash, intersectStreetHash = GetStreetNameAtCoord(x, y, z, currentStreetHash, intersectStreetHash)
                currentStreetName = GetStreetNameFromHashKey(currentStreetHash)

                drawTxtS(0.8, 0.50, 0.4,0.4,0.30, "Heading: " .. GetEntityHeading(GetPlayerPed(-1)), 55, 155, 55, 255)
                drawTxtS(0.8, 0.52, 0.4,0.4,0.30, "Coords: " .. pos, 55, 155, 55, 255)
                drawTxtS(0.8, 0.54, 0.4,0.4,0.30, "Attached Ent: " .. GetEntityAttachedTo(GetPlayerPed(-1)), 55, 155, 55, 255)
                drawTxtS(0.8, 0.56, 0.4,0.4,0.30, "Health: " .. GetEntityHealth(GetPlayerPed(-1)), 55, 155, 55, 255)
                drawTxtS(0.8, 0.58, 0.4,0.4,0.30, "H a G: " .. GetEntityHeightAboveGround(GetPlayerPed(-1)), 55, 155, 55, 255)
                drawTxtS(0.8, 0.60, 0.4,0.4,0.30, "Model: " .. GetEntityModel(GetPlayerPed(-1)), 55, 155, 55, 255)
                drawTxtS(0.8, 0.62, 0.4,0.4,0.30, "Speed: " .. GetEntitySpeed(GetPlayerPed(-1)), 55, 155, 55, 255)
                drawTxtS(0.8, 0.64, 0.4,0.4,0.30, "Frame Time: " .. GetFrameTime(), 55, 155, 55, 255)
                drawTxtS(0.8, 0.66, 0.4,0.4,0.30, "Street: " .. currentStreetName, 55, 155, 55, 255)
                
                
                DrawLine(pos,forPos, 255,0,0,115)
                DrawLine(pos,backPos, 255,0,0,115)

                DrawLine(pos,LPos, 255,255,0,115)
                DrawLine(pos,RPos, 255,255,0,115)

                DrawLine(forPos,forPos2, 255,0,255,115)
                DrawLine(backPos,backPos2, 255,0,255,115)

                DrawLine(LPos,LPos2, 255,255,255,115)
                DrawLine(RPos,RPos2, 255,255,255,115)

                local nearped = getNPC()

                local veh = GetVehicle()

                local nearobj = GetObject()

            else
                Citizen.Wait(5000)
            end
        end

    end)

    local noclip = false
    SafeEvents.register('admin:NOCLIP', function()
        local ped = PlayerPedId()
        noclip = not noclip

        if noclip then 
            SetEntityInvincible(ped,true)
		    SetEntityVisible(ped,false,false)
            startNoClip()
        else 
            SetEntityInvincible(ped,false)
		    SetEntityVisible(ped,true,false)
        end       
    end)

    CreateThread(function()
        if LocalPlayer.state.np_visible then 
            noclip = true 
            startNoClip()
        end
    end)

    startNoClip = function()
        CreateThread(function()
            while noclip and LocalPlayer.state.np_visible do
                Wait(1)
                local ped = PlayerPedId()
                local pedCoord = GetEntityCoords(ped)
                local x = pedCoord.x 
                local y = pedCoord.y 
                local z = pedCoord.z
                local dx,dy,dz = NyoFw.getCamDirection()
                local speed = 1.0
    
                SetEntityVelocity(ped,0.0001,0.0001,0.0001)
    
                if IsControlPressed(0,21) then
                    speed = 5.0
                end
    
                if IsControlPressed(0,32) then
                    x = x+speed*dx
                    y = y+speed*dy
                    z = z+speed*dz
                end
    
                if IsControlPressed(0,269) then
                    x = x-speed*dx
                    y = y-speed*dy
                    z = z-speed*dz
                end
    
                SetEntityCoordsNoOffset(ped,x,y,z,true,true,true)
            end
            noclip = false
        end)
    end

    SafeEvents.register('admin:TUNING', function()
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped)
        if IsEntityAVehicle(vehicle) then
            SetVehicleModKit(vehicle,0)
            SetVehicleWheelType(vehicle,7)
            for x=0,38 do 
                if x == 14 or x == 23 or x == 24 then 
                    SetVehicleMod(vehicle,14,16,false)
                elseif x > 16 and x < 23 then 
                    ToggleVehicleMod(vehicle,x,true)    
                else 
                    SetVehicleMod(vehicle,x,GetNumVehicleMods(vehicle,x)-1,false)
                end                
            end
            SetVehicleTyreSmokeColor(vehicle,255,0,255)
            SetVehicleWindowTint(vehicle,1)
            SetVehicleTyresCanBurst(vehicle,false)
            SetVehicleNumberPlateText(vehicle,"NYO NFW")
            SetVehicleNumberPlateTextIndex(vehicle,5)
            SetVehicleModColor_1(vehicle,255,135,255)
            SetVehicleModColor_2(vehicle,135,135)
            SetVehicleColours(vehicle,135,135)
            SetVehicleExtraColours(vehicle,135,135)
            SetVehicleNeonLightEnabled(vehicle,0,true)
            SetVehicleNeonLightEnabled(vehicle,1,true)
            SetVehicleNeonLightEnabled(vehicle,2,true)
            SetVehicleNeonLightEnabled(vehicle,3,true)
            SetVehicleNeonLightsColour(vehicle,255,5,190)
        end
    end)
end)