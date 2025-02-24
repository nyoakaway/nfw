Nfw.registerNyoModule('nyo_multi', {}, false, function()
    
    NfwClient.registerInterface(1)
    local playerCharacters = {}
    local multiConfig = NfwConfigs.multiConfig   

    local pedMulti = nil 
    local cam

    

    CreateThread(function()
        SetNuiFocus(false, false)
    end)

    local function parse_part(key)
        if type(key) == "string" and string.sub(key,1,1) == "p" then
            return true,tonumber(string.sub(key,2))
        else
            return false,tonumber(key)
        end
    end
    
    local function setCustomization(data)
        if pedMulti then 
            for k,v in pairs(data) do
                if k ~= "model" and k ~= "modelhash" then
                    local isprop, index = parse_part(k)
                    if isprop then
                        if v[1] < 0 then
                            ClearPedProp(pedMulti,index)
                        else
                            SetPedPropIndex(pedMulti,index,v[1],v[2],v[3] or 1)
                        end
                    else
                        SetPedComponentVariation(pedMulti,index,v[1],v[2],v[3] or 1)
                    end
                end
            end
        end        
    end 

    local function setPedCustom(data)
        if pedMulti then 
            SetPedHeadBlendData(pedMulti,data.hb.fi,data.hb.mi,0,data.hb.sc,0,0,data.hb.sc2 and data.hb.sm + 0.0 or 0.99,0,0,false)

            for k,v in pairs(data.f) do 
                if k == 'eye' then 
                    SetPedEyeColor(pedMulti,v)
                else 
                    SetPedFaceFeature(pedMulti,tonumber(k),tonumber(v))
                end
                
            end

            for k,v in pairs(data.h) do 
                if tonumber(k) == 12 then 
                    SetPedComponentVariation(pedMulti,2,v[1],0,0)
                    SetPedHairColor(pedMulti,v[2],v[3])
                else 
                    SetPedHeadOverlay(pedMulti, tonumber(k), v[1], v[4])
                    if tonumber(k) == 4 then 
                        SetPedHeadOverlayColor(pedMulti, 4, 0, 10, 15)
                    else 
                        SetPedHeadOverlayColor(pedMulti, tonumber(k), 1, v[2] or 0, v[3] or 0)
                    end     
                end
            end           
        end        
    end    

    local function setTattoo(data)
        if pedMulti then 
            ClearPedDecorations(pedMulti)
            if data then 
                for k,v in pairs(data) do
                    AddPedDecorationFromHashes(pedMulti,GetHashKey(v[1]),GetHashKey(k))
                end
            end            
        end        
    end

    local function fConvert(n)
        n = n + 0.00000
        return n
    end

    local function StartFade()
        DoScreenFadeOut(500)
        SetEntityCoords(PlayerPedId(), multiConfig.spawnPedCoord.x, multiConfig.spawnPedCoord.y, multiConfig.spawnPedCoord.z)           
        Wait(1000)
        while IsScreenFadingOut() do
            Citizen.Wait(1)
        end
    end
    
    local function EndFade()
        ShutdownLoadingScreen()
        DoScreenFadeIn(500)
        while IsScreenFadingIn() do
            Citizen.Wait(1)
        end
    end

    local function changeMultiCam()
        if not DoesCamExist(cam) then
            cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)           
        end
        SetCamActive(cam, true)
        RenderScriptCams(true, true, 500, true, true)  
        SetCamCoord(cam,vector3(multiConfig.spawnPedCamCoord.x, multiConfig.spawnPedCamCoord.y, multiConfig.spawnPedCamCoord.z))
        SetCamRot(cam,fConvert(multiConfig.spawnPedCamCoordRotate.x),fConvert(multiConfig.spawnPedCamCoordRotate.y),fConvert(multiConfig.spawnPedCamCoordRotate.z),2)
    end

    local function DeleteCam()
        SetCamActive(cam, false)
        RenderScriptCams(false, true, 0, true, true)
        DestroyCam(cam, true)
        cam = nil
    end
 
    SafeEvents.register('nfw:OpenUiMultiChar', function(characters, maxCharacters)       
        local iniStart = false
        if not DoesCamExist(cam) then StartFade() iniStart = true end

        SetEntityInvincible(PlayerPedId(),true)
        SetEntityVisible(PlayerPedId(),false)
        FreezeEntityPosition(PlayerPedId(),true)
        SetPedDiesInWater(PlayerPedId(),false)
        SetEntityCollision(PlayerPedId(), false)
        changeMultiCam()
        if not DoesCamExist(cam) or iniStart then Citizen.Wait(1000) EndFade() end  ;      
	    
        for k,v in pairs(characters) do 
            playerCharacters[v.id] = v
        end 
  
        SetNuiFocus(true, true)
        NfwClient.openUI({characters = characters, maxCharacter = maxCharacters})
    end)


    NfwClient.registerNUICallback('multi:changeCharacter', function(data,cb)
        if pedMulti then DeleteEntity(pedMulti) EndFade() end
        local dataPed = playerCharacters[data.selectedCharacter]

        local mhash = dataPed.customization.modelhash
        while not HasModelLoaded(mhash) do
            RequestModel(mhash)
            Citizen.Wait(10)
        end        
        if HasModelLoaded(mhash) then
            pedMulti = CreatePed(4, mhash, multiConfig.spawnPedCoord.x, multiConfig.spawnPedCoord.y, multiConfig.spawnPedCoord.z, multiConfig.spawnPedCoord.w, false)
       
            setPedCustom(dataPed.skin)
            setCustomization(dataPed.customization)
            setTattoo(dataPed.tattoo)
        end
       
    end)    

    NfwClient.registerNUICallback('multi:selectCharacter', function(data,cb)
        if pedMulti then DeleteEntity(pedMulti) end
        SetNuiFocus(false, false)
        NfwClient.closeUI()
        Wait(10)
        TriggerServerEvent("nfw:selectCharacter", data.selectedCharacter)        
        DeleteCam()

        -- PedSets
        local ped = PlayerPedId()
        local dataPed = playerCharacters[data.selectedCharacter]
        SetPedMaxHealth(ped,401)
        SetEntityHealth(ped, dataPed.health)
        SetPedArmour(ped, dataPed.armour)
        Wait(10)
        SetEntityCollision(ped, true)
        NetworkSetFriendlyFireOption(true)
	    SetCanAttackFriendly(ped,true,true)
        LocalPlayer.state.userRegistration = dataPed.registration
        LocalPlayer.state.pedCustom = dataPed.skin
        LocalPlayer.state.spawnPos = dataPed.position
        LocalPlayer.state.customization = dataPed.customization
        LocalPlayer.state.tattoo = dataPed.tattoo or {}
        LocalPlayer.state.cloakroom = false
        LocalPlayer.state.wardrobe = false   
        NyoFw.characterSetCustomization(dataPed.customization)
    end)

    NfwClient.registerNUICallback('multi:createCharacter', function(data,cb)
        if pedMulti then DeleteEntity(pedMulti) end
        NfwClient.closeUI()
        DeleteCam()
        Wait(10)
        TriggerEvent("Nfw/nyo_character/createCharacter")        
    end)
   
    NfwClient.registerNUICallback('close', function(data,cb)
        SetNuiFocus(false, false)       
    end)

end)