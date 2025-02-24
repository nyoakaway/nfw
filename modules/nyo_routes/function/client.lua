Nfw.registerFunctions('nyofw',function()

    local lang = Nfw.getModuleLanguage()


    return {
        onUiOpen = function(config)
        end,
        onUiClose = function(config)
        end,
        onRouteStart = function(currentConfigIndex, currentRouteCategory, currentRouteIndex)
            NfwGlobalFunctions.notify('green', 'Sucesso', lang.onRouteStart, 5000)
        end,
        onRouteStop = function()
            NfwGlobalFunctions.notify('green', 'Sucesso', lang.onRouteStop, 5000)
        end,
        onSuccessToCollectItem = function(config, itens)
            local function replaceTable(str, table)
                return str:gsub("$(%w+)%s", function(n) return table[n] end)
            end
            for k,v in pairs(itens) do
                NfwGlobalFunctions.notify('Sucesso', replaceTable(lang.onSuccessToCollectItem, v), "green", 5000)  
            end
        end,
        onFailToCollectItem = function(reason, config)
            NfwGlobalFunctions.notify('Erro', lang[reason], "#FF0000", 5000)
        end,
    }

end)