local module = 'nyo_spawn'
local traceback = debug.traceback()
local valid_traceback = string.format('@nfw/modules/%s/server.lua', module)

if traceback:find(valid_traceback) then
    Nfw.registerNyoModule(module, "1.0.0", {"nyo_core"}, false, function()
    local spawnConfig = NfwConfigs['spawnConfig']
    local module_funcs = Nfw.getModuleFunctions()

    RPC.addHandler('nfw:spawn:getLocations', function(src)
        local user_id = NyoFw.getCharId(src)
        local spawnLocs = {}

        if spawnConfig.enableHouse then 
            local houseConfig = module_funcs.getHomes(src, user_id)
            for k,v in pairs(houseConfig) do 
                spawnLocs[k] = v
            end
        end

        for k,v in pairs(spawnConfig.spawnLocs) do 
            if not v.perm or v.perm == '' or NyoFw.hasPermission(user_id, v.perm) then                
                spawnLocs[k] = v
            end
        end

        return spawnLocs
    end)
        

    end)
else
    error 'Module name has been modified'
    Nfw.preventCheat()
end