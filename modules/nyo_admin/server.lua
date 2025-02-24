local module = 'nyo_admin'
local traceback = debug.traceback()
local valid_traceback = string.format('@nfw/modules/%s/server.lua', module)

if traceback:find(valid_traceback) then
    Nfw.registerNyoModule(module, "1.0.0", {'nyo_core'}, false, function()

        local module_funcs = Nfw.getModuleFunctions()

        local function CreateCommand(command, handler, restricted)
            local config = NfwConfigs['ADMIN_COMMAND_'..command]
            if config and config.enabled then
                RegisterCommand(config.command, function(source, args, rawCommand)
                    local user_id = NyoFw.getCharId(source)
                    if Nfw.checkPermission(user_id, config.perm) then
                        local customLogArgs = {}
                        local function setCustomLogArgs(cargs)
                            customLogArgs = cargs
                        end
                        handler(source, user_id, args, rawCommand, setCustomLogArgs)
                        if config.sendLog then
                            module_funcs.sendLog(rawCommand, user_id, customLogArgs or {})
                        end
                    end
                end, restricted)
            end
        end
        
        -- GET CURRENT INTERIOR
        CreateCommand('GET_INTERIOR',function(source, user_id, args, rawCommand, setCustomLogArgs)
            local interiorId = RPC.trigger('admin:getCurrentInterior', source)
            NyoFw.prompt(source, 'Current interior ID', interiorId == 0 and 'Invalid interior' or interiorId)
            setCustomLogArgs({
                ['Interior ID'] = interiorId
            })
        end, false )
        
        -- VEC3
        CreateCommand('VEC3', function(source, user_id, args, rawCommand)
            local ped = GetPlayerPed(source)
            local cds = GetEntityCoords(ped)
            local function fn(n)
                return math.round(n * 100) / 100
            end
            local str = string.format("vec3(%s, %s, %s)", fn(cds.x), fn(cds.y), fn(cds.z))
            NyoFw.prompt(source, 'Current player coords', str)
        end, false)
        
        -- VEC4
        CreateCommand('VEC4', function(source, user_id, args, rawCommand)
            local ped = GetPlayerPed(source)
            local cds = GetEntityCoords(ped)
            local h = GetEntityHeading(ped)
            local function fn(n)
                return math.round(n * 100) / 100
            end
            local str = string.format("vec4(%s, %s, %s, %s)", fn(cds.x), fn(cds.y), fn(cds.z), fn(h))
            NyoFw.prompt(source, 'Current player coords', str)
        end, false)

        -- SPAWN CAR
        CreateCommand('SPAWN_CAR', function(source, user_id, args, rawCommand, setCustomLogArgs)
            if args[1] then
                local ped = GetPlayerPed(source)
                local cds = GetEntityCoords(ped)
                local h = GetEntityHeading(ped)
                local spawnCoords = vec4(cds.x,cds.y,cds.z,h)
                local veh, netID = exports['nfw']:createVehicle(source, args[1], spawnCoords, NyoFw.getCharacterIdentity(user_id).registration)
                SetPedIntoVehicle(ped, veh, -1)
                local function fn(n)
                    return math.round(n * 100) / 100
                end
                setCustomLogArgs({
                    ['Spawn Coords'] = string.format("vec4(%s, %s, %s, %s)", fn(cds.x), fn(cds.y), fn(cds.z), fn(h))
                })
            end
        end, false)

        -- DV
        CreateCommand("DV", function(source, user_id, args, rawCommand)
            local veh = NyoFw.getClosestVehicleFromPlayerServer(source, 25.0)
            TriggerEvent('nyo_module:delete_vehicle',source, veh,'')
        end)

        -- TELEPORT TO WAYPOINT
        CreateCommand('TELEPORT_WAYPOINT', function(source, user_id, args, rawCommand)
            SafeEvents.triggerClient('admin:TELEPORT_WAYPOINT', source)
        end, false)


        -- TELEPORT CDS
        CreateCommand("TELEPORT_CDS", function(source, user_id, args, rawCommand)
            local fcoords = NyoFw.prompt(source,"Cordenadas:","")
            if fcoords == "" then
                return
            end
            local coords = {}
            for coord in string.gmatch(fcoords or "0,0,0","[^,]+") do
                table.insert(coords,coord)
            end
            SetEntityCoords(GetPlayerPed(source), tonumber(coords[1]) or 0, tonumber(coords[2]) or 0, tonumber(coords[3]) or 0)
        end)

         -- TELEPORT TO ME
         CreateCommand("TELEPORT_TOME", function(source, user_id, args, rawCommand)
            if args[1] then 
                local tplayer = NyoFw.getUserSource(tonumber(args[1]))
                if tplayer then 
                    local playerCoord = GetEntityCoords(GetPlayerPed(source))
                    SetEntityCoords(GetPlayerPed(tplayer), playerCoord)
                end
            end
        end)

        -- TELEPORT TO
        CreateCommand("TELEPORT_TO", function(source, user_id, args, rawCommand)
            if args[1] then 
                local tplayer = NyoFw.getUserSource(tonumber(args[1]))
                if tplayer then 
                    local playerCoord = GetEntityCoords(GetPlayerPed(tplayer))
                    SetEntityCoords(GetPlayerPed(source), playerCoord)
                end
            end
        end)

        -- ADD FUEL
        CreateCommand("ADD_FUEL", function(source, user_id, args, rawCommand)
            local ped = GetPlayerPed(source)
            local veh = GetVehiclePedIsIn(ped, false)
            if veh ~= 0 then
                local netid = NetworkGetNetworkIdFromEntity(veh)
                exports['nfw']:NfwetFuel(netid, tonumber(args[1]) or 100.0)
            end
        end, false)

        -- ADD CAR
        CreateCommand("ADD_CAR", function(source, user_id, args, rawCommand)
            if args[1] then
                local vname = args[1]
                local vowner = tonumber(args[2]) or user_id
                local plate = NyoFw.generatePlate()
                NyoFw.querySync('nfw/nyo_dealership/add_vehicle', {char_id = vowner, vehicle = vname, plate = plate})
            end
        end)

        -- REM CAR
        CreateCommand("REM_CAR", function(source, user_id, args, rawCommand)
            if args[1] and args[2] then
                local vname = args[1]
                local vowner = tonumber(args[2]) or user_id
                if args[3] then 
                    local plate = args[3]
                    plate = plate:gsub(" ", '')
                    NyoFw.querySync('nfw/nyo_dealership/rem_vehicle', {char_id = vowner, vehicle = vname, plate = plate})
                else 
                    NyoFw.querySync('nfw/nyo_dealership/rem_vehicleNotPlate', {char_id = vowner, vehicle = vname})
                end
                
            end
        end)

        -- HAS CAR
        CreateCommand("HAS_CAR", function(source, user_id, args, rawCommand)
            if args[1] then
                local vname = args[1]
                local vowner = tonumber(args[2]) or user_id
                local hasCar = exports['nfw']:playerHasVehicle(vowner, vname)
                print('has car', hasCar)
            end
        end)

        -- TUNING
        CreateCommand("TUNING", function(source, user_id, args, rawCommand)
            SafeEvents.triggerClient("admin:TUNING", source)
        end)

        -- FIX
        CreateCommand("FIX", function(source, user_id, args, rawCommand)
            TriggerClientEvent("nfw:bennys:repairAll", source)
        end)

        -- CUFF
        CreateCommand("CUFF", function(source, user_id, args, rawCommand)
            SafeEvents.triggerClient("admin:cuff",source,true)
        end)

        -- UNCUFF
        CreateCommand("UNCUFF", function(source, user_id, args, rawCommand)
            SafeEvents.triggerClient("admin:cuff",source,false)
        end)

        -- CLEAR AREA
        CreateCommand("CLEAR_AREA", function(source, user_id, args, rawCommand)
            SafeEvents.triggerClient("admin:CLEAR_AREA", source, GetEntityCoords(GetPlayerPed(source)))
        end)

        -- DEBUG
        CreateCommand("DEBUG", function(source, user_id, args, rawCommand)
            SafeEvents.triggerClient("admin:DEBUG", source)
        end)

        -- ITEM
        CreateCommand("ITEM", function(source, user_id, args, rawCommand)
            local charId = args[3] or user_id
            local qtd = args[2] or 1
            if args[1] then 
                if NyoFw.getUserSource(tonumber(charId)) then 
                    NyoFw.giveInventoryItem(tonumber(charId), args[1], tonumber(qtd)) 
                else 
                    print('usuario offline')
                end            
            end
        end)

        -- NOCLIP
        CreateCommand("NOCLIP", function(source, user_id, args, rawCommand)
            NyoFw.safeNoClip(source)
            local nSource = NyoFw.getHoldPlayer(source)
            if nSource then 
                NyoFw.safeNoClip(nSource)
            end
            SafeEvents.triggerClient("admin:NOCLIP", source)
        end)

        -- MONEY
        CreateCommand("MONEY", function(source, user_id, args, rawCommand)
            if args[1] then
                NyoFw.giveMoney(user_id,tonumber(args[1]))
            end
        end)

        -- BAN
        CreateCommand("BAN", function(source, user_id, args, rawCommand)
            if args[1] then
                NyoFw.setBanned(tonumber(args[1]),true)
            end
        end)

        -- UNBAN
        CreateCommand("UNBAN", function(source, user_id, args, rawCommand)
            if args[1] then
                NyoFw.setBanned(tonumber(args[1]),false)
            end
        end)

        -- WL
        CreateCommand("WL", function(source, user_id, args, rawCommand)
            if args[1] then
                NyoFw.setWhitelisted(tonumber(args[1]),true)
            end
        end)

        -- UNWL
        CreateCommand("UNWL", function(source, user_id, args, rawCommand)
            if args[1] then
                NyoFw.setWhitelisted(tonumber(args[1]),false)
            end
        end)

        -- GOD
        CreateCommand("GOD", function(source, user_id, args, rawCommand)
            if args[1] then
                local nplayer = NyoFw.getUserSource(tonumber(args[1]))
                if nplayer then
                    SafeEvents.triggerClient("nfw:deathsystem:killGod", nplayer, 400)
                    TriggerClientEvent("nfw:closeUi", nplayer)
                    TriggerClientEvent("resetBleeding",nplayer)
                    TriggerClientEvent("resetDiagnostic",nplayer)               
                end
            else
                SafeEvents.triggerClient("nfw:deathsystem:killGod", source, 400)
                TriggerClientEvent("nfw:closeUi",source)
                TriggerClientEvent("resetBleeding",source)
                TriggerClientEvent("resetDiagnostic",source)
            end
        end)

        

        -- KICK
        CreateCommand("KICK", function(source, user_id, args, rawCommand)
            if args[1] then 
                if args[1] == 'all' then 
                    local allPlayer = NyoFw.getUsers()
                    for k,v in pairs(allPlayer) do 
                        DropPlayer(v, 'Você foi kikado do servidor!')
                    end
                else 
                    local nplayer = NyoFw.getUserSource(tonumber(args[1]))
                    if nplayer then 
                        DropPlayer(nplayer, 'Você foi kikado do servidor!')
                    end
                end
            end
        end)

        --
        CreateCommand("", function(source, user_id, args, rawCommand)
        
        end)

        --
        CreateCommand("", function(source, user_id, args, rawCommand)
        
        end)


        

        -- BAN SYSTEM TOKEN
        if not GetResourceKvpString('nfw_install_ban') then 
            NyoFw.query([[
                CREATE TABLE IF NOT EXISTS `nyo_hwidban` (
                    `token` varchar(100) NOT NULL,
                    `user_id` int(10) NOT NULL,
                    PRIMARY KEY (`token`),
                    KEY `user_id` (`user_id`)
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
            ]],nil,nil,'query')         
            SetResourceKvp('nfw_install_ban', true)
        end

        NyoFw.prepare('bansystem/setBanToken', 'INSERT IGNORE INTO nyo_hwidban (token, user_id) VALUES (@token, @user_id)')
        NyoFw.prepare('bansystem/checkTokenBan', 'SELECT * FROM nyo_hwidban hb LEFT JOIN nyo_account u ON (u.id = hb.user_id) WHERE hb.token = @token AND u.id NOT IN (hb.user_id) AND banned = 1')

        local function NfwetTokenBan(source, account_id)
            if source and account_id then
                local token = GetPlayerTokens(source)
                for k, v in pairs(token) do
                    NyoFw.query("bansystem/setBanToken", { token = v, user_id = account_id })
                end
                return token
            end
        end

        AddEventHandler("nfw:playerSpawn", function(char_id, src)
            console.debug('^3[ BAN SYSTEM ] ^7Checking player '..char_id)
            local account_id = NyoFw.getAccountId(src)
            local token = NfwetTokenBan(src, account_id)
            for k, v in pairs(token) do
                local dt = NyoFw.querySync("bansystem/checkTokenBan", { token = v })
                if #dt > 0 then
                    console.debug('^3[ BAN SYSTEM ] ^7Banning player '..account_id)
                    DropPlayer(src, "[NYO MODULE] Você esta banido por HWID! Contate a administração para mais informações!")
                    module_funcs.sendBanLog(account_id, dt[1].id)
                    NyoFw.setAccountBanned(account_id)
                    return
                end
            end
        end)
       
    end)
else
    error 'Module name has been modified'
    Nfw.preventCheat()
end