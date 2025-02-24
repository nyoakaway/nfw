Nfw.registerNyoModule('nyo_robbery', {}, false, function()

    local timeRoubo = 0

    NfwClient.registerKeyPress(function(v,k)
        local gConfig = NfwConfigs[v.config]
        local ped = plyPed
        if RPC.trigger('robbery-robberyCheckPolice', gConfig) then 
            if RPC.trigger('robbery-robberySvCheck', gConfig, v.id) then 
                local robberySequence = false 
                if gConfig.robberyRequestItem then 
                    if RPC.trigger('robbery-getModuleItem', gConfig.robberyItem.item, tonumber(gConfig.robberyItem.qtd)) then 
                        robberySequence = true
                    end
                else 
                    robberySequence = true
                end
                if robberySequence then 
                    NfwClient.disableMarkerType(1)
                    local rMinigame = gConfig.minigame
                    local rStart = false
                    if rMinigame == 'nptask' then 
                        local exp = exports["np-taskbarskill"]:taskBar(1200,7)
                        if exp == 100 then 
                            rStart = true 
                        end
                    elseif rMinigame == 'skillbar' then 
                        local exp = exports['nfw']:skillBarStart()
                        if exp then 
                            rStart = true
                        end
                    elseif rMinigame == 'keymaster' then 
                        local exp = exports['cd_keymaster']:StartKeyMaster()
                        if exp then 
                            rStart = true
                        end
                    elseif rMinigame == 'pdsafe' then 
                        local exp = exports["pd-safe"]:createSafe({math.random(0,99)})
                        if exp then 
                            rStart = true 
                        end
                    else 
                        rStart = true
                    end

                    if rStart then                                                                                 
                        RPC.trigger('robbery-robberySetStandby', gConfig, v.id)
                        SafeEvents.triggerServer('robbery-robberyAlertPolice', gConfig, v.coord.x, v.coord.y, v.coord.z)
                        -- iniciar o roubo aqui
                        SetEntityHeading(ped,v.heading)
                        SetEntityCoords(ped,v.coord.x, v.coord.y, v.coord.z-1,false,false,false,false)
                        NyoFw.playAnim(false,{{"anim@heists@ornate_bank@grab_cash_heels","grab"}},true)
                        TriggerEvent("nfw:sounds:playSound",'alarm',0.7)
                        SetPedComponentVariation(ped,5,45,0,2)
                        TriggerEvent('cancelando',true)
                        FreezeEntityPosition(ped, true)
                        timeRoubo = gConfig.robberyTime
                        timeRouboAfter = 0
                        robberyPorcent = 0
                        CreateThread(startRobberyKey)
                        while timeRoubo > 0 do 
                            Wait(1000)
                            timeRoubo = timeRoubo - 1
                            timeRouboAfter = timeRouboAfter + 1
                        end
                        ClearPedTasks(ped)
                        TriggerEvent('cancelando',false)
                        FreezeEntityPosition(ped, false)
                        RPC.trigger('robbery-robberyPayment', gConfig, timeRouboAfter)
                        NfwClient.enableMarkerType(1)
                    else 
                        NfwClient.enableMarkerType(1)
                        RPC.trigger('robbery-robberyResetCooldown', gConfig, v.id)
                        -- mensagem de falhar o roubo aqui
                    end
                else 
                    RPC.trigger('robbery-robberyResetCooldown', gConfig, v.id)
                end                                                                        
            end
        end
    end)

    function startRobberyKey()          
        while timeRoubo > 0 do 
            Wait(4)
            drawTxt2D("APERTE ~r~M~w~ PARA CANCELAR O ROUBO EM ANDAMENTO",4,0.5,0.91,0.36,255,255,255,180)
            drawTxt2D("RESTAM ~g~"..timeRoubo.." SEGUNDOS ~w~PARA TERMINAR",4,0.5,0.93,0.50,255,255,255,180)
            if IsControlJustPressed(0, 244) then 
                timeRoubo = 0
            end
        end
    end

    TriggerEvent('cancelando',false)

end)