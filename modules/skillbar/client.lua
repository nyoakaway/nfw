Nfw.registerModule({}, false, function()
    NfwClient.registerInterface(1) 
    Skillbar = {}
    Skillbar.Data = {}


    Skillbar.Data = {
        Active = false,
        Data = {},
    }
    successCb = nil
    failCb = nil

    NfwClient.registerNUICallback("Check", function(data, cb)
        if successCb ~= nil then
            Skillbar.Data.Active = false            

            if data.success then
                successCb()
            else
                failCb()
                NfwClient.sendNUIMessage('skillStop', {
                })
            end
            Wait(100)
            NfwClient.closeUI()
        end
    end)

    Skillbar.Start = function(data, success, fail)
        if not Skillbar.Data.Active then
            Skillbar.Data.Active = true
            if success ~= nil then
                successCb = success
            end
            if fail ~= nil then
                failCb = fail
            end
            Skillbar.Data.Data = data

            NfwClient.openUI({
                duration = data.duration,
                pos = data.pos,
                width = data.width,
            }, false, false)

        else
            -- erro ja tem um em execução
        end
    end

    Skillbar.Repeat = function(data)
        Skillbar.Data.Active = true
        Skillbar.Data.Data = data
        
        CreateThread(function()
            Wait(500)
            NfwClient.sendNUIMessage('skillRepeat', {
                duration = Skillbar.Data.Data.duration,
                pos = Skillbar.Data.Data.pos,
                width = Skillbar.Data.Data.width,
            })
        end)
    end

    CreateThread(function()
        while true do
            if Skillbar.Data.Active then
                if IsControlJustPressed(0, 38) then
                    NfwClient.sendNUIMessage('skillCheck', {
                        data = Skillbar.Data.Data,
                    })
                end
            end
            Wait(1)
        end
    end)

    function GetSkillbarObject()
        return Skillbar
    end

    local success = false
    function skillBarStart()
        success = false
        Skillbar.Start({
            duration = math.random(800, 2000),
            pos = math.random(10, 30),
            width = math.random(10, 20),
        }, skillbarSuccess, skillbarFailed)
        while Skillbar.Data.Active do 
            Wait(2)
        end
        Wait(10)
        return success

    end
    exports('skillBarStart', skillBarStart) 

    function skillbarSuccess()
        success = true
    end

    function skillbarFailed()
        success = false
    end

    SafeEvents.register('nfw:skillbar:start', function(id, data)
        local r = skillBarStart()
		SafeEvents.triggerServer("nfw:skillbar:gameCallBack", id, r)
    end)
end)
