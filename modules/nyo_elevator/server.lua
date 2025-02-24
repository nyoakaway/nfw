local module = 'nyo_elevator'
local traceback = debug.traceback()
local valid_traceback = string.format('@nfw/modules/%s/server.lua', module)

if traceback:find(valid_traceback) then
    Nfw.registerNyoModule(module, "1.0.0", {"nyo_core"}, false, function()
        
    end)
else
    error 'Module name has been modified'
    Nfw.preventCheat()
end