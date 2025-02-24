local module = 'nyo_homeschest'
local traceback = debug.traceback()
local valid_traceback = string.format('@nfw/modules/%s/server.lua', module)

if traceback:find(valid_traceback) then
    Nfw.registerNyoModule(module, "1.0.0", {"nyo_core", "nyo_homes"}, false, function()

        NyoFw.prepare('homes/getHomeVaultPerm', 'SELECT * FROM nyo_homes_permission WHERE homes_id = @id AND charId = @charId AND vault = 1')

        RPC.addHandler("nfw:homeChest:validHome", function(src, id)
            local charId = NyoFw.getCharId(src)
            if charId then 
                local data = NyoFw.querySync("homes/getHomeVaultPerm", {id = id, charId = charId})    
                if data[1] then 
                    return true
                end
            end 
            return false
        end)
    end)
else
    error 'Module name has been modified'
    Nfw.preventCheat()
end