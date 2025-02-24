local function _() 

    local blocked_G_sets = {
        ['PerformHttpRequest'] = true,
        ['PerformHttpRequestInternal'] = true,
        ['PerformHttpRequestInternalEx'] = true,
        ['RegisterNetEvent'] = true,
        ['RegisterServerEvent'] = true,
        ['AddEventHandler'] = true,
        ['TriggerEvent'] = true,
        ['TriggerServerEvent'] = true,
        ['TriggerClientEvent'] = true,
    }
    
    for k,v in pairs(blocked_G_sets) do
        if _G[k] then
            local info = debug.getinfo(_G[k])
            if info.short_src:find('nfw') then
                error('Hello world!')
            end
        end
    end

    local scripts = nil
    local connectedPlayers = {}
    local directory = GetResourcePath('nfw')
    local serverDirectory = directory:gsub('resources/(.*)', '')    

    config.scripts = {}

    SafeEvents.register('مترجم كامبريدج | الإنجليزية البرتغالية', function(source)
        console.debug(' Player connected on module '..source)
        connectedPlayers[#connectedPlayers + 1] = source
        Nfw.onReady(function()
            SafeEvents.triggerClient('مترجم كامبريدج | الإنجليزية البرتغالية', source, Nfw.getActiveModules())
        end)
    end)

    local function GetModulesInFolder()
        local pfile = io.popen('dir "'..directory..'/modules/" /b /D')
        local i = 0
        local t = {}
        for filename in pfile:lines() do
            if not filename:find('%.') then
                i = i + 1
                t[i] = filename
            end
        end
        return t
    end
    
    RegisterCommand('nfw:debug', function(s,args)
        config.debug = args[1] == "1"
    end, true)
    
    RegisterCommand('nfw:debugsync', function(s,args)
        config.debug = args[1] == "1"
        TriggerClientEvent('nfw:debugsync', -1, config.debug)
    end, true)

    CreateThread(function()
        Nfw.loadModules()
    end)

    Nfw.onReady(function() 
        local protectConfig = NfwConfigs.protectSystem 
        for k,v in pairs(NfwCoords) do
            if not NfwConfigs[v.config] then
                print('^3[ WARNING ]^7 Invalid config '..v.config..' - '..v.coord)
                NfwCoords[k] = nil
            end
        end

        local spawnProtect = {}

        NyoFw.setSpawnProtect = function(e)
            if e then 
                spawnProtect[e] = true
            end
        end

        NyoFw.getSpawnProtect = function(e)
            if spawnProtect[e] then 
                return true 
            else 
                return false
            end
        end

        AddEventHandler("nfw:addSafeEntity", function(e)
            if e then 
                local entity = NetworkGetEntityFromNetworkId(e) 
                spawnProtect[entity] = true
           end
        end)

        exports('setSpawnProtect', NyoFw.setSpawnProtect) 

        SafeEvents.register("nfw:نص عربي لترجمة قرن! إذا كنت تقرأ هذا ... أنت ديوث!", function(src, e)
            if e then 
                local entity = NetworkGetEntityFromNetworkId(e)
                spawnProtect[entity] = true
            end
        end)

        if config.protection then 
            AddEventHandler("explosionEvent",function(sender, ev)
                if protectConfig.activeProtect.explosion then 
                    CancelEvent()
                end                
            end)

            AddEventHandler('entityRemoved', function(entity)                
                if spawnProtect[entity] then 
                    spawnProtect[entity] = nil
                end
            end)
            
            AddEventHandler('entityCreating', function(entity)  
                local allowProtect = false 
                local entityType = GetEntityType(entity)
                if entityType == 1 and protectConfig.activeProtect.spawnPed then allowProtect = true end
                if entityType == 2 and protectConfig.activeProtect.spawnVehicle then allowProtect = true end
                if entityType == 3 and protectConfig.activeProtect.spawnProp then allowProtect = true end
                if allowProtect and not protectConfig.whitelistedProps[GetEntityModel(entity)] and not protectConfig.whitelistedPeds[GetEntityModel(entity)] then 
                    CreateThread(function()
                        Wait(1000)
                        if not spawnProtect[entity] and DoesEntityExist(entity) then
                            DeleteEntity(entity)
                        end            
                    end)
                end                
            end)
        end

       
    end)

    CreateThread(function()
        Wait(2500)
        if GetConvar('onesync') ~= 'on' then
            print('')
            print('^1[ ERROR ]^7 Onesync infinity is not enabled')
            print('')
        end
        if LoadResourceFile('nfw','modules/nyo_photos/config/server.lua') then
            print('')
            print('^1[ ERROR ]^7 nyo_photos is not a valid module')
            print('')
        end
    end)    

    NyoFw.safeNoClip = function(source)
        local state = Player(source).state.np_visible 
        Player(source).state:set('np_visible', not state, true) 
    end
end

_()