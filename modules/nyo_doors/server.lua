local module = 'nyo_doors'
local traceback = debug.traceback()
local valid_traceback = string.format('@nfw/modules/%s/server.lua', module)

if traceback:find(valid_traceback) then
    Nfw.registerNyoModule(module, "1.0.1", {"nyo_core"}, false, function()

        local configIndiv = {}
        local moduleConfigs = {}
        for k,v in pairs(NfwConfigs) do
            if v.type == 'nyo_doors' then
                moduleConfigs[k] = true
            end
        end
        for k,v in pairs(NfwCoords) do
            if moduleConfigs[v.config] then
                configIndiv[v.id] = {id = v.id, coord = v.coord, model = v.hash, group = v.group, lock = v.lock, text = v.drawText, config = v.config, distance = v.distance}
            end
        end
        moduleConfigs = nil

        RPC.addHandler('nfw:doors:getConfig',  function()
            return configIndiv
        end)

        RPC.addHandler('nfw:doors:requestItem',  function(src, cIndex, status)
            local cfgDoor = configIndiv[cIndex]            
            local doorCfg = status and cfgDoor.dataOpen or cfgDoor.dataClose
            local ret = false 
            local charId = NyoFw.getCharId(src)
            if doorCfg.requestItem then 
                if NyoFw.getInventoryItemAmount(charId, doorCfg.item.index) >= doorCfg.item.qtd then 
                    if doorCfg.removeItem then 
                        ret =  NyoFw.tryGetInventoryItem(charId, doorCfg.item.index, doorCfg.item.qtd)
                    else 
                        ret = true
                    end
                end
            else 
                ret = true
            end

            return ret
        end)

        SafeEvents.register('nyo_module:OpenDoor', function(src, id)                            
            local cfgDoor = configIndiv[id]
            local doorGroup = cfgDoor.group 
            cfgDoor.lock = not cfgDoor.lock 
            if NfwConfigs[cfgDoor.config].autoClose then 
                cfgDoor.time = NfwConfigs[cfgDoor.config].autoCloseTime
            end
            for k,v in pairs(configIndiv) do 
                if k ~= id then 
                    local cfgDoor2 = configIndiv[k]
                    if cfgDoor2.group == doorGroup and doorGroup ~= '' then 
                        cfgDoor2.lock = not cfgDoor2.lock
                        if NfwConfigs[cfgDoor2.config].autoClose then 
                            cfgDoor2.time = NfwConfigs[cfgDoor2.config].autoCloseTime
                        end
                    end                                    
                end
            end
            
            SafeEvents.triggerClient('nyoModule:UpdateDoorStatus', tonumber("-1"), id, true, cfgDoor.lock)
        end)


        CreateThread(function()
            while true do
                for k,v in pairs(configIndiv) do 
                    if v.time then 
                        configIndiv[k].time = configIndiv[k].time - 1
                        if configIndiv[k].time <= 0 then 
                            configIndiv[k].lock = true 
                            configIndiv[k].time = nil 
                            SafeEvents.triggerClient('nyoModule:UpdateDoorStatus', tonumber("-1"), k, false)
                        end
                    end
                end
                Wait(60000)
            end
        end)
    end)
else
    error 'Module name has been modified'
    Nfw.preventCheat()
end