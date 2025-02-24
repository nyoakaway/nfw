Nfw.registerNyoModule('nyo_tattooshop', {}, false, function()

    local valor = 0
    local precoTotal = 0
    local noProvador = false
    local oldC = nil -- Old do barberShop
    local cor = 0
    local old_custom = {}
    local nCustom = {}
    local dataPartE = 1
    local dataPartD = 'p1'
    local configShop = {}
    local typeShop = nil

    local pos = nil
    local camPos = nil
    local camPos2 = nil
    local cam = -1
    local oldH = 0
    local oldRotation = 0

    local tattooReset = true
    local paymentType

    local function parse_part(key)
        if type(key) == "string" and string.sub(key,1,1) == "p" then
            return true,tonumber(string.sub(key,2))
        else
            return false,tonumber(key)
        end
    end

    local function SetCameraCoords(type, start)
        local ped = plyPed
        if start then                
            RenderScriptCams(false, false, 0, 1, 0)
            DestroyCam(cam, false)
        end
        
        if not DoesCamExist(cam) then
            cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
            SetCamActive(cam, true)
            RenderScriptCams(true, true, 500, true, true)   
            pos = GetEntityCoords(ped)
            camPos = GetOffsetFromEntityInWorldCoords(ped, 0.0, 2.0, 0.0)
            camPos2 = GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.8, 0.0)       
        end

        if type == 'all' then                                        
            SetCamCoord(cam, camPos.x, camPos.y, camPos.z+0.75)
            PointCamAtCoord(cam, pos.x, pos.y, pos.z+0.15)
        elseif type == 'head' then 
            SetCamCoord(cam, camPos2.x, camPos2.y, camPos2.z+0.7)
            PointCamAtCoord(cam, pos.x, pos.y, pos.z+0.7)
        elseif type == 'torso' then 
            SetCamCoord(cam, camPos2.x, camPos2.y, camPos2.z+0.40)
            PointCamAtCoord(cam, pos.x, pos.y, pos.z+0.20)
        elseif type == 'shoes' then 
            SetCamCoord(cam, camPos2.x, camPos2.y, camPos2.z-0.30)
            PointCamAtCoord(cam, pos.x, pos.y, pos.z-0.30)
        elseif type == 'foot' then 
            SetCamCoord(cam, camPos2.x, camPos2.y, camPos2.z-0.70)
            PointCamAtCoord(cam, pos.x, pos.y, pos.z-0.70)
        end        
    end

    local function DeleteCam()
        SetCamActive(cam, false)
        RenderScriptCams(false, true, 0, true, true)
        cam = nil
    end

    local function setTattooRoupa()
        local modelHash = old_custom.modelhash
        local idleCopy = {}
        for l,w in pairs(configShop.roupaPelado[modelHash]) do
            idleCopy[l] = w
        end
    
        NyoFw.setCustomization(idleCopy)
    end

    local function atualizarTattooNUI()
        local ped = plyPed
        ClearPedDecorations(ped)
        for k,v in pairs(LocalPlayer.state.tattoo) do       
            AddPedDecorationFromHashes(ped,GetHashKey(v[1]),GetHashKey(k))
        end

        NfwClient.sendNUIMessage('updateTattooShopPrice', { value = precoTotal })
    end

    local function shopProvador() 
        ped = PlayerPedId()
        CreateThread(function()
            while inShop do
                DisableControlAction(1, 1, true)
                DisableControlAction(1, 2, true)
                DisableControlAction(1, 24, true)
                DisablePlayerFiring(ped, true)
                DisableControlAction(1, 142, true)
                DisableControlAction(1, 106, true)
                DisableControlAction(1, 37, true)
                Wait(4)
            end
        end)
    end


    SafeEvents.register('tattoshop:applyTattos', function(custom)
        LocalPlayer.state.tattoo = custom
        local ped = PlayerPedId()
        ClearPedDecorations(ped)
        for k,v in pairs(LocalPlayer.state.tattoo) do
            AddPedDecorationFromHashes(ped,GetHashKey(v[1]),GetHashKey(k))
        end
    end)

    NyoFw.tattooAplyTattoos = function()
        local ped = PlayerPedId()
        ClearPedDecorations(ped)
        for k,v in pairs(LocalPlayer.state.tattoo) do
            AddPedDecorationFromHashes(ped,GetHashKey(v[1]),GetHashKey(k))
        end
    end
    --GlobalState.tattooAplyTattoos = tattooApplyTattoos

    NfwClient.registerNUICallback('shopRotation', function(data,cb)
        local ped = plyPed
        local newH = data.rotation + 0.00
        SetEntityHeading(ped, newH)
        cb({})
    end)

    NfwClient.registerNUICallback('shopCam', function(data,cb)
        SetCameraCoords(data.type, false)
    end)

    NfwClient.registerNUICallback("changeTattooShopItem", function(data, cb)
        local pId = data.itemId + 1
        local pType = data.part
        local sexo = data.sexo

        local tattooData = configShop['parts'..sexo][pType]['tattoo'][pId]
        if LocalPlayer.state.tattoo[tattooData['name']] ~= nil then 
            local newAtualTattoo = {}
            for k,v in pairs(LocalPlayer.state.tattoo) do 
                if k ~= tattooData['name'] then 
                    newAtualTattoo[k] = v
                end
            end
            LocalPlayer.state.tattoo = newAtualTattoo

                if LocalPlayer.state.oldTattos[tattooData['name']] == nil then 
                    precoTotal = precoTotal - tattooData['price']
                end
            atualizarTattooNUI()
        else 
            local newAtualTattoo = {}
            for k,v in pairs(LocalPlayer.state.tattoo) do 
                if k ~= tattooData['name'] then 
                    newAtualTattoo[k] = v
                end
            end
            newAtualTattoo[tattooData['name']] = {tattooData['part']}
            LocalPlayer.state.tattoo = newAtualTattoo
            if LocalPlayer.state.oldTattos[tattooData['name']] == nil then 
                precoTotal = precoTotal + tattooData['price']
            end
            atualizarTattooNUI()
        end  
    end)

    NfwClient.registerNUICallback("limpaTattoo", function(data, cb)
        LocalPlayer.state.tattoo = {}
        precoTotal = 0
        atualizarTattooNUI()
    end)

    NfwClient.registerInterface(1)

    local function openTattooUI(v,k)
        tattooReset = true
        local ped = plyPed
        local config = NfwConfigs[v.config]

        if config.hidePlayers then
            NfwClient.enableHidingPlayers()
        end

        NfwClient.disableMarkerType(1)

        local cds = k and v.coord or plyCoords
        --ultLoja = k
        valor = 0
        precoTotal = 0
        noProvador = true
        configShop = config.shopConfig
        dataPartE = 'head'
        old_custom = NyoFw.getCustomization()
        paymentType = config.paymentType
        setTattooRoupa()
        
        shopProvador() 
        cor = 0
        
        TaskGoToCoordAnyMeans(ped, cds, 1.0, 0, 0, 786603, 0xbf800000)
        CreateThread(function()
            while noProvador do 
                Wait(4)
                if #(GetEntityCoords(ped) - cds).xy < 0.5 then 
                    oldH = v.heading
                    if k then
                        SetEntityHeading(ped, v.heading)     
                    end                  
                    ClearPedTasks(ped)
                    oldRotation = 0
                    noProvador = false
                    SetNuiFocus(true, true)
                    local pedModel = GetEntityModel(ped)
                    local sexo = ''
                    local prefix = ''
                    if pedModel == GetHashKey("mp_m_freemode_01") then
                        sexo = 'Male'
                        prefix = 'M'                
                    elseif pedModel == GetHashKey("mp_f_freemode_01") then 
                        sexo = 'Female'
                        prefix = 'F'
                    end
                    categoryE = 'head'
                    LocalPlayer.state.oldTattos = LocalPlayer.state.tattoo
                    NfwClient.openUI({config = config.shopConfig, oldpart = LocalPlayer.state.tattoo, sexo = sexo, prefix = prefix, categoryE = categoryE})
                    SetCameraCoords('all', true)
                    FreezeEntityPosition(ped, true)
                    SetEntityInvincible(ped, false)
                    IsEntityStatic(ped)
                end
            end
        end)  
    end

    NfwClient.registerKeyPress(openTattooUI)
    Nfw.registerCommand(openTattooUI)

    NfwClient.registerNUICallback('close', function(data,cb)
        NfwClient.enableMarkerType(1)
        if tattooReset then 
            LocalPlayer.state.tattoo = LocalPlayer.state.oldTattos
            local ped = plyPed
            ClearPedDecorations(ped)
            if LocalPlayer.state.tattoo then 
                for k,v in pairs(LocalPlayer.state.tattoo) do
                    AddPedDecorationFromHashes(ped,GetHashKey(v[1]),GetHashKey(k))
                end
            end           
        end
        LocalPlayer.state.oldTattos = {}
        NyoFw.setCustomization(old_custom)
        NfwClient.disableHidingPlayers()
        SetNuiFocus(false, false)
        DeleteCam()
        FreezeEntityPosition(plyPed, false)
    end)

    NfwClient.registerNUICallback('payment', function(data,cb)
        local success = RPC.trigger('tattooshop-tryPayment', precoTotal, paymentType or 1, LocalPlayer.state.tattoo)
        tattooReset = not success
        NfwClient.closeUI()
    end)

    AddEventHandler("nfw:closeUi", function()
        NfwClient.closeUI()
    end)
end)