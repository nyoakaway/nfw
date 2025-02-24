local _math = math
setmetatable(math, {
    __index = function(t,k)
        return _math[k]
    end,
    __newindex = function(t,k,v)
        -- if debug.traceback():find('@vrp/lib/lib.lua') then
        --     _Citizen[k] = v
        -- else
            error 'Ei espertinho, o que voce ta tentando fazer?'
        --end
    end,
    __metatable = 'SAI DAQUI, TA DOIDAO?'
})

if IsServer then
    local _os = os
    setmetatable(os, {
        __index = function(t,k)
            return _os[k]
        end,
        __newindex = function(t,k,v)
            error 'Ei espertinho, o que voce ta tentando fazer?'
        end,
        __metatable = 'SAI DAQUI, TA DOIDAO?'
    })
    
end

local _json = json
setmetatable(json, {
    __index = function(t,k)
        return _json[k]
    end,
    __newindex = function(t,k,v)
        error 'Ei espertinho, o que voce ta tentando fazer?'
    end,
    __metatable = 'SAI DAQUI, TA DOIDAO?'
})

Citizen.l_CreateThread = {}
local _Citizen = Citizen
setmetatable(Citizen, {
    __index = function(t,k)
        return _Citizen[k]
    end,
    __newindex = function(t,k,v)
        -- if debug.traceback():find('@vrp/lib/lib.lua') then
        --     _Citizen[k] = v
        -- else
            error 'Ei espertinho, o que voce ta tentando fazer?'
       -- end
    end,
    __metatable = 'SAI DAQUI, TA DOIDAO?'
})

IsServer  = IsDuplicityVersion()
config    = {}

config.debug       = GetConvarInt('nfw_debug', 0) == 1
config.markerDebug = GetConvarInt('nfw_marker_debug', 0) == 1
config.framework   = GetConvar('nfw_framework', "nyofw")
config.protection  = GetConvarInt("nfw_protection", 0) == 1

string.split = function (inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[#t + 1] = str
    end
    return t
end

table.compare = function (t1, t2)
    for k,v in pairs(t1) do
        local _v = type(t1[k])
        local _v2 = type(t2[k])
        if _v == _v2 then
            if _v == "table" then
                if not table.compare(v, t2[k]) then
                    return false
                end
            else
                if t2[k] ~= v then
                    return false
                end
            end
        else
            return false
        end
    end
    return true
end

table.clone = function(t1)
    local t2 = {}
    for k,v in pairs(t1) do
        if type(v) == "table" and k ~= '_G' and k ~= '_ENV' and k ~= 'Citizen' then
            t2[k] = table.clone(v)
        else
            t2[k] = v
        end
    end
    return t2
end

table.removeFunctions = function(t1)
    local t2 = {}
    for k,v in pairs(t1) do
        local vtype = type(v)
        if vtype == 'table' then
            t2[k] = table.removeFunctions(v)
        elseif vtype ~= 'function' then
            t2[k] = v
        end
    end
    return t2
end

table.merge = function(t1,t2)
    local t3 = {}
    for k,v in pairs(t2) do
        t3[k] = v
    end
    for k,v in pairs(t1) do
        t3[k] = v
    end
    return t3
end

if IsServer then
    config.token = GetConvar('nfw_token','')
    config.port = GetConvar('nfw_port','')
end


--- ================================================================================================ ---
--- [ Console ] ==================================================================================== ---
--- ================================================================================================ ---

console = {}
local Console = {}

local consoleDebugLang = {
    ['pt-BR'] = {

    },
    ['en-US'] = {
        
    }
}

--- @param message: string
Console.debug = function(message)
    if config.debug then
        print('^3[ DEBUG ] ^7'..message)
    end
end

--- @param table: table
--- @param tabpos?: number
Console.table = function(table, tabpos)
    tabpos = tabpos or 0
    local tab = ''
    local spaceamount = 0
    for i = 1, tabpos do
        tab = tab..'\t'
    end
    for k,v in pairs(table) do
        local _k = #tostring(k)
        if _k > spaceamount then
            spaceamount = _k
        end
    end
    for k,v in pairs(table) do
        local _k = #tostring(k)
        local space = ''
        for i = 1, spaceamount - _k do
            space = space..' '
        end
        if type(v) == 'table' then
            Console.table(v, tabpos + 1)
        end
    end
    print()
end

setmetatable(console, {
    __index = function(t,k)
        return Console[k]
    end,

    __newindex = function()
        return false
    end,
    __metatable = 'SAI DAQUI, TA DOIDAO?'
})

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

--- ================================================================================================ ---
--- [ Tokens ] ===================================================================================== ---
--- ================================================================================================ ---


token = {}
local letters = {'a', 'b', 'c', 'd', 'e','f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '%', '~', '/', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', [0] = '$', '*', 'A', 'B', 'C', 'D', 'E','F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'}
local _letters = {}
for k,v in pairs(letters) do
    _letters[v] = k
end
local generated_codes = {}
local Token = {}

function Token.generate(parts, qtd)
    parts = parts or 4
    qtd = qtd or 5
    local token = ""
    for part = 1, parts do
        local str = ''
        for i = 1, qtd do
            local index = math.random(#letters)
            str = str .. letters[index]
        end
        token = token .. (part == 1 and '' or '-')..str
    end
    if generated_codes[token] then
        return generate_token(parts, qtd)
    end
    generated_codes[token] = true
    return token
end

function Token.stringEncrypt(nstr, key)
    local str = ""
    for i = 1, #nstr do
        if _letters[nstr:sub(i, i)] then
            str = str..nstr:sub(i, i)
        end
    end
    local _key = #key
    local _str = #str
    local res = ""
    for i = _key, 1, -1 do
        for i2 = _str, 1, -1 do
            local letter = _letters[str:sub(i2, i2)] * i * i2
            if letter > #letters then
                letter = letter % #letters
            end
            res = res..letters[letter]
        end
    end
    return res
end

function Token.stringDecrypt(str, key)
    local _key = #key
    local _str = #str

    local res = ''

    local i = 1
    for i2 = 1, _str / _key do
        i2 = _str - i2 + 1
        local index = (_str / _key * ( i - 1 )) + i2
        local letter = i * i2
        if letter > #letters then
            letter = letter % #letters
        end
        for k,v in pairs(_letters) do
            local a = v * i * i2
            if a > #letters then
                a = a % #letters
            end
            if letters[a] == str[letter] then
                res = res .. k
            end
        end
    end
    return res
end

setmetatable(token, {
    __index = function(t,k)
        return Token[k]
    end,
    
    __newindex = function()
        return false
    end,

    __call = function(t, ...)
        return token.generate(...)
    end,
    __metatable = 'SAI DAQUI, TA DOIDAO?'
})

--- ================================================================================================ ---
--- [ NyO Modules ] ================================================================================ ---
--- ================================================================================================ ---

NyoFw                     = {}
Nfw                = {}
NfwCoords          = {}
NfwConfigs         = {}
local NfwCommands  = {}
NfwGlobalFunctions = {}
-- local nfw_coords = {}
-- local nfw_configs = {}
local NfwFunctions    = {}
local registered_modules     = {}
local registered_nfw = {}
local registered_modules_cfg = {}
local nyo_enabled_modules    = {}
local nfw_functions  = {}
local active_modules = {}
local modules_languages = {}
local current_language = 'pt-BR'
local module_ready = false
local pending_module_on_ready_functions = {}
local module_events_ids = {}
local on_stop_events = {}
local nfw_last_caller

--- @param code: function -- module code
nfw_functions.registerModule = function(dependencies, waitModuleLoad, code)
    local _code_type = type(code)

    if _code_type ~= 'function' and _code_type ~= 'table' then
        error 'Second param should be a function'
    end

    local code_info = _code_type ~= 'table' and debug.getinfo(code)
    local module = code_info and code_info.source:gsub('%@@nfw/modules/', ''):gsub('%/'..(IsServer and 'server' or 'client')..'.lua','') or nfw_last_caller

    if module:find('nyo_') then
        error('Unknown error while loading module '..module)
    end

    console.debug('Registering module '..module)

    if registered_modules[module] then
        error(string.format('Module "%s" is already registered',module))
    end
    
    registered_modules[module] = { code = code, extendedCodes = {}, dependencies = dependencies or {}, waitModuleLoad = waitModuleLoad }
end

--- @param module: string -- module name
--- @param code: function -- module code
nfw_functions.registerNyoModule = function(module, version, dependencies, waitModuleLoad, code)
    if not IsServer then
        code = waitModuleLoad
        waitModuleLoad = dependencies
        dependencies = version
        version = nil
    end

    local _module_type = type(module)
    local _code_type = type(code)

    if _code_type ~= 'function' and _code_type ~= 'table' then
        error 'Second param should be a function'
    end

    if _module_type ~= 'string' then
        error 'First param should be a string'
    end

    if _code_type == 'function' then
        local code_info = debug.getinfo(code)
        local valid_src = string.format('@@nfw/modules/%s/'..(IsServer and 'server' or 'client' )..'.lua', module)

        if valid_src ~= code_info.source then
            Nfw.preventCheat()
            error 'Attempt to cheat nfw. A log is being sent to NyO. Resource will stop working.'
        end
    else
        if module ~= nfw_last_caller then
            Nfw.preventCheat()
            error 'Attempt to cheat nfw. A log is being sent to NyO. Resource will stop working.'
        end
    end

    if registered_nfw[module] then
        Nfw.preventCheat()
        error(string.format('Module "%s" is already registered',module))
    end

    console.debug('Registering NyO module '..module)

    registered_nfw[module] = { code = code, version = version, extendedCodes = {}, dependencies = dependencies or {}, waitModuleLoad = waitModuleLoad }

end

nfw_functions.extendModule = function(loadPriority, code)
    local module = Nfw.getModuleByTraceback()
    local nyo_module = module:find('nyo')

    if not code then
        code = loadPriority
        loadPriority = nil
    end

    if nyo_module then
        if not registered_nfw[module] then return end
    else
        if not registered_modules[module] then return end
    end

    table.insert(nyo_module and registered_nfw[module].extendedCodes or registered_modules[module].extendedCodes, { code = code, loadPriority = loadPriority or 0 })
end

--- @param cfg: { config = {}, locs = {}, functions = {} }
nfw_functions.registerConfig = function(cfg)
    if type(cfg) ~= 'table' then
        error 'First parameter should be table'
    end

    local module = Nfw.getModuleByTraceback()

    if registered_modules_cfg[module] then
        error 'Module config is already registered'
    end

    console.debug('Registering module config '..module)

    registered_modules_cfg[module] = cfg
end

nfw_functions.registerFunctions = function(framework, object)
    local module = Nfw.getModuleByTraceback()
    local _framework = type(framework)
    local _object = type(object)

    if ( not object and _framework ~= 'function' ) or ( not object and not framework ) or ( object and _framework ~= 'string' and _object ~= 'table' and _object ~= 'function') then
        error 'Invalid parameters'
    end

    if module:find('@nfw') then
        local traceback = debug.traceback()
        object = framework
        framework = traceback:gsub('(.*)functions/',''):gsub('/'..(IsServer and 'server' or 'client')..'.lua(.*)', '')
        if framework == config.framework then
            console.debug('Registering global functions')
            local result = object()
            NfwGlobalFunctions = result
        end
    else
        if framework == config.framework then
            console.debug('Registering module "'..module..'" functions')
            if _object == 'function' then
                local result = object()
                NfwFunctions[module] = result
            else
                NfwFunctions[module] = object                
            end
        end
    end
end

nfw_functions.getModuleFunctions = function()
    local module = Nfw.getModuleByTraceback()
    return NfwFunctions[module]
end

if IsServer then
    nfw_functions.checkPermission = function(user_id, perm)
        if not perm or perm == "" then
            return true
        end
        if type(perm) == "table" then
            for k,v in pairs(perm) do
                if NyoFw.hasPermission(user_id, v) then
                    return true
                end
            end
            return false
        end
        return NyoFw.hasPermission(user_id, perm)
    end

else

    nfw_functions.checkPermission = function(perm)
        if not perm or perm == "" then
            return true
        end
        return RPC.trigger("checkPermission", perm)
    end

end

-- on_stop_events

nfw_functions.onModuleStop = function(module, func)
    if not on_stop_events[module] then on_stop_events[module] = {} end
    on_stop_events[module][#on_stop_events[module] + 1] = func
end

nfw_functions.loadModules = function(scripts, validToken)
    local modulesForLoad = {}
    for module, module_info in pairs(registered_modules) do        
        if config.custom_modules[module] then
            console.debug('Starting module '..module)
            active_modules[module] = {}
            if registered_modules_cfg[module] then
                local cfg = registered_modules_cfg[module]
                if cfg.config then
                    for k,v in pairs(cfg.config) do
                        NfwConfigs[k] = v
                        NfwConfigs[k].type = module
                        NfwConfigs[k].input = module
                    end
                end
                if cfg.commands and not IsServer then
                    NfwCommands[module] = {}
                    for k,v in pairs(cfg.commands) do
                        NfwCommands[module][#NfwCommands[module] + 1] = v
                    end
                end
                if cfg.locs then
                    for k,v in pairs(cfg.locs) do
                        if config.markerDebug then
                            console.debug('^3[ MARKER ]^7 Loading coords '..v.coord..' | '..v.config)
                        end
                        NfwCoords[#NfwCoords + 1] = v
                    end
                end
            end
            module_events_ids[module] = {}
            local _RegisterNetEvent = RegisterNetEvent
            local _AddEventHandler = AddEventHandler
            local RegisterNetEvent = function(event, func)
                if func then
                    local eventData = RegisterNetEvent(event, func)
                    module_events_ids[module][#module_events_ids[module] + 1] = eventData
                    return eventData
                end
            end
            local AddEventHandler = function(event, func)
                local eventData = RegisterNetEvent(event, func)
                module_events_ids[module][#module_events_ids[module] + 1] = eventData
                return eventData
            end
            table.insert(modulesForLoad, {module, module_info})
        end
    end
    
    for module, module_info in pairs(registered_nfw) do
        local allowed = true

        if allowed and config.modules[module] then
            active_modules[module] = {version = module_info.version}
            console.debug('Starting NyO module '..module)

            if registered_modules_cfg[module] then
                local cfg = registered_modules_cfg[module]
                if cfg.config then
                    for k,v in pairs(cfg.config) do
                        NfwConfigs[k] = v
                        NfwConfigs[k].type = module
                        NfwConfigs[k].input = module
                    end
                end
                if cfg.commands and not IsServer then
                    NfwCommands[module] = {}
                    for k,v in pairs(cfg.commands) do
                        NfwCommands[module][#NfwCommands[module] + 1] = v
                    end
                end
                if cfg.locs then
                    for k,v in pairs(cfg.locs) do
                        if config.markerDebug then
                            console.debug('^3[ MARKER ]^7 Loading coords '..v.coord..' | '..v.config)
                        end
                        NfwCoords[#NfwCoords + 1] = v
                    end
                end
                if cfg.functions then
                    NfwFunctions[module] = {}
                    for k,v in pairs(cfg.functions) do
                        NfwFunctions[module][k] = v
                    end
                end
            end
            module_events_ids[module] = {}
            local _RegisterNetEvent = RegisterNetEvent
            local _AddEventHandler = AddEventHandler
            local RegisterNetEvent = function(event, func)
                if func then
                    local eventData = RegisterNetEvent(event, func)
                    module_events_ids[module][#module_events_ids[module] + 1] = eventData
                    return eventData
                end
            end
            
            local AddEventHandler = function(event, func)
                local eventData = RegisterNetEvent(event, func)
                module_events_ids[module][#module_events_ids[module] + 1] = eventData
                return eventData
            end
            table.insert(modulesForLoad, {module, module_info})
        end
    end
    local loadOrder = {}
    local loadedDependencies = {}
    local inLoadOrder = {}
    local function loadDependencies(module, module_info, n)
        for l,w in pairs(module_info.dependencies) do
            for n2, module2 in pairs(modulesForLoad) do
                if module2[1] == w then
                    if not loadedDependencies[w] then
                        loadedDependencies[w] = true
                        loadDependencies(module2[1], module2[2], n2)
                    end
                    if not inLoadOrder[w] then
                        table.insert(loadOrder, n2)
                    end
                end
            end
        end
        if not inLoadOrder[module] then
            table.insert(loadOrder, n)
            inLoadOrder[module] = true
        end
    end
    for k,v in pairs(modulesForLoad) do
        loadDependencies(v[1],v[2], k)
    end
    for k,v in pairs(loadOrder) do
        local module_name = modulesForLoad[v][1]
        local module_info = modulesForLoad[v][2]
        if IsServer then
            local db_installed = GetResourceKvpInt('nfw_'..module_name..'_db_installed')
            if db_installed ~= 1 then
                local db = LoadResourceFile('nfw', 'modules/'..module_name..'/database.sql')
                if db then
                    local queries = db:split(';')
                    for k,v in pairs(queries) do
                        NyoFw.querySync(v, {})
                    end
                    SetResourceKvpInt('nfw_'..module_name..'_db_installed', 1)
                end
            end
        end
        local f = function ()
            module_info.code()
            table.sort(module_info.extendedCodes, function(a,b)
                return a.loadPriority > b.loadPriority
            end)
            for k,v in pairs(module_info.extendedCodes) do
                v.code()
            end
        end
        if not module_info.waitModuleLoad then CreateThread(f)
        else f() end
    end
    registered_modules     = {}
    registered_nfw = {}
    registered_modules_cfg = {}
    module_ready = true
    for k, v in pairs(pending_module_on_ready_functions) do
        v()
    end
    pending_module_on_ready_functions = {}
end

RegisterCommand("nfw:reinstalldb", function(source, args)
    if source ~= 0 then return end
    local function reinstall(module_name)
        DeleteResourceKvp('nfw_'..module_name..'_db_installed')
        local db = LoadResourceFile('nfw', 'modules/'..module_name..'/database.sql')
        if db then
            local queries = db:split(';')
            for k,v in pairs(queries) do
                NyoFw.querySync(v, {})
            end
            SetResourceKvpInt('nfw_'..module_name..'_db_installed', 1)
        end  
    end
    if not args[1] then
        local activeModules = Nfw.getActiveModules()
        for k,v in pairs(activeModules) do
            reinstall(k)
        end
    else
        reinstall(args[1])  
    end
end,true)

nfw_functions.isModuleActive = function(module)
    return active_modules[module]
end

nfw_functions.getActiveModules = function()
    local res = {}
    for k,v in pairs(active_modules) do
        if v then
            res[k] = v
        end
    end
    return res
end

if not IsServer then

    local modules_languages = {}
    local current_language

    local function onLanguageUpdate(oldLanguage, newLanguage)
        modules_languages = {}
        for module,_ in pairs(Nfw.getActiveModules()) do
            modules_languages[module] = json.decode(LoadResourceFile('nfw', 'modules/'..module..'/lang/'..newLanguage..'.json')) or {}
        end
    end

    CreateThread(function()
        Nfw.onReady(function()
            nfw_functions.setCurrentLanguage(GetResourceKvpString('nfw_lang') or config.defaultLanguage or 'pt-BR')
            modules_languages = {}
            for module,_ in pairs(Nfw.getActiveModules()) do
                modules_languages[module] = json.decode(LoadResourceFile('nfw', 'modules/'..module..'/lang/'..current_language..'.json')) or {}
            end
        end)
    end)

    nfw_functions.setCurrentLanguage = function(language)
        SetResourceKvp('nfw_lang', language)
        onLanguageUpdate(current_language, language)
        current_language = language
        SendNUIMessage({
            action = "setLanguage",
            language = current_language
        })
    end
    
    nfw_functions.getModuleLanguage = function(_module)
        local module = _module or Nfw.getModuleByTraceback()
        return setmetatable({}, {
            __index = function(t,k)
                return modules_languages[module][k] or ''
            end,           
            __newindex = function(t,k,v)
                return false
            end
        })
    end
    
end

nfw_functions.preventCheat = function(err)
    print(err)
end                                          

nfw_functions.getModuleByTraceback = function()
    local traceback = debug.traceback()
    local module = traceback:gsub('(.*)@nfw/modules/',''):gsub('/(.*)','')
    if module:find('@nfw') and traceback:find('citizen:/scripting/lua/scheduler.lua:507: in function <citizen:/scripting/lua/scheduler.lua:506>') then
        module = nfw_last_caller
        nfw_last_caller = nil
    end
    return module
end

nfw_functions.isReady = function()
    return module_ready
end

nfw_functions.onReady = function(func)
    if Nfw.isReady() then
        CreateThread(func)
    else
        pending_module_on_ready_functions[#pending_module_on_ready_functions + 1] = func
    end
end

exports("isReady", nfw_functions.isReady)
exports("onReady", nfw_functions.onReady)
exports("addCoords", function(coordsInfo)
    local index = #NfwCoords + 1
    NfwCoords[index] = coordsInfo
    return index
end)
exports("remCoords", function(coordsIndex)
    if coordsIndex then
        if NfwCoords[coordsIndex] then
            NfwCoords[coordsIndex] = nil
            return true
        end
    end
    return false
end)

nfw_functions.registerCommand = function(func)
    local module = Nfw.getModuleByTraceback()
    local commands = NfwCommands[module]
    if not commands then return end
    for k,v in pairs(commands) do
        RegisterCommand(v.command, function(source, args, rawC)
            local ped = IsServer and GetPlayerPed(source) or plyPed
            local cds = GetEntityCoords(ped)
            local allowed
            if v.coords then
                for l,w in pairs(v.coords) do
                    if #(cds - w[1]) < w[2] then
                        allowed = true
                        break
                    end
                end
            elseif v.coord then
                if #(cds - v.coord) < v.distance then
                    allowed = true
                end
            elseif not IsServer and v.interiors then
                for l,w in pairs(v.interiors) do
                    if GetInteriorAtCoords(plyCoords) == w then
                        allowed = true
                        break
                    end
                end
            elseif not IsServer and v.interior then     
                if GetInteriorAtCoords(plyCoords) == v.interior then
                    allowed = true
                end
            else 
                allowed = true
            end
            if allowed then
                local config = NfwConfigs[v.config]
                if IsServer then
                    local user_id = NyoFw.getCharId(source)
                    if Nfw.checkPermission(user_id, config.perm) then            
                        func(source, v)
                    end
                else
                    if Nfw.checkPermission(config.perm) then
                        func(v)
                    end
                end
            end
        end)
    end
    NfwCommands[module] = {}
end

nfw_functions.registerEvent = function(eventFunction)

end

RegisterNetEvent('nfw:openModule', function(module)
end)

setmetatable(Nfw, {

    __index = function(t, k)
        local blocked_src_functions = {--[[  ['loadModules'] = true ]] }

        if blocked_src_functions[k] then
            local traceback = debug.traceback()           
            if not traceback:find(IsServer and '@nfw/nyo_module_sv.lua' or '@nfw/lib/client.lua') then
                error('Not allowed to execute this function')
            end
        end

        return nfw_functions[k] or function() end
    end,

    __newindex = function(t,k)
        return false
    end,

    __call = function()

    end,
    __metatable = 'SAI DAQUI, TA DOIDAO?'

})

exports('getFunction', function(v, fn)
    if GetInvokingResource() ~= 'nfw' then
        error('Not allowed to get this function')
        return
    end
    return _G[v][fn]
end)

exports('setLastCaller', function(m)
    nfw_last_caller = m
end)

-- if IsServer then
--     GlobalState['ريزيتس حار حقًا ونيو به وحدة رائعة passa nem wifi aqui viu !'] = token()
-- end

--- ================================================================================================ ---
--- [ Tunnel Events ] ============================================================================== ---
--- ================================================================================================ ---

SafeEvents = {}
RPC        = {}

local RegisterEvent = RegisterNetEvent
local rpc = {}
local safe_events   = {}
local safe_handlers = {}
local rpc_handlers  = {}
local rpc_requests  = {}
local registered_stop_events = {}
local registered_stop_rpc = {}

if IsServer then

    RegisterNetEvent('nfw:safe_events', function(info, ...)
        -- console.table({info, params})
        local params = {...}
        local source = source
        local player = Player(source).state
        local token, name = info.token, info.name
        local _token = source..GetPlayerName(source)..NetworkGetNetworkIdFromEntity(GetPlayerPed(source))
        local safe_token = Token.stringEncrypt(_token, 'nfw')
        console.debug('^3[ SAFE EVENTS ] ^7 Received event '..name.. ' from '..source)
        if config.debugSpecial then
            console.table({info, params}, 1)
        end
        if safe_token == token  then
            if safe_handlers[name] then
                for k,v in pairs(safe_handlers[name]) do
                    CreateThread(function()
                        if v then
                            v(source, table.unpack(params))
                        end
                    end)
                end
            end
        else
            console.debug('^3[ SAFE EVENTS ] ^7 Invalid token. Event: '..name.. ' | Source: '..source)
        end
    end)

    safe_events.triggerClient = function(name, src, ...)
        console.debug('^3[ SAFE EVENTS ] ^7 Triggering client event '..name..' | '..src)
        if src == -1 then
            for k,v in pairs(GetPlayers()) do
                local ply = Player(v).state
                TriggerClientEvent('nfw:safe_events', v, { name = name, token = ply['ريزيتس حار حقًا ونيو به وحدة رائعة passa nem wifi aqui viu !']}, {...} )
            end
        else
            local ply = Player(src).state
            TriggerClientEvent('nfw:safe_events', src, { name = name, token = ply['ريزيتس حار حقًا ونيو به وحدة رائعة passa nem wifi aqui viu !']}, {...} )
        end
    end

else
    
    RegisterNetEvent('nfw:safe_events', function(info, params)
        local player = LocalPlayer.state
        local token, name = info.token, info.name
        console.debug('^3[ SAFE EVENTS ] ^7 Received event '..name)
        if config.debugSpecial then
            console.table({info, params}, 1)
        end
        if token == LocalPlayer.state['ريزيتس حار حقًا ونيو به وحدة رائعة passa nem wifi aqui viu !'] then
            if safe_handlers[name] then
                for k,v in pairs(safe_handlers[name]) do
                    CreateThread(function()
                        if v then
                            v(table.unpack(params))
                        end
                    end)
                end
            end
        else        
            console.debug('^3[ SAFE EVENTS ] ^7 Invalid token. Event: '..name)
        end
    end)

    safe_events.triggerServer = function(name, ...)
        local params = {...}
        CreateThread(function()
            while PlayerPedId() == 0 do
                Wait(100)
            end
            local plyId = PlayerId()
            local _token = GetPlayerServerId(plyId)..GetPlayerName(plyId)..NetworkGetNetworkIdFromEntity(PlayerPedId())
            local safe_token = Token.stringEncrypt(_token, 'nfw')
            console.debug('^3[ SAFE EVENTS ] ^7 Triggering server event '..name)
            TriggerServerEvent('nfw:safe_events', { name = name, token = safe_token }, table.unpack(params))
        end)
    end

end

safe_events.register = function(name, handler)
    if not safe_handlers[name] then
        safe_handlers[name] = {}
    end
    local id = #safe_handlers[name] + 1
    safe_handlers[name][id] = handler
    local module = Nfw.getModuleByTraceback()
    if module ~= "@nfw" then
        if not registered_stop_events[module] then
            console.debug('^3[ SAFE EVENTS ] ^7 Registering event '..name)
            registered_stop_events[module] = {}
            registered_stop_events[module][#registered_stop_events[module] + 1] = {name = name, id = id}
            Nfw.onModuleStop(module, function()
                for k,v in pairs(registered_stop_events[module]) do
                    SafeEvents.remove(v.name, v.id)
                end
                registered_stop_events[module] = nil
            end)
        else
            registered_stop_events[module][#registered_stop_events[module] + 1] = {name = name, id = id}
        end
    end
    return id
end

safe_events.remove = function(name, id)
    if name and safe_handlers[name] and id then
        console.debug('^3[ SAFE EVENTS ] ^7 Removing event '..name)
        safe_handlers[name][id] = nil
    end
end

setmetatable(SafeEvents, {
    __index = function(t,k)
        return safe_events[k]
    end,

    __newindex = function(t,k,v)
        return false
    end,

    __call = function(t, ...)

    end,
    __metatable = 'SAI DAQUI, TA DOIDAO?'

})

rpc.addHandler = function(name, func)
    if not rpc_handlers[name] then
        local module = Nfw.getModuleByTraceback()
        if module ~= "@nfw" then
            if not registered_stop_rpc[module] then
                registered_stop_rpc[module] = {}
                registered_stop_rpc[module][#registered_stop_rpc[module] + 1] = name
                Nfw.onModuleStop(module, function()
                    for k,v in pairs(registered_stop_rpc[module]) do
                        RPC.removeHandler(v)
                    end
                    registered_stop_rpc[module] = nil
                end)
            else
                registered_stop_rpc[module][#registered_stop_rpc[module] + 1] = name
            end
        end
        rpc_handlers[name] = func
    end
end

rpc.removeHandler = function(name)
    rpc_handlers[name] = nil
end

if IsServer then
    rpc.triggerCallback = function(name, cb, src, ...)
        console.debug('^3[ RPC ] ^7 Triggering callback '..name..' | '..src)
        local id = #rpc_requests + 1
        rpc_requests[id] = { callback = cb }
        SafeEvents.triggerClient('nyo_module:rpc:request', src, { name = name, id = id }, ...)
    end

    rpc.trigger = function(name, src, ...)
        local id = #rpc_requests + 1
        local p = promise.new()
        rpc_requests[id] = { promise = p }
        SafeEvents.triggerClient('nyo_module:rpc:request', src, { name = name, id = id }, ...)
        local res = Citizen.Await(p)
        if res.err then
            error(res.err)
        end
        return table.unpack(res)
    end

    SafeEvents.register('nyo_module:rpc:request', function(src, info, ...)
        local name, id = info.name, info.id
        if rpc_handlers[name] then
            SafeEvents.triggerClient('nyo_module:rpc:response', src, info, rpc_handlers[name](src, ...))
        else
            info.err = 'Invalid request name'
            SafeEvents.triggerClient('nyo_module:rpc:response', src, info)
        end
    end)

    SafeEvents.register('nyo_module:rpc:response', function(src, info, ...)
        local name, id, err = info.name, info.id, info.err
        if rpc_requests[id] then
            local callback, promise = rpc_requests[id].callback, rpc_requests[id].promise
            if err then
                if callback then
                    error(err)
                end
                if promise then
                    promise:resolve(info)
                end
            else
                if callback then
                    return callback(...)
                end
                if promise then
                    promise:resolve({...})
                end
            end
        else
            error('RPC request with id '..id..' not found')
        end
    end)

else
    rpc.triggerCallback = function(name, cb, ...)
        local id = #rpc_requests + 1
        rpc_requests[id] = { callback = cb }
        SafeEvents.triggerServer('nyo_module:rpc:request', { name = name, id = id }, ...)
    end

    rpc.trigger = function(name, ...)
        local id = #rpc_requests + 1
        local p = promise.new()
        rpc_requests[id] = { promise = p }
        SafeEvents.triggerServer('nyo_module:rpc:request', { name = name, id = id }, ...)
        local res = Citizen.Await(p)
        if res.err then
            error(res.err)
        end
        return table.unpack(res)
    end

    SafeEvents.register('nyo_module:rpc:request', function(info, ...)
        local name, id = info.name, info.id
        if rpc_handlers[name] then
            SafeEvents.triggerServer('nyo_module:rpc:response', info, rpc_handlers[name](...))
        else
            info.err = 'Invalid request name'
            SafeEvents.triggerServer('nyo_module:rpc:response', info)
        end
    end)

    SafeEvents.register('nyo_module:rpc:response', function(info, ...)
        local name, id, err = info.name, info.id, info.err
        if rpc_requests[id] then
            local callback, promise = rpc_requests[id].callback, rpc_requests[id].promise
            if err then
                if callback then
                    error(err)
                end
                if promise then
                    promise:resolve(info)
                end
            else
                if callback then
                    return callback(...)
                end
                if promise then
                    promise:resolve({...})
                end
            end
        else
            error('RPC request with id '..id..' not found')
        end
    end)
end

setmetatable(RPC, {
    __index = function(t,k)
        return rpc[k]
    end,

    __newindex = function(t,k,v)
        return false
    end,

    __call = function(t, ...)

    end,
    __metatable = 'SAI DAQUI, TA DOIDAO?'

})

RPC.addHandler('checkPermission', function(source, perm)
    local user_id = NyoFw.getCharId(source)
    return Nfw.checkPermission(user_id, perm)
end)


_RegisterCommand = RegisterCommand
    
RegisterCommand = function(command, func)
    _RegisterCommand(command, function(s,args,rawC)
        console.debug('Command executed: '..command..' by '..(s == 0 and 'console' or GetPlayerName(s))..' | '..s)
        if config.debugSpecial then
            console.table(args)
        end
        func(s,args,rawC)
    end)
end

function table.maxn(t)
	local max = 0
	for k,v in pairs(t) do
		local n = tonumber(k)
		if n and n > max then max = n end
	end
	return max
end

local function wait(self)
	local rets = Citizen.Await(self.p)
	if not rets then
		rets = self.r 
	end
	return table.unpack(rets,1,table.maxn(rets))
end

local function areturn(self, ...)
	self.r = {...}
	self.p:resolve(self.r)
end

function async(func)
	if func then
		Citizen.CreateThreadNow(func)
	else
		return setmetatable({ wait = wait, p = promise.new() }, { __call = areturn })
	end
end