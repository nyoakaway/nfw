Nfw.registerFunctions('nyofw',function()

    return {
        getAccountId = function(src)
            return NyoFw.getAccountId(src)
        end,
    
        multiMaxCharacter = function(account_id)
            local maxChar = 1
            if account_id then 
                local rows = NyoFw.querySync('nfw/nyo_multi/getAccountData', {account_id = account_id})
                if rows[1] then maxChar = rows[1].max_character end
            end
            return maxChar
        end,
    
        multiGetCharacters = function(account_id)
            local rows = NyoFw.querySync('nfw/nyo_multi/getCharacter', { account_id = account_id})
            local characters = {}
            for k,v in pairs(rows) do 
                local vPos = false
                if v.position then 
                    vPos = json.decode(v.position)
                end
                characters[#characters+1] = {
                    id = v.id,
                    registration = v.registration,
                    name = v.name,
                    midname = v.middle_name,
                    lastname = v.last_name,
                    age = v.age,
                    phone = v.phone,
                    money = v.money,
                    bankmoney = v.bank_money,
                    skin = json.decode(v.skin), 
                    customization = json.decode(v.customization),
                    tattoo = json.decode(v.tattoo),
                    health = v.health,
                    armour = v.armour,
                    position = vPos                 
                }
            end
            return characters
        end,
    }
  
end)