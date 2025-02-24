local module = 'nyo_deathsystem'
local traceback = debug.traceback()
local valid_traceback = string.format('@nfw/modules/%s/server.lua', module)

if traceback:find(valid_traceback) then
    Nfw.registerNyoModule(module, "1.0.2", {"nyo_core"}, false, function()
        local deathConfig = NfwConfigs['configDeathSystem']
        local module_funcs = Nfw.getModuleFunctions()
       
       
        RPC.addHandler("deathsystem:ClearInventory", function(src)
            local user_id = NyoFw.getCharId(src)         
            return module_funcs.clearInventory(src, user_id)
        end)
        
        RPC.addHandler("deathsystem:checkRevive", function(src)
            local user_id = NyoFw.getCharId(src)
            if module_funcs.checkRevive(src, user_id) then 
                if NfwGlobalFunctions.tryPayment(user_id, deathConfig.reviveCost, deathConfig.paymentType) then                     
                    return true, nil
                else 
                    return false, 2
                end
            else 
                return false, 1
            end           
        end)
    end)
else
    error 'Module name has been modified'
    Nfw.preventCheat()
end