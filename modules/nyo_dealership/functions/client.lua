-- NfwGlobalFunctions.notify( src, 'Sucesso', 'O veículo foi adquirido com sucesso e já pode ser encontrado na sua garagem.', "green", 5000)
-- NfwGlobalFunctions.notify( src, 'Erro', 'Não foi possível efetuar a compra.', "#FF0000", 5000)

Nfw.registerFunctions('nyofw',function()

    local lang = Nfw.getModuleLanguage()

    local function replaceTable(str, table)
        return str:gsub("$name", table.name):gsub("$price", table.price)
    end

    return {
        onPlayerFailureToBuyVehicle = function(reason, vehicle, category, price, remainingStock)
            NfwGlobalFunctions.notify('Erro', lang[reason], "#FF0000", 5000)
        end,
        onPlayerBuyVehicle = function(vname, category, price, remainingStock)
            NfwGlobalFunctions.notify('Sucesso', replaceTable(lang.onPlayerBuyVehicle, {name = vname, price = price}), "green", 5000)
        end,
        onPlayerFailureToSellVehicle = function(reason, vname)
            NfwGlobalFunctions.notify('Erro', lang[reason], "#FF0000", 5000)
        end,
        onPlayerSellVehicle = function(vname, price)
            NfwGlobalFunctions.notify('Sucesso', replaceTable(lang.onPlayerSellVehicle,{name = vname, price = price}), "green", 5000)
        end,
    }

end)