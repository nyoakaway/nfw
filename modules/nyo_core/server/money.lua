Nfw.extendModule(1, function() 
    function NyoFw.getMoney(character_id)
        return NyoFw.getInventoryItemAmount(character_id, 'dinheiro')
        -- local data = NyoFw.getUserTable(character_id)
        -- if data then 
        --     return data.money or 0
        -- else 
        --     return 0
        -- end
    end
    exports('getMoney', NyoFw.getMoney)

    function NyoFw.setMoney(character_id, amount)
        local uMoney = NyoFw.getMoney(character_id)
        if uMoney > 0 then 
            if NyoFw.tryPayment(character_id, uMoney) then 
                NyoFw.giveMoney(character_id,amount)
            end
        else 
            NyoFw.giveMoney(character_id,amount)
        end
        -- local data = NyoFw.getUserTable(character_id)
        -- if data then 
        --     data.money = amount
        -- end
    end
    exports('setMoney', NyoFw.setMoney) 

    function NyoFw.tryPayment(character_id, amount)
        if amount > 0 then
            return NyoFw.tryGetInventoryItem(character_id, 'dinheiro', amount)
            -- local money = NyoFw.getMoney(character_id)
            -- if amount >= 0 and money >= amount then
            --     NyoFw.setMoney(character_id,money-amount)
            --     return true
            -- else
            --     return false
            -- end
        elseif amount == 0 then return true
        end
        return false
    end
    exports('tryPayment', NyoFw.tryPayment)

    function NyoFw.giveMoney(character_id,amount)
        if amount >= 0 then
           NyoFw.giveInventoryItem(character_id, 'dinheiro', amount)
            -- local money = NyoFw.getMoney(character_id)
            -- NyoFw.setMoney(character_id,money+amount)
        end
    end
    exports('giveMoney', NyoFw.giveMoney)

    function NyoFw.getBankMoney(character_id)
        local data = NyoFw.getUserTable(character_id)
        if data then
            return data.bank_money or 0
        else
            return 0
        end
    end
    exports('getBankMoney', NyoFw.getBankMoney)

    function NyoFw.setBankMoney(character_id,value)
        local data = NyoFw.getUserTable(character_id)
        if data then
            data.bank_money = value
        end
    end
    exports('setBankMoney', NyoFw.setBankMoney)
    
    function NyoFw.giveBankMoney(character_id,amount)
        if amount >= 0 then
            local money = NyoFw.getBankMoney(character_id)
            NyoFw.setBankMoney(character_id,money+amount)
        end
    end
    exports('giveBankMoney', NyoFw.giveBankMoney)
    
    function NyoFw.tryWithdraw(character_id,amount)
        local money = NyoFw.getBankMoney(character_id)
        if amount >= 0 and money >= amount then
            NyoFw.setBankMoney(character_id,money-amount)
            NyoFw.giveMoney(character_id,amount)
            return true
        else
            return false
        end
    end
    exports('tryWithdraw', NyoFw.tryWithdraw)
    
    function NyoFw.tryDeposit(character_id,amount)
        if amount >= 0 and NyoFw.tryPayment(character_id,amount) then
            NyoFw.giveBankMoney(character_id,amount)
            return true
        else
            return false
        end
    end
    exports('tryDeposit', NyoFw.tryDeposit)
    
    function NyoFw.tryFullPayment(character_id,amount)
        if amount >= 0 then
            local money = NyoFw.getMoney(character_id)
            if money >= amount then
                return NyoFw.tryPayment(character_id,amount)
            else
                if NyoFw.tryWithdraw(character_id, amount-money) then
                    return NyoFw.tryPayment(character_id,amount)
                end
            end
        end
        return false
    end
    exports('tryFullPayment', NyoFw.tryFullPayment)

end)