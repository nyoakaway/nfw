local function _()

    local nvec = vec3(0.0,0.0,0.0)

    -- Proximity coordinates selector
    local CloseCoordinates = {}
    plyPed = PlayerPedId()
    plyCoords = GetEntityCoords(PlayerPedId())
    npVisible = 0 
    npWeapon = 0

    Nfw.onReady(function()
        local protectConfig = NfwConfigs.protectSystem 
        SafeEvents.register("nfw:inventory:حماية القرن! هنا الديوث لن يفعل شيئًا!", function(w)
            LocalPlayer.state.sW = w
        end)

        -- Player info update
        CreateThread(function()        
            while true do
                plyPed = PlayerPedId()
                plyCoords = GetEntityCoords(plyPed)
               
                if config.protection then                   
                    if LocalPlayer.state.spawned then 
                        -- NC PROTECT
                        if protectConfig.activeProtect.noclip then 
                            local visible = LocalPlayer.state.np_visible 
                            if not IsEntityVisible(plyPed) and not visible then 
                                npVisible = npVisible + 1
                                if npVisible > 3 then 
                                    SetEntityVisible(plyPed, true)
                                end                            
                            else 
                                npVisible = 0
                            end
                        end
                        
                        -- WEAPON PROTECT
                        if protectConfig.activeProtect.weapon then 
                            local pWeapon = GetSelectedPedWeapon(PlayerPedId())

                            if pWeapon ~= LocalPlayer.state.sW and pWeapon ~= -1569615261 then 
                                npWeapon = npWeapon + 1 
                                if npWeapon > 3 then 
                                    RemoveAllPedWeapons(plyPed)
                                end
                            else 
                                npWeapon = 0 
                            end
                        end
                       
                    end 

                end
                

                Wait(config.updatePedInfoTime)
            end
        end)

        function checkPlayerPermission(perm)            
            local playerPermissions = GlobalState.permissions

            if playerPermissions then 
                if type(perm) == "table" then
                    for k,v in pairs(perm) do
                        if playerPermissions[v] then
                            return true
                        end
                    end
                    return false
                else 
                    if playerPermissions[perm] then 
                        return true 
                    else 
                        return false
                    end
                end
            end            
        end

        function checkUpgrade(upgrade)
            
            if type(upgrade) == 'table' then 
                for k,v in pairs(upgrade) do 
                    if NyoFw.checkUpgrade(k) then 
                        return true
                    end
                end
            else 
                if NyoFw.checkUpgrade(upgrade) then 
                    return true
                end
            end
            return false
        end

        CreateThread(function ()

            local function CheckMarkerPermission(playerPermissions, perm)
                if not playerPermissions then return true end
                if not perm or perm == '' or config.showMakerWithoutPermission then
                    return true
                end
                if type(perm) == 'table' then
                    for k,v in pairs(perm) do
                        if playerPermissions[v] then
                            return true
                        end
                    end
                elseif playerPermissions[perm] then
                    return true
                end
                return false
            end

            while true do
                CloseCoordinates = {}
                local textures = {}
                local usedTextures = {}
                for k,v in pairs(NfwCoords) do
                    local distance = #(plyCoords - v.coord)
                    local maxDistance = v.markerDistance or 10.0
                    local config = NfwConfigs[v.config]
                    if config.marker and config.marker.custom and config.marker.custom.active then
                        textures[#textures + 1] = config.marker.custom
                    end
                    if distance <= maxDistance then
                        if _G.config.markerDebug then
                            console.debug('^3[ MARKER ]^7 Adding close coordinates '..v.coord..' | '..v.config)
                        end
                        if ((not config.perm or config.perm == '') or checkPlayerPermission(config.perm)) and ((not v.requestUpgrade or v.requestUpgrade == '') or checkUpgrade(v.requestUpgrade)) then
                            if config.marker and config.marker.custom and config.marker.custom.active then
                                usedTextures[config.marker.custom.dict..config.marker.custom.name] = config.marker.custom
                            end
                            v.k_index = k
                            CloseCoordinates[#CloseCoordinates + 1] = v
                        end
                    end
                end
                for k,v in pairs(textures) do
                    if not usedTextures[v.dict..v.name] then
                        if HasStreamedTextureDictLoaded(v.dict) then
                            SetStreamedTextureDictAsNoLongerNeeded(v.dict)
                            if config.markerDebug then
                                console.debug('^3[ MARKER ]^7 Removing dict '..v.dict)
                            end
                        end
                    end
                end
                for k,v in pairs(usedTextures) do
                    if not HasStreamedTextureDictLoaded(v.dict) then
                        if config.markerDebug then
                            console.debug('^3[ MARKER ]^7 Loading dict '..v.dict)
                        end
                        RequestStreamedTextureDict(v.dict)
                    end
                end
                Wait(config.updateCloseCoordinatesTime)
            end

        end)

        CreateThread(function()
            while true do
                local msec = config.sleepMarkerTime
                for k,v in pairs(CloseCoordinates) do
                    msec = 4
                    local mconfig = NfwConfigs[v.config]
                    if mconfig then
                        local mtype = type(mconfig.marker)
                        if not disabled_marker_types[registered_marker_types[mconfig.type] or 1] then
                            if registered_marker_functions[mconfig.type] then
                                registered_marker_functions[mconfig.type](v, v.k_index)
                            else
                                if mtype == 'function' then
                                    mconfig.marker(v.coord, v.text)
                                elseif mtype == 'table' then
                                    local type = mconfig.marker.id
                                    local pos = v.coord
                                    local dir = mconfig.marker.direction or nvec
                                    local rot =  mconfig.marker.rotacao or nvec
                                    local scale = mconfig.marker.scale or nvec
                                    local rgba = mconfig.marker.color
                                    local bobUpAndDown = mconfig.marker.bobUpAndDown or false
                                    local faceCamera = mconfig.marker.faceCamera or false
                                    local rotate = mconfig.marker.rotation or false
                                    local drawOnEnts = mconfig.marker.drawOnEnts or false
                                    local dict = mconfig.marker.custom and mconfig.marker.custom.active and HasStreamedTextureDictLoaded(mconfig.marker.custom.dict) and mconfig.marker.custom.dict 
                                    local name = mconfig.marker.custom and mconfig.marker.custom.active and mconfig.marker.custom.name
                                    DrawMarker(type, pos, dir, rot, scale, rgba[1], rgba[2], rgba[3], rgba[4], bobUpAndDown, faceCamera, 1, rotate, dict, name, drawOnEnts)
                                elseif mconfig.text3d then
                                    DrawText3Ds(v.coord.x, v.coord.y, v.coord.z, v.text or '')
                                elseif mconfig.text2d then
                                    drawTxt2D(v.text or '', 4, 0.9, 0.5, 0.5, 255,255,255, 150)
                                end
                            end
                            if #(plyCoords - v.coord) <= (v.distance or 1.1) and IsControlJustPressed(0,mconfig.actionKey) and Nfw.checkPermission(mconfig.perm) and not LocalPlayer.state.handCuffed and not LocalPlayer.state.blockAnim then
                                if registered_click_functions[mconfig.type] then
                                    registered_click_functions[mconfig.type](v, v.k_index)
                                    Wait(500)
                                end
                            end
                        end
                    end
                end
                Wait(msec)
            end
        end)
    end)

    RegisterCommand("nfw:setlang",function(s,args,rawC)
        if args[1] then
            Nfw.setCurrentLanguage(args[1])
        end
    end)

    Nfw.onReady(function()
        for k,v in pairs(NfwCoords) do
            if v.showBlip then
                local config = NfwConfigs[v.config]
                local bconfig = config.blip
                local blip = AddBlipForCoord(v.coord)
                SetBlipSprite(blip,bconfig.blipId)
                SetBlipColour(blip,bconfig.blipColor)
                SetBlipScale(blip,bconfig.blipScale)
                SetBlipAsShortRange(blip,true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(bconfig.name)
                EndTextCommandSetBlipName(blip)
            end
        end
    end)

    Nfw.onReady(function() 
        for k,v in pairs(NfwCoords) do
            if not NfwConfigs[v.config] then
                print('^3[ WARNING ]^7 Invalid config '..v.config..' - '..v.coord)
                NfwCoords[k] = nil
            end
        end
    end)

    SafeEvents.register('core:updateConfig', function(configIndex, state)
        config[configIndex] = state
    end)

end

_()