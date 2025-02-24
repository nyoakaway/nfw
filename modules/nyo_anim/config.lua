Nfw.registerConfig({
    config = {
        ['configAnim'] = {
            generalConfig = {
                commands = {
                    animWalk = 'ew',
                    animExpression = 'ex',
                    animShared = 'ec',
                    animOther = 'e'
                },
                keyMapping = {
                    ['animacaocruzarbraco'] = {
                        keyLocate = 'keyboard',
                        key = 'f1',
                        text = 'Animação - Cruzar o Braço',
                        action = function()
                            local ped = PlayerPedId() 
                            if not IsPedInAnyVehicle(ped) and GetEntityHealth(ped) > 0 then
                                if IsEntityPlayingAnim(ped,"anim@heists@heist_corona@single_team","single_team_loop_boss",3) then
                                    NyoFw.deleteObject()
                                else
                                    NyoFw.deleteObject()
                                    NyoFw.playAnim(true,{{"anim@heists@heist_corona@single_team","single_team_loop_boss"}},true)
                                end
                            end    
                        end
                    },
                    ['animaguardar'] = {
                        keyLocate = 'keyboard',
                        key = 'f2',
                        text = 'Animação - Aguardar',
                        action = function()
                            local ped = PlayerPedId()
                            if not IsPedInAnyVehicle(ped) and GetEntityHealth(ped) > 0 then
                                if IsEntityPlayingAnim(ped,"mini@strip_club@idles@bouncer@base","base",3) then
                                    NyoFw.deleteObject()
                                else
                                    NyoFw.deleteObject()
                                    NyoFw.playAnim(true,{{"mini@strip_club@idles@bouncer@base","base"}},true)
                                end     
                            end
                        end
                    },
                    ['animdedomeio'] = {
                        keyLocate = 'keyboard',
                        key = 'f3',
                        text = 'Animação - Dedo do meio',
                        action = function()
                            local ped = PlayerPedId()
                            if not IsPedInAnyVehicle(ped) and GetEntityHealth(ped) > 0 then
                                if IsEntityPlayingAnim(ped,"anim@mp_player_intupperfinger","idle_a_fp",3) then
                                    NyoFw.deleteObject()
                                else
                                    NyoFw.deleteObject()
                                    NyoFw.playAnim(true,{{"anim@mp_player_intupperfinger","idle_a_fp"}},true)
                                end
                            end
                        end
                    },
                    ['animajoelhar'] = {
                        keyLocate = 'keyboard',
                        key = 'f5',
                        text = 'Animação - Ajoelhar',
                        action = function()
                            local ped = PlayerPedId()
                            if not IsPedInAnyVehicle(ped) and GetEntityHealth(ped) > 0 then
                                if IsEntityPlayingAnim(ped,"random@arrests@busted","idle_a",3) then
                                    NyoFw.deleteObject()
                                else
                                    NyoFw.deleteObject()
                                    NyoFw.carregarAnim("random@arrests")
                                    NyoFw.carregarAnim("random@arrests@busted")
                                    TaskPlayAnim(ped,"random@arrests","idle_2_hands_up",8.0,1.0,-1,2,0,0,0,0)
                                    Wait(4000)
                                    TaskPlayAnim(ped,"random@arrests","kneeling_arrest_idle",8.0,1.0,-1,2,0,0,0,0)
                                    Wait(500)
                                    TaskPlayAnim(ped,"random@arrests@busted","enter",8.0,1.0,-1,2,0,0,0,0)
                                    Wait(1000)
                                    TaskPlayAnim(ped,"random@arrests@busted","idle_a",8.0,1.0,-1,9,0,0,0,0)
                                    Wait(100)
                                end 
                            end
                        end
                    },
                    ['animcancelar'] = {
                        keyLocate = 'keyboard',
                        key = 'f6',
                        text = 'Animação - Cancelar Animação',
                        action = function()
                            local ped = PlayerPedId()
                            if GetEntityHealth(ped) > 0 and not LocalPlayer.state.blockAnim then
                                NyoFw.deleteObject()
                                ClearPedTasks(ped)
                                TriggerEvent("binoculos", false)
                            end
                        end
                    },
                    ['animmaonacabeca'] = {
                        keyLocate = 'keyboard',
                        key = 'f10',
                        text = 'Animação - Mãos na Cabeça',
                        action = function()
                            local ped = PlayerPedId()
                            if GetEntityHealth(ped) > 0 then
                                if IsEntityPlayingAnim(ped,"random@arrests@busted","idle_a",3) then
                                    NyoFw.deleteObject()
                                else
                                    NyoFw.deleteObject()
                                    NyoFw.playAnim(true,{{"random@arrests@busted","idle_a"}},true)    
                                end            
                            end
                        end
                    },
                    ['animlevantarmaos'] = {
                        keyLocate = 'keyboard',
                        key = 'x',
                        text = 'Animação - Levantar as Mãos',
                        action = function()
                            local ped = PlayerPedId()
                            if GetEntityHealth(ped) > 0 then  
                                if IsEntityPlayingAnim(ped,"random@mugging3","handsup_standing_base",3) then
                                    NyoFw.deleteObject()
                                else
                                    NyoFw.deleteObject()
                                    NyoFw.playAnim(true,{{"random@mugging3","handsup_standing_base"}},true)
                                end
                            end                            
                        end
                    },
                    ['animassobiar'] = {
                        keyLocate = 'keyboard',
                        key = 'down',
                        text = 'Animação - Assobiar',
                        action = function()
                            local ped = PlayerPedId()
                            if not IsPedInAnyVehicle(ped) and GetEntityHealth(ped) > 0 then  
                                NyoFw.playAnim(true,{{"rcmnigel1c","hailing_whistle_waive_a"}},false)
                            end
                        end
                    },
                    ['animsaudacao'] = {
                        keyLocate = 'keyboard',
                        key = 'up',
                        text = 'Animação - Saudação',
                        action = function()
                            local ped = PlayerPedId()
                            if not IsPedInAnyVehicle(ped) and GetEntityHealth(ped) > 0 then
                                NyoFw.playAnim(true,{{"anim@mp_player_intcelebrationmale@salute","salute"}},false)
                            end
                        end
                    },
                    ['animjoia'] = {
                        keyLocate = 'keyboard',
                        key = 'left',
                        text = 'Animação - Joia',
                        action = function()
                            local ped = PlayerPedId()
                            if not IsPedInAnyVehicle(ped) and GetEntityHealth(ped) > 0 then
                                NyoFw.playAnim(true,{{"anim@mp_player_intupperthumbs_up","enter"}},false)
                            end
                        end
                    },
                    ['animfacepalm'] = {
                        keyLocate = 'keyboard',
                        key = 'right',
                        text = 'Animação - Face Palm',
                        action = function()
                            local ped = PlayerPedId()
                            if not IsPedInAnyVehicle(ped) and GetEntityHealth(ped) > 0 then
                                NyoFw.playAnim(true,{{"anim@mp_player_intcelebrationmale@face_palm","face_palm"}},false)
                            end
                        end
                    },
                    ['animapontar'] = {
                        keyLocate = 'keyboard',
                        key = 'b',
                        text = 'Animação - Apontar',
                        action = function()
                            local ped = PlayerPedId()
                            if GetEntityHealth(ped) > 0 then 
                                NyoFw.carregarAnim("anim@mp_point")
                                if not LocalPlayer.state.animApontar then
                                    SetPedCurrentWeaponVisible(ped,0,1,1,1)
                                    SetPedConfigFlag(ped,36,1)
                                    Citizen.InvokeNative(0x2D537BA194896636,ped,"task_mp_pointing",0.5,0,"anim@mp_point",24)
                                    LocalPlayer.state.animApontar = true
                                    functionApontar(true)
                                else
                                    Citizen.InvokeNative(0xD01015C7316AE176,ped,"Stop")
                                    if not IsPedInjured(ped) then
                                        ClearPedSecondaryTask(ped)
                                    end
                                    if not IsPedInAnyVehicle(ped) then
                                        SetPedCurrentWeaponVisible(ped,1,1,1,1)
                                    end
                                    SetPedConfigFlag(ped,36,0)
                                    ClearPedSecondaryTask(ped)
                                    LocalPlayer.state.animApontar = false
                                    functionApontar(false)
                                end
                            end
                        end
                    },
                    ['ligarmotor'] = {
                        keyLocate = 'keyboard',
                        key = 'z',
                        text = 'Ligar Motor',
                        action = function()
                            local ped = PlayerPedId()
                            if IsPedInAnyVehicle(ped) then
                                local vehicle = GetVehiclePedIsIn(ped,false)
                                if GetPedInVehicleSeat(vehicle,-1) == ped then
                                    NyoFw.deleteObject()
                                    local running = Citizen.InvokeNative(0xAE31E7DF9B5B132E,vehicle)
                                    SetVehicleEngineOn(vehicle,not running,true,true)
                                    if running then
                                        SetVehicleUndriveable(vehicle,true)
                                    else
                                        SetVehicleUndriveable(vehicle,false)
                                    end
                                end
                            end
                        end
                    },
                }
            },

            walkAnim = {
                ["Alien"] = {
                    perm = "", 
                    anim = "move_m@alien"
                },
                ["Armored"] = {
                    perm = "", 
                    anim = "anim_group_move_ballistic"
                },
                ["Arrogant"] = {
                    perm = "", 
                    anim = "move_f@arrogant@a"
                },
                ["Brave"] = {
                    perm = "", 
                    anim = "move_m@brave"
                },
                ["Casual"] = {
                    perm = "", 
                    anim = "move_m@casual@a"
                },
                ["Casual2"] = {
                    perm = "", 
                    anim = "move_m@casual@b"
                },
                ["Casual3"] = {
                    perm = "", 
                    anim = "move_m@casual@c"
                },
                ["Casual4"] = {
                    perm = "", 
                    anim = "move_m@casual@d"
                },
                ["Casual5"] = {
                    perm = "", 
                    anim = "move_m@casual@e"
                },
                ["Casual6"] = {
                    perm = "", 
                    anim = "move_m@casual@f"
                },
                ["Chichi"] = {
                    perm = "", 
                    anim = "move_f@chichi"
                },
                ["Confident"] = {
                    perm = "", 
                    anim = "move_m@confident"
                },
                ["Cop"] = {
                    perm = "", 
                    anim = "move_m@business@a"
                },
                ["Cop2"] = {
                    perm = "", 
                    anim = "move_m@business@b"
                },
                ["Cop3"] = {
                    perm = "", 
                    anim = "move_m@business@c"
                },
                ["Default Female"] = {
                    perm = "", 
                    anim = "move_f@multiplayer"
                },
                ["Default Male"] = {
                    perm = "", 
                    anim = "move_m@multiplayer"
                },
                ["Drunk"] = {
                    perm = "", 
                    anim = "move_m@drunk@a"
                },
                ["Drunk"] = {
                    perm = "", 
                    anim = "move_m@drunk@slightlydrunk"
                },
                ["Drunk2"] = {
                    perm = "", 
                    anim = "move_m@buzzed"
                },
                ["Drunk3"] = {
                    perm = "", 
                    anim = "move_m@drunk@verydrunk"
                },
                ["Femme"] = {
                    perm = "", 
                    anim = "move_f@femme@"
                },
                ["Fire"] = {
                    perm = "", 
                    anim = "move_characters@franklin@fire"
                },
                ["Fire2"] = {
                    perm = "", 
                    anim = "move_characters@michael@fire"
                },
                ["Fire3"] = {
                    perm = "", 
                    anim = "move_m@fire"
                },
                ["Flee"] = {
                    perm = "", 
                    anim = "move_f@flee@a"
                },
                ["Franklin"] = {
                    perm = "", 
                    anim = "move_p_m_one"
                },
                ["Gangster"] = {
                    perm = "", 
                    anim = "move_m@gangster@generic"
                },
                ["Gangster2"] = {
                    perm = "", 
                    anim = "move_m@gangster@ng"
                },
                ["Gangster3"] = {
                    perm = "", 
                    anim = "move_m@gangster@var_e"
                },
                ["Gangster4"] = {
                    perm = "", 
                    anim = "move_m@gangster@var_f"
                },
                ["Gangster5"] = {
                    perm = "", 
                    anim = "move_m@gangster@var_i"
                },
                ["Grooving"] = {
                    perm = "", 
                    anim = "anim@move_m@grooving@"
                },
                ["Guard"] = {
                    perm = "", 
                    anim = "move_m@prison_gaurd"
                },
                ["Handcuffs"] = {
                    perm = "", 
                    anim = "move_m@prisoner_cuffed"
                },
                ["Heels"] = {
                    perm = "", 
                    anim = "move_f@heels@c"},
                ["Heels2"] = {
                    perm = "", 
                    anim = "move_f@heels@d"},
                ["Hiking"] = {
                    perm = "", 
                    anim = "move_m@hiking"},
                ["Hipster"] = {
                    perm = "", 
                    anim = "move_m@hipster@a"},
                ["Hobo"] = {
                    perm = "", 
                    anim = "move_m@hobo@a"},
                ["Hurry"] = {
                    perm = "", 
                    anim = "move_f@hurry@a"},
                ["Janitor"] = {
                    perm = "", 
                    anim = "move_p_m_zero_janitor"},
                ["Janitor2"] = {
                    perm = "", 
                    anim = "move_p_m_zero_slow"},
                ["Jog"] = {
                    perm = "", 
                    anim = "move_m@jog@"},
                ["Lemar"] = {
                    perm = "", 
                    anim = "anim_group_move_lemar_alley"},
                ["Lester"] = {
                    perm = "", 
                    anim = "move_heist_lester"},
                ["Lester2"] = {
                    perm = "", 
                    anim = "move_lester_caneup"},
                ["Maneater"] = {
                    perm = "", 
                    anim = "move_f@maneater"},
                ["Michael"] = {
                    perm = "", 
                    anim = "move_ped_bucket"},
                ["Money"] = {
                    perm = "", 
                    anim = "move_m@money"},
                ["Muscle"] = {
                    perm = "", 
                    anim = "move_m@muscle@a"},
                ["Posh"] = {
                    perm = "", 
                    anim = "move_m@posh@"
                },
                ["Posh2"] = {
                    perm = "", 
                    anim = "move_f@posh@"
                },
                ["Quick"] = {
                    perm = "", 
                    anim = "move_m@quick"
                },
                ["Runner"] = {
                    perm = "", 
                    anim = "female_fast_runner"
                },
                ["Sad"] = {
                    perm = "", 
                    anim = "move_m@sad@a"
                },
                ["Sassy"] = {
                    perm = "", 
                    anim = "move_m@sassy"
                },
                ["Sassy2"] = {
                    perm = "", 
                    anim = "move_f@sassy"
                },
                ["Scared"] = {
                    perm = "", 
                    anim = "move_f@scared"
                },
                ["Sexy"] = {
                    perm = "", 
                    anim = "move_f@sexy@a"
                },
                ["Shady"] = {
                    perm = "", 
                    anim = "move_m@shadyped@a"
                },
                ["Slow"] = {
                    perm = "", 
                    anim = "move_characters@jimmy@slow@"
                },
                ["Swagger"] = {
                    perm = "", 
                    anim = "move_m@swagger"
                },
                ["Tough"] = {
                    perm = "", 
                    anim = "move_m@tough_guy@"
                },
                ["Tough2"] = {
                    perm = "", 
                    anim = "move_f@tough_guy@"
                },
                ["Trash"] = {
                    perm = "", 
                    anim = "clipset@move@trash_fast_turn"
                },
                ["Trash2"] = {
                    perm = "", 
                    anim = "missfbi4prepp1_garbageman"
                },
                ["Trevor"] = {
                    perm = "", 
                    anim = "move_p_m_two"
                },
                ["Wide"] = {
                    perm = "", 
                    anim = "move_m@bag"
                },
            },
            
            expression = {
                ["Angry"] = {
                    perm = "", 
                    anim = "mood_angry_1"
                },
                ["Drunk"] = {
                    perm = "", 
                    anim = "mood_drunk_1"
                },
                ["Dumb"] = {
                    perm = "", 
                    anim = "pose_injured_1"
                },
                ["Electrocuted"] = {
                    perm = "", 
                    anim = "electrocuted_1"
                },
                ["Grumpy"] = {
                    perm = "", 
                    anim = "effort_1"
                },
                ["Grumpy2"] = {
                    perm = "", 
                    anim = "mood_drivefast_1"
                },
                ["Grumpy3"] = {
                    perm = "", 
                    anim = "pose_angry_1"
                },
                ["Happy"] = {
                    perm = "", 
                    anim = "mood_happy_1"
                },
                ["Injured"] = {
                    perm = "", 
                    anim = "mood_injured_1"
                },
                ["Joyful"] = {
                    perm = "", 
                    anim = "mood_dancing_low_1"
                },
                ["Mouthbreather"] = {
                    perm = "", 
                    anim = "smoking_hold_1"
                },
                ["NeverBlink"] = {
                    perm = "", 
                    anim = "pose_normal_1"
                },
                ["OneEye"] = {
                    perm = "", 
                    anim = "pose_aiming_1"
                },
                ["Shocked"] = {
                    perm = "", 
                    anim = "shocked_1"
                },
                ["Shocked2"] = {
                    perm = "", 
                    anim = "shocked_2"
                },
                ["Sleeping"] = {
                    perm = "", 
                    anim = "mood_sleeping_1"
                },
                ["Sleeping2"] = {
                    perm = "", 
                    anim = "dead_1"
                },
                ["Sleeping3"] = {
                    perm = "", 
                    anim = "dead_2"
                },
                ["Smug"] = {
                    perm = "", 
                    anim = "mood_smug_1"
                },
                ["Speculative"] = {
                    perm = "", 
                    anim = "mood_aiming_1"
                },
                ["Stressed"] = {
                    perm = "", 
                    anim = "mood_stressed_1"
                },
                ["Sulking"] = {
                    perm = "", 
                    anim = "mood_sulk_1"
                },
                ["Weird"] = {
                    perm = "", 
                    anim = "effort_2"
                },
                ["Weird2"] = {
                    perm = "", 
                    anim = "effort_3"
                },
                ["di2"] = {
                    perm = "", 
                    anim = "die_1"},
                ["normal"] = {
                    perm = "", 
                    anim = "mood_normal_1"
                }
            },

            animComp = {
                ["receiveblowjob"] = {
                    perm = "", 
                    dict = "misscarsteal2pimpsex", 
                    anim = "pimpsex_punter", 
                    otherAnim = "giveblowjob", 
                    andar = false,
                    syncOption = {
                        EmoteDuration = 30000,
                        SyncOffsetFront = 0.63
                    }
                },
                ["giveblowjob"] = {
                    perm = "", 
                    dict = "misscarsteal2pimpsex", 
                    anim = "pimpsex_hooker", 
                    otherAnim = "receiveblowjob", 
                    andar = false,
                    syncOption = {
                        EmoteDuration = 30000,
                        SyncOffsetFront = 0.63
                    }
                },
                ["streetsexmale"] = {
                    perm = "", 
                    dict = "misscarsteal2pimpsex", 
                    anim = "shagloop_pimp", 
                    otherAnim = "streetsexfemale", 
                    andar = false, 
                    loop = true,
                    syncOption = {
                        SyncOffsetFront = 0.50
                    }
                },
                ["streetsexfemale"] = {
                    perm = "", 
                    dict = "misscarsteal2pimpsex", 
                    anim = "shagloop_hooker", 
                    otherAnim = "streetsexmale", 
                    andar = false, 
                    loop = true,
                    syncOption = {
                        SyncOffsetFront = 0.50
                    }
                },

                ["handshake"] = {
                    perm = "", 
                    dict = "mp_ped_interaction",
                    anim = "handshake_guy_a", 
                    otherAnim = "handshake2", 
                    andar = true,
                    syncOption = {
                        EmoteDuration = 3000,
                        SyncOffsetFront = 0.9
                    }
                },
                ["handshake2"] = {
                    perm = "", 
                    dict = "mp_ped_interaction",
                    anim = "handshake_guy_b", 
                    otherAnim = "handshake", 
                    andar = true,
                    syncOption = {
                        EmoteDuration = 3000
                    }
                },
                ["hug"] = {
                    perm = "", 
                    dict = "mp_ped_interaction",
                    anim = "kisses_guy_a", 
                    otherAnim = "hug2", 
                    andar = false,
                    syncOption = {
                        EmoteDuration = 5000,
                        SyncOffsetFront = 1.05,
                    }
                },
                ["hug2"] = {
                    perm = "", 
                    dict = "mp_ped_interaction",
                    anim = "kisses_guy_b", 
                    otherAnim = "hug", 
                    andar = false,
                    syncOption = {
                        EmoteDuration = 5000,
                        SyncOffsetFront = 1.13
                    }
                },
                ["hug3"] = {
                    perm = "", 
                    dict = "misscarsteal2chad_goodbye",
                    anim = "chad_armsaround_chad", 
                    otherAnim = "hug4", 
                    andar = false,
                    loop = true,
                    syncOption = {
                        SyncOffsetFront = 0.05,
                    }
                },
                ["hug4"] = {
                    perm = "", 
                    dict = "misscarsteal2chad_goodbye",
                    anim = "chad_armsaround_girl", 
                    otherAnim = "hug3",                     
                    andar = false,
                    loop = true,
                    syncOption = {
                        SyncOffsetFront = 0.13
                    }
                },
                ["beijar"] = {
                    perm = "", 
                    dict = "mp_ped_interaction",
                    anim = "kisses_guy_a", 
                    otherAnim = "beijar2",                     
                    andar = false,
                    syncOption = {
                        EmoteDuration = 5000,
                        SyncOffsetFront = 1.05,
                    }
                },
                ["beijar2"] = {
                    perm = "", 
                    dict = "mp_ped_interaction",
                    anim = "kisses_guy_b", 
                    otherAnim = "beijar", 
                    andar = false,
                    syncOption = {
                        EmoteDuration = 5000,
                        SyncOffsetFront = 1.13,
                    }
                },
                ["give"] = {
                    perm = "", 
                    dict = "mp_common",
                    anim = "givetake1_a", 
                    otherAnim = "give2", 
                    andar = true,
                    syncOption = {
                        EmoteDuration = 2000,
                    }
                },
                ["give2"] = {
                    perm = "", 
                    dict = "mp_common",
                    anim = "givetake1_b", 
                    otherAnim = "give", 
                    andar = true,
                    syncOption = {
                        EmoteDuration = 2000,
                    }
                },
                ["baseball"] = {
                    perm = "", 
                    dict = "anim@arena@celeb@flat@paired@no_props@",
                    anim = "baseball_a_player_a", 
                    otherAnim = "baseballthrow"
                },
                ["baseballthrow"] = {
                    perm = "", 
                    dict = "anim@arena@celeb@flat@paired@no_props@",
                    anim = "baseball_a_player_b", 
                    otherAnim = "baseball"
                },
                ["stickup"] = {
                    perm = "", 
                    dict = "random@countryside_gang_fight",
                    anim = "biker_02_stickup_loop", 
                    otherAnim = "stickupscared",                     
                    andar = true,
                    loop = true,
                },
                ["stickupscared"] = {
                    perm = "", 
                    dict = "missminuteman_1ig_2",
                    anim = "handsup_base", 
                    otherAnim = "stickup", 
                    andar = true,
                    loop = true,
                },
                ["punch"] = {
                    perm = "", 
                    dict = "melee@unarmed@streamed_variations",
                    anim = "plyr_takedown_rear_lefthook", 
                    otherAnim = "punched"
                },
                ["punched"] = {
                    perm = "", 
                    dict = "melee@unarmed@streamed_variations",
                    anim = "victim_takedown_front_cross_r", 
                    otherAnim = "punch"
                },
                ["headbutt"] = {
                    perm = "", 
                    dict = "melee@unarmed@streamed_variations",
                    anim = "plyr_takedown_front_headbutt", 
                    otherAnim = "headbutted"
                },
                ["headbutted"] = {
                    perm = "", 
                    dict = "melee@unarmed@streamed_variations",
                    anim = "victim_takedown_front_headbutt", 
                    otherAnim = "headbutt"
                },
                ["slapped"] = {
                    perm = "", 
                    dict = "melee@unarmed@streamed_variations",
                    anim = "victim_takedown_front_slap", 
                    otherAnim = "slap"
                },
                ["slapped2"] = {
                    perm = "", 
                    dict = "melee@unarmed@streamed_variations",
                    anim = "victim_takedown_front_backslap", 
                    otherAnim = "slap2"
                },
                ["slap2"] = {
                    perm = "", 
                    dict = "melee@unarmed@streamed_variations",
                    anim = "plyr_takedown_front_backslap", 
                    otherAnim = "slapped2", 
                    andar = true,
                    loop = true,
                    syncOption = {
                        EmoteDuration = 2000,
                    }
                },
                ["slap"] = {
                    perm = "", 
                    dict = "melee@unarmed@streamed_variations",
                    anim = "plyr_takedown_front_slap", 
                    otherAnim = "slapped", 
                    andar = true,
                    loop = true,
                    syncOption = {
                        EmoteDuration = 2000,
                    }
                },
            },

            anim = {
                ["radio2"] = {
                    perm = "",
                    prop = "prop_boombox_01",
                    flag = 50,
                    hand = 57005,
                    pos = {0.30,0,0,0,260.0,60.0}   
                },
            
                ["bolsa"] = {
                    perm = "policia.permissao",
                    prop = "prop_boombox_01",
                    flag = 50,
                    hand = 57005,
                    pos = {0.16,0,0,0,260.0,60.0}
               
                },
            
                ["bolsa2"] = {
                    perm = "",
                    prop = "prop_ld_case_01_s",
                    flag = 50,
                    hand = 57005,
                    pos = {0.16,0,0,0,260.0,60.0}
               
                },
            
                ["bolsa3"] = {
                    perm = "",
                    prop = "prop_security_case_01",
                    flag = 50,
                    hand = 57005,
                    pos = {0.16,0,-0.01,0,260.0,60.0}
               
                },
            
                ["bolsa4"] = {
                    perm = "",
                    prop = "w_am_case", 
                    flag = 50, 
                    hand = 57005, 
                    pos = {0.08,0,0,0,260.0,60.0}
               
                },
            
                ["bolsa5"] = {
                    perm = "",
                    prop = "prop_ld_suitcase_01",
                    flag = 50,
                    hand = 57005,
                    pos = {0.39,0,0,0,260.0,60.0}
                },
            
                ["bolsa6"] = {
                    perm = "",
                    prop = "xm_prop_x17_bag_med_01a",
                    flag = 50,
                    hand = 57005,
                    pos = {0.43,0,0.04,0,260.0,60.0}
                },
            
                ["bolsa7"] = {
                    perm = "", 
                    dict = "move_weapon@jerrycan@generic", 
                    anim = "idle",
                    prop = "prop_ld_suitcase_01",
                    hand = 57005,
                    flag = 50,
                    pos = {0.35, 0.0, 0.0, 0.0, 266.0, 90.0},
                    loop = true,
                    andar = true,
                },
            
                ["bolsa8"] = {
                    perm = "", 
                    dict = "move_weapon@jerrycan@generic", 
                    anim = "idle",
                    prop = "prop_security_case_01",
                    hand = 57005,
                    flag = 50,
                    pos = {0.13, 0.0, -0.01, 0.0, 280.0, 90.0},
                    loop = true,
                    andar = true,
                },
            
                ["caixa2"] = {
                    perm = "",
                    prop = "prop_tool_box_04", 
                    flag = 50, 
                    hand = 57005, 
                    pos = {0.45,0,0.05,0,260.0,60.0}   
                },
            
                ["caixa3"] = {
                    perm = "",
                    dict = "anim@heists@box_carry@", 
                    anim = "idle",
                    prop = "xm_prop_smug_crate_s_medical",
                    flag = 50,
                    hand = 28422
                },
            
                ["lixo"] = {
                    perm = "",
                    prop = "prop_cs_rub_binbag_01", 
                    flag = 50, 
                    hand = 57005, 
                    pos = {0.11, 0, 0.0, 0, 260.0, 60.0}
                },
            
                ["mic"] = {
                    perm = "", 
                    prop = "prop_microphone_02", 
                    flag = 50, 
                    hand = 60309, 
                    pos = {0.08, 0.03, 0.0, 240.0, 0.0, 0.0}
                },
            
                ["mic2"] = {
                    perm = "", 
                    prop = "p_ing_microphonel_01", 
                    flag = 50, 
                    hand = 60309, 
                    pos = {0.08, 0.03, 0.0, 240.0, 0.0, 0.0}
                },
            
                ["mic3"] = {
                    perm = "", 
                    dict = "missfra1", 
                    anim = "mcs2_crew_idle_m_boom", 
                    prop = "prop_v_bmike_01", 
                    flag = 50, 
                    hand = 28422
                },
            
                ["mic4"] = {
                    perm = "",
                    dict = "missmic4premiere", 
                    anim = "interview_short_lazlow",
                    prop = "p_ing_microphonel_01",
                    flag = 50,
                    hand = 28422
                },
            
                ["mic5"] = {
                    perm = "",
                    dict = "anim@random@shop_clothes@watches", 
                    anim = "base",
                    prop = "p_ing_microphonel_01", 
                    andar = true, 
                    loop = true,
                    flag = 49,
                    hand = 60309,
                    pos = {0.10,0.04,0.012,-60.0,60.0,-30.0}, 
                    propAnim = true
                },
            
                ["buque"] = {
                    perm = "", 
                    prop = "prop_snow_flower_02", 
                    flag = 50, 
                    hand = 60309, 
                    pos = {0.0,0.0,0.0,300.0,0.0,0.0},
                },
                
                ["rosa"] = {
                    perm = "",
                    prop = "prop_single_rose", 
                    flag = 50, 
                    hand = 60309, 
                    pos = {0.055, 0.05, 0.0, 240.0, 0.0, 0.0}
                },
            
                ["rosa2"] = {
                    perm = "", 
                    dict = "anim@heists@humane_labs@finale@keycards", 
                    anim = "ped_a_enter_loop", 
                    prop = "prop_single_rose",
                    hand = 18905,
                    pos = {0.055, 0.05, 0.0, 240.0, 0.0, 0.0},
                    flag = 50,
                    loop = true,
                       andar = true,
                },
            
                ["prebeber"] = {
                    perm = "", 
                    dict = "amb@code_human_wander_drinking@beer@male@base", 
                    anim = "static", 
                    prop = "prop_fib_coffee", 
                    flag = 49, 
                    hand = 28422
                },
            
                ["prebeber2"] = {
                    perm = "", 
                    dict = "amb@code_human_wander_drinking@beer@male@base",
                    anim = "static", 
                    prop = "prop_ld_flow_bottle", 
                    flag = 49, 
                    hand = 28422
                },
            
                ["prebeber3"] = {
                    perm = "", 
                    dict = "amb@code_human_wander_drinking@beer@male@base", 
                    anim = "static", 
                    prop = "prop_cs_bs_cup", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["verificar"] ={ 
                    dict = "amb@medic@standing@tendtodead@idle_a", 
                    anim = "idle_a", 
                    andar = false, 
                    loop = true 
                },
            
                ["mexer"] = {
                    perm = "", 
                    dict = "amb@prop_human_parking_meter@female@idle_a", 
                    anim = "idle_a_female", 
                    andar = true, 
                    loop = true 
                },
            
                ["cuidar"] = {
                    perm = "", 
                    dict = "mini@cpr@char_a@cpr_str", 
                    anim = "cpr_pumpchest", 
                    andar = true, 
                    loop = true 
                },
            
                ["cuidar2"] = {
                    perm = "", 
                    dict = "mini@cpr@char_a@cpr_str", 
                    anim = "cpr_kol", 
                    andar = true, 
                    loop = true 
                },
            
                ["cuidar3"] = {
                    perm = "", 
                    dict = "mini@cpr@char_a@cpr_str", 
                    anim = "cpr_kol_idle", 
                    andar = true, 
                    loop = true 
                },
            
                ["cansado"] = {
                    perm = "", 
                    dict = "rcmbarry", 
                    anim = "idle_d", 
                    andar = false, 
                    loop = true 
                },
            
                ["alongar2"] = {
                    perm = "", 
                    dict = "mini@triathlon", 
                    anim = "idle_e", 
                    andar = false, 
                    loop = true 
                },
            
                ["alongar6"] = {
                    perm = "",
                    dict = "rcmfanatic1maryann_stretchidle_b", 
                    anim = "idle_e", 
                    andar = false, 
                    loop = true
                },
            
                ["alongar7"] = {
                    perm = "",
                    dict = "timetable@reunited@ig_2", 
                    anim = "jimmy_getknocked", 
                    andar = false, 
                    loop = true
                },
            
                ["meleca"] = {
                    perm = "", 
                    dict = "anim@mp_player_intuppernose_pick", 
                    anim = "idle_a", 
                    andar = true, 
                    loop = true 
                },
            
                ["bora"] = {
                    perm = "", 
                    dict = "missfam4", 
                    anim = "say_hurry_up_a_trevor", 
                    andar = true, 
                    loop = false 
                },
            
                ["limpar"] = {
                    perm = "",
                    dict = "missfbi3_camcrew", 
                    anim = "final_loop_guy", 
                    andar = true, 
                    loop = false 
                },
            
                ["galinha"] = {
                    perm = "", 
                    dict = "random@peyote@chicken", 
                    anim = "wakeup", 
                    andar = true, 
                    loop = true 
                },
            
                ["amem"] = {
                    perm = "", 
                    dict = "rcmepsilonism8", 
                    anim = "worship_base", 
                    andar = true, 
                    loop = true 
                },
            
                ["nervoso"] = {
                    perm = "", 
                    dict = "rcmme_tracey1", 
                    anim = "nervous_loop", 
                    andar = true, 
                    loop = true 
                },
            
                ["morrer"] = {
                    perm = "", 
                    dict = "misslamar1dead_body", 
                    anim = "dead_idle", 
                    andar = false, 
                    loop = true 
                },
            
                ["ajoelhar"] = {
                    perm = "", 
                    dict = "amb@medic@standing@kneel@idle_a", 
                    anim = "idle_a", 
                    andar = false, 
                    loop = true 
                },
            
                ["sinalizar"] = {
                    perm = "", 
                    dict = "amb@world_human_car_park_attendant@male@base", 
                    anim = "base", 
                    prop = "prop_parking_wand_01", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["placa"] = {
                    perm = "", 
                    dict = "amb@world_human_bum_freeway@male@base", 
                    anim = "base", 
                    prop = "prop_beggers_sign_01", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["placa2"] = {
                    perm = "", 
                    dict = "amb@world_human_bum_freeway@male@base", 
                    anim = "base", 
                    prop = "prop_beggers_sign_03", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["placa3"] = {
                    perm = "", 
                    dict = "amb@world_human_bum_freeway@male@base", 
                    anim = "base", 
                    prop = "prop_beggers_sign_04", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["placa4"] = {
                    perm = "", 
                    dict = "rcmnigel1d", 
                    anim = "base_club_shoulder",
                    prop = "prop_sign_road_01a",
                    hand = 60309,
                    flag = 50,
                    pos = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
                    loop = true,
                    andar = true
                },
            
                ["placa5"] = {
                    perm = "", 
                    dict = "rcmnigel1d", 
                    anim = "base_club_shoulder",
                    prop = "prop_sign_road_02a",
                    hand = 60309,
                    flag = 50,
                    pos = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
                    loop = true,
                    andar = true
                },
            
                ["placa6"] = {
                    perm = "", 
                    dict = "rcmnigel1d", 
                    anim = "base_club_shoulder",
                    prop = "prop_sign_road_03d",
                    hand = 60309,
                    flag = 50,
                    pos = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
                    loop = true,
                    andar = true
                },
            
                ["placa7"] = {
                    perm = "", 
                    dict = "rcmnigel1d", 
                    anim = "base_club_shoulder",
                    prop = "prop_sign_road_04a",
                    hand = 60309,
                    flag = 50,
                    pos = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
                    loop = true,
                    andar = true
                },
            
                ["placa8"] = {
                    perm = "", 
                    dict = "rcmnigel1d", 
                    anim = "base_club_shoulder",
                    prop = "prop_sign_road_04w",
                    hand = 60309,
                    flag = 50,
                    pos = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
                    loop = true,
                    andar = true
                },
            
                ["placa9"] = {
                    perm = "", 
                    dict = "rcmnigel1d", 
                    anim = "base_club_shoulder",
                    prop = "prop_sign_road_05a",
                    hand = 60309,
                    flag = 50,
                    pos = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
                    loop = true,
                    andar = true
                },
            
                ["placa10"] = {
                    perm = "", 
                    dict = "rcmnigel1d", 
                    anim = "base_club_shoulder",
                    prop = "prop_sign_road_05t",
                    hand = 60309,
                    flag = 50,
                    pos = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
                    loop = true,
                    andar = true
                },
            
                ["placa11"] = {
                    perm = "", 
                    dict = "rcmnigel1d", 
                    anim = "base_club_shoulder",
                    prop = "prop_sign_freewayentrance",
                    hand = 60309,
                    flag = 50,
                    pos = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
                    loop = true,
                    andar = true
                },
            
                ["placa12"] = {
                    perm = "", 
                    dict = "rcmnigel1d", 
                    anim = "base_club_shoulder",
                    prop = "prop_snow_sign_road_01a",
                    hand = 60309,
                    flag = 50,
                    pos = {-0.1390, -0.9870, 0.4300, -67.3315314, 145.0627869, -4.4318885},
                    loop = true,
                    andar = true
                },
            
            
                ["abanar"] = {
                    perm = "", 
                    dict = "timetable@amanda@facemask@base", 
                    anim = "base", 
                    andar = true, 
                    loop = true 
                },
            
                ["cocada"] = {
                    perm = "", 
                    dict = "mp_player_int_upperarse_pick", 
                    anim = "mp_player_int_arse_pick", 
                    andar = true, 
                    loop = true 
                },
            
                ["cocada2"] = {
                    perm = "", 
                    dict = "mp_player_int_uppergrab_crotch", 
                    anim = "mp_player_int_grab_crotch", 
                    andar = true, 
                    loop = true 
                },
            
                ["lero"] = {
                    perm = "", 
                    dict = "anim@mp_player_intselfiejazz_hands", 
                    anim = "idle_a", 
                    andar = true, 
                    loop = false 
                },
            
                ["lero2"] = {
                    perm = "",
                    dict = "anim@mp_player_intcelebrationfemale@thumb_on_ears", 
                    anim = "thumb_on_ears", 
                    andar = false, 
                    loop = false
                },
            
                ["lero3"] = {
                    perm = "",
                    dict = "anim@mp_player_intcelebrationfemale@cry_baby", 
                    anim = "cry_baby", 
                    andar = false, 
                    loop = false
                },
            
                ["dj2"] = {
                    perm = "", 
                    dict = "anim@mp_player_intupperair_synth", 
                    anim = "idle_a_fp", 
                    andar = false, 
                    loop = true 
                },
            
                ["dj3"] = {
                    perm = "",
                    dict = "anim@mp_player_intcelebrationfemale@air_synth", 
                    anim = "air_synth", 
                    andar = false, 
                    loop = false
                },
            
                ["dj4"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@djs@dixon@", 
                    anim = "dixn_dance_cntr_open_dix",
                    loop = true,
                       andar = true,
                },
            
                ["dj5"] = { 
                    perm = "",
                    dict = "anim@amb@nightclub@djs@solomun@", 
                    anim = "sol_idle_ctr_mid_a_sol",
                    loop = true,
                       andar = false,
                },
            
                ["dj6"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@djs@solomun@", 
                    anim = "sol_dance_l_sol",
                    loop = true,
                       andar = false,
                },
            
                ["dj7"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@djs@black_madonna@", 
                    anim = "dance_b_idle_a_blamadon",
                    loop = true,
                       andar = false,
                },
            
                ["dj8"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@djs@dixon@", 
                    anim = "dixn_end_dix",
                    loop = true,
                       andar = false,
                },
            
                ["dj9"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@djs@dixon@", 
                    anim = "dixn_idle_cntr_a_dix",
                    loop = true,
                       andar = false,
                },
            
                ["dj10"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@djs@dixon@", 
                    anim = "dixn_idle_cntr_b_dix",
                    loop = true,
                       andar = false,
                },
            
                ["dj11"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@djs@dixon@", 
                    anim = "dixn_idle_cntr_g_dix",
                    loop = true,
                       andar = false,
                },
            
                ["dj12"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@djs@dixon@", 
                    anim = "dixn_idle_cntr_gb_dix",
                    loop = true,
                       andar = false,
                },
            
                ["dj13"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@djs@dixon@", 
                    anim = "dixn_sync_cntr_j_dix",
                    loop = true,
                       andar = false,
                },
            
                ["coca"] = {
                    perm = "",
                    dict = "anim@amb@business@coc@coc_packing_hi@", 
                    anim = "full_cycle_v3_pressoperator", 
                    andar = false, 
                    loop = true
                },
            
                ["beijo"] = {
                    perm = "", 
                    dict = "anim@mp_player_intselfieblow_kiss", 
                    anim = "exit", 
                    andar = true, 
                    loop = false 
                },
            
                ["beijo2"] = {
                    perm = "",
                    dict = "anim@mp_player_intcelebrationfemale@blow_kiss", 
                    anim = "blow_kiss", 
                    andar = true, 
                    loop = false
                },
            
            
                ["malicia"] = {
                    perm = "", 
                    dict = "anim@mp_player_intupperdock", 
                    anim = "idle_a", 
                    andar = true, 
                    loop = false 
                },
            
                ["ligar"] = {
                    perm = "", 
                    dict = "cellphone@", 
                    anim = "cellphone_call_in", 
                    prop = "prop_amb_phone", 
                    flag = 50, 
                    hand = 28422 
                },
            
                ["radio"] = {
                    perm = "", 
                    dict = "cellphone@", 
                    anim = "cellphone_call_in", 
                    prop = "prop_cs_hand_radio", 
                    flag = 50, 
                    hand = 28422 
                },
            
                ["cafe"] = {
                    perm = "", 
                    dict = "amb@world_human_aa_coffee@base", 
                    anim = "base", 
                    prop = "prop_fib_coffee", 
                    flag = 50, 
                    hand = 28422 
                },
            
                ["cafe2"] = {
                    perm = "", 
                    dict = "amb@world_human_aa_coffee@idle_a", 
                    anim = "idle_a", 
                    prop = "prop_fib_coffee", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["caixa"] = {
                    perm = "", 
                    dict = "anim@heists@box_carry@", 
                    anim = "idle", 
                    prop = "hei_prop_heist_box", 
                    flag = 50, 
                    hand = 28422 
                },
            
                ["chuva"] = {
                    perm = "", 
                    dict = "amb@world_human_drinking@coffee@male@base", 
                    anim = "base", 
                    prop = "p_amb_brolly_01", 
                    flag = 50, 
                    hand = 28422 
                },
            
                ["chuva2"] = {
                    perm = "",
                    dict = "amb@world_human_drinking@coffee@male@base", 
                    anim = "base", 
                    prop = "p_amb_brolly_01_s", 
                    flag = 50, 
                    hand = 28422 
                },
            
                ["comer"] = {
                    perm = "", 
                    dict = "amb@code_human_wander_eating_donut@male@idle_a", 
                    anim = "idle_c", 
                    prop = "prop_cs_burger_01", 
                    flag = 49, 
                    hand = 28422
                },
            
                ["comer2"] = {
                    perm = "", 
                    dict = "amb@code_human_wander_eating_donut@male@idle_a", 
                    anim = "idle_c", 
                    prop = "prop_cs_hotdog_01", 
                    flag = 49, 
                    hand = 28422
                },
            
                ["comer3"] = {
                    perm = "", 
                    dict = "amb@code_human_wander_eating_donut@male@idle_a", 
                    anim = "idle_c", 
                    prop = "prop_amb_donut", 
                    flag = 49,
                    hand = 28422 
                },
            
                ["comer4"] = {
                    perm = "",
                    dict = "mp_player_inteat@burger", 
                    anim = "mp_player_int_eat_burger",
                    prop = "prop_sandwich_01",
                    flag = 49,
                    hand = 60309
                },
            
                ["comer5"] = {
                    perm = "",
                    dict = "mp_player_inteat@burger", 
                    anim = "mp_player_int_eat_burger",
                    prop = "prop_choc_ego",
                    flag = 49,
                    hand = 60309
                },
            
                ["beber"] = {
                    perm = "", 
                    dict = "amb@world_human_drinking@beer@male@idle_a", 
                    anim = "idle_a", 
                    prop = "p_cs_bottle_01", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["beber2"] = {
                    perm = "", 
                    dict = "amb@world_human_drinking@beer@male@idle_a", 
                    anim = "idle_a", 
                    prop = "prop_energy_drink", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["beber3"] = {
                    perm = "",
                    dict = "amb@world_human_drinking@beer@male@idle_a", 
                    anim = "idle_a", 
                    prop = "prop_amb_beer_bottle", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["beber4"] = {
                    perm = "", 
                    dict = "amb@world_human_drinking@beer@male@idle_a", 
                    anim = "idle_a", 
                    prop = "p_whiskey_notop", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["beber5"] = {
                    perm = "", 
                    dict = "amb@world_human_drinking@beer@male@idle_a", 
                    anim = "idle_a", 
                    prop = "prop_beer_logopen", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["beber6"] = {
                    perm = "", 
                    dict = "amb@world_human_drinking@beer@male@idle_a", 
                    anim = "idle_a", 
                    prop = "prop_beer_blr", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["beber7"] = {
                    perm = "",
                    dict = "amb@world_human_drinking@beer@male@idle_a", 
                    anim = "idle_a", 
                    prop = "prop_ld_flow_bottle", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["digitar"] = {
                    perm = "", 
                    dict = "anim@heists@prison_heistig1_p1_guard_checks_bus", 
                    anim = "loop", 
                    andar = false, 
                    loop = true 
                },
            
                ["digitar2"] = {
                    perm = "",
                    dict = "mp_fbi_heist", 
                    anim = "loop", 
                    andar = false, 
                    loop = true
                },
            
                ["continencia"] = {
                    perm = "", 
                    dict = "mp_player_int_uppersalute", 
                    anim = "mp_player_int_salute", 
                    andar = true, 
                    loop = true 
                },
            
                ["atm"] = {
                    perm = "", 
                    dict = "amb@prop_human_atm@male@idle_a", 
                    anim = "idle_a", 
                    andar = false, 
                    loop = false 
                },
            
                ["no"] = {
                    perm = "",
                    dict = "mp_player_int_upper_nod", 
                    anim = "mp_player_int_nod_no", 
                    andar = true, 
                    loop = true 
                },
                
                ["palmas"] = {
                    perm = "", 
                    dict = "anim@mp_player_intcelebrationfemale@slow_clap", 
                    anim = "slow_clap", 
                    andar = true, 
                    loop = false 
                },
            
                ["palmas2"] = {
                    perm = "", 
                    dict = "amb@world_human_cheering@male_b", 
                    anim = "base", 
                    andar = true, 
                    loop = true 
                },
            
                ["palmas3"] = {
                    perm = "", 
                    dict = "amb@world_human_cheering@male_d", 
                    anim = "base", 
                    andar = true, 
                    loop = true 
                },
            
                ["palmas4"] = {
                    perm = "", 
                    dict = "amb@world_human_cheering@male_e", 
                    anim = "base", 
                    andar = true, 
                    loop = true 
                },
            
                ["palmas5"] = {
                    perm = "", 
                    dict = "anim@arena@celeb@flat@solo@no_props@", 
                    anim = "angry_clap_a_player_a", 
                    andar = false, 
                    loop = true 
                },
            
                ["palmas6"] = {
                    perm = "", 
                    dict = "anim@mp_player_intupperslow_clap", 
                    anim = "idle_a", 
                    andar = false, 
                    loop = true 
                },
            
                ["postura"] = {
                    perm = "", 
                    dict = "anim@heists@prison_heiststation@cop_reactions", 
                    anim = "cop_a_idle", 
                    andar = true, 
                    loop = true 
                },
            
                ["postura2"] = {
                    perm = "", 
                    dict = "amb@world_human_cop_idles@female@base", 
                    anim = "base", 
                    andar = true, 
                    loop = true 
                },
            
                ["varrer"] = {
                    perm = "", 
                    dict = "amb@world_human_janitor@male@idle_a", 
                    anim = "idle_a",
                    prop = "prop_tool_broom", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["musica"] = {
                    perm = "", 
                    dict = "amb@world_human_musician@guitar@male@base", 
                    anim = "base", 
                    prop = "prop_el_guitar_01", 
                    flag = 49, 
                    hand = 60309 
                },
            
                ["musica2"] = {
                    perm = "", 
                    dict = "amb@world_human_musician@guitar@male@base", 
                    anim = "base", 
                    prop = "prop_el_guitar_02", 
                    flag = 49, 
                    hand = 60309 
                },
            
                ["musica3"] = {
                    perm = "", 
                    dict = "amb@world_human_musician@guitar@male@base", 
                    anim = "base", 
                    prop = "prop_el_guitar_03", 
                    flag = 49, 
                    hand = 60309 
                },
            
                ["musica4"] = {
                    perm = "", 
                    dict = "amb@world_human_musician@guitar@male@base", 
                    anim = "base", 
                    prop = "prop_acc_guitar_01", 
                    flag = 49, 
                    hand = 60309
                },
            
                ["camera"] = {
                    perm = "", 
                    dict = "amb@world_human_paparazzi@male@base", 
                    anim = "base", 
                    prop = "prop_pap_camera_01", 
                    flag = 49, 
                    hand = 28422
                },
            
                ["camera2"] = {
                    perm = "", 
                    dict = "missfinale_c2mcs_1", 
                    anim = "fin_c2_mcs_1_camman", 
                    prop = "prop_v_cam_01", 
                    flag = 49, 
                    hand = 28422
                },
            
                ["prancheta"] = {
                    perm = "", 
                    dict = "amb@world_human_clipboard@male@base", 
                    anim = "base", 
                    prop = "p_amb_clipboard_01", 
                    flag = 50, 
                    hand = 60309 
                },
            
                ["mapa"] = {
                    perm = "", 
                    dict = "amb@world_human_clipboard@male@base", 
                    anim = "base", 
                    prop = "prop_tourist_map_01", 
                    flag = 50, 
                    hand = 60309 
                },
            
                ["anotar"] = {
                    perm = "", 
                    dict = "amb@medic@standing@timeofdeath@base", 
                    anim = "base", 
                    prop = "prop_notepad_01", 
                    flag = 49, 
                    hand = 60309 
                },
            
                ["peace"] = {
                    perm = "", 
                    dict = "mp_player_int_upperpeace_sign", 
                    anim = "mp_player_int_peace_sign", 
                    andar = true, 
                    loop = true 
                },
            
                ["deitar"] = {
                    perm = "", 
                    dict = "amb@world_human_sunbathe@female@back@idle_a", 
                    anim = "idle_a", 
                    andar = false, 
                    loop = true 
                },
            
                ["deitar2"] = {
                    perm = "", 
                    dict = "amb@world_human_sunbathe@female@front@idle_a", 
                    anim = "idle_a", 
                    andar = false, 
                    loop = true 
                },
            
                ["deitar3"] = {
                    perm = "", 
                    dict = "amb@world_human_sunbathe@male@back@idle_a", 
                    anim = "idle_a", 
                    andar = false, 
                    loop = true 
                },
            
                ["deitar4"] = {
                    perm = "", 
                    dict = "amb@world_human_sunbathe@male@front@idle_a", 
                    anim = "idle_a", 
                    andar = false, 
                    loop = true 
                },
            
                ["deitar5"] = {
                    perm = "", 
                    dict = "mini@cpr@char_b@cpr_str", 
                    anim = "cpr_kol_idle", 
                    andar = false, 
                    loop = true 
                },
            
                ["deitar6"] = {
                    perm = "", 
                    dict = "switch@trevor@scares_tramp", 
                    anim = "trev_scares_tramp_idle_tramp", 
                    andar = false, 
                    loop = true 
                },
            
                ["deitar7"] = {
                    perm = "", 
                    dict = "switch@trevor@annoys_sunbathers",
                    anim = "trev_annoys_sunbathers_loop_girl",
                    andar = false, 
                    loop = true 
                },
                
                ["deitar8"] = {
                    perm = "", 
                    dict = "switch@trevor@annoys_sunbathers",
                    anim = "trev_annoys_sunbathers_loop_guy", 
                    andar = false, 
                    loop = true 
                },
            
                ["debrucar"] = {
                    perm = "", 
                    dict = "amb@prop_human_bum_shopping_cart@male@base", 
                    anim = "base", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar"] = {
                    perm = "", 
                    dict = "rcmnigel1bnmt_1b", 
                    anim = "dance_loop_tyler", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar2"] = {
                    perm = "", 
                    dict = "mp_safehouse", 
                    anim = "lap_dance_girl", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar3"] = {
                    perm = "", 
                    dict = "misschinese2_crystalmazemcs1_cs", 
                    anim = "dance_loop_tao", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar4"] = {
                    perm = "", 
                    dict = "mini@strip_club@private_dance@part1", 
                    anim = "priv_dance_p1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar5"] = {
                    perm = "", 
                    dict = "mini@strip_club@private_dance@part2", 
                    anim = "priv_dance_p2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar6"] = {
                    perm = "", 
                    dict = "mini@strip_club@private_dance@part3", 
                    anim = "priv_dance_p3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar7"] = {
                    perm = "", 
                    dict = "special_ped@mountain_dancer@monologue_2@monologue_2a", 
                    anim = "mnt_dnc_angel", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar8"] = {
                    perm = "", 
                    dict = "special_ped@mountain_dancer@monologue_3@monologue_3a", 
                    anim = "mnt_dnc_buttwag", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar9"] = {
                    perm = "", 
                    dict = "missfbi3_sniping", 
                    anim = "dance_m_default", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar10"] =	{ 
                    dict = "anim@amb@nightclub@dancers@black_madonna_entourage@", 
                    anim = "hi_dance_facedj_09_v2_male^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar11"] =	{ 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_09_v1_female^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar12"] =	{ 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_09_v1_female^2", 
                    andar = false,
                    loop = true 
                },
            
                ["dancar13"] =	{ 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_09_v1_female^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar14"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_09_v1_female^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar15"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_09_v1_female^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar16"] =	{ 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_09_v1_female^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar17"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_09_v1_male^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar18"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_09_v1_male^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar19"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_09_v1_male^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar20"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_09_v1_male^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar21"] =	{ 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_09_v1_male^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar22"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_09_v1_male^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar23"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_09_v2_female^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar24"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_09_v2_female^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar25"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_09_v2_female^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar26"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_09_v2_female^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar27"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_09_v2_female^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar28"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_09_v2_female^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar29"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_09_v2_male^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar30"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_09_v2_male^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar31"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_09_v2_male^3", 
                    andar = false, 
                    loop = true 
                },
            
            
                ["dancar32"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_09_v2_male^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar33"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_09_v2_male^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar34"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_09_v2_male^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar35"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_11_v1_female^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar36"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_11_v1_female^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar37"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_11_v1_female^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar38"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_11_v1_female^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar39"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_11_v1_female^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar40"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_11_v1_female^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar41"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_11_v1_male^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar42"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_11_v1_male^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar43"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_11_v1_male^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar44"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_11_v1_male^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar45"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_11_v1_male^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar46"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_11_v1_male^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar47"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_11_v2_female^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar48"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_11_v2_female^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar49"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_11_v2_female^3", 
                    andar = false,
                    loop = true 
                },
            
                ["dancar50"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_11_v2_female^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar51"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_11_v2_female^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar52"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_11_v2_female^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar53"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_11_v2_male^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar54"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_11_v2_male^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar55"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_11_v2_male^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar56"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_11_v2_male^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar57"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_11_v2_male^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar58"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_11_v2_male^6", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar59"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_13_v1_female^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar60"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_13_v1_female^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar61"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_13_v1_female^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar62"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_13_v1_female^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar63"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_13_v1_female^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar64"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_13_v1_female^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar65"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_13_v1_male^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar66"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_13_v1_male^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar67"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_13_v1_male^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar68"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_13_v1_male^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar69"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_13_v1_male^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar70"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_13_v1_male^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar71"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_13_v2_female^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar72"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_13_v2_female^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar73"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_13_v2_female^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar74"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_13_v2_female^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar75"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_13_v2_female^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar76"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_13_v2_female^6", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar77"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_13_v2_male^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar78"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_13_v2_male^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar79"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_13_v2_male^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar80"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_13_v2_male^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar81"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_13_v2_male^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar82"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_13_v2_male^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar83"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_15_v1_female^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar84"] =	{ 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_15_v1_female^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar85"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_15_v1_female^3", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar86"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_15_v1_female^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar87"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_15_v1_female^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar88"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_15_v1_female^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar89"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_15_v1_male^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar90"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_15_v1_male^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar91"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_15_v1_male^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar92"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_15_v1_male^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar93"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_15_v1_male^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar94"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_15_v1_male^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar95"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_15_v2_female^1", 
                    andar = false, 
                    loop = true 
                },
                
                ["dancar96"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_15_v2_female^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar97"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_15_v2_female^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar98"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_15_v2_female^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar99"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_15_v2_female^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar100"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_15_v2_female^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar101"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_15_v2_male^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar102"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_15_v2_male^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar103"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_15_v2_male^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar104"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_15_v2_male^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar105"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_15_v2_male^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar106"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_15_v2_male^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar107"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_17_v1_female^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar108"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_17_v1_female^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar109"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_17_v1_female^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar110"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_17_v1_female^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar111"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_17_v1_female^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar112"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_17_v1_female^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar113"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_17_v1_male^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar114"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_17_v1_male^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar115"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_17_v1_male^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar116"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_17_v1_male^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar117"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_17_v1_male^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar118"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_17_v1_male^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar119"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_17_v2_female^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar120"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_17_v2_female^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar121"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_17_v2_female^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar122"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_17_v2_female^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar123"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_17_v2_female^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar124"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_17_v2_female^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar125"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_17_v2_male^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar126"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_17_v2_male^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar127"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_17_v2_male^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar128"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_17_v2_male^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar129"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_17_v2_male^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar130"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_17_v2_male^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar131"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_09_v1_female^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar132"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_09_v1_female^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar133"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_09_v1_female^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar134"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_09_v1_female^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar135"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_09_v1_female^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar136"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_09_v1_female^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar137"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_09_v1_male^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar138"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_09_v1_male^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar139"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_09_v1_male^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar140"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_09_v1_male^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar141"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_09_v1_male^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar142"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_09_v1_male^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar143"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_09_v2_female^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar144"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_09_v2_female^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar145"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_09_v2_female^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar146"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_09_v2_female^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar147"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_09_v2_female^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar148"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_09_v2_female^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar149"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_09_v2_male^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar150"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_09_v2_male^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar151"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_09_v2_male^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar152"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_09_v2_male^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar153"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_09_v2_male^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar154"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_09_v2_male^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar155"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_11_v1_female^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar156"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_11_v1_female^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar157"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_11_v1_female^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar158"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_11_v1_female^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar159"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_11_v1_female^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar160"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_11_v1_female^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar161"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_11_v1_male^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar162"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_11_v1_male^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar163"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_11_v1_male^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar164"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_11_v1_male^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar165"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_11_v1_male^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar166"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_11_v1_male^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar167"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_13_v2_female^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar168"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_13_v2_female^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar169"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_13_v2_female^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar170"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_13_v2_female^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar171"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_13_v2_female^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar172"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_13_v2_female^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar173"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_13_v2_male^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar174"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_13_v2_male^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar175"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_13_v2_male^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar176"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_13_v2_male^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar177"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_13_v2_male^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar178"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_13_v2_male^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar179"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_15_v1_female^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar180"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_15_v1_female^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar181"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_15_v1_female^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar182"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_15_v1_female^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar183"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_15_v1_female^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar184"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_15_v1_female^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar185"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_15_v1_male^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar186"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_15_v1_male^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar187"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_15_v1_male^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar188"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_15_v1_male^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar189"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_15_v1_male^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar190"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_15_v1_male^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar191"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_15_v2_female^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar192"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_15_v2_female^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar193"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_15_v2_female^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar194"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_15_v2_female^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar195"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_15_v2_female^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar196"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_15_v2_female^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar197"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_15_v2_male^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar198"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_15_v2_male^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar199"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_15_v2_male^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar200"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_15_v2_male^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar201"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_15_v2_male^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar202"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_15_v2_male^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar203"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_17_v1_female^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar204"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_17_v1_female^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar205"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_17_v1_female^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar206"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_17_v1_female^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar207"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_17_v1_female^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar208"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_17_v1_female^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar209"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_17_v1_male^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar210"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_17_v1_male^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar211"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_17_v1_male^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar212"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_17_v1_male^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar213"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_17_v1_male^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar214"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_17_v1_male^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar215"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_17_v2_female^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar216"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_17_v2_female^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar217"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_17_v2_female^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar218"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_17_v2_female^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar219"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_17_v2_female^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar220"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_17_v2_female^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar221"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_17_v2_male^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar222"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_17_v2_male^2", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar223"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_17_v2_male^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar224"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_17_v2_male^4", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar225"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_17_v2_male^5", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar226"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity", 
                    anim = "hi_dance_crowd_17_v2_male^6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar227"] = {
                    perm = "", 
                    dict = "anim@mp_player_intcelebrationfemale@the_woogie", 
                    anim = "the_woogie", 
                    andar = false, 
                    loop = true 
                },
                
                ["dancar228"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", 
                    anim = "med_center_up", 
                    andar = false, 
                    loop = true 
                },
                
                ["dancar229"] = {
                    perm = "", 
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@", 
                    anim = "high_center", 
                    andar = false, 
                    loop = true 
                },
                
                ["dancar230"] = {
                    perm = "", 
                    dict = "timetable@tracy@ig_8@idle_b", 
                    anim = "idle_d", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar231"] = {
                    perm = "", 
                    dict = "timetable@tracy@ig_5@idle_a", 
                    anim = "idle_a", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar232"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@lazlow@hi_podium@", 
                    anim = "danceidle_hi_11_buttwiggle_b_laz", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar233"] = {
                    perm = "", 
                    dict = "move_clown@p_m_two_idles@", 
                    anim = "fidget_short_dance", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar234"] = {
                    perm = "", 
                    dict = "move_clown@p_m_zero_idles@",
                    anim = "fidget_short_dance", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar235"] = {
                    perm = "", 
                    dict = "misschinese2_crystalmazemcs1_ig", 
                    anim = "dance_loop_tao", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar236"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", 
                    anim = "low_center", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar237"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", 
                    anim = "low_center_down", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar238"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", 
                    anim = "low_center", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar239"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", 
                    anim = "high_center_up", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar240"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", 
                    anim = "high_center", 
                    andar = true, 
                    loop = true 
                },
            
                ["dancar241"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", 
                    anim = "high_center_up", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar242"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", 
                    anim = "high_center", 
                    andar = false, 
                    loop = true 
                },
            
            
                ["dancar243"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", 
                    anim = "high_center_down", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar244"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@podium_dancers@", 
                    anim = "hi_dance_facedj_17_v2_male^5", 
                    andar = false, 
                    loop = true 
                },
            
            
                ["dancar245"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", 
                    anim = "low_center", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar246"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", 
                    anim = "low_center_down", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar247"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", 
                    anim = "low_center", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar248"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", 
                    anim = "high_center_up", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar249"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_09_v2_female^3", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar250"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", 
                    anim = "hi_dance_facedj_09_v2_female^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar251"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", 
                    anim = "high_center", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar252"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@dancers@solomun_entourage@", 
                    anim = "mi_dance_facedj_17_v1_female^1", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar253"] = {
                    perm = "", 
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@", 
                    anim = "med_center", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar254"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", 
                    anim = "med_left_down", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar255"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", 
                    anim = "med_left_up", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar256"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", 
                    anim = "med_right", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar257"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", 
                    anim = "med_right_down", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar258"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", 
                    anim = "med_right_up", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar259"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", 
                    anim = "high_center", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar260"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", 
                    anim = "high_center_down", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancar261"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", 
                    anim = "high_center_up", 
                    andar = false, 
                    loop = true 		
                },
            
                ["dancar262"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", 
                    anim = "high_left", 
                    andar = false, 
                    loop = true 
                },
                
                ["dancar263"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", 
                    anim = "high_left_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar264"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", 
                    anim = "high_left_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar265"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", 
                    anim = "high_right", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar266"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", 
                    anim = "high_right_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar267"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", 
                    anim = "high_right_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar268"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", 
                    anim = "low_center", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar269"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", 
                    anim = "low_center_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar270"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", 
                    anim = "low_center_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar271"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", 
                    anim = "low_left", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar272"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", 
                    anim = "low_left_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar273"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", 
                    anim = "low_left_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar274"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", 
                    anim = "low_right", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar275"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", 
                    anim = "low_right_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar276"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", 
                    anim = "low_right_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar277"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", 
                    anim = "med_center", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar278"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", 
                    anim = "med_center_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar279"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", 
                    anim = "med_center_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar280"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", 
                    anim = "med_left", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar281"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", 
                    anim = "med_left_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar282"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", 
                    anim = "med_left_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar283"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", 
                    anim = "med_right", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar284"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", 
                    anim = "med_right_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar285"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", 
                    anim = "med_right_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar286"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", 
                    anim = "high_center", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar287"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", 
                    anim = "high_center_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar288"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", 
                    anim = "high_center_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar289"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", 
                    anim = "high_left", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar290"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", 
                    anim = "high_left_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar291"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", 
                    anim = "high_left_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar292"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", 
                    anim = "high_right", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar293"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", 
                    anim = "high_right_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar294"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", 
                    anim = "high_right_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar295"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", 
                    anim = "low_center", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar296"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", 
                    anim = "low_center_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar297"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", 
                    anim = "low_center_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar298"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", 
                    anim = "low_left", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar299"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", 
                    anim = "low_left_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar300"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", 
                    anim = "low_left_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar301"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", 
                    anim = "low_right", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar302"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", 
                    anim = "low_right_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar303"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", 
                    anim = "low_right_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar304"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", 
                    anim = "med_center", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar305"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", 
                    anim = "med_center_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar306"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", 
                    anim = "med_center_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar307"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", 
                    anim = "med_left", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar308"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", 
                    anim = "med_left_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar309"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", 
                    anim = "med_left_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar310"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", 
                    anim = "med_right", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar311"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", 
                    anim = "med_right_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar312"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", 
                    anim = "med_right_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar313"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", 
                    anim = "high_center", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar314"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", 
                    anim = "high_center_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar315"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", 
                    anim = "high_center_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar316"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", 
                    anim = "high_left", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar317"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", 
                    anim = "high_left_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar318"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", 
                    anim = "high_left_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar319"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", 
                    anim = "high_right", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar320"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", 
                    anim = "high_right_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar321"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", 
                    anim = "high_right_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar322"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", 
                    anim = "low_center", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar323"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", 
                    anim = "low_center_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar324"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", 
                    anim = "low_center_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar325"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", 
                    anim = "low_left", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar326"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", 
                    anim = "low_left_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar327"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", 
                    anim = "low_left_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar328"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", 
                    anim = "low_right", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar329"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", 
                    anim = "low_right_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar330"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", 
                    anim = "low_right_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar331"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", 
                    anim = "med_center", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar332"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", 
                    anim = "med_center_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar333"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", 
                    anim = "med_center_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar334"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", 
                    anim = "med_left", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar335"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", 
                    anim = "med_left_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar336"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", 
                    anim = "med_left_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar337"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", 
                    anim = "med_right", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar338"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", 
                    anim = "med_right_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar339"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", 
                    anim = "med_right_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar340"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@", 
                    anim = "high_center", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar341"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@", 
                    anim = "high_center_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar342"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@", 
                    anim = "high_center_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar343"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@", 
                    anim = "high_left", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar344"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@", 
                    anim = "high_left_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar345"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@", 
                    anim = "high_left_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar346"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@", 
                    anim = "high_right", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar347"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@", 
                    anim = "high_right_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar348"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@", 
                    anim = "high_right_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar349"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@", 
                    anim = "low_center", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar350"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@", 
                    anim = "low_center_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar351"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@", 
                    anim = "low_center_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar352"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@", 
                    anim = "low_left", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar353"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@", 
                    anim = "low_left_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar354"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@", 
                    anim = "low_left_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar355"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@", 
                    anim = "low_right", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar356"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@", 
                    anim = "low_right_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar357"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@", 
                    anim = "low_right_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar358"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@", 
                    anim = "med_center", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar359"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@", 
                    anim = "med_center_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar360"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@", 
                    anim = "med_center_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar361"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@", 
                    anim = "med_left", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar362"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@", 
                    anim = "med_left_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar363"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@", 
                    anim = "med_left_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar364"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@", 
                    anim = "med_right", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar365"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@", 
                    anim = "med_right_down", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar366"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@", 
                    anim = "med_right_up", 
                    andar = false, 
                    loop = true
                },
            
                ["dancar367"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@", 
                    anim = "high_center", 
                    andar = false, 
                    loop = true
                },
                
                ["dancar368"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@", 
                    anim = "high_center_down", 
                    andar = false, 
                    loop = true
                },
                
                ["dancar369"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@", 
                    anim = "high_center_up", 
                    andar = false, 
                    loop = true
                },
                
                ["dancar370"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@", 
                    anim = "high_left", 
                    andar = false, 
                    loop = true
                },
                
                ["dancar371"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@", 
                    anim = "high_left_down", 
                    andar = false, 
                    loop = true
                },
                
                ["dancar372"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@", 
                    anim = "high_left_up", 
                    andar = false, 
                    loop = true
                },
                
                ["dancar373"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@", 
                    anim = "high_right", 
                    andar = false, 
                    loop = true
                },
                
                ["dancar374"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@", 
                    anim = "high_right_down", 
                    andar = false, 
                    loop = true
                },
                
                ["dancar375"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@", 
                    anim = "high_right_up", 
                    andar = false, 
                    loop = true
                },
                
                ["dancar376"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@", 
                    anim = "low_center", 
                    andar = false, 
                    loop = true
                },
                
                ["dancar377"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@", 
                    anim = "low_center_down", 
                    andar = false, 
                    loop = true
                },
                
                ["dancar378"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@", 
                    anim = "low_center_up", 
                    andar = false, 
                    loop = true
                },
                
                ["dancar379"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@", 
                    anim = "low_left", 
                    andar = false, 
                    loop = true
                },
                
                ["dancar380"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@", 
                    anim = "low_left_down", 
                    andar = false, 
                    loop = true
                },
                
                ["dancar381"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@", 
                    anim = "low_left_up", 
                    andar = false, 
                    loop = true
                },
                
                ["dancar382"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@", 
                    anim = "low_right", 
                    andar = false, 
                    loop = true
                },
                
                ["dancar383"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@", 
                    anim = "low_right_down", 
                    andar = false, 
                    loop = true
                },
                
                ["dancar384"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@", 
                    anim = "low_right_up", 
                    andar = false, 
                    loop = true
                },
                
                ["dancar385"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@", 
                    anim = "med_center", 
                    andar = false, 
                    loop = true
                },
                
                ["dancar386"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@", 
                    anim = "med_center_down", 
                    andar = false, 
                    loop = true
                },
                
                ["dancar387"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@", 
                    anim = "med_center_up", 
                    andar = false, 
                    loop = true
                },
                
                ["dancar388"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@", 
                    anim = "med_left", 
                    andar = false, 
                    loop = true
                },
                
                ["dancar389"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@", 
                    anim = "med_left_down", 
                    andar = false, 
                    loop = true
                },
                
                ["dancar390"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@", 
                    anim = "med_left_up", 
                    andar = false, 
                    loop = true
                },
                
                ["dancar391"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@", 
                    anim = "med_right", 
                    andar = false, 
                    loop = true
                },
                
                ["dancar392"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@", 
                    anim = "med_right_down", 
                    andar = false, 
                    loop = true
                },
                
                ["dancar393"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@", 
                    anim = "med_right_up", 
                    andar = false, 
                    loop = true
                },
            
            
                ["dancar394"] = {
                    perm = "",
                    dict = "mini@strip_club@private_dance@idle", 
                    anim = "priv_dance_idle",
                    loop = true 
                },
            
                ["dancar395"] = {
                    perm = "",
                    dict = "oddjobs@assassinate@multi@yachttarget@lapdance", 
                    anim = "yacht_ld_f",
                    loop = true,
                },
            
                ["dancar396"] = {
                    perm = "",
                    dict = "mini@strip_club@lap_dance_2g@ld_2g_p3", 
                    anim = "ld_2g_p3_s2",
                    loop = true,
                },
            
                ["dancar397"] = {
                    perm = "",
                    dict = "mini@strip_club@lap_dance_2g@ld_2g_p2", 
                    anim = "ld_2g_p2_s2",
                    loop = true,
                },
            
                ["dancar398"] = {
                    perm = "",
                    dict = "mini@strip_club@lap_dance_2g@ld_2g_p1", 
                    anim = "ld_2g_p1_s2",
                    loop = true,
                },
            
                ["dancar399"] = {
                    perm = "",
                    dict = "mini@strip_club@lap_dance@ld_girl_a_song_a_p1", 
                    anim = "ld_girl_a_song_a_p1_f",
                    loop = true,
                },
            
                ["dancar400"] = {
                    perm = "",
                    dict = "mini@strip_club@lap_dance@ld_girl_a_song_a_p2", 
                    anim = "ld_girl_a_song_a_p2_f",
                    loop = true,
                },
            
                ["dancar401"] = {
                    perm = "",
                    dict = "mini@strip_club@lap_dance@ld_girl_a_song_a_p3", 
                    anim = "ld_girl_a_song_a_p3_f",
                    loop = true,
                },
            
                ["poledance"] = {
                    perm = "",
                    dict = "mini@strip_club@pole_dance@pole_dance1", 
                    anim = "pd_dance_01", 
                    andar = false, 
                    loop = true
                },
            
                ["poledance1"] = {
                    perm = "",
                    dict = "mini@strip_club@pole_dance@pole_dance2", 
                    anim = "pd_dance_02", 
                    andar = false, 
                    loop = true
                },
            
                ["poledance2"] = {
                    perm = "",
                    dict = "mini@strip_club@pole_dance@pole_dance3", 
                    anim = "pd_dance_03", 
                    andar = false, 
                    loop = true
                },
            
                ["sexo"] = {
                    perm = "", 
                    dict = "rcmpaparazzo_2", 
                    anim = "shag_loop_poppy", 
                    andar = false, 
                    loop = true 
                },
            
                ["sexo2"] = {
                    perm = "", 
                    dict = "rcmpaparazzo_2", 
                    anim = "shag_loop_a", 
                    andar = false, 
                    loop = true 
                },
            
                ["sexo3"] = {
                    perm = "", 
                    dict = "anim@mp_player_intcelebrationfemale@air_shagging", 
                    anim = "air_shagging", 
                    andar = false, 
                    loop = true 
                },
            
                ["sexo4"] = {
                    perm = "", 
                    dict = "oddjobs@towing", 
                    anim = "m_blow_job_loop", 
                    andar = false, 
                    loop = true, 
                    carros = true 
                },
            
                ["sexo5"] = {
                    perm = "", 
                    dict = "oddjobs@towing", 
                    anim = "f_blow_job_loop", 
                    andar = false, 
                    loop = true, 
                    carros = true 
                },
            
                ["sexo6"] = {
                    perm = "", 
                    dict = "mini@prostitutes@sexlow_veh", 
                    anim = "low_car_sex_loop_female", 
                    andar = false, 
                    loop = true, 
                    carros = true 
                },
            
                ["sexo7"] = {
                    perm = "",
                    dict = "timetable@trevor@skull_loving_bear", 
                    anim = "skull_loving_bear", 
                    andar = false, 
                    loop = true
                },
            
                ["sentar2"] = {
                    perm = "", 
                    dict = "amb@world_human_picnic@male@base", 
                    anim = "base", 
                    andar = false, 
                    loop = true 
                },
            
                ["sentar3"] = {
                    perm = "", 
                    dict = "anim@heists@fleeca_bank@ig_7_jetski_owner", 
                    anim = "owner_idle", 
                    andar = false, 
                    loop = true 
                },
            
                ["sentar4"] = {
                    perm = "", 
                    dict = "amb@world_human_stupor@male@base", 
                    anim = "base", 
                    andar = false, 
                    loop = true 
                },
            
                ["sentar5"] = {
                    perm = "", 
                    dict = "amb@world_human_picnic@female@base", 
                    anim = "base", 
                    andar = false, 
                    loop = true 
                },
            
                ["sentar6"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub@lazlow@lo_alone@", 
                    anim = "lowalone_base_laz", 
                    andar = false, 
                    loop = true 
                },
            
                ["sentar7"] = {
                    perm = "", 
                    dict = "anim@amb@business@bgen@bgen_no_work@", 
                    anim = "sit_phone_phoneputdown_idle_nowork", 
                    andar = false, 
                    loop = true 
                },
            
                ["sentar8"] = {
                    perm = "", 
                    dict = "rcm_barry3", 
                    anim = "barry_3_sit_loop", 
                    andar = false, 
                    loop = true 
                },
            
                ["sentar9"] = {
                    perm = "", 
                    dict = "amb@world_human_picnic@male@idle_a", 
                    anim = "idle_a", 
                    andar = false, 
                    loop = true 
                },
            
                ["sentar10"] = {
                    perm = "", 
                    dict = "amb@world_human_picnic@female@idle_a", 
                    anim = "idle_a", 
                    andar = false, 
                    loop = true 
                },
            
                ["sentar11"] = {
                    perm = "", 
                    dict = "timetable@jimmy@mics3_ig_15@", 
                    anim = "idle_a_jimmy", 
                    andar = false, 
                    loop = true 
                },
            
                ["sentar12"] = {
                    perm = "", 
                    dict = "timetable@jimmy@mics3_ig_15@", 
                    anim = "mics3_15_base_jimmy", 
                    andar = false, 
                    loop = true 
                },
            
                ["sentar13"] = {
                    perm = "", 
                    dict = "amb@world_human_stupor@male@idle_a", 
                    anim = "idle_a", 
                    andar = false, 
                    loop = true 
                },
            
                ["sentar14"] = {
                    perm = "", 
                    dict = "timetable@tracy@ig_14@", 
                    anim = "ig_14_base_tracy", 
                    andar = false, 
                    loop = true 
                },
            
                ["sentar15"] = {
                    perm = "", 
                    dict = "anim@heists@ornate_bank@hostages@hit", 
                    anim = "hit_loop_ped_b", 
                    andar = false, 
                    loop = true 
                },
                
                ["sentar16"] = {
                    perm = "", 
                    dict = "anim@heists@ornate_bank@hostages@ped_e@", 
                    anim = "flinch_loop", 
                    andar = false, 
                    loop = true 
                },
            
                ["sentar17"] = {
                    perm = "", 
                    dict = "timetable@ron@ig_5_p3", 
                    anim = "ig_5_p3_base", 
                    andar = false, 
                    loop = true 
                },
            
                ["sentar18"] = {
                    perm = "", 
                    dict = "timetable@reunited@ig_10", 
                    anim = "base_amanda", 
                    andar = false, 
                    loop = true 
                },
            
                ["sentar19"] = {
                    perm = "", 
                    dict = "timetable@ron@ig_3_couch", 
                    anim = "base", 
                    andar = false, 
                    loop = true 
                },
            
                ["sentar20"] = {
                    perm = "", 
                    dict = "timetable@jimmy@mics3_ig_15@", 
                    anim = "mics3_15_base_tracy", 
                    andar = false, 
                    loop = true 
                },
            
                ["sentar21"] = {
                    perm = "", 
                    dict = "timetable@maid@couch@", 
                    anim = "base", 
                    andar = false, 
                    loop = true 
                },
            
                ["sentar22"] = {
                    perm = "", 
                    dict = "timetable@ron@ron_ig_2_alt1", 
                    anim = "ig_2_alt1_base", 
                    andar = false, 
                    loop = true 
                },
            
                ["sentar23"] = {
                    perm = "",
                    dict = "missdrfriedlanderdrf_idles", 
                    anim = "drf_idle_drf", 
                    andar = false, 
                    loop = false
                },
             
                ["sentar24"] = {
                    perm = "", 
                    dict = "missfbi2@leadinout", 
                    anim = "fbi_2_int_leadinout_loop_steve", 
                    andar = false, 
                    loop = true
                },
               
                ["sentar25"] = {
                    perm = "",
                    dict = "missfbi3_party", 
                    anim = "snort_coke_a_female", 
                    andar = false, 
                    loop = false
                },
             
                ["sentar26"] = {
                    perm = "",
                    dict = "missheist_agency2aig_8", 
                    anim = "start_loop_foreman", 
                    andar = false, 
                    loop = false
                },
              
                ["sentar27"] = {
                    perm = "",
                    dict = "misslester1aig_3main", 
                    anim = "air_guitar_01_b", 
                    andar = false, 
                    loop = false
                },
            
                ["striper"] = {
                    perm = "", 
                    dict = "mini@strip_club@idles@stripper", 
                    anim = "stripper_idle_02", 
                    andar = false, 
                    loop = true 
                },
            
                ["escutar"] = {
                    perm = "", 
                    dict = "mini@safe_cracking", 
                    anim = "idle_base", 
                    andar = false, 
                    loop = true 
                },
            
                ["alongar"] = {
                    perm = "", 
                    dict = "anim@deathmatch_intros@unarmed", 
                    anim = "intro_male_unarmed_e", 
                    andar = false, 
                    loop = true 
                },
            
                ["dj"] = {
                    perm = "", 
                    dict = "anim@mp_player_intupperdj", 
                    anim = "idle_a", 
                    andar = true, 
                    loop = true 
                },
            
                ["rock"] = {
                    perm = "", 
                    dict = "anim@mp_player_intcelebrationmale@air_guitar", 
                    anim = "air_guitar", 
                    andar = false, 
                    loop = true 
                },
            
                ["rock2"] = {
                    perm = "", 
                    dict = "mp_player_introck", 
                    anim = "mp_player_int_rock", 
                    andar = false, 
                    loop = false 
                },
            
                ["abracar"] = {
                    perm = "", 
                    dict = "mp_ped_interaction", 
                    anim = "hugs_guy_a", 
                    andar = false, 
                    loop = false 
                },
            
                ["abracar2"] = {
                    perm = "", 
                    dict = "mp_ped_interaction", 
                    anim = "kisses_guy_b", 
                    andar = false, 
                    loop = false 
                },
            
                ["peitos"] = {
                    perm = "", 
                    dict = "mini@strip_club@backroom@", 
                    anim = "stripper_b_backroom_idle_b", 
                    andar = false, 
                    loop = false 
                },
            
                ["espernear"] = {
                    perm = "", 
                    dict = "missfam4leadinoutmcs2", 
                    anim = "tracy_loop", 
                    andar = false, 
                    loop = true 
                },
            
                ["arrumar"] = {
                    perm = "", 
                    dict = "anim@amb@business@coc@coc_packing_hi@", 
                    anim = "full_cycle_v1_pressoperator", 
                    andar = false, 
                    loop = true 
                },
            
                ["bebado"] = {
                    perm = "", 
                    dict = "missfam5_blackout", 
                    anim = "pass_out", 
                    andar = false, 
                    loop = false 
                },
            
                ["bebado2"] = {
                    perm = "", 
                    dict = "missheist_agency3astumble_getup", 
                    anim = "stumble_getup", 
                    andar = false, 
                    loop = false 
                },
            
                ["bebado3"] = {
                    perm = "", 
                    dict = "missfam5_blackout", 
                    anim = "vomit", 
                    andar = false, 
                    loop = false 
                },
            
                ["bebado4"] = {
                    perm = "", 
                    dict = "random@drunk_driver_1", 
                    anim = "drunk_fall_over", 
                    andar = false, 
                    loop = false 
                },
            
                ["yoga"] = {
                    perm = "", 
                    dict = "missfam5_yoga", 
                    anim = "f_yogapose_a", 
                    andar = false, 
                    loop = true 
                },
            
                ["yoga2"] = {
                    perm = "", 
                    dict = "amb@world_human_yoga@male@base", 
                    anim = "base_a", 
                    andar = false, 
                    l1oop = true 
                },
            
                ["abdominal"] = {
                    perm = "", 
                    dict = "amb@world_human_sit_ups@male@base", 
                    anim = "base", 
                    andar = false, 
                    loop = true 
                },
            
                ["bixa"] = {
                    perm = "", 
                    anim = "WORLD_HUMAN_PROSTITUTE_LOW_CLASS" 
                },
            
                ["britadeira"] = {
                    perm = "", 
                    dict = "amb@world_human_const_drill@male@drill@base", 
                    anim = "base", 
                    prop = "prop_tool_jackham", 
                    flag = 15, 
                    hand = 28422 
                },
            
                ["cerveja"] = {
                    perm = "", 
                    anim = "WORLD_HUMAN_PARTYING" 
                },
            
                ["churrasco"] = {
                    perm = "", 
                    anim = "prop_HUMAN_BBQ" 
                },
            
                ["consertar"] = {
                    perm = "", 
                    anim = "WORLD_HUMAN_WELDING" 
                },
            
                ["dormir"] = {
                    perm = "", 
                    dict = "anim@heists@ornate_bank@hostages@hit", 
                    anim = "hit_react_die_loop_ped_a", 
                    andar = false, 
                    loop = true 
                },
            
                ["dormir2"] = {
                    perm = "", 
                    dict = "anim@heists@ornate_bank@hostages@hit", 
                    anim = "hit_react_die_loop_ped_e", 
                    andar = false, 
                    loop = true 
                },
            
                ["dormir3"] = {
                    perm = "", 
                    dict = "anim@heists@ornate_bank@hostages@hit", 
                    anim = "hit_react_die_loop_ped_h", 
                    andar = false, 
                    loop = true 
                },
            
                ["dormir4"] = {
                    perm = "", 
                    dict = "mp_sleep", 
                    anim = "sleep_loop", 
                    andar = false, 
                    loop = true 
                },
            
                ["encostar"] = {
                    perm = "", 
                    dict = "amb@lo_res_idles@", 
                    anim = "world_human_lean_male_foot_up_lo_res_base", 
                    andar = false, 
                    loop = true 
                },
            
                ["encostar2"] = {
                    perm = "",
                    dict = "bs_2a_mcs_10-0", 
                    anim = "hc_gunman_dual-0", 
                    andar = false, 
                    loop = true
                },
            
                ["encostar3"] = {
                    perm = "",
                    dict = "misscarstealfinalecar_5_ig_1", 
                    anim = "waitloop_lamar", 
                    andar = false, 
                    loop = true
                },
            
                ["encostar4"] = {
                    perm = "",
                    dict = "anim@amb@casino@out_of_money@ped_female@02b@base", 
                    anim = "base", 
                    andar = false, 
                    loop = true
                },
            
                ["encostar5"] = {
                    perm = "",
                    dict = "anim@amb@casino@hangout@ped_male@stand@03b@base", 
                    anim = "base", 
                    andar = true, 
                    loop = true
                },
            
                ["encostar6"] = {
                    perm = "",
                    dict = "anim@amb@casino@hangout@ped_female@stand@02b@base", 
                    anim = "base", 
                    andar = false, 
                    loop = true
                },
            
                ["encostar7"] = {
                    perm = "",
                    dict = "anim@amb@casino@hangout@ped_female@stand@02a@base", 
                    anim = "base", 
                    andar = false, 
                    loop = true
                },
            
                ["estatua"] = {
                    perm = "", 
                    dict = "amb@world_human_statue@base", 
                    anim = "base", 
                    andar = false, 
                    loop = true 
                },
            
                ["flexao"] = {
                    perm = "", 
                    dict = "amb@world_human_push_ups@male@base", 
                    anim = "base", 
                    andar = false, 
                    loop = true 
                },
            
                ["flexao2"] = {
                    perm = "", 
                    anim = "WORLD_HUMAN_MUSCLE_FLEX"
                },
            
                ["fumar"] = {
                    perm = "", 
                    anim = "WORLD_HUMAN_SMOKING" 
                },
            
                ["fumar2"] = {
                    perm = "", 
                    anim = "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS" 
                },
            
                ["fumar3"] = {
                    perm = "", 
                    anim = "WORLD_HUMAN_AA_SMOKE" 
                },
            
                ["fumar4"] = {
                    perm = "", 
                    anim = "WORLD_HUMAN_SMOKING_POT" 
                },
            
                ["fumar5"] = {
                    perm = "",
                    dict = "amb@world_human_aa_smoke@male@idle_a",
                    anim = "idle_c",
                    prop = "prop_cs_ciggy_01",
                    flag = 49,
                    hand = 28422 
                },
            
                ["fumar6"] = {
                    perm = "",
                    dict = "amb@world_human_smoking@female@idle_a",
                    anim = "idle_b",
                    prop = "prop_cs_ciggy_01",
                    flag = 49,
                    hand = 28422 
                },
            
                ["malhar"] = {
                    perm = "", 
                    dict = "amb@world_human_muscle_free_weights@male@barbell@base", 
                    anim = "base", 
                    prop = "prop_curl_bar_01", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["malhar2"] = {
                    perm = "", 
                    dict = "amb@prop_human_muscle_chin_ups@male@base", 
                    anim = "base", 
                    andar = false, 
                    loop = true 
                },
            
                ["martelo"] = {
                    perm = "", 
                    dict = "amb@world_human_hammering@male@base", 
                    anim = "base", 
                    prop = "prop_tool_hammer", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["pescar"] = {
                    perm = "", 
                    dict = "amb@world_human_stand_fishing@base", 
                    anim = "base", 
                    prop = "prop_fishing_rod_01", 
                    flag = 49, 
                    hand = 60309 
                },
            
                ["pescar2"] = {
                    perm = "", 
                    dict = "amb@world_human_stand_fishing@idle_a", 
                    anim = "idle_c", 
                    prop = "prop_fishing_rod_01", 
                    flag = 49, 
                    hand = 60309 
                },
            
                ["plantar"] = {
                    perm = "", 
                    dict = "amb@world_human_gardener_plant@female@base", 
                    anim = "base_female", 
                    andar = false, 
                    loop = true 
                },
            
                ["plantar2"] = {
                    perm = "", 
                    dict = "amb@world_human_gardener_plant@female@idle_a", 
                    anim = "idle_a_female", 
                    andar = false, 
                    loop = true 
                },
            
                ["procurar"] = {
                    perm = "", 
                    dict = "amb@world_human_bum_wash@male@high@base", 
                    anim = "base", 
                    andar = false, 
                    loop = true 
                },
            
                ["soprador"] = {
                    perm = "", 
                    dict = "amb@code_human_wander_gardener_leaf_blower@base", 
                    anim = "static", 
                    prop = "prop_leaf_blower_01", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["soprador2"] = {
                    perm = "", 
                    dict = "amb@code_human_wander_gardener_leaf_blower@idle_a", 
                    anim = "idle_a", 
                    prop = "prop_leaf_blower_01", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["soprador3"] = {
                    perm = "", 
                    dict = "amb@code_human_wander_gardener_leaf_blower@idle_a", 
                    anim = "idle_b", 
                    prop = "prop_leaf_blower_01", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["tragar"] = {
                    perm = "", 
                    anim = "WORLD_HUMAN_DRUG_DEALER" 
                },
            
                ["trotar"] = {
                    perm = "", 
                    dict = "amb@world_human_jog_standing@male@fitidle_a", 
                    anim = "idle_a", 
                    andar = false, 
                    loop = true 
                },
            
                ["esquentar"] = {
                    perm = "", 
                    anim = "WORLD_HUMAN_STAND_FIRE" 
                },
            
                ["selfie"] = {
                    perm = "", 
                    dict = "cellphone@self", 
                    anim = "selfie_in_from_text", 
                    prop = "prop_amb_phone", 
                    flag = 50, 
                    hand = 28422 
                },
            
                ["selfie2"] = {
                    perm = "", 
                    dict = "cellphone@", 
                    anim = "cellphone_text_read_base_cover_low", 
                    prop = "prop_amb_phone", 
                    flag = 50, 
                    hand = 28422 
                },
            
                ["mecanico"] = {
                    perm = "",
                    dict = "amb@world_human_vehicle_mechanic@male@idle_a", 
                    anim = "idle_a", 
                    andar = false, 
                    loop = true 
                },
            
                ["mecanico2"] = {
                    perm = "",
                    dict = "mini@repair", 
                    anim = "fixing_a_player", 
                    andar = false, 
                    loop = true 
                },
            
                ["mecanico3"] = {
                    perm = "",
                    dict = "mini@repair", 
                    anim = "fixing_a_ped", 
                    andar = false, 
                    loop = true 
                },
            
                ["pullover"] = {
                    perm = "",
                    dict = "misscarsteal3pullover", 
                    anim = "pull_over_right", 
                    andar = false, 
                    loop = false 
                },
            
                ["airguitar"] = {
                    perm = "",
                    dict = "anim@mp_player_intcelebrationfemale@air_guitar", 
                    anim = "air_guitar", 
                    andar = false, 
                    loop = true 
                },
            
                ["airsynth"] = {
                    perm = "",
                    dict = "anim@mp_player_intcelebrationfemale@air_synth", 
                    anim = "air_synth", 
                    andar = false, 
                    loop = true 
                },
            
                ["puto"] = {
                    perm = "",
                    dict = "misscarsteal4@actor", 
                    anim = "actor_berating_loop", 
                    andar = true, 
                    loop = true 
                },
            
                ["puto2"] = {
                    perm = "",
                    dict = "oddjobs@assassinate@vice@hooker", 
                    anim = "argue_a", 
                    andar = true, 
                    loop = true 
                },
            
                ["puto3"] = {
                    perm = "",
                    dict = "mini@triathlon", 
                    anim = "want_some_of_this", 
                    andar = false, 
                    loop = false 
                },
            
                ["unhas"] = {
                    perm = "",
                    dict = "anim@amb@clubhouse@bar@drink@idle_a", 
                    anim = "idle_a_bartender", 
                    andar = true, 
                    loop = true 
                },
            
                ["mandarbeijo"] = {
                    perm = "", 
                    dict = "anim@mp_player_intcelebrationfemale@blow_kiss", 
                    anim = "blow_kiss", 
                    andar = false, 
                    loop = false 
                },
                
                ["mandarbeijo2"] = {
                    perm = "",
                    dict = "anim@mp_player_intselfieblow_kiss", 
                    anim = "exit", 
                    andar = false, 
                    loop = false 
                },
            
                ["bale"] = {
                    perm = "",
                    dict = "anim@mp_player_intcelebrationpaired@f_f_sarcastic", 
                    anim = "sarcastic_left", 
                    andar = false, 
                    loop = true 
                },
            
                ["bonzao"] = {
                    perm = "",
                    dict = "misscommon@response", 
                    anim = "bring_it_on", 
                    andar = false, 
                    loop = false 
                },
            
                ["cruzarbraco"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@peds@", 
                    anim = "rcmme_amanda1_stand_loop_cop", 
                    andar = true, 
                    loop = true 
                },
            
                ["cruzarbraco2"] = {
                    perm = "",
                    dict = "amb@world_human_hang_out_street@female_arms_crossed@idle_a", 
                    anim = "idle_a", 
                    andar = true, 
                    loop = true 
                },
            
                ["wtf"] = {
                    perm = "",
                    dict = "anim@mp_player_intcelebrationfemale@face_palm", 
                    anim = "face_palm", 
                    andar = true, 
                    loop = false 
                },
            
                ["wtf2"] = {
                    perm = "",
                    dict = "random@car_thief@agitated@idle_a", 
                    anim = "agitated_idle_a", 
                    andar = true, 
                    loop = false 
                },
            
                ["wtf3"] = {
                    perm = "",
                    dict = "missminuteman_1ig_2", 
                    anim = "tasered_2", 
                    andar = true, 
                    loop = false 
                },
            
                ["wtf4"] = {
                    perm = "",
                    dict = "anim@mp_player_intupperface_palm", 
                    anim = "idle_a", 
                    andar = true, 
                    loop = false 
                },
            
                ["suicidio"] = {
                    perm = "",
                    dict = "mp_suicide", 
                    anim = "pistol", 
                    andar = false, 
                    loop = false 
                },
            
                ["suicidio2"] = {
                    perm = "",
                    dict = "mp_suicide", 
                    anim = "pill", 
                    andar = false, 
                    loop = false 
                },
            
                ["lutar"] = {
                    perm = "",
                    dict = "anim@deathmatch_intros@unarmed", 
                    anim = "intro_male_unarmed_c", 
                    andar = false, 
                    loop = false 
                },
            
                ["lutar2"] = {
                    perm = "",
                    dict = "anim@deathmatch_intros@unarmed", 
                    anim = "intro_male_unarmed_e", 
                    andar = false, 
                    loop = false 
                },
            
                ["dedo"] = {
                    perm = "",
                    dict = "anim@mp_player_intselfiethe_bird", 
                    anim = "idle_a", 
                    andar = false, 
                    loop = false 
                },
            
                ["mochila"] = {
                    perm = "",
                    dict = "move_m@hiking", 
                    anim = "idle", 
                    andar = true, 
                    loop = true 
                },
            
                ["exercicios"] = {
                    perm = "",
                    dict = "timetable@reunited@ig_2", 
                    anim = "jimmy_getknocked", 
                    andar = true, 
                    loop = true 
                },
            
                ["escorar"] = {
                    perm = "",
                    dict = "timetable@mime@01_gc", 
                    anim = "idle_a", 
                    andar = false, 
                    loop = true 
                },
            
                ["escorar2"] = {
                    perm = "",
                    dict = "misscarstealfinale", 
                    anim = "packer_idle_1_trevor", 
                    andar = false, 
                    loop = true 
                },
            
                ["escorar3"] = {
                    perm = "",
                    dict = "misscarstealfinalecar_5_ig_1", 
                    anim = "waitloop_lamar", 
                    andar = false, 
                    loop = true 
                },
            
                ["escorar4"] = {
                    perm = "",
                    dict = "rcmjosh2", 
                    anim = "josh_2_intp1_base", 
                    andar = false, 
                    loop = true 
                },
            
                ["meditar"] = {
                    perm = "",
                    dict = "rcmcollect_paperleadinout@", 
                    anim = "meditiate_idle", 
                    andar = false, 
                    loop = true 
                },
            
                ["meditar2"] = {
                    perm = "",
                    dict = "rcmepsilonism3", 
                    anim = "ep_3_rcm_marnie_meditating", 
                    andar = false, 
                    loop = true 
                },
            
                ["meditar3"] = {
                    perm = "",
                    dict = "rcmepsilonism3", 
                    anim = "base_loop", 
                    andar = false, 
                    loop = true 
                },
            
                ["meleca2"] = {
                    perm = "",
                    dict = "anim@mp_player_intcelebrationfemale@nose_pick", 
                    anim = "nose_pick", 
                    andar = false, 
                    loop = false 
                },
            
                ["cortaessa"] = {
                    perm = "",
                    dict = "gestures@m@standing@casual", 
                    anim = "gesture_no_way", 
                    andar = false, 
                    loop = false 
                },
            
                ["meleca3"] = {
                    perm = "",
                    dict = "move_p_m_two_idles@generic", 
                    anim = "fidget_sniff_fingers", 
                    andar = true, 
                    loop = false 
                },
            
                ["bebado5"] = {
                    perm = "",
                    dict = "misscarsteal4@actor", 
                    anim = "stumble", 
                    andar = false, 
                    loop = false 
                },
            
                ["bebado6"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@drinking@drinking_shots@ped_c@drunk", 
                    anim = "outro_fallover", 
                    andar = false, 
                    loop = false
                },
            
                ["bebado7"] = {
                    perm = "",
                    dict = "switch@trevor@puking_into_fountain", 
                    anim = "trev_fountain_puke_loop", 
                    andar = false, 
                    loop = true
                },
            
                ["bebado8"] = {
                    perm = "",
                    dict = "switch@trevor@head_in_sink", 
                    anim = "trev_sink_idle", 
                    andar = false, 
                    loop = true
                },
            
                ["joia"] = {
                    perm = "",
                    dict = "anim@mp_player_intincarthumbs_uplow@ds@", 
                    anim = "enter", 
                    andar = false, 
                    loop = false 
                },
            
                ["joia2"] = {
                    perm = "",
                    dict = "anim@mp_player_intselfiethumbs_up", 
                    anim = "idle_a", 
                    andar = false, 
                    loop = false 
                },
            
                ["yeah"] = {
                    perm = "",
                    dict = "anim@mp_player_intupperair_shagging", 
                    anim = "idle_a", 
                    andar = false, 
                    loop = false 
                },
            
                ["assobiar"] = {
                    perm = "",
                    dict = "taxi_hail", 
                    anim = "hail_taxi", 
                    andar = false, 
                    loop = false 
                },
            
                ["carona"] = {
                    perm = "",
                    dict = "random@hitch_lift", 
                    anim = "idle_f", 
                    andar = true, 
                    loop = false 
                },
            
                ["estatua2"] = {
                    perm = "",
                    dict = "fra_0_int-1", 
                    anim = "cs_lamardavis_dual-1", 
                    andar = false, 
                    loop = true 
                },
            
                ["estatua3"] = {
                    perm = "",
                    dict = "club_intro2-0", 
                    anim = "csb_englishdave_dual-0", 
                    andar = false, 
                    loop = true 
                },
            
                ["dormir5"] = {
                    perm = "",
                    dict = "missarmenian2", 
                    anim = "drunk_loop", 
                    andar = false, 
                    loop = true 
                },
            
                ["colher"] = {
                    perm = "",
                    dict = "creatures@rottweiler@tricks@", 
                    anim = "petting_franklin", 
                    andar = false, 
                    loop = false 
                },
            
                ["rastejar"] = {
                    perm = "",
                    dict = "move_injured_ground", 
                    anim = "front_loop", 
                    andar = false, 
                    loop = true 
                },
            
                ["rastejar2"] = {
                    perm = "",
                    dict = "move_injured_ground", 
                    anim = "front_loop", 
                    andar = false, 
                    loop = true
                },
            
                ["rastejar3"] = {
                    perm = "",
                    dict = "missfbi3_sniping", 
                    anim = "prone_dave", 
                    andar = false, 
                    loop = true
                },
            
                ["pirueta"] = {
                    perm = "",
                    dict = "anim@arena@celeb@flat@solo@no_props@", 
                    anim = "cap_a_player_a", 
                    andar = false, 
                    loop = false 
                },
            
                ["pirueta2"] = {
                    perm = "",
                    dict = "anim@arena@celeb@flat@solo@no_props@", 
                    anim = "flip_a_player_a", 
                    andar = false, 
                    loop = false 
                },
            
                ["fodase"] = {
                    perm = "",
                    dict = "anim@arena@celeb@podium@no_prop@", 
                    anim = "flip_off_a_1st", 
                    andar = false, 
                    loop = false 
                },
            
                ["taco"] = {
                    perm = "",
                    dict = "anim@arena@celeb@flat@solo@no_props@", 
                    anim = "slugger_a_player_a", 
                    andar = false, 
                    loop = false 
                },
            
                ["onda"] = {
                    perm = "",
                    dict = "anim@mp_player_intupperfind_the_fish", 
                    anim = "idle_a", 
                    andar = false, 
                    loop = true 
                },
            
                ["alongar3"] = {
                    perm = "",
                    dict = "mini@triathlon", 
                    anim = "idle_f", 
                    andar = false, 
                    loop = true 
                },
            
                ["alongar4"] = {
                    perm = "",
                    dict = "mini@triathlon", 
                    anim = "idle_d", 
                    andar = false, 
                    loop = true 
                },
            
                ["alongar5"] = {
                    perm = "",
                    dict = "rcmfanatic1maryann_stretchidle_b", 
                    anim = "idle_e", 
                    andar = false, 
                    loop = true 
                },
            
                ["lutar3"] = {
                    perm = "",
                    dict = "rcmextreme2", 
                    anim = "loop_punching", 
                    andar = true, 
                    loop = true 
                },
            
                ["heroi"] = {
                    perm = "",
                    dict = "rcmbarry", 
                    anim = "base", 
                    andar = true, 
                    loop = true 
                },
            
                ["boboalegre"] = {
                    perm = "",
                    dict = "rcm_barry2", 
                    anim = "clown_idle_0", 
                    andar = false, 
                    loop = false 
                },
            
                ["boboalegre2"] = {
                    perm = "",
                    dict = "rcm_barry2", 
                    anim = "clown_idle_1", 
                    andar = false, 
                    loop = false 
                },
            
                ["boboalegre3"] = {
                    perm = "",
                    dict = "rcm_barry2", 
                    anim = "clown_idle_2", 
                    andar = false, 
                    loop = false 
                },
            
                ["boboalegre4"] = {
                    perm = "",
                    dict = "rcm_barry2", 
                    anim = "clown_idle_6", 
                    andar = false, 
                    loop = false 
                },
            
                ["boboalegre5"] = {
                    perm = "",
                    dict = "rcm_barry2", 
                    anim = "clown_idle_6", 
                    andar = false, 
                    loop = false
                },
            
                ["meditar4"] = {
                    perm = "",
                    dict = "timetable@amanda@ig_4", 
                    anim = "ig_4_base", 
                    andar = false, 
                    loop = true 
                },
            
                ["passaro"] = {
                    perm = "",
                    dict = "random@peyote@bird", 
                    anim = "wakeup", 
                    andar = false, 
                    loop = false 
                },
            
                ["cachorro"] = {
                    perm = "",
                    dict = "random@peyote@dog", 
                    anim = "wakeup", 
                    andar = false, 
                    loop = false 
                },
            
                ["karate"] = {
                    perm = "",
                    dict = "anim@mp_player_intcelebrationfemale@karate_chops", 
                    anim = "karate_chops", 
                    andar = false, 
                    loop = false 
                },
            
                ["karate2"] = {
                    perm = "",
                    dict = "anim@mp_player_intcelebrationmale@karate_chops", 
                    anim = "karate_chops", 
                    andar = false, 
                    loop = false 
                },
            
                ["ameacar"] = {
                    perm = "",
                    dict = "anim@mp_player_intcelebrationmale@cut_throat", 
                    anim = "cut_throat", 
                    andar = false, 
                    loop = false 
                },
            
                ["ameacar2"] = {
                    perm = "",
                    dict = "anim@mp_player_intcelebrationfemale@cut_throat", 
                    anim = "cut_throat", 
                    andar = false, 
                    loop = false 
                },
            
                ["boxe"] = {
                    perm = "",
                    dict = "anim@mp_player_intcelebrationmale@shadow_boxing", 
                    anim = "shadow_boxing", 
                    andar = false, 
                    loop = false 
                },
            
                ["boxe2"] = {
                    perm = "",
                    dict = "anim@mp_player_intcelebrationfemale@shadow_boxing", 
                    anim = "shadow_boxing", 
                    andar = false, 
                    loop = false 
                },
            
                ["mamamia"] = {
                    perm = "",
                    dict = "anim@mp_player_intcelebrationmale@finger_kiss", 
                    anim = "finger_kiss", 
                    andar = true, 
                    loop = false 
                },
            
                ["louco"] = {
                    perm = "",
                    dict = "anim@mp_player_intincaryou_locobodhi@ds@", 
                    anim = "idle_a", 
                    andar = true, 
                    loop = true 
                },
            
                ["xiu"] = {
                    perm = "",
                    dict = "anim@mp_player_intincarshushbodhi@ds@", 
                    anim = "idle_a_fp", 
                    andar = true, 
                    loop = true 
                },
            
                ["cruzar"] = {
                    perm = "",
                    dict = "amb@world_human_cop_idles@female@idle_b", 
                    anim = "idle_e", 
                    andar = true, 
                    loop = true 
                },
            
                ["cruzar2"] = {
                    perm = "",
                    dict = "anim@amb@casino@hangout@ped_male@stand@02b@idles", 
                    anim = "idle_a", 
                    andar = true, 
                    loop = true
                },
            
                ["cruzar3"] = {
                    perm = "",
                    dict = "amb@world_human_hang_out_street@male_c@idle_a", 
                    anim = "idle_b", 
                    andar = true, 
                    loop = true
                },
            
                ["cruzar4"] = {
                    perm = "",
                    dict = "random@street_race", 
                    anim = "_car_b_lookout", 
                    andar = true, 
                    loop = true
                },
            
                ["cruzar5"] = {
                    perm = "",
                    dict = "random@shop_gunstore", 
                    anim = "_idle", 
                    andar = true, 
                    loop = true
                },
            
                ["cruzar6"] = {
                    perm = "",
                    dict = "move_m@hiking", 
                    anim = "idle", 
                    andar = true, 
                    loop = true
                },
            
                ["cruzar7"] = {
                    perm = "",
                    dict = "anim@amb@casino@valet_scenario@pose_d@", 
                    anim = "base_a_m_y_vinewood_01", 
                    andar = true, 
                    loop = true
                },
                
                ["pose"] = {
                    perm = "",
                    dict = "missmic4premiere", 
                    anim = "prem_actress_star_a", 
                    andar = false, 
                    loop = true 
                },
            
                ["bjs"] = {
                    perm = "",
                    dict = "mini@hookers_spvanilla", 
                    anim = "idle_a", 
                    andar = true, 
                    loop = false 
                },
            
                ["vemca"] = {
                    perm = "",
                    dict = "anim@heists@chicken_heist@ig_5_guard_wave_in", 
                    anim = "guard_reaction_quick", 
                    andar = true, 
                    loop = false 
                },   
            
                ["cruzarbraco3"] = {
                    perm = "",
                    dict = "anim@heists@heist_safehouse_intro@variations@male@window", 
                    anim = "window_part_one_loop", 
                    andar = true, 
                    loop = false 
                },   
            
                ["chute"] = {
                    perm = "",
                    dict = "anim@mp_freemode_return@f@fail", 
                    anim = "fail_a", 
                    andar = false, 
                    loop = false 
                },
            
                ["no"] = {
                    perm = "",
                    dict = "mp_player_int_upper_nod",
                    anim = "mp_player_int_nod_no", 
                    andar = true, 
                    loop = true 
                },
            
                ["nao"] = {
                    perm = "",
                    dict = "anim@arena@celeb@podium@no_prop@", 
                    anim = "dance_b_3rd", 
                    andar = false, 
                    loop = true 
                },
            
                ["palhaco"] = {
                    perm = "",
                    dict = "rcm_barry2", 
                    anim = "clown_idle_6", 
                    andar = false, 
                    loop = true 
                },
            
                ["dancinha"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", 
                    anim = "med_center_down", 
                    andar = false, 
                    loop = true 
                },   
            
                ["dancinha2"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@", 
                    anim = "hi_dance_crowd_09_v1_female^3", 
                    andar = false, 
                    loop = true 
                },  
            
                ["dancinha2"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@", 
                    anim = "hi_dance_crowd_09_v1_female^3", 
                    andar = false, 
                    loop = true 
                },   
            
                ["deaf"] = {
                    perm = "",
                    dict = "misscarsteal2", 
                    anim = "sweep_high", 
                    andar = false, 
                    loop = true 
                }, 
            
                ["deaf2"] = {
                    perm = "",
                    dict = "gestures@miss@dockssetup1", 
                    anim = "floyd_dh1_aeab_01_g1", 
                    andar = true, 
                    loop = false 
                }, 
            
                ["deaf3"] = {
                    perm = "",
                    dict = "gestures@miss@fra_0", 
                    anim = "lamar_fkn0_cjae_01_g4", 
                    andar = false, 
                    loop = false 
                }, 
            
                ["deaf4"] = {
                    perm = "",
                    dict = "missexile2", 
                    anim = "franklinwavetohelicopter", 
                    andar = false, 
                    loop = false 
                }, 
            
                ["deaf5"] = {
                    perm = "",
                    dict = "missheist_jewelleadinout", 
                    anim = "jh_int_outro_loop_c", 
                    andar = false, 
                    loop = false 
                }, 
            
                ["celebration"] = {
                    perm = "",
                    dict = "anim@arena@celeb@flat@solo@no_props@", 
                    anim = "pageant_a_player_a", 
                    andar = false, 
                    loop = false 
                },
            
                ["encostado"] = {
                    perm = "",
                    dict = "misshair_shop@hair_dressers", 
                    anim = "assistant_base", 
                    andar = false, 
                    loop = true 
                }, 
            
                ["encostado2"] = {
                    perm = "",
                    dict = "anim@heists@prison_heist", 
                    anim = "ped_b_react", 
                    andar = false, 
                    loop = true 
                },    
            
                ["encostado3"] = {
                    perm = "",
                    dict = "anim@heists@prison_heiststation@cop_reactions", 
                    anim = "drunk_idle", 
                    andar = false, 
                    loop = true 
                },    
            
                ["dancinha3"] = {
                    perm = "",
                    dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@", 
                    anim = "high_right_down", 
                    andar = false, 
                    loop = true 
                },    
            
                ["dedo2"] = {
                    perm = "",
                    dict = "anim@arena@celeb@flat@paired@no_props@", 
                    anim = "the_bird_a_player_a", 
                    andar = false, 
                    loop = true 
                }, 
            
                ["tempo"] = {
                    perm = "",
                    dict = "anim@random@shop_clothes@watches", 
                    anim = "idle_c", 
                    andar = false, 
                    loop = true 
                },
            
                ["olha"] = {
                    perm = "",
                    dict = "mini@strip_club@lap_dance@ld_girl_a_approach", 
                    anim = "ld_girl_a_approach_f", 
                    andar = false, 
                    loop = true 
                },
            
                ["mantra"] = {
                    perm = "",
                    dict = "misscarsteal1leadin", 
                    anim = "devon_idle_02", 
                    andar = false, 
                    loop = true 
                },
            
                ["mecanico4"] = {
                    perm = "",
                    dict = "anim@amb@garage@chassis_repair@", 
                    anim = "idle_02_amy_skater_01", 
                    andar = false, 
                    loop = true 
                },
            
                ["esperando"] = {
                    perm = "",
                    dict = "anim@amb@casino@shop@ped_female@01a@idles", 
                    anim = "idle_a", 
                    andar = false,
                    loop = true 
                },
            
                ["calmaai"] = {
                    perm = "",
                    dict = "anim@heists@ornate_bank@chat_manager", 
                    anim = "average_car", 
                    andar = false, 
                    loop = true 
                },
            
                ["basta"] = {
                    perm = "",
                    dict = "anim@heists@ornate_bank@chat_manager", 
                    anim = "fail", 
                    andar = false, 
                    loop = false 
                },
            
                ["basta2"] = {
                    perm = "",
                    dict = "mini@hookers_sp", 
                    anim = "idle_reject", 
                    andar = false, 
                    loop = false 
                },
            
                ["dancinha4"] = {
                    perm = "",
                    dict = "anim@amb@nightclub@dancers@crowddance_groups@", 
                    anim = "mi_dance_crowd_17_v2_female^6", 
                    andar = false, 
                    loop = false 
                }, 
            
                ["postura3"] = {
                    perm = "",
                    dict = "missbigscore2aleadinout@bs_2a_mcs_3", 
                    anim = "bankman_leadout_action", 
                    andar = true, 
                    loop = true 
                }, 
            
                ["postura4"] = {
                    perm = "",
                    dict = "missfbi2@leadinoutfbi_2_mcs_1", 
                    anim = "_leadin_loop_fbi", 
                    andar = true, 
                    loop = true 
                },       
            
                ["postura5"] = {
                    perm = "",
                    dict = "timetable@amanda@ig_9", 
                    anim = "ig_9_base_amanda", 
                    andar = true, 
                    loop = true 
                },     
            
                ["cruzarbraco4"] = {
                    perm = "",
                    dict = "anim@heists@heist_corona@single_team", 
                    anim = "single_team_intro_boss", 
                    andar = true, 
                    loop = true 
                },    
            
                ["explicar"] = {
                    perm = "",
                    dict = "random@bus_tour_guide@idle_a", 
                    anim = "idle_b", 
                    andar = true, 
                    loop = false 
                },  
            
                ["obrigado"] = {
                    perm = "",
                    dict = "anim@arena@celeb@podium@no_prop@", 
                    anim = "regal_a_1st", 
                    andar = false, 
                    loop = false 
                },  
            
                ["unhas2"] = {
                    perm = "",
                    dict = "friends@fra@ig_1", 
                    anim = "base_idle", 
                    andar = false, 
                    loop = true 
                },  
            
                ["podeser"] = {
                    perm = "",
                    dict = "amb@world_human_hang_out_street@male_a@idle_a", 
                    anim = "idle_e", 
                    andar = false, 
                    loop = false 
                },  
            
                ["xiu2"] = {
                    perm = "",
                    dict = "anim@arena@celeb@flat@solo@no_props@", 
                    anim = "giggle_a_player_a", 
                    andar = false, 
                    loop = false 
                },
            
            
                ["agua"] = {
                    perm = "",
                    dict = "amb@world_human_drinking@beer@male@idle_a", 
                    anim = "idle_a", 
                    prop = "prop_ld_flow_bottle", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["champ"] = {
                    perm = "",
                    dict = "anim@mp_player_intupperspray_champagne", 
                    anim = "idle_a", 
                    prop = "ba_prop_battle_champ_open", 
                    flag = 49, 
                    hand = 28422, 
                    loop = true 
                },
            
                ["taca"] = {
                    perm = "",
                    dict = "anim@heists@humane_labs@finale@keycards", 
                    anim = "ped_a_enter_loop", 
                    prop = "prop_drink_champ", 
                    flag = 49, 
                    hand = 18905, 
                    pos = {0.10,-0.03,0.03,-100.0,0.0,-10.0}
                },
            
                ["taca2"] = {
                    perm = "",
                    dict = "anim@heists@humane_labs@finale@keycards", 
                    anim = "ped_a_enter_loop", 
                    prop = "prop_drink_redwine", 
                    flag = 49, 
                    hand = 18905, 
                    pos = {0.10,-0.03,0.03,-100.0,0.0,-10.0}
                },
            
                ["garcom"] = {
                    perm = "",
                    dict = "anim@move_f@waitress", 
                    anim = "idle", 
                    prop = "vw_prop_vw_tray_01a", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["garcom2"] = {
                    perm = "",
                    dict = "anim@move_f@waitress", 
                    anim = "idle", 
                    prop = "prop_food_tray_01", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["garcom3"] = {
                    perm = "",
                    dict = "anim@move_f@waitress", 
                    anim = "idle", 
                    prop = "prop_food_tray_02", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["garcom4"] = {
                    perm = "",
                    dict = "anim@move_f@waitress", 
                    anim = "idle", 
                    prop = "prop_food_tray_03", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["garcom5"] = {
                    perm = "",
                    dict = "anim@move_f@waitress", 
                    anim = "idle", 
                    prop = "h4_prop_h4_champ_tray_01b", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["garcom6"] = {
                    perm = "",
                    dict = "anim@move_f@waitress", 
                    anim = "idle", 
                    prop = "h4_prop_h4_champ_tray_01c", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["beber"] = {
                    perm = "",
                    dict = "amb@world_human_drinking@beer@male@idle_a", 
                    anim = "idle_a", 
                    prop = "p_cs_bottle_01", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["beber2"] = {
                    perm = "",
                    dict = "amb@world_human_drinking@beer@male@idle_a", 
                    anim = "idle_a", 
                    prop = "prop_energy_drink", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["beber4"] = {
                    perm = "",
                    dict = "amb@world_human_drinking@beer@male@idle_a", 
                    anim = "idle_a", 
                    prop = "p_whiskey_notop", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["beber5"] = {
                    perm = "",
                    dict = "amb@world_human_drinking@beer@male@idle_a", 
                    anim = "idle_a", 
                    prop = "prop_beer_logopen", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["beber6"] = {
                    perm = "",
                    dict = "amb@world_human_drinking@beer@male@idle_a", 
                    anim = "idle_a", 
                    prop = "prop_beer_blr", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["beber7"] = {
                    perm = "",
                    dict = "amb@world_human_drinking@beer@male@idle_a", 
                    anim = "idle_a", 
                    prop = "prop_ld_flow_bottle", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["beber8"] = {
                    perm = "",
                    dict = "amb@world_human_drinking@beer@male@idle_a", 
                    anim = "idle_a", 
                    prop = "prop_plastic_cup_02", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["beber9"] = {
                    perm = "",
                    dict = "amb@world_human_drinking@beer@male@idle_a", 
                    anim = "idle_a", 
                    prop = "prop_food_bs_juice03", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["beber10"] = {
                    perm = "",
                    dict = "amb@world_human_drinking@beer@male@idle_a", 
                    anim = "idle_a", 
                    prop = "ng_proc_sodacan_01b", 
                    flag = 49, 
                    hand = 28422 
                },
            
                ["encostar8"] = {
                    perm = "",
                    dict = "anim@amb@casino@hangout@ped_female@stand@01b@base", 
                    anim = "base", 
                    andar = false, 
                    loop = true 
                },
            
                ["encostar9"] = {
                    perm = "",
                    dict = "anim@amb@clubhouse@bar@bartender@", 
                    anim = "base_bartender", 
                    andar = false, 
                    loop = true 
                },
            
                ["encostar10"] = {
                    perm = "",
                    dict = "missclothing", 
                    anim = "idle_a", 
                    andar = false, 
                    loop = true 
                },
            
                ["encostar11"] = {
                    perm = "",
                    dict = "misscarstealfinale", 
                    anim = "packer_idle_1_trevor", 
                    andar = false, 
                    loop = true 
                },
            
                ["encostar12"] = {
                    perm = "",
                    dict = "missarmenian1leadinoutarm_1_ig_14_leadinout", 
                    anim = "leadin_loop", 
                    andar = false, 
                    loop = true 
                },
            
                ["cruzar8"] = {
                    perm = "",
                    dict = "anim@amb@casino@shop@ped_female@01a@base", 
                    anim = "base", 
                    andar = true, 
                    loop = true 
                },
            
                ["cruzar9"] = {
                    perm = "",
                    dict = "anim@amb@casino@valet_scenario@pose_c@", 
                    anim = "shuffle_feet_a_m_y_vinewood_01", 
                    andar = true, 
                    loop = true 
                },
            
                ["cruzar10"] = {
                    perm = "",
                    dict = "anim@amb@casino@hangout@ped_male@stand@03a@idles_convo", 
                    anim = "idle_a", 
                    andar = true, 
                    loop = true 
                },
            
                ["cruzar11"] = {
                    perm = "",
                    dict = "oddjobs@assassinate@guard", 
                    anim = "unarmed_fold_arms", 
                    andar = true, 
                    loop = true 
                },
            
                ["tchau"] = {
                    perm = "",
                    dict = "anim@mp_player_intupperwave",
                    anim ="idle_a",
                    andar = true,
                    loop = true 
                },
            
                ["fera" ] = {
                    perm = "",
                    dict = "anim@mp_fm_event@intro" ,
                    anim ="beast_transform" ,
                    andar = true ,
                    loop = false 
                },
            
                ["explodir" ] = {
                    perm = "",
                    dict = "anim@mp_player_intcelebrationmale@mind_blown" ,
                    anim ="mind_blown" ,
                    andar = false ,
                    loop = false 
                },
            
                ["fedo" ] = {
                    perm = "",
                    dict = "anim@mp_player_intcelebrationfemale@stinker" ,
                    anim ="stinker" ,
                    andar = false ,
                    loop = false 
                },
            
                ["pensar" ] = {
                    perm = "",
                    dict = "anim@amb@casino@out_of_money@ped_male@01b@base" ,
                    anim ="base" ,
                    andar = true ,
                    loop = true 
                },
            
                ["pensar2" ] = {
                    perm = "",
                    dict = "misscarsteal4@aliens" ,
                    anim ="rehearsal_base_idle_director" ,
                    andar = true ,
                    loop = true 
                },
            
                ["ferido" ] = {
                    perm = "",
                    dict = "anim@amb@casino@hangout@ped_female@stand_withdrink@01b@base" ,
                    anim ="base" ,
                    andar = true ,
                    loop = true 
                },
            
                ["ferido2" ] = {
                    perm = "",
                    dict = "combat@damage@injured_pistol@to_writhe" ,
                    anim ="variation_d" ,
                    andar = false ,
                    loop = false 
                },
            
                ["olhar" ] = {
                    perm = "",
                    dict = "oddjobs@basejump@" ,
                    anim ="ped_d_loop" ,
                    andar = true ,
                    loop = true 
                },
            
                ["olhar2" ] = {
                    perm = "",
                    dict = "friends@fra@ig_1" ,
                    anim ="base_idle" ,
                    andar = true ,
                    loop = true 
                },
            
                ["senha" ] = {
                    perm = "",
                    dict = "mp_heists@keypad@" ,
                    anim ="idle_a" ,
                    andar = false ,
                    loop = true 
                },
            
                ["lavar" ] = {
                    perm = "",
                    dict = "missheist_agency3aig_23" ,
                    anim ="urinal_sink_loop" ,
                    andar = true ,
                    loop = true 
                },
            
                ["triste" ] = {
                    perm = "",
                    dict = "misscarsteal2car_stolen" ,
                    anim ="chad_car_stolen_reaction" ,
                    andar = false ,
                    loop = false 
                },
            
                ["aqc" ] = {
                    perm = "",
                    dict = "anim@deathmatch_intros@unarmed" ,
                    anim ="intro_male_unarmed_a" ,
                    andar = false ,
                    loop = false 
                },
            
                ["aqc2" ] = {
                    perm = "",
                    dict = "anim@deathmatch_intros@unarmed" ,
                    anim ="intro_male_unarmed_d" ,
                    andar = false ,
                    loop = false 
                },
            
                ["inspec" ] = {
                    perm = "",
                    dict = "anim@deathmatch_intros@melee@2h" ,
                    anim ="intro_male_melee_2h_b" ,
                    andar = false ,
                    loop = true 
                },
            
                ["inspec2" ] = {
                    perm = "",
                    dict = "anim@deathmatch_intros@melee@2h" ,
                    anim ="intro_male_melee_2h_c" ,
                    andar = false ,
                    loop = false 
                },
            
                ["inspec3" ] = {
                    perm = "",
                    dict = "anim@deathmatch_intros@melee@2h" ,
                    anim ="intro_male_melee_2h_d" ,
                    andar = false ,
                    loop = false 
                },
            
                ["inspec4" ] = {
                    perm = "",
                    dict = "anim@deathmatch_intros@melee@2h" ,
                    anim ="intro_male_melee_2h_e" ,
                    andar = false ,
                    loop = false 
                },
            
                ["inspec5" ] = {
                    perm = "",
                    dict = "mp_deathmatch_intros@1hmale" ,
                    anim ="intro_male_1h_a_michael" ,
                    andar = false ,
                    loop = false 
                },
            
                ["inspec6" ] = {
                    perm = "",
                    dict = "mp_deathmatch_intros@melee@1h" ,
                    anim ="intro_male_melee_1h_a" ,
                    andar = false ,
                    loop = false 
                },
            
                ["inspec7" ] = {
                    perm = "",
                    dict = "mp_deathmatch_intros@melee@1h" ,
                    anim ="intro_male_melee_1h_b" ,
                    andar = false ,
                    loop = false 
                },
            
                ["inspec8" ] = {
                    perm = "",
                    dict = "mp_deathmatch_intros@melee@1h" ,
                    anim ="intro_male_melee_1h_c" ,
                    andar = false ,
                    loop = false 
                },
            
                ["inspec9" ] = {
                    perm = "",
                    dict = "mp_deathmatch_intros@melee@1h" ,
                    anim ="intro_male_melee_1h_d" ,
                    andar = false ,
                    loop = false 
                },
            
                ["inspec10" ] = {
                    perm = "",
                    dict = "mp_deathmatch_intros@melee@1h" ,
                    anim ="intro_male_melee_1h_e" ,
                    andar = false ,
                    loop = false 
                },
            
                ["inspec11" ] = {
                    perm = "",
                    dict = "mp_deathmatch_intros@melee@2h" ,
                    anim ="intro_male_melee_2h_a" ,
                    andar = false ,
                    loop = false 
                },
            
                ["inspec12" ] = {
                    perm = "",
                    dict = "mp_deathmatch_intros@melee@2h" ,
                    anim ="intro_male_melee_2h_b" ,
                    andar = false ,
                    loop = false 
                },
            
                ["inspec13" ] = {
                    perm = "",
                    dict = "mp_deathmatch_intros@melee@2h" ,
                    anim ="intro_male_melee_2h_c" ,
                    andar = false ,
                    loop = false 
                },
            
                ["inspec14" ] = {
                    perm = "",
                    dict = "mp_deathmatch_intros@melee@2h" ,
                    anim ="intro_male_melee_2h_d" ,
                    andar = false ,
                    loop = false 
                },
            
                ["inspec15" ] = {
                    perm = "",
                    dict = "mp_deathmatch_intros@melee@2h" ,
                    anim ="intro_male_melee_2h_e" ,
                    andar = false ,
                    loop = false 
                },
            
                ["inspec16" ] = {
                    perm = "",
                    dict = "anim@deathmatch_intros@1hmale" ,
                    anim ="intro_male_1h_d_michael" ,
                    andar = true ,
                    loop = false 
                },
            
                ["swat" ] = {
                    perm = "",
                    dict = "swat" ,
                    anim ="come" ,
                    andar = true ,
                    loop = false 
                },
            
                ["swat2" ] = {
                    perm = "",
                    dict = "swat" ,
                    anim ="freeze" ,
                    andar = true ,
                    loop = false 
                },
            
                ["swat3" ] = {
                    perm = "",
                    dict = "swat" ,
                    anim ="go_fwd" ,
                    andar = true ,
                    loop = false 
                },
            
                ["swat4" ] = {
                    perm = "",
                    dict = "swat" ,
                    anim ="rally_point" ,
                    andar = true ,
                    loop = false 
                },
            
                ["swat5" ] = {
                    perm = "",
                    dict = "swat" ,
                    anim ="understood" ,
                    andar = true ,
                    loop = false 
                },
            
                ["swat6" ] = {
                    perm = "",
                    dict = "swat" ,
                    anim ="you_back" ,
                    andar = true ,
                    loop = false 
                },
            
                ["swat7" ] = {
                    perm = "",
                    dict = "swat" ,
                    anim ="you_fwd" ,
                    andar = true ,
                    loop = false 
                },
            
                ["swat8" ] = {
                    perm = "",
                    dict = "swat" ,
                    anim ="you_left" ,
                    andar = true ,
                    loop = false 
                },
            
                ["swat9" ] = {
                    perm = "",
                    dict = "swat" ,
                    anim ="you_right" ,
                    andar = true ,
                    loop = false 
                },
            
                ["cigarro"] = {
                    perm = "", 
                    prop = "prop_cigar_02",
                    flag = 49,
                    hand = 47419,
                    pos = {0.010,0,0,50.0,0.0,-80.0}
                },
            
                ["naruto"] = {
                    perm = "",
                    dict = "missfbi1", 
                    anim = "ledge_loop", 
                    andar = true, 
                    loop = true
                },
            
                ["naruto2"] = {
                    perm = "",
                    dict = "missfam5_yoga", 
                    anim = "a2_pose", 
                    andar = true, 
                    loop = true
                },
            
                ["rebolar"] = {
                    perm = "",
                    dict = "switch@trevor@mocks_lapdance", 
                    anim = "001443_01_trvs_28_idle_stripper", 
                    andar = false, 
                    loop = true
                },
            
                ["celebrar"] = {
                    perm = "",
                    dict = "rcmfanatic1celebrate", 
                    anim = "celebrate", 
                    andar = false, 
                    loop = false
                },
            
                
                ["morto"] = {
                    perm = "",
                    dict = "anim@mp_player_intcelebrationmale@cut_throat", 
                    anim = "cut_throat", 
                    andar = true, 
                    loop = false
                },
            
                ["morto2"] = {
                    perm = "",
                    dict = "anim@mp_player_intcelebrationfemale@cut_throat", 
                    anim = "cut_throat", 
                    andar = true, 
                    loop = false
                },
                
                ["champanhe"] = {
                    perm = "",
                    dict = "anim@mp_player_intupperspray_champagne", 
                    anim = "idle_a", 
                    prop = "ba_prop_battle_champ_open",
                    flag = 49,
                    hand = 28422
                },
            
                ["abracocintura"] = {
                    perm = "",
                    dict = "misscarsteal2chad_goodbye", 
                    anim = "chad_armsaround_chad", 
                    andar = false, 
                    loop = true
                },
            
                ["abracocintura2"] = {
                    perm = "",
                    dict = "misscarsteal2chad_goodbye", 
                    anim = "chad_armsaround_chad", 
                    andar = true, 
                    loop = true
                },
            
                ["abracoombro"] = {
                    perm = "",
                    dict = "misscarsteal2chad_goodbye", 
                    anim = "chad_armsaround_girl", 
                    andar = false, 
                    loop = true
                },
            
                ["abracoombro2"] = {
                    perm = "",
                    dict = "misscarsteal2chad_goodbye", 
                    anim = "chad_armsaround_girl", 
                    andar = true, 
                    loop = true
                },
            
                ["casalm"] = {
                    perm = "",
                    dict = "timetable@trevor@ig_1", 
                    anim = "ig_1_thedontknowwhy_trevor", 
                    andar = false, 
                    loop = true
                },
            
                ["casalf"] = {
                    perm = "",
                    dict = "timetable@trevor@ig_1", 
                    anim = "ig_1_thedontknowwhy_patricia", 
                    andar = false, 
                    loop = true
                },
            
                ["casalm2"] = {
                    perm = "",
                    dict = "timetable@trevor@ig_1", 
                    anim = "ig_1_thedesertissobeautiful_trevor", 
                    andar = false, 
                    loop = true
                },
            
                ["casalf2"] = {
                    perm = "",
                    dict = "timetable@trevor@ig_1", 
                    anim = "ig_1_thedesertissobeautiful_patricia", 
                    andar = false, 
                    loop = true
                },
            
                ["danceclub"] = {
                    perm = "",
                    dict = "anim@amb@nightclub_island@dancers@beachdance@", 
                    anim = "hi_idle_a_m03",
                    loop = true
                },
            
                ["danceclub2"] = {
                    perm = "",
                    dict = "anim@amb@nightclub_island@dancers@beachdance@", 
                    anim = "hi_idle_a_m05",
                    loop = true
                },
            
                ["danceclub3"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub_island@dancers@beachdance@", 
                    anim = "hi_idle_a_m02",
                    loop = true
                },
            
                ["danceclub4"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub_island@dancers@beachdance@", 
                    anim = "hi_idle_b_f01",
                    loop = true
                },
            
                ["danceclub5"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub_island@dancers@club@", 
                    anim = "hi_idle_a_f02",
                    loop = true
                },
            
                ["danceclub6"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub_island@dancers@club@", 
                    anim = "hi_idle_b_m03",
                    loop = true
                },
            
                ["danceclub7"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub_island@dancers@club@", 
                    anim = "hi_idle_d_f01",
                    loop = true
                },
            
                ["dancedrink"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", 
                    anim = "mi_idle_c_m01",
                    prop = "prop_beer_amopen",
                    flag = 50, 
                    hand = 28422,
                    loop = true,
                    andar = false
                },
            
                ["dancedrink2"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", 
                    anim = "mi_loop_f1",
                    prop = "p_wine_glass_s",
                    flag = 50, 
                    hand = 28422,
                    loop = true,
                    andar = false
                },
            
                ["dancedrink3"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub_island@dancers@beachdanceprop@", 
                    anim = "mi_loop_m04",
                    prop = "ba_prop_battle_whiskey_opaque_s",
                    flag = 50, 
                    hand = 28422,
                    loop = true,
                    andar = false
                },
            
                ["dancedrink4"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub_island@dancers@beachdanceprops@male@", 
                    anim = "mi_idle_b_m04",
                    prop = "ba_prop_battle_whiskey_opaque_s",
                    flag = 50, 
                    hand = 28422,
                    loop = true,
                    andar = false
                },
            
                ["dancedrink5"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", 
                    anim = "hi_dance_prop_09_v1_female^3",
                    prop = "p_wine_glass_s",
                    flag = 50, 
                    hand = 28422,
                    loop = true,
                    andar = false
                },
            
                ["dancedrink6"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", 
                    anim = "hi_dance_prop_09_v1_male^3",
                    prop = "prop_beer_logopen",
                    flag = 50, 
                    hand = 28422,
                    loop = true,
                    andar = false
                },
            
                ["dancedrink7"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", 
                    anim = "hi_dance_prop_11_v1_female^3",
                    prop = "p_wine_glass_s",
                    flag = 50, 
                    hand = 28422,
                    loop = true,
                    andar = false
                },
            
                ["dancedrink8"] = {
                    perm = "", 
                    dict = "anim@amb@nightclub_island@dancers@crowddance_single_props@", 
                    anim = "hi_dance_prop_11_v1_female^1",
                    prop = "p_wine_glass_s",		
                    flag = 50, 
                    hand = 28422,
                    loop = true,
                    andar = false
                },


                ["binoculos"] = {
                    perm = "", 
                    dict = "amb@world_human_binoculars@male@enter", 
                    anim = "enter", 
                    prop = "prop_binoc_01", 
                    flag = 50, 
                    hand = 28422, 
                    extra = function()
                        startBinoculos()
                    end 
                },

                ["pano"] = {
                    perm = "",
                    dict = "timetable@maid@cleaning_window@base", 
                    anim = "base",
                    prop = "prop_rag_01",
                    flag = 49,
                    hand = 28422,
                    extra = function()
                        local vehicle = NyoFw.getClosestEntity('vehicle', nil, 7.0)
                        if IsEntityAVehicle(vehicle) then
                            TriggerEvent("progress",15000,"limpando")
                            SetTimeout(15000,function()
                                SetVehicleDirtLevel(vehicle,0.0)
                                SetVehicleUndriveable(vehicle,false)
                                NyoFw.deleteObject()
                            end)
                        end
                    end
                },

                ["pano2"] = {
                    perm = "",
                    dict = "timetable@maid@cleaning_surface@base", 
                    anim = "base",
                    prop = "prop_rag_01", 
                    flag = 49, 
                    hand = 28422,
                    extra = function()
                        local vehicle = NyoFw.getClosestEntity('vehicle', nil, 7.0)
                        if IsEntityAVehicle(vehicle) then
                            SetVehicleDirtLevel(vehicle,0.0)
                            SetVehicleUndriveable(vehicle,false)
                            NyoFw.deleteObject()
                        end
                    end
                },

                ["camera3"] = {
                    perm = "",
                    dict = "missfinale_c2mcs_1", 
                    anim = "fin_c2_mcs_1_camman", 
                    prop = "prop_v_cam_01", 
                    flag = 49, 
                    hand = 28422,
                    extra = function()
                        startCamera()
                    end
                }
                
               
            }
        },

    
    },
})