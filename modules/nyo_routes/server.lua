local module = 'nyo_routes'
local traceback = debug.traceback()
local valid_traceback = string.format('@nfw/modules/%s/server.lua', module)

if traceback:find(valid_traceback) then
    Nfw.registerNyoModule(module, "1.0.4", {"nyo_core"}, false, function()

        Nfw.onReady(function()
            local module_funcs = Nfw.getModuleFunctions()

            for k,v in pairs(NfwConfigs) do
                if v.type == 'nyo_routes' then
                    for l,w in pairs(v.routesConfig) do
                        for x,y in pairs(w.routes) do
                            for _, item in ipairs(y.resultItens) do
                                if item.type == 'money' then
                                    NfwConfigs[k].routesConfig[l].routes[x].resultItens[_].name = 'Dinheiro'
                                else
                                    NfwConfigs[k].routesConfig[l].routes[x].resultItens[_].name = NyoFw.getItemName(item.index)
                                end
                            end
                            for _, item in ipairs(y.requiredItens) do
                                if item.type == 'money' then
                                    NfwConfigs[k].routesConfig[l].routes[x].requiredItens[_].name = 'Dinheiro'
                                else
                                    NfwConfigs[k].routesConfig[l].routes[x].requiredItens[_].name = NyoFw.getItemName(item.index)
                                end
                            end
                        end
                    end
                end
            end

            local inRoutePlayers = {}
            
            SafeEvents.register('routes-addPlayer', function(src, config, category, route)
                module_funcs.onAddPlayerToRoute(src, config, category, route)
                inRoutePlayers[src] = { config = config, category = category, route = route }
            end)

            SafeEvents.register('routes-remPlayer', function(src)
                module_funcs.onRemPlayerFromRoute(src)
                inRoutePlayers[src] = nil
            end)

            AddEventHandler('playerDropped', function()
                module_funcs.onRemPlayerFromRoute(src)
                inRoutePlayers[source] = nil
            end)

            RPC.addHandler('routes-tryPayment', function(src)
                if inRoutePlayers[src] then
                    local user_id = NyoFw.getCharId(src)
                    local config = NfwConfigs[inRoutePlayers[src].config]
                    local routeConfig = config.routesConfig[inRoutePlayers[src].category].routes[inRoutePlayers[src].route]
                    local tryItens = true
                    local multipliers = {}
                    local itens = {}
                    local itenstry = {}
                    for k,v in pairs(routeConfig.requiredItens) do
                        local amount = math.random(v.min, v.max)
                        if v.type == 'money' then
                            if NyoFw.getMoney(user_id) < amount then
                                tryItens = false
                                break
                            else
                                itens[#itens + 1] = {amount = amount, index = v.index, name = v.name, type = v.type, multiplier = v.multiplier * amount, paymentType = v.paymentType}
                            end
                        else
                            if NyoFw.getInventoryItemAmount(user_id,v.index) < amount then
                                tryItens = false
                                break
                            else
                                itens[#itens + 1] = {amount = amount, index = v.index, name = v.name, type = v.type, multiplier = v.multiplier * amount}
                                table.insert(itenstry, {v.index, amount})
                            end
                        end
                    end
                    if tryItens then
                        local giveItens1 = {}
                        local giveItens2 = {}
                        for k,v in pairs(routeConfig.resultItens) do
                            local random = math.random(v.min, v.max)
                            local amount = math.floor(random + random * (itens[k] and itens[k].multiplier or 0))
                            table.insert(giveItens1, {index = v.index, amount = amount, name = v.name, type = v.type})
                            table.insert(giveItens2, {v.index, amount})
                        end
                        if not NfwGlobalFunctions.checkInventoryWeight2(user_id,giveItens2,itenstry) then
                            module_funcs.onFailToCollectItem("insufficientItems", user_id, routeConfig)
                            return false, "insufficientSpaceInInventory"
                        end
                        for k,v in pairs(itens) do
                            if v.type == 'money' then
                                NfwGlobalFunctions.tryPayment(user_id, v.amount, v.paymentType)
                            else
                                NyoFw.tryGetInventoryItem(user_id, v.index, v.amount)
                            end
                        end
                        for k,v in pairs(giveItens1) do
                            if v.type == 'money' then
                                NyoFw.giveMoney(user_id, v.amount)
                            else
                                NyoFw.giveInventoryItem(user_id, v.index, v.amount)
                            end
                        end
                        if routeConfig.callPolice then
                            routeConfig.callPolice(src, user_id, GetEntityCoords(GetPlayerPed(src)), routeConfig)
                        end
                        module_funcs.onSuccessToCollectItem(user_id, routeConfig, giveItens1)
                        return true, giveItens1
                    else
                        module_funcs.onFailToCollectItem("insufficientItems", user_id, routeConfig)
                        return false, "insufficientItems"
                    end
                end
            end)
        end)
        
    end)
else
    error 'Module name has been modified'
    Nfw.preventCheat()
end