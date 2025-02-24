Nfw.registerFunctions('nyofw', function()   
    return {
        clearInventory = function(src, charId) -- Função para limpar o inventario
            configInventory = NfwConfigs['inventoryGeneralConfig']
            if charId then
                local inventoryDefault =  {w = {}, i = {}, d = {mw = configInventory.defaultWeight} }
                local dataInventory = NyoFw.getUserTable(charId)
                dataInventory.inventory = inventoryDefault

               -- NyoFw.setMoney(charId, 0)
                NyoFw.clearWeapons(src)

                NyoFw.setHandcuffed(src,false)
                return true
            else 
                return false
            end
        end,
        checkRevive = function(source, user_id) -- Requisitos para utilizar o botão REVIVER (Ex: quantidade minima de paramedicos online)
            return true 
        end
    }

end)