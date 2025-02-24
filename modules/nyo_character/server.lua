local module = 'nyo_character'
local traceback = debug.traceback()
local valid_traceback = string.format('@nfw/modules/%s/server.lua', module)

if traceback:find(valid_traceback) then
    Nfw.registerNyoModule(module, "1.0.0", {"nyo_core", "nyo_multi"}, false, function()

        
        NyoFw.prepare("character/addCharacter","INSERT INTO nyo_character (account_id, registration, name, middle_name, last_name, age, phone, skin, customization, inventory, bank_money) VALUES (@account_id, @registration, @name, @middle_name, @last_name, @age, @phone, @skin, @customization, @inventory, @bank_money)")
       
      
        RPC.addHandler('character:saveCharacter', function(source, name, midName, lastName, age, skin)
            local account_id = NyoFw.getAccountId(source)

            local characterConfig = NfwConfigs['creatorConfig']
            local invGConfig = NfwConfigs['inventoryGeneralConfig']

            local registration = NyoFw.generateRegistrationNumber()
            local phone = NyoFw.generatePhoneNumber()
            local skinPed = 0
            if skin.hb.g == 'M' then skinPed = 1885233650 elseif skin.hb.g == 'F' then skinPed = -1667301416 else return false end
            local customization = characterConfig.pedBasicClothes[skinPed]    
            customization.modelhash = skinPed    
            --local startMoney = 
            local startBankMoney = characterConfig.startBankMoney
            local inventory = {
                w = {},
                i = {
                    {["a"] = characterConfig.startMoney, ["i"] = "dinheiro"}
                },
                d = { mw = invGConfig.defaultWeight }
            }
            local r =  NyoFw.querySync("character/addCharacter", {
                    account_id = account_id, registration = registration, name = name, middle_name = midName, last_name = lastName, age = age, phone = phone, skin = json.encode(skin), customization = json.encode(customization), inventory = json.encode(inventory), bank_money = startBankMoney})
            
            return r and true or false
        end)        
    end)
else
    error 'Module name has been modified'
    Nfw.preventCheat()
end