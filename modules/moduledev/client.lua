Nfw.registerModule({}, false, function()
    
    local coordIni = vec3(173.82, -1025.87, 29.36)
    local coordX = vec3(173.82, -1025.87, 29.36)
    local coordY  = vec3(173.82, -1025.87, 29.36)

    local boxSize = 1.0
    local boxDistance = 0.10
    local grid = 8

    local locs = {

    }

    local locsBox = {
       
    }


    CreateThread(function()
        for i=1, grid do -- colunas
            for y=1, grid do -- linhas
                locs[#locs+1] = {
                    {vec3(coordIni.x, coordIni.y, coordIni.z), vec3(coordIni.x, coordIni.y-boxSize, coordIni.z)},
                    {vec3(coordIni.x, coordIni.y-boxSize, coordIni.z), vec3(coordIni.x-boxSize, coordIni.y-boxSize, coordIni.z)},
                    {vec3(coordIni.x-boxSize, coordIni.y-boxSize, coordIni.z), vec3(coordIni.x-boxSize, coordIni.y, coordIni.z)},
                    {vec3(coordIni.x-boxSize, coordIni.y, coordIni.z), vec3(coordIni.x, coordIni.y, coordIni.z)}
                }

                locsBox[#locsBox+1] = {
                    vec3(coordIni.x, coordIni.y, coordIni.z), vec3(coordIni.x-boxSize, coordIni.y-boxSize, coordIni.z)
                }
                coordIni = vec3(coordY.x, coordY.y-(boxSize + boxDistance), coordY.z)
                coordY = vec3(coordY.x, coordY.y-(boxSize + boxDistance), coordY.z)
            end
            coordIni = vec3(coordX.x-(boxSize + boxDistance), coordX.y, coordX.z)            
            coordY = vec3(coordX.x-(boxSize + boxDistance +0.05), coordX.y, coordX.z)
            coordX = vec3(coordX.x-(boxSize + boxDistance), coordX.y, coordX.z)
        end
        startLine()
    end)

    function startLine()
        CreateThread(function()
            while true do 
                for k,v in pairs(locs) do 

                    for k2,v2 in pairs(v) do 
                        --DrawLine(v2[1].x, v2[1].y, v2[1].z,v2[2].x, v2[2].y, v2[2].z, 0, 0, 255, 100)
                        if k2 == 1 then 
                            DrawBox(v2[1].x, v2[1].y, v2[1].z,v2[2].x+0.05, v2[2].y, v2[2].z, 0, 0, 255, 100)
                        elseif k2 == 2 then
                            DrawBox(v2[1].x, v2[1].y, v2[1].z,v2[2].x, v2[2].y+0.05, v2[2].z, 0, 255, 0, 100)
                        elseif k2 == 3 then
                            DrawBox(v2[1].x, v2[1].y, v2[1].z,v2[2].x-0.05, v2[2].y, v2[2].z, 255, 0, 0, 100)
                        elseif k2 == 4 then
                            DrawBox(v2[1].x, v2[1].y, v2[1].z,v2[2].x, v2[2].y-0.05, v2[2].z, 255, 255, 0, 100)
                        end
                        
                    end
                end

                for k,v in pairs (locsBox) do 
                    --for k2, v2 in pairs(v) do 
                    DrawBox(v[1].x, v[1].y, v[1].z,v[2].x, v[2].y, v[2].z, 0, 255, 255, 10)
                    --end
                end
                Wait(1)
            end
        end)
    end

    RegisterCommand("testeN", function(source, args)
        ClearPedDecorations(ped)
        AddPedDecorationFromHashes(PlayerPedId(),GetHashKey("otaku_nails_overlays"),GetHashKey("otaku_ln_blue_02_M"))
        AddPedDecorationFromHashes(PlayerPedId(),GetHashKey("otaku_nails_overlays"),GetHashKey("otaku_ln_lightgreen_01_M"))
        --AddPedDecorationFromHashes(PlayerPedId(),GetHashKey("otaku_nails_overlays"),GetHashKey(args[1]))
    end)








    -- local locs = {
    --     {
    --         {vec3(47.2, -1143.98, 627.94), vec3(48.2, -1143.98, 627.94)},
    --         {vec3(48.2, -1143.98, 627.94), vec3(48.2, -1144.98, 627.94)},
    --         {vec3(48.2, -1144.98, 627.94), vec3(47.2, -1144.98, 627.94)},
    --         {vec3(47.2, -1144.98, 627.94), vec3(47.2, -1143.98, 627.94)}
    --     }
    -- }

    -- local locs2 = {
    --     {
    --         {vec3(47.2, -1143.98, 627.94), vec3(48.2, -1144.98, 627.94)}
    --     }
    -- }
    
    -- CreateThread(function()
    --     while true do             
    --         for k,v in pairs(locs) do 
    --             for k2, v2 in pairs(v) do 
    --                 DrawLine(v2[1].x, v2[1].y, v2[1].z,v2[2].x, v2[2].y, v2[2].z, 0, 0, 255, 100)
    --             end
    --         end
    --         Wait(3)
    --     end
    -- end)
    
    -- CreateThread(function()
    --     while true do             
    --         for k,v in pairs(locs2) do 
    --             for k2, v2 in pairs(v) do 
    --                 DrawBox(v2[1].x, v2[1].y, v2[1].z,v2[2].x, v2[2].y, v2[2].z, 0, 255, 255, 50)
    --             end
    --         end
    --         Wait(3)
    --     end        
    -- end)
    
    
    --NfwClient.registerInterface(1) 
        -- 1 = NUI DE USO (inventario, skinshop)
        -- 2 = NUI QUE NÃO SOME (notify)
        -- 3 = NUI QUE SOME QUANDO USAR O 1 (hud)


        
    -- CreateThread(function()
    --     while true do
    --     Wait(4)    
    --         if NetworkIsInSpectatorMode() then
    --             print('caiu no spec mode')
    --         end
    --     end
    -- end)

    -- CreateThread(function()
    --     while true do
    --         Wait(4)
    --         local camRight, camForward, camUp, camPosition = GetCamMatrix(GetRenderingCam())
    --         if camRight  ~= vector3(0, 0, 0) or camForward  ~= vector3(0, 0, 0) or camUp  ~= vector3(0, 0, 0) or camPosition  ~= vector3(0, 0, 0) then
    --             print('caiu no freecam')
    --         end
    --     end
    -- end)

    -- CreateThread(function()
    --     Wait(10000) -- Wait 10 seconds
    --     while true do
    --         Wait(0)
    --         local ped = PlayerPedId()
    --         local posx,posy,posz = table.unpack(GetEntityCoords(ped,true))
    --         local still = IsPedStill(ped)
    --         local vel = GetEntitySpeed(ped)
    --         local ped = PlayerPedId()
    --         Wait(3000) -- wait 3 seconds and check again

    --         local newx,newy,newz = table.unpack(GetEntityCoords(ped,true))
    --         local newPed = PlayerPedId() -- make sure the peds are still the same, otherwise the player probably respawned
    --         if GetDistanceBetweenCoords(posx,posy,posz, newx,newy,newz) > 200 and still == IsPedStill(ped) and vel == GetEntitySpeed(ped) and ped == newPed then
    --             print('caiu no noclip')
    --         end
    --     end
    -- end)

    -- CreateThread(function()
    --     Wait(10000); -- Wait 10 seconds
    --     while true do
	-- 	    Wait(1)             
    --         SetPedInfiniteAmmoClip(PlayerPedId(), false)
    --         SetEntityInvincible(PlayerPedId(), false)
    --         SetEntityCanBeDamaged(PlayerPedId(), true)
    --         ResetEntityAlpha(PlayerPedId())
    --         local fallin = IsPedFalling(PlayerPedId())
    --         local ragg = IsPedRagdoll(PlayerPedId())
    --         local parac = GetPedParachuteState(PlayerPedId())
    --         if parac >= 0 or ragg or fallin then
    --             SetEntityMaxSpeed(PlayerPedId(), 80.0)
    --         else
    --             SetEntityMaxSpeed(PlayerPedId(), 7.1)
    --         end
    --     end
    -- end)


    -- RegisterCommand("testeCommand", function(source, args)
    --     local registeredCommands = GetRegisteredCommands()
    --     print(json.encode(registeredCommands))
    -- end)

    -- RegisterCommand("explosaaao", function(source, args)
    --     AddExplosion(GetEntityCoords(PlayerPedId()),5,3000.0,true,false,true)
    -- end)

    -- AddEventHandler('gameEventTriggered', function (name, args)
    --     if name == 'CEventNetworkEntityDamage'  then
    --         print(json.encode(args,{indent=true}))
    --     end 
    -- end)

    -- CreateThread(function()
    --     while true do 
    --         Wait(1)
    --         local ped = PlayerPedId()
    --         if not IsEntityVisible(ped) then 
    --          --   print('no clip')
    --         end
    --     end
    -- end)
end)