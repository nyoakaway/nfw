Nfw.registerNyoModule('nyo_notify', {}, false, function()
    
    NfwClient.registerInterface(2)

    RegisterNetEvent("nyo_notify", function(titulo, mensagem, tipo, delay, icon, request, requestId)
        NfwClient.sendNUIMessage('notify',{color = tipo, title = titulo, content = mensagem, delay = delay, icon = icon, request = request or false, requestId = requestId})
    end) 

    RegisterNetEvent("nyo_notifyItem", function(title, item, itemName, qtd, cor, delay)
        NfwClient.sendNUIMessage('notifyItem',{title = title, item = item, itemName = itemName, qtd = qtd, cor = cor, delay = delay, img = NyoFw.getItemImg(item)})
    end)
    
    RegisterNetEvent("Notify", function(css, mensagem)
        local tipo = '#FFFFFF'
        if css == 'sucesso' then 
            tipo = '#00FF00'
        elseif css == 'erro' then 
            tipo = '#FF0000'
        elseif css == 'importante' then 
            tipo = '#FFD700'
        end
        NfwClient.sendNUIMessage('notify',{color = tipo, title = 'Notify', content = mensagem, delay = 5000})
    end)

    RegisterNetEvent("nyo_notify:lang", function(module, langTitle, langMessage, color, delay, icon)
        local lang = Nfw.getModuleLanguage(module)
        NfwClient.sendNUIMessage('notify',{color = color, title = lang[langTitle], content = lang[langMessage], delay = delay or 5000, icon = icon})
    end)

    SafeEvents.register('nfw:notify:request', function(id, text, time)
        TriggerEvent("nyo_notify", 'REQUISIÇÃO', text, '#FF0000', time * 1000, '', true, id)
    end)

    RegisterCommand("nfw:request:accept", function()
        NfwClient.sendNUIMessage('requestAccept', {})
    end)
    RegisterKeyMapping("nfw:request:accept", 'Request Accept', 'KEYBOARD', "y")

    RegisterCommand("nfw:request:deny", function()
        NfwClient.sendNUIMessage('requestDeny', {})
    end)
    RegisterKeyMapping("nfw:request:deny", 'Request Deny', 'KEYBOARD', "u")

    RegisterNUICallback("notifyRequestCallBack", function(data)
        if data.id then 
            SafeEvents.triggerServer("nfw:notify:requestCallback", data.type, data.id)
        end
    end)

    SafeEvents.register('nfw:prompt', function(title, text)
        SetNuiFocus(true, true)
        NfwClient.sendNUIMessage('openPrompt',{title = title, text = text})
    end)

    NyoFw.prompt = function(title, text)
        SetNuiFocus(true, true)
        NfwClient.sendNUIMessage('openPrompt',{title = title, text = text})
    end
    exports('prompt', NyoFw.prompt)

    RegisterNUICallback("promptCallback", function(data)
        SetNuiFocus(false, false)
        SafeEvents.triggerServer("nfw:prompt:callback", data.text)
    end)


    -- Progressbar 
    RegisterNetEvent("progress")
    AddEventHandler("progress",function(time,text)
        NfwClient.sendNUIMessage('progressbar',{title = text, time = time})
    end)

end)