local module = 'nyo_crafting'
local traceback = debug.traceback()
local valid_traceback = string.format('@nfw/modules/%s/server.lua', module)

if traceback:find(valid_traceback) then
    Nfw.registerNyoModule(module, "1.0.3", {"nyo_core"}, false, function()

        local module_funcs = Nfw.getModuleFunctions()
        local craftingUsers = {}

        RPC.addHandler('crafting-getInventory', function(src)
            local user_id = NyoFw.getCharId(src)
            return module_funcs.getPlayerInventory(user_id)
        end)

        RPC.addHandler('crafting-produceItens', function(src, configIndex, data)
            local user_id = NyoFw.getCharId(src)
            if not craftingUsers[user_id] then 
                craftingUsers[user_id] = true 
                local config = NfwConfigs[configIndex]
                local craftingConfig = config.craftingConfig[data.category].itens
                local inventory = module_funcs.getPlayerInventory(user_id)
                local isAbleToCraft = true
                local tryitens = {}
                for k,v in pairs(craftingConfig[data.item].requiredItens) do
                    table.insert(tryitens, {k, v*data.quantity})
                    if NyoFw.getInventoryItemAmount(user_id, k) < (v *  data.quantity) then
                        isAbleToCraft = false
                    end
                end
                if isAbleToCraft then
                    if NfwGlobalFunctions.checkInventoryWeight2(user_id, {{data.item, data.quantity * craftingConfig[data.item].resultAmount}}, tryitens) then
                        CreateThread(function()
                            module_funcs.progressBar(src, 1000 * craftingConfig[data.item].productionTime * data.quantity, 'Produzindo '..NyoFw.getItemName(data.item))
                            for k,v in pairs(craftingConfig[data.item].requiredItens) do
                                NyoFw.tryGetInventoryItem(user_id, k, v * data.quantity)
                            end
                            Wait(1000 * craftingConfig[data.item].productionTime * data.quantity)
                            NyoFw.giveInventoryItem(user_id, data.item, data.quantity * craftingConfig[data.item].resultAmount )
                            SafeEvents.triggerClient('crafting-updateInventory', src, module_funcs.getPlayerInventory(user_id))                            
                            craftingUsers[user_id] = nil 
                        end)
                        module_funcs.onSuccessToProduceItens(user_id, config)
                        return true
                    else
                        module_funcs.onFailToProduceItens('insufficientSpaceInInventory', user_id, config)
                        -- NfwGlobalFunctions.notify(src, 'Erro', 'Você não possui espaço na mochila!', "#FF0000", 5000)
                        craftingUsers[user_id] = nil 
                        return false, 'insufficientSpaceInInventory'
                    end
                    
                else
                    module_funcs.onFailToProduceItens('insufficientItems', user_id, config)
                    craftingUsers[user_id] = nil 
                    return false, 'insufficientItems'
                end
            end            
        end)

    end)
else
    error 'Module name has been modified'
    Nfw.preventCheat()
end