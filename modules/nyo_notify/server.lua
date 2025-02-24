local module = 'nyo_notify'
local traceback = debug.traceback()
local valid_traceback = string.format('@nfw/modules/%s/server.lua', module)

if traceback:find(valid_traceback) then
    Nfw.registerNyoModule(module, "1.0.1", {"nyo_core"}, false, function()
        local requests = {}
        local prompts = {}

        NyoFw.request = function(source, text, time)
            local r = async()
            local id = NyoFw.generateId()
            local request = { source = source, cb_ok = r, done = false }
            requests[id] = request
            
            SafeEvents.triggerClient("nfw:notify:request", source, id, text, time)
        
            SetTimeout(time*1000,function()
                if not request.done then
                    request.cb_ok(false)
                    NyoFw.removeId(id)
                    requests[id] = nil
                end
            end)
            return r:wait()
        end
        exports('request', NyoFw.request) 

        SafeEvents.register("nfw:notify:requestCallback", function(source, type, id)
            local id = tonumber(id)
            local request = requests[id]
            if request and request.source == source then
                local ok = false 
                if type == 'accept' then ok = true end
                request.done = true
                request.cb_ok(ok)
                NyoFw.removeId(id)
                requests[id] = nil
            end
        end)

        NyoFw.prompt = function(source, title, text)
            local r = async()
            prompts[source] = r
            SafeEvents.triggerClient("nfw:prompt", source, title, text)
            return r:wait()
        end
        exports('prompt', NyoFw.prompt)

        SafeEvents.register("nfw:prompt:callback", function(source, text)
            if text == nil then
                text = ""
            end
        
            local prompt = prompts[source]
            if prompt ~= nil then
                prompts[source] = nil
                prompt(text)
            end
        end)
    end)
else
    error 'Module name has been modified'
    Nfw.preventCheat()
end