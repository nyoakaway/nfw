Nfw.registerNyoModule('nyo_barbershop', {}, false, function()

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

    local function fConvert(n)
        n = n + 0.00000
        return n
    end

    local barberData = {
        parts = {
            ["Defeitos"] = 0,
            ["Barba"] = 1,
            ["Sobrancelhas"] = 2,
            ["Envelhecimento"] = 3,
            ["Maquiagem"] = 4,
            ["Blush"] = 5,
            ["Rugas"] = 6,
            ["Batom"] = 8,
            ["Sardas"] = 9,
            ["Cabelo no Peito"] = 10,
            ["Manchas no Corpo"] = 11,
            ["Cabelo"] = 12,
            ["Cor Sec. do Cabelo"] = 13
        },

        character = {

        },

        oldCharacter = {
            ["0"] = 0,
            ["1"] = 0,
            ["2"] = 0,
            ["3"] = 0,
            ["4"] = 0,
            ["5"] = 0,
            ["6"] = 0,
            ["8"] = 0,
            ["9"] = 0,                
            ["10"] = 0,
            ["12"] = 0,
            ["13"] = 0,                
        },

        carroCompras = {
            ["0"] = false,
            ["1"] = false,
            ["2"] = false,
            ["3"] = false,
            ["4"] = false,
            ["5"] = false,
            ["6"] = false,
            ["8"] = false,
            ["9"] = false,              
            ["10"] = false,
            ["12"] = false,
            ["13"] = false,              
        }
    }

    local cfg = {}

    local SetCameraCoords = function(type, start)
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

    local DeleteCam = function()
        SetCamActive(cam, false)
        RenderScriptCams(false, true, 0, true, true)
        cam = nil
    end
    local precoTotal, oldC, configShop, barberReset = 0

    local updateCarroCompras = function(type)
        valor = 0
        if type == 'skinShop' then 
            for k, v in pairs(shopConfig.carroCompras) do
                if shopConfig.carroCompras[k] == true then
                    local somaValor = configShop[k]['price']
                    valor = valor + somaValor
                end
            end
        elseif type == 'barberShop' then 
            for k, v in pairs(barberData.carroCompras) do
                if barberData.carroCompras[k] == true then
                    local somaValor = configShop[tonumber(k)]['price']
                    valor = valor + somaValor
                end
            end
        end
        
        precoTotal = valor
        return valor
    end

    NyoFw.barberSetPedCustom = function()
        local ped = PlayerPedId()
        local data = LocalPlayer.state.pedCustom

        SetPedHeadBlendData(ped,data.hb.fi,data.hb.mi,0,data.hb.sc,0,0,data.hb.sc2 and data.hb.sm + 0.0 or 0.99,0,0,false)

        for k,v in pairs(data.f) do 
            if k == 'eye' then 
                SetPedEyeColor(ped,v)
            else 
                SetPedFaceFeature(ped,tonumber(k),tonumber(v))
            end
            
        end

        for k,v in pairs(data.h) do 
            if tonumber(k) == 12 then 
                SetPedComponentVariation(ped,2,v[1],0,0)
                SetPedHairColor(ped,tonumber(v[2]),tonumber(v[3]))
            else 
                SetPedHeadOverlay(ped,tonumber(k),tonumber(v[1]),tonumber(v[4]))
                if tonumber(k) == 4 then 
                    SetPedHeadOverlayColor(ped,4,0,10,15)
                else 
                    SetPedHeadOverlayColor(ped,tonumber(k),1,tonumber(v[2]) or 0, tonumber(v[3]) or 0)
                end                
            end
        end
    end

    --GlobalState.barberSetPedCustom = barberSetPedCustom


    -- Funções Gerais 
    local getBarberShopDrawables = function(part)
        ped = PlayerPedId()
        if part == 12 then
            return tonumber(GetNumberOfPedDrawableVariations(ped,2))
        elseif part == -1 then
            return tonumber(GetNumberOfPedDrawableVariations(ped,0))
        elseif part == -2 then
            return 64
        else
            return tonumber(GetNumHeadOverlayValues(part))
        end
    end
    
    local getBarberShopTextures = function(part)
        if part == -1 then
            return tonumber(GetNumHairColors())
        else
            return 64
        end
    end

    local getBarberOverlay = function()
        local bConfig = LocalPlayer.state.pedCustom

        local overlay = {
            ["0"] = { bConfig.h['0'][1],0 },
            ["1"] = { bConfig.h['1'][1],bConfig.h['1'][2] },            
            ["2"] = { bConfig.h['2'][1],bConfig.h['2'][2] },            
            ["3"] = { bConfig.h['3'][1],0 },            
            ["4"] = { bConfig.h['4'][1],0 },            
            ["5"] = { bConfig.h['5'][1],bConfig.h['5'][2] },
            ["6"] = { bConfig.h['6'][1],0 },
            ["8"] = { bConfig.h['8'][1],bConfig.h['8'][2] },
            ["9"] = { bConfig.h['9'][1],0 },            
            ["10"] = { bConfig.h['10'][1],bConfig.h['10'][2] },
            ["12"] = { bConfig.h['12'][1],bConfig.h['12'][2] },
            ["13"] = { bConfig.h['12'][1],bConfig.h['12'][3] },
        }
        return overlay
    end
    
    NfwClient.registerInterface(1)

    local openUI = function(v,k)
        console.debug('^3[ BARBERSHOP ] ^7Open barbershop UI')
        NfwClient.disableMarkerType(1)
        local ped = plyPed
        local model = GetEntityModel(ped)

        SetNuiFocus(true, true)
        barberReset = true

        if k then
            local coordPed = vector3(v.coord.x, v.coord.y, v.coord.z-1)
            SetEntityCoords(ped, coordPed)
            SetEntityHeading(ped, v.heading)
        end

        local drawa = getBarberShopDrawables(12)
        local texture = getBarberShopTextures(12)

        LocalPlayer.state.oldPedCustom = LocalPlayer.state.pedCustom
        cfg = NfwConfigs[v.config]

        if cfg.hidePlayers then
            NfwClient.enableHidingPlayers()
        end

        oldC = getBarberOverlay()
        barberData.oldCharacter = LocalPlayer.state.oldPedCustom
        configShop = cfg.shopConfig

        NfwClient.openUI({
            type = cfg.shopType,
            config = cfg,
            oldpart = oldC,
            sexo = model == `mp_m_freemode_01` and 'Male' or 'Female',
            prefix = model == `mp_m_freemode_01` and 'M' or 'F',
            category = 12,
            drawa = drawa,
            texture = texture
        })

        SetCameraCoords('all', true)
    end
    
    NfwClient.registerKeyPress(openUI)
    Nfw.registerCommand(openUI)

    NfwClient.registerNUICallback('closeBarber', function(data,cb)
        console.debug('^3[ BARBERSHOP ] ^7Close barbershop UI')
        NfwClient.enableMarkerType(1)
        if barberReset then
            LocalPlayer.state.pedCustom = LocalPlayer.state.oldPedCustom
            NyoFw.barberSetPedCustom()
        end
        NfwClient.disableHidingPlayers()
        SetNuiFocus(false, false)
        DeleteCam()
        cb({})
    end)

    NfwClient.registerNUICallback('shopCam', function(data,cb)
        console.debug('^3[ BARBERSHOP ] ^7Change camera position')
        SetCameraCoords(data.type, false)
    end)

    NfwClient.registerNUICallback('changeBarberShopPart', function(data,cb)
        console.debug('^3[ BARBERSHOP ] ^7Change barbershop part')
        local newPart = ''
        local menu = data.menu

        if menu == 'D' then
            dataPartD = data.part
            newPart = dataPartD
        elseif menu == 'E' then 
            dataPartE = data.part
            newPart = dataPartE
        end

        local bConfig = LocalPlayer.state.pedCustom
        local opacity = bConfig.h[newPart][4] or 0.99
       
        NfwClient.sendNUIMessage('updateBarberShop', {
            newPart = newPart,
            drawa = getBarberShopDrawables(tonumber(newPart)),
            texture = getBarberShopTextures(tonumber(newPart)),
            opacity = tonumber(opacity),
            menu = menu
        })

        cb({})
    end)

    NfwClient.registerNUICallback("changeBarberShopItem", function(data, cb)
        console.debug('^3[ BARBERSHOP ] ^7Change barbershop item')
        local type = tonumber(data.part)
    
        if tonumber(data.itemId) ~= oldC[tostring(type)][1] and barberData.oldCharacter[tostring(type)] ~= "custom" then 
            barberData.carroCompras[tostring(type)] = true
            barberData.oldCharacter[tostring(type)] = "custom"
        end

        if tonumber(data.itemId) == oldC[tostring(type)][1] and barberData.oldCharacter[tostring(type)] == "custom" then 
            barberData.carroCompras[tostring(type)] = false                
            barberData.oldCharacter[tostring(type)] = "0"
        end

        local price = updateCarroCompras('barberShop')

        local bConfig = LocalPlayer.state.pedCustom
        bConfig.h[tostring(type)][1] = tonumber(data.itemId)

        LocalPlayer.state.pedCustom = bConfig
        NyoFw.barberSetPedCustom()

        NfwClient.sendNUIMessage('updateBarberShopPrice', { value = price })
        cb({})
    end)

    NfwClient.registerNUICallback('changeBarberShopColor', function(data,cb)
        console.debug('^3[ BARBERSHOP ] ^7Change barbershop color')
        local dataType = tonumber(data.part);
        local dColor = tonumber(data.color);
        local type = tonumber(data.type);
        local bConfig = LocalPlayer.state.pedCustom

        if dataType == 1 or dataType == 2 or dataType == 5 or dataType == 8 or dataType == 10 then 
            if type == 1 then 
                bConfig.h[tostring(dataType)][2] = dColor
            end
        elseif dataType == 12 then 
            if type == 1 then 		
                bConfig.h[tostring(dataType)][2] = dColor	
            else			
                bConfig.h[tostring(dataType)][3] = dColor
            end
        end
        LocalPlayer.state.pedCustom = bConfig
        NyoFw.barberSetPedCustom()
    end)

    NfwClient.registerNUICallback('changeBarberShopbarberOpacity', function(data,cb)
        console.debug('^3[ BARBERSHOP ] ^7Change barbershop opacity')
        local type = tonumber(data.part)
        local bConfig = LocalPlayer.state.pedCustom

        bConfig.h[tostring(type)][4] = tonumber(data.opacity)
       
        LocalPlayer.state.pedCustom = bConfig
        NyoFw.barberSetPedCustom()
    end)

    NfwClient.registerNUICallback('changeRotation', function(data,cb)
        console.debug('^3[ BARBERSHOP ] ^7Change rotation')
        local ped = plyPed
        local newH = data.value + 0.00
        SetEntityHeading(ped, newH)
        cb({})
    end)

    NfwClient.registerNUICallback('payment', function(data,cb)
        console.debug('^3[ BARBERSHOP ] ^7Try payment')
        local success = RPC.trigger('barbershop-tryPayment', precoTotal, cfg.paymentType or 1, LocalPlayer.state.pedCustom)
        barberReset  = not success
        NfwClient.closeUI()
    end)

    RegisterNetEvent("nyoModule:refreshBarber")
    AddEventHandler("nyoModule:refreshBarber",function()
        NyoFw.barberSetPedCustom()
    end)

    AddEventHandler("nfw:closeUi", function()
        NfwClient.closeUI()
    end)
end)