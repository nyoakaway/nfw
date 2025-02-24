local module = 'nyo_anim'
local traceback = debug.traceback()
local valid_traceback = string.format('@nfw/modules/%s/server.lua', module)

if traceback:find(valid_traceback) then
    Nfw.registerNyoModule(module, "1.0.1", {'nyo_core'}, false, function()
        local module_funcs = Nfw.getModuleFunctions()

        local animConfig = NfwConfigs['configAnim']

        RegisterCommand(animConfig.generalConfig.commands.animWalk, function(source, args)
            local source = source
            local user_id = NyoFw.getCharId(source)
            local anim = animConfig.walkAnim[args[1]]
            if anim then 
                if Nfw.checkPermission(user_id, anim.perm) then 
                    SafeEvents.triggerClient('anim-setWalking', source, anim.anim)
                end
            end
        end)

        RegisterCommand(animConfig.generalConfig.commands.animExpression, function(source, args)
            local source = source
            local user_id = NyoFw.getCharId(source)
            local anim = animConfig.expression[args[1]]
            if anim then 
                if Nfw.checkPermission(user_id, anim.perm) then 
                    SafeEvents.triggerClient('anim-setExpression', source, anim.anim)
                end
            end
        end)

        RegisterCommand(animConfig.generalConfig.commands.animShared, function(source, args)
            local source = source 
            local user_id = NyoFw.getCharId(source)
            local anim = animConfig.animComp[args[1]]

            if anim then 
                if Nfw.checkPermission(user_id, anim.perm) then  
                    local psource = RPC.trigger("anim-getPlayer", source)  
                    if psource and psource ~= 0 then 
                        local identify = NyoFw.getCharacterIdentity(user_id)
                        local req = NyoFw.request(psource, "Deseja fazer ["..anim.otherAnim.."] com "..identify.name..' '..identify.last_name, 15)
                        if req then 
                            SafeEvents.triggerClient('anim-setAnimShared', source, args[1])
                            SafeEvents.triggerClient('anim-setAnimShared2', psource, anim.otherAnim, source)
                        else 
                        end
                    else   
                    end
                end
            end
        end)


        RegisterCommand(animConfig.generalConfig.commands.animOther, function(source, args)
            local source = source 
            local user_id = NyoFw.getCharId(source)
            local anim = animConfig.anim[args[1]]
            if anim then 
                if Nfw.checkPermission(user_id, anim.perm) then 
                    SafeEvents.triggerClient('anim-setAnim', source, args[1])
                end
            end
        end)


        NyoFw.playAnim = function(source, u, s, l)
            SafeEvents.triggerClient("nfw:anim:playAnim", source, u, s, l)
        end 

        NyoFw.carregarObjeto = function(source, d, a, p, f, h, p1, p2, p3, p4, p5, p6)
            SafeEvents.triggerClient("nfw:anim:carregarObjeto", source, d, a, p, f, h, p1, p2, p3, p4, p5, p6)
        end

        NyoFw.deleteObject = function(source)
            SafeEvents.triggerClient("nfw:anim:deleteObject", source)
        end

        NyoFw.playAnimByName = function(source, anim)
            SafeEvents.triggerClient("nfw:anim:playAnimByName", source, anim)
        end 

        NyoFw.stopAnim = function(source, u)
            SafeEvents.triggerClient("nfw:anim:stopAnim", source, u)
        end 

        exports('playAnim', NyoFw.playAnim) 
        exports('playAnimByName', NyoFw.playAnimByName) 
        exports('carregarObjeto', NyoFw.carregarObjeto) 
        exports('deleteObject', NyoFw.deleteObject) 
        exports('stopAnim', NyoFw.stopAnim)    
    end)
else
    error 'Module name has been modified'
    Nfw.preventCheat()
end