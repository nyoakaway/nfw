Nfw.registerFunctions('nyofw',function()
    
    local lang = Nfw.getModuleLanguage()

    return {
        onFailToProduceItens = function(reason, config, data)
            -- reason = "insufficientItems" || "insufficientSpaceInInventory"
            -- data = { category = string, quantity = int, item = string }
            NfwGlobalFunctions.notify('Erro', lang[reason], "#FF0000", 5000)
        end,
        onSuccessToProduceItens = function(config, data)
            -- data = { category = string, quantity = int, item = string }
        end,
        onFinishingProducingItens = function(config, data)
            -- data = { category = string, quantity = int, item = string }
        end,
        onUiOpen = function(config, inventory)
        end,
        onUiClose = function(config, inventory, producing)
        end,
        onInventoryUpdate = function(config, inventory)
        end
    }
end)