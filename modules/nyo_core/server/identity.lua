Nfw.extendModule(1, function() 

    NyoFw.prepare("Nfw:getCharIdentity","SELECT id, registration, name, middle_name, last_name, phone, age FROM nyo_character WHERE id = @character_id")
    NyoFw.prepare("Nfw:getCharByReg","SELECT id FROM nyo_character WHERE registration = @registration")
    NyoFw.prepare("Nfw:getCharByPhone","SELECT id FROM nyo_character WHERE phone = @phone")


    function NyoFw.getCharacterIdentity(characterId)
        local rows = NyoFw.querySync("Nfw:getCharIdentity",{ character_id = characterId })
        return rows[1]
    end
    GlobalState.getCharacterIdentity = NyoFw.getCharacterIdentity
    exports('getCharacterIdentity', NyoFw.getCharacterIdentity) 

    function NyoFw.getCharacterByRegistration(registration)
        local rows = NyoFw.querySync("Nfw:getCharByReg",{ registration = registration or "" })
        if #rows > 0 then
            return rows[1].id
        end
    end
    GlobalState.getCharacterByRegistration = NyoFw.getCharacterByRegistration
    exports('getCharacterByRegistration', NyoFw.getCharacterByRegistration) 
    
    function NyoFw.getCharByPhone(phone)
        local rows = NyoFw.querySync("Nfw:getCharByPhone",{ phone = phone or "" })
        if #rows > 0 then
            return rows[1].id
        end
    end
    GlobalState.getCharByPhone = NyoFw.getCharByPhone
    exports('getCharByPhone', NyoFw.getCharByPhone) 
    
    function NyoFw.generateStringNumber(format)
        local abyte = string.byte("A")
        local zbyte = string.byte("0")
        local number = ""
        for i=1,#format do
            local char = string.sub(format,i,i)
            if char == "D" then number = number..string.char(zbyte+math.random(0,9))
            elseif char == "L" then number = number..string.char(abyte+math.random(0,25))
            else number = number..char end
        end
        return number
    end
    GlobalState.generateStringNumber = NyoFw.generateStringNumber
    exports('generateStringNumber', NyoFw.generateStringNumber) 
    
    function NyoFw.generateRegistrationNumber()
        local char_id = nil
        local registration = ""
        repeat
            registration = NyoFw.generateStringNumber("DDLLLDDD")
            char_id = NyoFw.getCharacterByRegistration(registration)
        until not char_id
    
        return registration
    end
    GlobalState.generateRegistrationNumber = NyoFw.generateRegistrationNumber
    exports('generateRegistrationNumber', NyoFw.generateRegistrationNumber) 
    
    function NyoFw.generatePhoneNumber()
        local char_id = nil
        local phone = ""
    
        repeat
            phone = NyoFw.generateStringNumber("DDD-DDD")
            char_id = NyoFw.getCharByPhone(phone)
        until not char_id
    
        return phone
    end
    GlobalState.generatePhoneNumber = NyoFw.generatePhoneNumber
    exports('generatePhoneNumber', NyoFw.generatePhoneNumber) 
end)

