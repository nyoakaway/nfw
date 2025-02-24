Nfw.registerModule({'nyo_core'}, false, function()
    AddEventHandler("explosionEvent",function(sender, ev)
        CancelEvent()
        print(sender)
        print(json.encode(ev))
        -- for _, v in ipairs(Config.BlockedExplosions) do
        --     if ev.explosionType == v then
        --         CancelEvent()
        --         TriggerEvent("Foxey:Automatic-ban", " Explosion protection, ", sender)
        --         return
        --     end
        -- end
    end)
end)