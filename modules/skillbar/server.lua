Nfw.registerModule({"nyo_core"}, false, function()
    local requests = {}

    NyoFw.MGSkillBar = function(source, data)
        local r = async()
        local id = NyoFw.generateId()
        local request = { source = source, cb_ok = r, done = false }
        requests[id] = request

        SafeEvents.triggerClient("nfw:skillbar:start", source, id, data)

        return r:wait()
    end
    exports('MGSkillBar', NyoFw.MGSkillBar) 

    SafeEvents.register("nfw:skillbar:gameCallBack", function(source,id,result)
        local id = tonumber(id)
        local request = requests[id]
        if request and request.source == source then            
            request.done = true
            request.cb_ok(result)
            NyoFw.removeId(id)
            requests[id] = nil
        end
    end)
end)