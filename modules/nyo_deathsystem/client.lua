Nfw.registerNyoModule('nyo_deathsystem', {}, false, function()
    local deathConfig = NfwConfigs['configDeathSystem']
    NfwClient.registerInterface(1)


    NyoFw.killGod = function()
        local ped = PlayerPedId()
        local coord = GetEntityCoords(ped)
        NetworkResurrectLocalPlayer(coord.x,coord.y,coord.z,true,true,false)
        ClearPedBloodDamage(ped)
        SetEntityInvincible(ped,false)
        SetEntityHealth(ped,201)
        ClearPedTasks(ped)
        ClearPedSecondaryTask(ped)
        NyoFw.revive()
    end

    SafeEvents.register("nfw:deathsystem:killGod", function(health)
        NyoFw.killGod()
        SetEntityHealth(PlayerPedId(), health)
    end)

    NyoFw.revive = function()
        local ped = plyPed
        SetNuiFocus(false, false)
        TriggerScreenblurFadeOut(0)
        SetCamEffect(0)
        AnimpostfxStop('DeathFailOut')
        NfwClient.closeUI()
    end

    NyoFw.isComa = function()
        local ped = plyPed 
        if GetEntityHealth(ped) == 0 then return true end 
        return false
    end

    AddEventHandler("nfw:deathsystem:checkDeath", function()
        Wait(1000)
        local ped = PlayerPedId()
        print(GetEntityHealth(ped)) 
        if GetEntityHealth(ped) == 0 then 
        TriggerEvent("nfw:closeUi")
            TriggerScreenblurFadeIn(0)
            RemoveAllPedWeapons(ped, false)
            if deathConfig.deathZoomCam then SetCamEffect(1) end
            if deathConfig.deathGrayCam then AnimpostfxPlay('DeathFailOut', 0, true) end                              
            SetNuiFocus(true, true)
            NfwClient.openUI({config = deathConfig})
        end
    end)

    exports('killGod', NyoFw.killGod) 
    exports('isComa', NyoFw.isComa) 

    CreateThread(function()
        while true do
            Citizen.Wait(2000)
            SetPlayerHealthRechargeMultiplier(PlayerId(),0)
        end
    end)

    if LocalPlayer.state.spawned then 
        CreateThread(function()
            Wait(2000)
            local ped = plyPed
    
            if GetEntityHealth(ped) < 1 and not LocalPlayer.state.inArena then 
                TriggerEvent("nfw:closeUi")
                TriggerScreenblurFadeIn(0)
                RemoveAllPedWeapons(ped, false)
                if deathConfig.deathZoomCam then SetCamEffect(1) end
                if deathConfig.deathGrayCam then AnimpostfxPlay('DeathFailOut', 0, true) end                              
                SetNuiFocus(true, true)
                NfwClient.openUI({config = deathConfig})
            else 
                TriggerScreenblurFadeOut(0)
                AnimpostfxStop('DeathFailOut')
                SetCamEffect(0)
            end
        end)
    end
   

    RegisterNetEvent("nfw:closeUi")
    AddEventHandler("nfw:closeUi", function()
        NfwClient.enableMarkerType(1)
    end)

    AddEventHandler('gameEventTriggered', function (name, args)
        if LocalPlayer.state.spawned and name == 'CEventNetworkEntityDamage'  then
            local ped = plyPed
            if args[1] == ped and args[6] == 1 and not LocalPlayer.state.inArena then 
                TriggerEvent("nfw:closeUi")
                TriggerScreenblurFadeIn(0)
                RemoveAllPedWeapons(ped, false)
                if deathConfig.deathZoomCam then SetCamEffect(1) end
                if deathConfig.deathGrayCam then AnimpostfxPlay('DeathFailOut', 0, true) end                              
                SetNuiFocus(true, true)
                NfwClient.openUI({config = deathConfig})
            end
        end
    end)   

    RegisterNetEvent("nfw:Revive")
    AddEventHandler("nfw:Revive", function()
        NyoFw.revive()
    end)

    NfwClient.registerNUICallback("deathsystem:revive", function(data, cb)
        local ped = plyPed
        if data.time <= 0 then 
            local rtn, type = RPC.trigger("deathsystem:checkRevive")
            if rtn then 
                local pedCoord = GetEntityCoords(ped)
                TriggerEvent("resetBleeding")
                TriggerEvent("resetDiagnostic") 
                TriggerScreenblurFadeOut(0)
                SetCamEffect(0)
                AnimpostfxStop('DeathFailOut')
                SetNuiFocus(false,false)
                NfwClient.closeUI()
                ClearPedBloodDamage(ped)
                SetEntityHealth(ped,400)
                SetPedArmour(ped,0)
                LocalPlayer.state:set('hunger', 100, true)
                LocalPlayer.state:set('thirst', 100, true)
                NetworkResurrectLocalPlayer(pedCoord,true,true,false)
            else 
                cb(false)
                if type == 1 then                     
                    -- print('retornou aqui2')
                elseif type == 2 then                    
                    -- print('retornou aqui')
                end
            end
        end
    end)

    NfwClient.registerNUICallback("deathsystem:giveUp", function(data, cb)
        local ped = plyPed
        if data.time <= 0 then 
            if RPC.trigger("deathsystem:ClearInventory") then 
                TriggerEvent("resetBleeding")
                TriggerEvent("resetDiagnostic")                
                DoScreenFadeOut(1000)
                TriggerScreenblurFadeOut(0)
                SetCamEffect(0)
                AnimpostfxStop('DeathFailOut')
                SetNuiFocus(false,false)
                NfwClient.closeUI()
                ClearPedBloodDamage(ped)
                SetEntityHealth(ped,400)
                SetPedArmour(ped,0)
                LocalPlayer.state:set('hunger', 100, true)
                LocalPlayer.state:set('thirst', 100, true)
                Wait(1000)
               -- SetEntityCoords(ped,deathConfig.giveUpCoord.x+0.0001,deathConfig.giveUpCoord.y+0.0001,deathConfig.giveUpCoord.z+0.0001,1,0,0,1)
                NetworkResurrectLocalPlayer(deathConfig.giveUpCoord,true,true,false)
                FreezeEntityPosition(ped,true)
                SetTimeout(5000,function()
                    --SetPedConfigFlag(PlayerPedId(), 48, true)
                    FreezeEntityPosition(ped,false)
                    Wait(1000)
                    DoScreenFadeIn(1000)
                end)
            end
        end
    end)
end)