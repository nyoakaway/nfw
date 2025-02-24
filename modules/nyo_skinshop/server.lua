local module = 'nyo_skinshop'
local traceback = debug.traceback()
local valid_traceback = string.format('@nfw/modules/%s/server.lua', module)

if traceback:find(valid_traceback) then
    Nfw.registerNyoModule(module, "1.0.4", {"nyo_core"}, false, function()
        NyoFw.prepare("nyo_module/nyo_skinshop/update","UPDATE nyo_character SET customization = @data WHERE id = @charId")


        local skinCmd = NfwConfigs['skinShopGeneralConfig']

        local function parse_part(key)
            if type(key) == "string" and string.sub(key,1,1) == "p" then
                return true,tonumber(string.sub(key,2))
            else
                return false,tonumber(key)
            end
        end

        for k,v in pairs(skinCmd.commands) do           
            RegisterCommand(v.prefix, function(source, args)   
                local charId = NyoFw.getCharId(source)             
                if (v.item == '' or NyoFw.getInventoryItemAmount(charId, v.item) > 0) and (v.perm == '' or NyoFw.hasPermission(charId, v.perm)) then 
                    local clothId = nil
                    local clothColor = 0
                    if args[1] then clothId = tonumber(args[1]) end
                    if args[2] then clothColor = tonumber(args[2]) end  
                    
                    local data = NyoFw.getUserTable(charId).customization
                    local isprop, index = parse_part(v.id)

                    if clothId then 
                        data[v.id] = {tonumber(clothId), tonumber(clothColor)}
                    else 
                        if isprop then 
                            data[v.id] = nil
                        else 
                            data[v.id] = {tonumber(v.clothWithDraw.id), tonumber(v.clothWithDraw.color)}
                        end
                    end
                    
                    SafeEvents.triggerClient("nfw:skinshop:changeCloth", source, v.id, clothId, clothColor, k)
                end
            end)
        end


        RPC.addHandler('skinshop-tryPayment', function(source, price, paymentType, data)
            local charId = NyoFw.getCharId(source)
            local success =  NfwGlobalFunctions.tryPayment(charId, price, paymentType or 1)

            if success and Nfw.isModuleActive('nyo_guardaroupa') then                
                TriggerEvent("nyoModule:SaveWardrobe", charId, data)
            end

            if success then
                NyoFw.getUserTable(charId).customization = data
                NyoFw.querySync("nyo_module/nyo_skinshop/update", {data = json.encode(data), charId = charId}) 
                TriggerClientEvent("nyo_notify:lang", source, 'nyo_skinshop', 'ui-success', 'ui-buy-success', '#00FF00', 5000)
                --NfwGlobalFunctions.notify(source, 'Sucesso', 'Compra Efetuada', '#00FF00', 5000)
            else 
                NfwGlobalFunctions.notify(source, 'Erro', 'Dinheiro insuficiente', '#FF0000', 5000)
            end
            return success
        end)

        NyoFw.getCustomization = function(source)
            return RPC.trigger("nfw:skin_shop:getCustomization", source)
        end

        NyoFw.setCustomization = function(source, custom)
            RPC.trigger("nfw:skin_shop:setCustomization", source, custom)
        end

        exports('getCustomization', NyoFw.getCustomization) 
        exports('setCustomization', NyoFw.setCustomization) 
    end)
else
    error 'Module name has been modified'
    Nfw.preventCheat()
end