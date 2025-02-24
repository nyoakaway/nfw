Nfw.registerFunctions('nyofw',{
    getPlayerInventory = function(charId)
        local dataInventory = NyoFw.getUserTable(charId).inventory
        local data = {}
            for k,v in pairs(dataInventory.i) do 
                if not data[v.i] then 
                    data[v.i] = { amount = v.a, name = NyoFw.getItemName(v.i) } 

                else 
                    data[v.i].amount += data[v.i].amount + v.a
                end 
            end
        return data
    end,
    progressBar = function(src, time, text)
        TriggerClientEvent('progress', src, time, text)
    end,
    onFailToProduceItens = function(reason, user_id, config, data)
        -- reason = "insufficientItems" || "insufficientSpaceInInventory"
        -- data = { category = string, quantity = int, item = string }
    end,
    onSuccessToProduceItens = function(user_id, config, data)
        -- data = { category = string, quantity = int, item = string }    
    end
})