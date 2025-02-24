local module = 'nyo_hud'
local traceback = debug.traceback()
local valid_traceback = string.format('@nfw/modules/%s/server.lua', module)

if traceback:find(valid_traceback) then
    Nfw.registerNyoModule(module, "1.0.0", {"nyo_core"}, false, function()

        NyoFw.setHunger = function(src, value)
            if src and value then 
                local aHunger = Player(src).state.hunger
                local nHunger = aHunger + value
                if nHunger < 0 then 
                    nHunger = 0
                elseif nHunger > 100 then 
                    nHunger = 100 
                end 
                Player(src).state:set('hunger', tonumber(nHunger), true) 
            end            
        end

        NyoFw.setThirst = function(src, value)
            if src and value then 
                local aThirst = Player(src).state.thirst
                local nThirst = aThirst + value
                if nThirst < 0 then 
                    nThirst = 0
                elseif nThirst > 100 then 
                    nThirst = 100 
                end 
                Player(src).state:set('thirst', tonumber(nThirst), true) 
            end   
        end

        exports('setHunger', NyoFw.setHunger) 
        exports('setThirst', NyoFw.setThirst) 
    end)
else
    error 'Module name has been modified'
    Nfw.preventCheat()
end