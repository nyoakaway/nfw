
local module = 'nyo_player'
local traceback = debug.traceback()
local valid_traceback = string.format('@nfw/modules/%s/server.lua', module)

if traceback:find(valid_traceback) then
    Nfw.registerNyoModule(module, "1.0.0", {"nyo_core"}, false, function()
        local playerConfig = NfwConfigs['playerGeneralConfig']
        local module_funcs = Nfw.getModuleFunctions()

        NyoFw.prepare("Nfw:getCharplate","SELECT char_id FROM nyo_users_vehicles WHERE plate = @plate")
        NyoFw.prepare("Nfw:getVehicles","SELECT * FROM nyo_users_vehicles WHERE char_id = @char_id AND plate = @plate")
        NyoFw.prepare("Nfw:setDetido","UPDATE nyo_users_vehicles SET impounded = 1 WHERE char_id = @char_id AND plate = @plate")

        NyoFw.prepare("Nfw:getMulta","SELECT multas FROM nyo_character WHERE id = @id")
        NyoFw.prepare("Nfw:setMulta","UPDATE nyo_character SET multas = @multas WHERE id = @id")

        NyoFw.prepare("Nfw:setPrender","UPDATE nyo_character SET prision = @time WHERE id = @id")
        NyoFw.prepare("Nfw:getPrision","SELECT prision FROM nyo_character WHERE id = @id")
        NyoFw.prepare("Nfw:setPrision","UPDATE nyo_character SET prision = @time WHERE id = @id")

        local function CreateCommand(command, handler, restricted)
            local config = NfwConfigs['ADMIN_COMMAND_'..command]
            if config and config.enabled then
                RegisterCommand(config.command, function(source, args, rawCommand)
                    local charId = NyoFw.getCharId(source)
                    if Nfw.checkPermission(charId, config.perm) then
                        local customLogArgs = {}
                        local function setCustomLogArgs(cargs)
                            customLogArgs = cargs
                        end
                        handler(source, charId, args, rawCommand, setCustomLogArgs)
                        if config.sendLog then
                            module_funcs.sendLog(rawCommand, charId, customLogArgs or {})
                        end
                    end
                end, restricted)
            end
        end
    
        NyoFw.toogleHandcuff = function(source)
            SafeEvents.triggerClient("nfw:player:setHtoogleHandcuffandcuffed", source)
        end

        NyoFw.setHandcuffed = function(source, u)
            SafeEvents.triggerClient("nfw:player:setHandcuffed", source, u)
        end

        NyoFw.isHandcuffed = function(source)
            return RPC.trigger("nfw:player:isHandcuffed", source)
        end

        exports('toogleHandcuff', NyoFw.toogleHandcuff) 
        exports('setHandcuffed', NyoFw.setHandcuffed) 
        exports('isHandcuffed', NyoFw.isHandcuffed) 


        local holdPlayer = {}

        NyoFw.getHoldPlayer = function(src)
            if holdPlayer[src] then 
                return holdPlayer[src]
            end
            return false
        end

        SafeEvents.register("nfw:player:handcuffed", function(src)
            local charId = NyoFw.getCharId(src)	 
            if not NyoFw.isHandcuffed(src) then  
                if NyoFw.hasPermission(charId, playerConfig.handCuffedPerm) or NyoFw.getInventoryItemAmount(charId, 'algema') > 0 then 
                    local nplayer = RPC.trigger("core-getNearestPlayer", src, 2.0) 
                    if nplayer then 
                        if NyoFw.isHandcuffed(nplayer) then 
                            SafeEvents.triggerClient("nfw:player:setHold", nplayer, src)
                            NyoFw.playAnim(src,false,{{"mp_arresting","a_uncuff"}},false)
                            SetTimeout(5000,function()
                                NyoFw.toogleHandcuff(nplayer)
                                SafeEvents.triggerClient("nfw:player:setHold", nplayer, src)
                                TriggerClientEvent("nfw:sounds:playSound",src,'uncuff',0.1)
                                TriggerClientEvent("nfw:sounds:playSound",nplayer,'uncuff',0.1)
                                SafeEvents.triggerClient("nfw:player:setHandcuffed", nplayer, 'remove')
                            end)
                        else 
                            TriggerClientEvent("nfw:blockAnim", src, true)
                            TriggerClientEvent("nfw:blockAnim", nplayer, true)
                            SafeEvents.triggerClient("nfw:player:setHold", nplayer, src)
                            NyoFw.playAnim(src,false,{{"mp_arrest_paired","cop_p2_back_left"}},false)
                            NyoFw.playAnim(nplayer,false,{{"mp_arrest_paired","crook_p2_back_left"}},false)
                            SetTimeout(3500,function()
                                NyoFw.stopAnim(src, false)
                                NyoFw.toogleHandcuff(nplayer)
                                SafeEvents.triggerClient("nfw:player:setHold", nplayer, src)
                                TriggerClientEvent("nfw:blockAnim", src, false)
                                TriggerClientEvent("nfw:blockAnim", nplayer, false)
                                TriggerClientEvent("nfw:sounds:playSound",src,'cuff',0.1)
                                TriggerClientEvent("nfw:sounds:playSound",nplayer,'cuff',0.1)
                                SafeEvents.triggerClient("nfw:player:setHandcuffed", nplayer, 'set')
                                                            
                            end)
                        end
                    end
                end
            end            
        end)

        SafeEvents.register("nfw:player:hold", function(src)
            local charId = NyoFw.getCharId(src)
            if not NyoFw.isHandcuffed(src) then
                if NyoFw.hasPermission(charId, playerConfig.holdPerm) then
                    local nplayer = RPC.trigger("core-getNearestPlayer", src, 2.0)
                    if nplayer then
                        if holdPlayer[src] then 
                            holdPlayer[src] = nil
                        else
                            holdPlayer[src] = nplayer
                        end
                        SafeEvents.triggerClient("nfw:player:setHold", nplayer, src)
                    end
                end
            end
        end)

        -- DISPAROS

        SafeEvents.register("nfw:atirando", function(source,x,y,z)
            local charId = NyoFw.getCharId(source)
            if charId then
                if not NyoFw.hasPermission(charId, playerConfig.policiaPerm) then
                    local policiais = NyoFw.getUsersByPermission(playerConfig.policiaPerm)
                    for l,w in pairs(policiais) do
                        local player = NyoFw.getUserSource(tonumber(w))
                        if player then
                            SafeEvents.triggerClient('nfw:notificacao', player, x, y, z, 10, 49, 0.5, 30000, "Disparos de arma de fogo", false, 64, 64, 255, true, true,"133")
                        end
                    end
               end
            end
        end)

        -- RMASCARA
        RegisterCommand('rmascara',function(src,args,rawCommand)
            local charId = NyoFw.getCharId(src)
            if NyoFw.hasPermission(charId, playerConfig.rmascaraPerm) then
                local nplayer = RPC.trigger("core-getNearestPlayer", src, 2.0)  
                if nplayer then
                    TriggerClientEvent('rmascara',nplayer)
                end
            end
        end)
        
        -- RCHAPEU
        RegisterCommand('rchapeu',function(src,args,rawCommand)
            local charId = NyoFw.getCharId(src)
            if NyoFw.hasPermission(charId, playerConfig.rchapeuPerm) then
                local nplayer = RPC.trigger("core-getNearestPlayer", src, 2.0)
                if nplayer then
                    TriggerClientEvent('rchapeu',nplayer)
                end
            end
        end)

        RegisterCommand('cv',function(src,args,rawCommand)
            local charId = NyoFw.getCharId(src)
            if NyoFw.hasPermission(charId, playerConfig.policiaPerm) then
                local nplayer = RPC.trigger("core-getNearestPlayer", src, 10)
                if nplayer then

                    SafeEvents.triggerClient("putInNearestVehicleAsPassenger", nplayer, 7)
                end
            end
        end)

        -- [ REMOVER DO VEICULO ] --
        RegisterCommand('rv',function(src,args,rawCommand)
            local charId = NyoFw.getCharId(src)
            if NyoFw.hasPermission(charId, playerConfig.policiaPerm) then
                local nplayer = RPC.trigger("core-getNearestPlayer", src, 10)
                if nplayer then
                    SafeEvents.triggerClient("ejectVehicle", nplayer)
                end
            end
        end)

        -- [ ID ] --
        RegisterCommand('id',function(src,args,rawCommand)
            local charId = NyoFw.getCharId(src)
            if NyoFw.hasPermission(charId, playerConfig.policiaPerm) then
                local nplayer = RPC.trigger("core-getNearestPlayer", src, 10)
                if nplayer then
                    local charIdd = NyoFw.getCharId(nplayer)
                    local identity = NyoFw.getCharacterIdentity(charIdd)
                    TriggerClientEvent('chatMessage',src,"id",{255, 255, 0}," "..charIdd.." ^1Nome: ^0"..identity.name.." "..identity.last_name)
                end
            end
        end)


        -- [ RE ] --
        RegisterCommand('re',function(src,args,rawCommand)
            local charId = NyoFw.getCharId(src)
            if NyoFw.hasPermission(charId,playerConfig.policiaPerm) or NyoFw.hasPermission(charId,playerConfig.hospitalPerm) then
                local nplayer = RPC.trigger("core-getNearestPlayer", src, 2.0)
                if nplayer then
                        NyoFw.playSound(src,false,{{"amb@medic@standing@tendtodead@base","base"},{"mini@cpr@char_a@cpr_str","cpr_pumpchest"}},true)

                            TriggerClientEvent("progress",src,10000,"reanimando")
                            SetTimeout(10000,function()	
                                SafeEvents.triggerClient("nfw:deathsystem:killGod", nplayer, 200)
                                TriggerClientEvent("nfw:closeUi", nplayer)
                                TriggerClientEvent("resetBleeding",nplayer)
                                TriggerClientEvent("resetDiagnostic",nplayer)     
                            end)

                else
                    NfwGlobalFunctions.notify(src, 'Sucesso', 'Chegue mais perto do paciente.', '#00FF00', 5000)
                end
            end
        end)

        -- [ PLACA ] --
        RegisterCommand('placa',function(src,args,rawCommand)
            local charId = NyoFw.getCharId(src)
            if NyoFw.hasPermission(charId,playerConfig.policiaPerm) then
                if args[1] then
                    local charId = NyoFw.querySync("Nfw:getCharplate",{ plate = args[1] })
                    if charId then
                        local identity = NyoFw.getCharacterIdentity(charId[1].char_id)
                        if identity then
                            NyoFw.playSound(src,"Event_Message_Purple","GTAO_FM_Events_Soundset")
                            TriggerClientEvent('chatMessage',src,"911",{64,64,255},"^1Passaporte: ^0"..identity.id.."   ^2|   ^1Placa: ^0"..args[1].."   ^2|   ^1Proprietário: ^0"..identity.name.." "..identity.last_name.."^2|   ^1Telefone: ^0"..identity.phone)
                        end
                    else
                        NfwGlobalFunctions.notify(src, 'Sucesso', 'Placa inválida ou veículo de americano.', '#00FF00', 5000)
                        
                    end
                else
                    local vehicle,vnetid,plate,vname,lock,banned,trunk = RPC.trigger("garages-getClosestVehicleInfo", src, 7.0)

                        local placa_user = NyoFw.querySync("Nfw:getCharplate",{ plate = plate })           
                        if placa_user then
                            local identity = NyoFw.getCharacterIdentity(placa_user[1].char_id)
                            if identity then
                                local vehicleName = NyoFw.getVehicleName(vname)
                                NyoFw.playSound(src,"Event_Message_Purple","GTAO_FM_Events_Soundset")
        
                                TriggerClientEvent('chatMessage',src,"133",{64,64,255},"^1Passaporte: ^0"..identity.id.."   ^2|   ^1Placa: ^0"..plate.."   ^2|   ^1Proprietário: ^0"..identity.name.." "..identity.last_name.."   ^2|   ^1Modelo: ^0"..vehicleName.." ^2|   ^1Telefone: ^0"..identity.phone)
                            end
                        else
                            NfwGlobalFunctions.notify(src, 'Sucesso', 'Placa inválida ou veículo de americano.', '#00FF00', 5000)
                        end
                end
            end
        end)

        -- [ MULTAR ] --

        RegisterCommand('multar',function(src,args,rawCommand)
            local charId = NyoFw.getCharId(src)
            if NyoFw.hasPermission(charId,playerConfig.policiaPerm) then
                local id = NyoFw.prompt(src,"Passaporte:","")
                local valor = NyoFw.prompt(src,"Valor:","")
                local motivo = NyoFw.prompt(src,"Motivo:","")
                if id == "" or valor == "" or motivo == "" then
                    return
                end
                
                local value = NyoFw.querySync("Nfw:getMulta",{ id = tonumber(id) })
                local multas = (tonumber(value[1].multas) + tonumber(valor))
                NyoFw.querySync("Nfw:setMulta", {id = tonumber(id), multas = multas})

                if playerConfig.multa.bonuspolicia then
                    randmoney = playerConfig.multa.valuebonus
                    NyoFw.giveMoney(charId,tonumber(randmoney))
                    NfwGlobalFunctions.notify(src, 'Importante','Você recebeu <b>$'..tonumber(randmoney)..' dólares</b> de bonificação.', '#00FF00', 5000)
                end

                NfwGlobalFunctions.notify(src, 'Sucesso','Multa aplicada com sucesso.', '#00FF00', 5000)  

                local nplayer = NyoFw.getUserSource(tonumber(id))

                NfwGlobalFunctions.notify(nplayer, 'Importante','Você foi multado em <b>$'..tonumber(valor)..' dólares</b>.<br><b>Motivo:</b> '..motivo..'.', '#00FF00', 5000)

                NyoFw.playSound(src,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
            end
        end)

        -- [ DETIDO ] --

        RegisterCommand('detido',function(src,args,rawCommand)
            local charId = NyoFw.getCharId(src)
            if NyoFw.hasPermission(charId,playerConfig.policiaPerm) then
                local vehicle,vnetid,plate,vname,lock,banned,trunk = RPC.trigger("garages-getClosestVehicleInfo", src, 7.0)
                local motivo = NyoFw.prompt(src,"Motivo:","")
                if motivo == "" then
                    return
                end

                if vehicle then
                    local pcharId = NyoFw.querySync("Nfw:getCharplate",{ plate = plate })
                    local rows = NyoFw.querySync("Nfw:getVehicles",{ char_id = tonumber(pcharId[1].char_id), plate = plate })
                    if rows[1] then
                        if tonumber(rows[1].impounded) == 1 then
                            NfwGlobalFunctions.notify(tplayer, 'Importante','Este veículo já se encontra detido.', '#00FF00', 5000)
                        else
                            NyoFw.querySync("Nfw:setDetido",{ char_id = tonumber(pcharId[1].char_id), plate = plate, impounded = 1 })
                            TriggerEvent('nyo_module:delete_vehicle',src, vnetid, vname)

                            if playerConfig.detido.bonuspolicia then
                                randmoney = playerConfig.detido.valuebonus
                                NyoFw.giveMoney(charId,tonumber(randmoney))
                                NfwGlobalFunctions.notify(src, 'Importante','Você recebeu <b>$'..tonumber(randmoney)..' dólares</b> de bonificação.', '#00FF00', 5000)
                            end

                            NfwGlobalFunctions.notify(src, 'Sucesso','Carro apreendido com sucesso.', '#00FF00', 5000) 

                            local nplayer = NyoFw.getUserSource(tonumber(pcharId[1].char_id))
                            NfwGlobalFunctions.notify(nplayer, 'Importante','Seu Veículo foi <b>Detido</b>.<br><b>Motivo:</b> '..motivo..'.', '#00FF00', 5000)
                          
                            NyoFw.playSound(src,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
                        end
                    end
                end
            end
        end)

       -- [ Cabeçada ] --

        SafeEvents.register("nfw:apertare", function(source,player,x,y,z)
            local targetCoords = GetEntityCoords(GetPlayerPed(player))
            local Coords = GetEntityCoords(GetPlayerPed(source))
            if #(targetCoords - Coords ) <= 5.0 then
                SafeEvents.triggerClient('nfw:apertarePlayer',player,x,y,z)
            end
        end)

        -- [ QTH ] --

        RegisterCommand('qth',function(source,args,rawCommand)
            local charId = NyoFw.getCharId(source)
            local identity = NyoFw.getCharacterIdentity(charId)
            local plyCoords = GetEntityCoords(GetPlayerPed(source))
            local x,y,z = plyCoords[1],plyCoords[2],plyCoords[3]
                if NyoFw.hasPermission(charId, playerConfig.policiaPerm) then
                    local policiais = NyoFw.getUsersByPermission(playerConfig.policiaPerm)
                    for l,w in pairs(policiais) do
                        local player = NyoFw.getUserSource(tonumber(w))
                        if player then
                            SafeEvents.triggerClient('nfw:notificacao', player, x, y, z, 3, 41, 0.5, 20000, "Localização de "..identity.name.." "..identity.last_name, false, 5, 144, 242, false, false,"133")
                            NfwGlobalFunctions.notify(player, 'Importante','Localização enviada de <b>'..identity.name..' '..identity.last_name..'</b>.', '#00FF00', 5000)
                        end
                    end
                    NfwGlobalFunctions.notify(source, 'Sucesso','Localização enviada com sucesso.', '#00FF00', 5000) 
                end
        end)

        -- [ PRENDER PRISÃO ] --

        RegisterCommand('prender',function(src,args,rawCommand)
            local charId = NyoFw.getCharId(src)
            if NyoFw.hasPermission(charId,playerConfig.policiaPerm) then
                local crimes = NyoFw.prompt(src,"Crimes:","")
                if crimes == "" then
                    return
                end

                local player = NyoFw.getUserSource(tonumber(args[1]))

                if player then

                    NyoFw.querySync("Nfw:setPrender",{ id = tonumber(args[1]), time = tonumber(args[2])})

                    SafeEvents.triggerClient("nfw:player:setHandcuffed", player, 'remove')
                    SafeEvents.triggerClient('nfw:prisioneiro',player,true)

                    prison_lock(tonumber(args[1]))

                    TriggerClientEvent("nfw:sounds:playSound",player,'jaildoor',0.7)
                    TriggerClientEvent("nfw:sounds:playSound",src,'jaildoor',0.7)

                    if playerConfig.prender.bonuspolicia then
                        randmoney = playerConfig.prender.valuebonus
                        NyoFw.giveMoney(charId,tonumber(randmoney))
                        NfwGlobalFunctions.notify(src, 'Importante','Você recebeu <b>$'..tonumber(randmoney)..' dólares</b> de bonificação.', '#00FF00', 5000)
                    end

                    NfwGlobalFunctions.notify(src, 'Sucesso','Prisão efetuada com sucesso.', '#00FF00', 5000) 

                    NfwGlobalFunctions.notify(player, 'Importante','Você recebeu <b>$'..tonumber(randmoney)..' dólares</b> de bonificação.', '#00FF00', 5000)
                    NfwGlobalFunctions.notify(player, 'Importante','Você foi preso por <b>'..tonumber(args[2])..' meses</b>.<br><b>Motivo:</b> '..crimes..'.', '#00FF00', 5000)

                    NyoFw.playSound(src,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
                end
            end
        end)
        
        AddEventHandler("nfw:playerSpawn",function(charId,src)
            SetTimeout(10000,function()
                local value = NyoFw.querySync("Nfw:getPrision",{ id = tonumber(charId)})
                local tempo = value[1].prision or -1

                if tempo == -1 then
                    return
                end

                if tempo > 0 then
                    NfwGlobalFunctions.notify(src, 'Importante','Ainda vai passar <b>'..tonumber(tempo)..' meses</b> preso.', '#00FF00', 5000)
                    SafeEvents.triggerClient('nfw:prisioneiro',src,true)
                    SetEntityCoords(GetPlayerPed(src), 1680.1,2513.0,46.5)
                    prison_lock(tonumber(charId))
                end
            end)
        end)

        function prison_lock(charId)
            local player = NyoFw.getUserSource(tonumber(charId))
            if player then
                SetTimeout(60000,function()

                    local value = NyoFw.querySync("Nfw:getPrision",{ id = tonumber(charId)})
                    local tempo = value[1].prision or 0
                    if tonumber(tempo) >= 1 then
                        NfwGlobalFunctions.notify(player, 'Importante','Ainda vai passar <b>'..tonumber(tempo)..' meses</b> preso.', '#00FF00', 5000)
                        NyoFw.querySync("Nfw:setPrision",{ id = tonumber(charId), time = tonumber(tempo) - 1})
                        prison_lock(tonumber(charId))
                    elseif tonumber(tempo) == 0 then
                        SafeEvents.triggerClient('nfw:prisioneiro',player,false)
                        SetEntityCoords(GetPlayerPed(player), 1847.53, 2585.46, 45.66)
                        NyoFw.querySync("Nfw:setPrision",{ id = tonumber(charId), time = -1})
                        NfwGlobalFunctions.notify(player, 'Importante','Sua sentença terminou, esperamos não ve-lo novamente.', '#00FF00', 5000)
                    end
                end)
            end
        end

        SafeEvents.register("nfw:diminuirpena", function(src)
            local charId = NyoFw.getCharId(src)
            local value = NyoFw.querySync("Nfw:getPrision",{ id = tonumber(charId)})
            local tempo = value[1].prision or 0

            if tempo >= playerConfig.prender.mesesdiminuir then
                NyoFw.querySync("Nfw:setPrision",{ id = tonumber(charId), time = tonumber(tempo) - playerConfig.prender.diminuircaixa})
                NfwGlobalFunctions.notify(src, 'Importante','Sua pena foi reduzida em <b>'..playerConfig.prender.diminuircaixa..' meses</b>, continue o trabalho.', '#00FF00', 5000)
            else
                NfwGlobalFunctions.notify(src, 'Importante','Atingiu o limite da redução de pena, não precisa mais trabalhar.', '#00FF00', 5000)
            end
        end)

        -- SALARIO
        CreateThread(function()
            while true do 
                Wait(10000)
                local users = NyoFw.getUsers()
                local nTime = os.time()
                for k,v in pairs(users) do 
                    local userDb = NyoFw.getUserTable(k)
                    local src = NyoFw.getUserSource(k)                   
                    for k2, v2 in pairs(playerConfig.wage) do  
                        local userTime = userDb.cloak[k2] or userDb.cloak.login 
                        local diffTime = nTime - userTime
                        local cTime = v2.time * 60
                        local paymentPerm = false
                        local paymentService = false 
                        local paymentVipAccount = false 
                        local paymentVipCharacter = false 
               
                        if v2.requirePerm ~= '' then                             
                            if NyoFw.hasPermission(k, v2.requirePerm) then 
                                paymentPerm = true
                            end 
                        else 
                            paymentPerm = true
                        end

                        if v2.requireService ~= '' then 
                            local dPlayer = NyoFw.inService(v2.requireService)
                            if dPlayer[src] then 
                                paymentService = true
                            end
                        else 
                            paymentService = true
                        end

                        if v2.requireVipAccount ~= '' then 
                            if NyoFw.getAccountVipByChar(k, v2.requireVipAccount) then 
                                paymentVipAccount = true
                            end
                        else 
                            paymentVipAccount = true 
                        end 

                        if v2.requireVipCharacter ~= '' then 
                            if NyoFw.getCharacterVip(k, v2.requireVipCharacter) then 
                                paymentVipCharacter = true
                            end
                        else 
                            paymentVipCharacter = true 
                        end 
                   
                        if paymentPerm and paymentService and paymentVipAccount and paymentVipCharacter and diffTime >= cTime then 
                            userDb.cloak[k2] = nTime
                            TriggerClientEvent("nfw:sounds:playSound",v,'coins',0.5)
                            TriggerClientEvent("nyo_notify",v,"Importante","Obrigado por colaborar com a cidade, seu salario de <b>"..v2.name.."</b> no valor de: <b>R$"..v2.value.." reais</b> foi depositado.", "#00FF00", 5000, "fa-solid fa-dollar-sign")
                            NyoFw.giveBankMoney(k,v2.value)
                        end                        
                    end
                end                
            end
        end)
    end)
else
    error 'Module name has been modified'
    Nfw.preventCheat()
end