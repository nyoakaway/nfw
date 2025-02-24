Nfw.registerNyoModule('nyo_character', {}, false, function()
    
    NfwClient.registerInterface(1)

    local creatorConfig = NfwConfigs.creatorConfig
    local pedCharacter = nil 
    local cam

    local ccMode = { 
        ['hb'] = {
            ['fi'] = 0, ['mi'] = 0, ['g'] = 'M', ['sc'] = 0, ['sc2'] = 0, ['sm'] = 0.0, ['sm2'] = 0.0,
        },
        ['f'] = {
            [0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0,
            [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 0,
            [12] = 0, [13] = 0, [14] = 0, [15] = 0, [16] = 0,
            [17] = 0, [18] = 0, [19] = 0, ['eye'] = 0,
        },
        ['h'] = {
            [0] = {-1,0,0,0.99},
            [1] = {-1,0,0,0.99},
            [2] = {0,0,0,0.99},
            [3] = {-1,0,0,0.99},
            [4] = {-1,0,0,0.99},
            [5] = {-1,0,0,0.99},
            [6] = {-1,0,0,0.99},
            [7] = {-1,0,0,0.99},
            [8] = {-1,0,0,0.99},
            [9] = {-1,0,0,0.99},
            [10] = {-1,0,0,0.99},
            [12] = {4,0,0,0.99},
        }
    }
   
    -- Funções Gerais 
    local fConvert = function(n)
        n = n + 0.00000
        return n
    end

    local parse_part = function(key)
        if type(key) == "string" and string.sub(key,1,1) == "p" then
            return true,tonumber(string.sub(key,2))
        else
            return false,tonumber(key)
        end
    end

    local getCharacterDrawable = function(part)
        if not pedCharacter then return end
        if part == 12 then
            return tonumber(GetNumberOfPedDrawableVariations(pedCharacter,2))
        elseif part == -1 then
            return tonumber(GetNumberOfPedDrawableVariations(pedCharacter,0))
        elseif part == -2 then
            return 64
        else
            return tonumber(GetNumHeadOverlayValues(part))
        end
    end
    
    local getCharacterDrawableTextures = function(part)
        if part == -1 then
            return tonumber(GetNumHairColors())
        else
            return 64
        end
    end

    characterTaskUpdateGender = function()
        if not pedCharacter then return end
        local data = ccMode.hb.g

        if data == "F" then
            characterChangeGender("mp_f_freemode_01")
        else
            characterChangeGender("mp_m_freemode_01")
        end
        characterRefreshDefaultCharacter()
        characterTaskUpdateSkinOptions()
        characterTaskUpdateFaceOptions()
        characterTaskUpdateHeadOptions()
    end

    characterRefreshDefaultCharacter = function()
        if not pedCharacter then return end
        SetPedDefaultComponentVariation(pedCharacter)
        ClearAllPedProps(pedCharacter)
        local pedModel = GetEntityModel(pedCharacter)
        local configClothPed = creatorConfig.pedBasicClothes[pedModel]
        for k,v in pairs(configClothPed) do 
            local prop, id = parse_part(k)
            if prop then 
                SetPedPropIndex(pedCharacter,id,v[1],v[2],2)
            else 
                SetPedComponentVariation(pedCharacter,id,v[1],v[2],2)
            end
        end
    end

    characterChangeGender = function(model)
        local creatorConfig = NfwConfigs.creatorConfig
        if pedCharacter then DeleteEntity(pedCharacter) end
        
        local mhash = GetHashKey(model)
        while not HasModelLoaded(mhash) do
            RequestModel(mhash)
            Citizen.Wait(10)
        end        
        if HasModelLoaded(mhash) then
            pedCharacter = CreatePed(4, mhash, creatorConfig.spawnPedCoord.x, creatorConfig.spawnPedCoord.y, creatorConfig.spawnPedCoord.z, creatorConfig.spawnPedCoord.w, false)
            SetModelAsNoLongerNeeded(mhash)
        end
    end

    characterTaskUpdateSkinOptions = function()
        if not pedCharacter then return end
        local data = ccMode.hb
        SetPedHeadBlendData(pedCharacter,data.fi,data.mi,0,data.sc,data.sc2,0,fConvert(data.sm),fConvert(data.sm2),0,false)
    end

    characterTaskUpdateFaceOptions = function()
        if not pedCharacter then return end
        local data = ccMode.f

        for k,v in pairs(data) do 
            if k == 'eye' then 
                SetPedEyeColor(pedCharacter,v)
            else 
                SetPedFaceFeature(pedCharacter,k,v)
            end
            
        end
    end

    characterTaskUpdateHeadOptions = function()
        if not pedCharacter then return end
        local data = ccMode.h

        for k,v in pairs(data) do 
            if k == 12 then 
                SetPedComponentVariation(pedCharacter,2,v[1],0,0)
                SetPedHairColor(pedCharacter,v[2],v[3])
            else 
                SetPedHeadOverlay(pedCharacter,k,v[1],v[4])
                if tonumber(k) == 4 then 
                    SetPedHeadOverlayColor(pedCharacter,4,0,10,15)
                else 
                    SetPedHeadOverlayColor(pedCharacter,tonumber(k),1,v[2] or 0, v[3] or 0)
                end                   
            end
        end
    end

    local changeCharacterCam = function()
        if not DoesCamExist(cam) then
            cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)           
        end
        SetCamActive(cam, true)
        RenderScriptCams(true, true, 500, true, true)  
        SetCamCoord(cam,vector3(creatorConfig.spawnPedCamCoord.x, creatorConfig.spawnPedCamCoord.y, creatorConfig.spawnPedCamCoord.z))   
        SetCamRot(cam,fConvert(creatorConfig.spawnPedCamCoordRotate.x),fConvert(creatorConfig.spawnPedCamCoordRotate.y),fConvert(creatorConfig.spawnPedCamCoordRotate.z),2)     
    end

    local DeleteCam = function()
        SetCamActive(cam, false)
        RenderScriptCams(false, true, 0, true, true)
        DestroyCam(cam, true)
        cam = nil
    end

    CreateThread(function()
        SetNuiFocus(false, false)
    end)

    RegisterNetEvent("Nfw/nyo_character/createCharacter", function()
        local creatorConfig = NfwConfigs.creatorConfig
        pedCharacter = CreatePed(4, GetHashKey('mp_m_freemode_01'), creatorConfig.spawnPedCoord.x, creatorConfig.spawnPedCoord.y, creatorConfig.spawnPedCoord.z, creatorConfig.spawnPedCoord.w, false)
        SetNuiFocus(true, true)
        characterRefreshDefaultCharacter()
        characterTaskUpdateSkinOptions()
        characterTaskUpdateFaceOptions()
        characterTaskUpdateHeadOptions()
        NfwClient.openUI({})
        changeCharacterCam()
    end)

    NfwClient.registerNUICallback('character:backMulti', function(data,cb)
        if pedCharacter then DeleteEntity(pedCharacter) end
        NfwClient.closeUI()
        DeleteCam()
        Wait(10)
        TriggerServerEvent("nfw:openMultiCharacter")
    end)

    NfwClient.registerNUICallback("character:updateCharacter", function(data, cb)
        local updateSkin = false 
        local updateFace = false 
        local updateHead = false 
        local updateGender = false

        if data.gender then 
            ccMode.hb.g = data.gender characterTaskUpdateGender() 
        end
        
        if data.skinFeature then 
            ccMode.hb[data.type] = tonumber(data.value) updateSkin = true
        end

        if data.headModel then 
            ccMode.h[tonumber(data.id)][1] = tonumber(data.value)
            updateHead = true
        end
        
        if data.headColor then 
            local pos = 2
            if data.pos == 'c2' then pos = 3 end
            ccMode.h[tonumber(data.id)][pos] = tonumber(data.value)
            updateHead = true
        end

        if data.headOpacity then 
            ccMode.h[tonumber(data.id)][4] = tonumber(data.value)
            updateHead = true
        end

        if data.faceFeature then 
            ccMode.f[data.id] = tonumber(data.value) 
            updateFace = true
        end

        if updateSkin then characterTaskUpdateSkinOptions() end 
        if updateFace then characterTaskUpdateFaceOptions() end 
        if updateHead then characterTaskUpdateHeadOptions() end 
    end)

    NfwClient.registerNUICallback("character:getGenderData", function(data, cb)
        local gender = data.gender
        local maxHair = getCharacterDrawable(12)
        local maxEyesBrows = getCharacterDrawable(2)
        local maxBeard = getCharacterDrawable(1)
        local maxBlush = getCharacterDrawable(5)
        local maxChest = getCharacterDrawable(10)
        local maxLipstick = getCharacterDrawable(8)
        local maxBlemishes = getCharacterDrawable(0)
        local maxAgeing = getCharacterDrawable(3)
        local maxComplexion = getCharacterDrawable(6)
        local maxSundamage = getCharacterDrawable(7)
        local maxFreckles = getCharacterDrawable(9)
        local maxMakeup = getCharacterDrawable(4)
        

        cb({maxHair = maxHair, atualHair = ccMode.h[12][1], 
            maxEyesBrows = maxEyesBrows, atualEyesBrows = ccMode.h[2][1],
            maxBeard = maxBeard, atualBeard = ccMode.h[1][1],
        
            maxBlush = maxBlush, atualBlush = ccMode.h[5][1],
            maxChest = maxChest, atualChest = ccMode.h[10][1],
            maxLipstick = maxLipstick, atualLipstick = ccMode.h[8][1],
            maxBlemishes = maxBlemishes, atualBlemishes = ccMode.h[0][1],
            maxAgeing = maxAgeing, atualAgeing = ccMode.h[3][1],
            maxComplexion = maxComplexion, atualComplexion = ccMode.h[6][1],
            maxSundamage = maxSundamage, atualSundamage = ccMode.h[7][1],
            maxFreckles = maxFreckles, atualFrackles = ccMode.h[9][1],
            maxMakeup = maxMakeup, atualMakeup = ccMode.h[4][1]})


    end)


    NfwClient.registerNUICallback('character:saveCharacter', function(data,cb)
        local lang = Nfw.getModuleLanguage()
        local creatorConfig = NfwConfigs.creatorConfig.characterRequire
        local n = data.name 
        local mn = data.midName 
        local ln = data.lastName 
        local ag = tonumber(data.age) or 0

        if creatorConfig.name then 
            if creatorConfig.nameMinCharacter > #n then 
                NfwGlobalFunctions.notify("Negado", lang.insufficientNameMinCharacter, "#FF0000",  5000)
                return 
            end
        end

        if creatorConfig.midName then 
            if creatorConfig.midNameMinCharacter > #mn then 
                NfwGlobalFunctions.notify("Negado", lang.insufficientMidNameMinCharacter, "#FF0000",  5000)
                return 
            end
        end

        if creatorConfig.lastName then 
            if creatorConfig.lastNameMinCharacter > #ln then 
                NfwGlobalFunctions.notify("Negado", lang.insufficientLastNameMinCharacter, "#FF0000",  5000)
                return 
            end
        end
        
        if creatorConfig.ageMin > ag or creatorConfig.ageMax < ag then 
            NfwGlobalFunctions.notify("Negado", lang.incorrectAge, "#FF0000",  5000)
            return
        end

        local success = RPC.trigger('character:saveCharacter', n, mn, ln, ag, ccMode )  

        if success then 
            if pedCharacter then DeleteEntity(pedCharacter) end
            NfwClient.closeUI()
            DeleteCam()
            Wait(10)
            TriggerServerEvent("nfw:openMultiCharacter")
        else 
            print ('algo deu errado')
            return 
        end
       
    end)


    NyoFw.characterSetCustomization = function(custom)
        local r = async()
        CreateThread(function()
            if custom then
                local ped = GetPlayerPed(-1)
                local mhash = nil
    
                if custom.modelhash then
                    mhash = custom.modelhash
                elseif custom.model then
                    mhash = GetHashKey(custom.model)
                end
                if mhash then
                    local i = 0
                    while not HasModelLoaded(mhash) and i < 10000 do
                        i = i + 1
                        RequestModel(mhash)
                        Citizen.Wait(10)
                    end
                    if HasModelLoaded(mhash) then
                        local armour = GetPedArmour(ped)
                        local health = GetEntityHealth(ped)
                        SetPlayerModel(PlayerId(),mhash)

                        ped = GetPlayerPed(-1)
                        SetPedMaxHealth(ped,401)
                        SetEntityHealth(ped, health)
                        SetPedArmour(ped, armour)
                        SetModelAsNoLongerNeeded(mhash)
                    end
                end
                
    
                for k,v in pairs(custom) do
                    if k ~= "model" and k ~= "modelhash" then
                        local isprop, index = parse_part(k)
                        if isprop then
                            if v[1] < 0 then
                                ClearPedProp(ped,index)
                            else
                                SetPedPropIndex(ped,index,v[1],v[2],v[3] or 2)
                            end
                        else
                            SetPedComponentVariation(ped,index,v[1],v[2],v[3] or 2)
                        end					
                    end
                end
                NyoFw.barberSetPedCustom()
                NyoFw.tattooAplyTattoos()
            end
            r()
        end)
        return r:wait()
    end

    NfwClient.registerNUICallback("rotatePed", function(data,cb)
        local initialHeading = creatorConfig.spawnPedCoord.w
        local currentHeading = initialHeading + data.value - 180
        SetEntityHeading(pedCharacter, currentHeading)
        cb{}
    end)



    exports('changeCharacterData', NyoFw.characterSetCustomization) 
end)