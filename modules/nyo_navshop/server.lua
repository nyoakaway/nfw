local module = 'nyo_navshop'
local traceback = debug.traceback()
local valid_traceback = string.format('@nfw/modules/%s/server.lua', module)

if traceback:find(valid_traceback) then
    Nfw.registerNyoModule(module, "1.0.2", {"nyo_core"}, false, function()
        local activedUsers = {}
        
        SafeEvents.register('navShopAction', function (source, config, index, item)
            local user_id = NyoFw.getCharId(source)
            local nsConfig = config[index]
            if not activedUsers[user_id] then 
                activedUsers[user_id] = true 
                if nsConfig.index == item then   
                    if nsConfig.type == 'buy' then                                                                           
                        local qtd = nsConfig.qtd
                        if NfwGlobalFunctions.checkInventoryWeight(user_id, item, qtd) then
                            if nsConfig.typeMoney == 'ilegal' then                                                 
                                if NyoFw.tryGetInventoryItem(user_id, NfwConfigs.generalConfigNavShop.illegalMoneyItem, nsConfig.price) then 
                                    NyoFw.giveInventoryItem(user_id, item, qtd)
                                    NfwGlobalFunctions.notify(source, 'Sucesso', 'Você comprou <b>'..qtd..'x '..NyoFw.getItemName(item)..'</b> por <b>$'..nsConfig.price..'</b>!', "#00FF00", 5000)
                                else 
                                    NfwGlobalFunctions.notify(source, 'Erro', 'Dinheiro Sujo insuficiente.', "#FF0000", 5000)
                                end
                            else 
                                if NfwGlobalFunctions.tryPayment(user_id, nsConfig.price, nsConfig.paymentType or 1) then
                                    NyoFw.giveInventoryItem(user_id, item, qtd)
                                    NfwGlobalFunctions.notify(source, 'Sucesso', 'Você comprou <b>'..qtd..'x '..NyoFw.getItemName(item)..'</b> por <b>$'..nsConfig.price..'</b>!', "#00FF00", 5000)
                                else
                                    NfwGlobalFunctions.notify(source, 'Erro', 'Dinheiro insuficiente.', "#FF0000", 5000)
                                end
                            end                                           
                        else
                            NfwGlobalFunctions.notify(source, 'Erro', 'Espaço insuficiente.', "#FF0000", 5000)
                        end


                    elseif nsConfig.type == 'sell' then                                       
                        local qtd = tonumber(NyoFw.getInventoryItemAmount(user_id,item))
                        if qtd > 0 then 
                            
                            if NyoFw.tryGetInventoryItem(user_id, item, qtd) then
                                if nsConfig.typeMoney == 'ilegal' then 
                                    NyoFw.giveInventoryItem(user_id, NfwConfigs.generalConfigNavShop.illegalMoneyItem, nsConfig.price*qtd)
                                else 
                                    NyoFw.giveMoney(user_id,nsConfig.price*qtd)
                                end                                                
                                NfwGlobalFunctions.notify(source, 'Sucesso', 'Você vendeu <b>'..qtd..'x '..NyoFw.getItemName(item)..'</b> por <b>$'..(nsConfig.price*qtd)..'</b>!', "#00FF00", 5000)
                            end
                        end
                    end
                else 
                    NfwGlobalFunctions.notify(source, 'Erro', 'Ocorreu um erro, tente novamente.', "#FF0000", 5000)
                end
                
                activedUsers[user_id] = nil 
            end
        end)
    end)
else
    error 'Module name has been modified'
    Nfw.preventCheat()
end