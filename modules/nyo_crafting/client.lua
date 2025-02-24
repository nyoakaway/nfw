Nfw.registerNyoModule('nyo_crafting', {}, false, function()
    Nfw.onReady(function()
        local module_funcs = Nfw.getModuleFunctions()

        for k,v in pairs(NfwConfigs) do
            if v.type == 'nyo_crafting' then
                for l,w in pairs(v.craftingConfig) do
                    for x,y in pairs(w.itens) do
                        NfwConfigs[k].craftingConfig[l].itens[x].name = NyoFw.getItemName(x)
                        for a,b in pairs(y.requiredItens) do
                            NfwConfigs[k].craftingConfig[l].itens[x].requiredItens[a] = {NyoFw.getItemName(a), b}
                        end
                    end
                end
            end
        end
        
        NfwClient.registerInterface(1)

        local currentInventory
        local currentConfig
        local currentConfigIndex
        local producing
        local safeConfig
        local category

        NfwClient.registerKeyPress(function(v, k)
            currentInventory = RPC.trigger('crafting-getInventory')
            currentConfig = NfwConfigs[v.config]
            currentConfigIndex = v.config

            safeConfig = table.clone(currentConfig.craftingConfig)
            for k,v in pairs(safeConfig) do
                safeConfig[k].executeAnimation = nil
                safeConfig[k].stopAnimation = nil
            end
            module_funcs.onUiOpen(currentConfig, currentInventory)
            NfwClient.openUI({
                inventory = currentInventory,
                config = safeConfig
            })
            NfwClient.disableMarkerType(1)
            SetNuiFocus(true, true)
        end)

        NfwClient.registerNUICallback('close', function()
            module_funcs.onUiClose(currentConfig, currentInventory, producing)
            SetNuiFocus(false, false)
            if not producing then
                NfwClient.enableMarkerType(1)
            end
        end)

        NfwClient.registerNUICallback('produceItens', function(data,cb)
            if producing then
                return
            end
            local ableToCraft, failReason = RPC.trigger('crafting-produceItens', currentConfigIndex, data)
            cb({ableToCraft = ableToCraft})
            if ableToCraft then
                module_funcs.onSuccessToProduceItens(NfwConfigs[currentConfigIndex], data)
                FreezeEntityPosition(plyPed, true)
                producing = true
                NfwClient.closeUI()
                category = data.category
                currentConfig.craftingConfig[data.category].executeAnimation()
                module_funcs.onFinishingProducingItens(NfwConfigs[currentConfigIndex], data)
            else
                module_funcs.onFailToProduceItens(failReason, NfwConfigs[currentConfigIndex], data)
            end
        end)

        SafeEvents.register('crafting-updateInventory', function(data)
            currentInventory = data
            module_funcs.onInventoryUpdate(currentConfig, currentInventory)
            NfwClient.openUI({
                inventory = currentInventory,
                config = safeConfig
            })
            SetNuiFocus(true, true)
            producing = false
            FreezeEntityPosition(plyPed, false)
            currentConfig.craftingConfig[category].stopAnimation()
        end)

        AddEventHandler("nfw:closeUi", function()
            NfwClient.closeUI()
        end)
    end)
    
end)