Nfw.registerModule({}, false, function()
    NfwClient.registerInterface(1) 
	Lockpick = {}
	local lockpickEnable = false
	local lockSuccess = false
	local successCb = nil
    local failCb = nil

	Lockpick.Start = function(data,success, fail)
		if not lockpickEnable then 
			lockpickEnable = true
			successCb = success 
			failCb = fail
			SetNuiFocus(true,true)
			NfwClient.openUI({pinDamage = data.pinDamage or 10, pinHealth = data.pinHealth or 100})
		end
	end

	Lockpick.Stop = function()
		NfwClient.sendNUIMessage('lockpickStop', {})
	end

	NfwClient.registerNUICallback("Check", function(data, cb)
        if successCb ~= nil then
            if data.success then
                successCb()
            else
                failCb()
                Lockpick.Stop()
            end     			
            lockpickEnable = false
			Wait(100)			
			SetNuiFocus(false,false)
			NfwClient.closeUI()       
        end
    end)

	NyoFw.startLockpick = function(data)
        lockSuccess = false
        Lockpick.Start(data or {},lockpickSuccess, lockpickFailed)
        while lockpickEnable do 
            Wait(2)
        end
        Wait(10)
        return lockSuccess
    end
	exports('MGLockPick', NyoFw.startLockpick) 


	function lockpickSuccess()
		lockSuccess = true
    end

    function lockpickFailed()
        lockSuccess = false
    end

	SafeEvents.register('nfw:lockpick:start', function(id, data)
        local r = NyoFw.startLockpick(data)
		SafeEvents.triggerServer("nfw:lockpick:gameCallBack", id, r)
    end)
	
	AddEventHandler("nfw:closeUi", function()
		if lockpickEnable then 
			if successCb ~= nil then
				failCb()
				Lockpick.Stop()			
				lockpickEnable = false
				Wait(100)			
				SetNuiFocus(false,false)
				NfwClient.closeUI()  
			end
		end
    end)
end)