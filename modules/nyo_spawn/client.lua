Nfw.registerNyoModule('nyo_spawn', {}, false, function()

    NfwClient.registerInterface(1)

    -- CONFIGURAÇÃO DO MODELO DO PED E COORDENADAS DE SPAWN
    local model =  `mp_m_freemode_01`
    local spawncds = vector4(-64.087905883789,-64.483512878418,59.508422851562,161.57479858398)
    local spawnLocations =  nil 

    local spawnConfig = NfwConfigs.spawnConfig    

    -- THREAD PARA INICIAR O SPAWN DO PLAYER
    CreateThread(function()

        -- CHECA SE O PLAYER NÃO ESTÁ LOGADO, CASO O SCRIPT SEJA REINICIADO
        if not LocalPlayer.state.loggedIn then

            local plyid = PlayerId()

            -- REQUISITA E SETA O MODELO DO PED
            RequestModel(model)
            while not HasModelLoaded(model) do
                Wait(10)
            end
            SetPlayerModel(plyid,model)
            SetModelAsNoLongerNeeded(model)

            -- SETA COORDENADAS E HEADING DO PED
            local ped = PlayerPedId()
            LocalPlayer.state.ped = ped
            SetEntityCoordsNoOffset(ped,spawncds.x,spawncds.y,spawncds.z, false, false, false, true)
            SetEntityHeading(ped,spawncds.w)

            -- CONGELA O PLAYER E DEIXA INVISÍVEL PARA OUTROS JOGADORES
            FreezeEntityPosition(ped,true)
            SetEntityInvincible(ped,true)
            SetEntityCollision(ped,false)
            SetEntityVisible(ped,false)
            SetPlayerControl(plyid,false,false)
            ClearPedTasksImmediately(ped)
            ClearPlayerWantedLevel(plyid)

            -- REQUISITA A COLISÃO NAS COORDENADAS
            RequestCollisionAtCoord(spawncds.x,spawncds.y,spawncds.z)
            local time = GetGameTimer()
            while (not HasCollisionLoadedAroundEntity(ped) and (GetGameTimer() - time) < 5000) do
                Wait(10)
            end

            -- TIRA A LOADING SCREEN
            DoScreenFadeOut(1000)
            Wait(1000)
            ShutdownLoadingScreen()
            Wait(100)
            DoScreenFadeIn(1000)

            -- DEIXA O PED VISÍVEL PARA OUTROS JOGADORES
            FreezeEntityPosition(ped,false)
            SetEntityInvincible(ped,false)
            SetEntityVisible(ped,true)
            SetEntityCollision(ped,true)
            SetPlayerControl(plyid,true,false)

            -- SETA NA STATE BAG DO PLAYER QUE ELE JÁ FOI LOGADO
            LocalPlayer.state.loggedIn = true

            -- TRIGGA O EVENTO DE PLAYER SPAWNED
            TriggerEvent('playerSpawned', spawn)
        end
    end)

    CreateThread(function()
        SetNuiFocus(false, false)
        TriggerScreenblurFadeOut(0)
    end)


    RegisterNetEvent("nfw:SpawnSelector")
    AddEventHandler("nfw:SpawnSelector", function()
        if LocalPlayer.state.spawn then 
            SetEntityInvincible(PlayerPedId(),true)
            SetEntityVisible(PlayerPedId(),false)
            FreezeEntityPosition(PlayerPedId(),true)
            SetPedDiesInWater(PlayerPedId(),false)
            LocalPlayer.state.spawnCamFreezy = true
            startCamFreezy()
        end

        if not LocalPlayer.state.spawnPos then 
            -- Pensar se coloco cutscene ou não
            spawnCam(spawnConfig.startPos)
        else 
            spawnLocations = RPC.trigger('nfw:spawn:getLocations') 

            if spawnConfig.enableLastPos then 
                spawnLocations['ultpos'] = {loc = vector3(LocalPlayer.state.spawnPos.x, LocalPlayer.state.spawnPos.y, LocalPlayer.state.spawnPos.z), name = 'Ultima Localização', desc = 'Sua ultima Localização', imgBack = '', imgMarker = 'marker', perm = ""}
            end
            SetNuiFocus(true, true)
            TriggerScreenblurFadeIn(0)
            NfwClient.openUI({spawn = spawnLocations})
        end       
    end)

    NfwClient.registerNUICallback('close', function(data,cb)
        SetNuiFocus(false, false)
        TriggerScreenblurFadeOut(0)
    end)
    
    local cam, cam2 = nil, nil

    local function fConvert(n)
        n = n + 0.00000
        return n
    end

    function setCamHeight(height)
        local pos = GetEntityCoords(PlayerPedId())
        SetCamCoord(cam,vector3(pos.x,pos.y,fConvert(height)))
    end

    function startCamFreezy()
        CreateThread(function()
            while LocalPlayer.state.spawnCamFreezy do 
                local pos = GetEntityCoords(PlayerPedId())
                SetCamCoord(cam,vector3(pos.x,pos.y,fConvert(1000)))
                SetCamRot(cam,-fConvert(90),fConvert(0),fConvert(0),2)
                SetCamActive(cam,true)
                StopCamPointing(cam)
                RenderScriptCams(true,true,0,0,0,0)
                Wait(10)
            end
        end)       
    end

    function spawnCam(loc)
        SetEntityCoords(PlayerPedId(), loc, 0, 0, 0, 0)       
        if LocalPlayer.state.spawn == nil then  
            LocalPlayer.state.spawn = true
        else 
            LocalPlayer.state.spawnCamFreezy = false
        end

        local pos = GetEntityCoords(PlayerPedId())

        if spawnConfig.spawnCamType == 1 then             
            cam = CreateCam("DEFAULT_SCRIPTED_CAMERA",false)
            
            SetCamCoord(cam,vector3(pos.x,pos.y,fConvert(1000)))
            SetCamRot(cam,-fConvert(90),fConvert(0),fConvert(0),2)
            SetCamActive(cam,true)
            StopCamPointing(cam)
            RenderScriptCams(true,true,0,0,0,0)

            local altura = 1000
            while altura > 50 do
                if altura <= 300 then
                    altura = altura - 6
                elseif altura >= 301 and altura <= 700 then
                    altura = altura - 4
                else
                    altura = altura - 2
                end

                setCamHeight(altura)
                Citizen.Wait(10)
            end
            DestroyCam(cam, true)
        elseif spawnConfig.spawnCamType == 2 then 
            cam2 = CreateCam("DEFAULT_SCRIPTED_CAMERA",false)
            SetCamCoord(cam2,spawnConfig.spawnCamCoord)
            SetCamRot(cam2,fConvert(0),fConvert(0),fConvert(0),2)
            SetCamActive(cam2,true)
            StopCamPointing(cam2)
            RenderScriptCams(true,true,0,0,0,0)
            PointCamAtCoord(cam2, pos.x,pos.y,pos.z+2)
        
            Citizen.Wait(900)
        
            cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", pos.x,pos.y,pos.z+200, 300.00,0.00,0.00, 100.00, false, 0)
            PointCamAtCoord(cam, pos.x,pos.y,pos.z+2)
            SetCamActiveWithInterp(cam, cam2, 3700, true, true)
        
            Citizen.Wait(3700)
        
            PlaySoundFrontend(-1, "Zoom_Out", "DLC_HEIST_PLANNING_BOARD_SOUNDS", 1)
            RenderScriptCams(false, true, 500, true, true)
            PlaySoundFrontend(-1, "CAR_BIKE_WHOOSH", "MP_LOBBY_SOUNDS", 1)
            FreezeEntityPosition(GetPlayerPed(-1), false)
        
            Citizen.Wait(500)
            DestroyCam(cam, true)
            SetCamActive(cam, false)
           
        end 

      
        
        SetEntityInvincible(PlayerPedId(),false)
        SetEntityVisible(PlayerPedId(),true)
        FreezeEntityPosition(PlayerPedId(),false)
        SetPedDiesInWater(PlayerPedId(),true)

        SetCamActive(cam,false)
        StopCamPointing(cam)
        RenderScriptCams(0,0,0,0,0,0)
        SetFocusEntity(PlayerPedId())
        LocalPlayer.state:set('spawned', true, true) 
        --NyoFw.checkDeathCam()
        TriggerEvent("nfw:deathsystem:checkDeath")
        --NyoFw.toogleHud(true)
        --SetPedConfigFlag(PlayerPedId(), 48, true)
    end

    NfwClient.registerNUICallback('selectSpawn', function(data, cb)
        local loc = data.locate

        if loc then 
            local dataLoc = spawnLocations[loc]
            if dataLoc then 
                SetNuiFocus(false, false)
                NfwClient.closeUI()
                spawnCam(dataLoc.loc)
            end
        end
    end)

end)