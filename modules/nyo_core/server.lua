local module = 'nyo_core'
local traceback = debug.traceback()
local valid_traceback = string.format('@nfw/modules/%s/server.lua', module)

if traceback:find(valid_traceback) then
    Nfw.registerNyoModule(module, "1.0.0", {'database'}, true, function()

        NyoFw.accounts = GlobalState.coreAccounts or {}
        NyoFw.raccounts = GlobalState.coreRAccounts or {}
        NyoFw.account_source = GlobalState.coreAccountsSource or {}
        NyoFw.raccount_source = GlobalState.coreRAccountsSource or {}
        NyoFw.users = GlobalState.coreUsers or {}
        NyoFw.rusers = GlobalState.coreRUsers or {}
        NyoFw.account_user = GlobalState.coreAccountU or {}
        NyoFw.raccount_user = GlobalState.coreRAccountU or {}
        NyoFw.user_sources = GlobalState.coreUserSources or {}
        NyoFw.user_tables = GlobalState.coreUserTables or {}
        NyoFw.account_vip = GlobalState.coreAccountsVip or {}

        NyoFw.prepare("Nfw:create_user","INSERT INTO nyo_account(whitelisted,banned) VALUES(false,false)")
        NyoFw.prepare("Nfw:accountIdByIdentifier","SELECT account_id FROM nyo_account_identifier WHERE identifier = @identifier")
        NyoFw.prepare("Nfw:getAccountByCharacterId","SELECT account_id FROM nyo_character WHERE id = @character_id")
        NyoFw.prepare("Nfw:addIdentifier","INSERT INTO nyo_account_identifier(identifier,account_id) VALUES(@identifier,@account_id)")
        NyoFw.prepare("Nfw:getAccountBanned","SELECT banned FROM nyo_account WHERE id = @account_id")
        NyoFw.prepare("Nfw:setAccountBanned","UPDATE nyo_account set banned = @banned WHERE id = @account_id")
        NyoFw.prepare("Nfw:getAccountWhitelisted","SELECT whitelisted FROM nyo_account WHERE id = @account_id")
        NyoFw.prepare("Nfw:setAccountWhitelisted","UPDATE nyo_account set whitelisted = @whitelisted WHERE id = @account_id")

        NyoFw.prepare("nyoCharacter:checkCharacterAuth", "SELECT * FROM nyo_character WHERE id = @character AND account_id = @account")
        NyoFw.prepare("nyoCharacter:getAccountData", "SELECT * FROM nyo_account WHERE id = @account")

        NyoFw.prepare("nyoCharacter:getAccountVip", "SELECT vip FROM nyo_account WHERE id = @account")
        NyoFw.prepare("nyoCharacter:getCharacterVip", "SELECT account_id, vip FROM nyo_character WHERE id = @character")
        NyoFw.prepare("nyoCharacter:setAccountVip", "UPDATE nyo_account SET vip = @vip WHERE id = @account")
        NyoFw.prepare("nyoCharacter:setCharacterVip", "UPDATE nyo_character SET vip = @vip WHERE id = @character")

        NyoFw.prepare("Nfw:saveCharacter","UPDATE nyo_character set health = @health, armour = @armour, hunger = @hunger, thirst = @thirst, position = @position, customization = @customization, groups = @groups, inventory = @inventory, bank_money = @bank_money, vip = @vip WHERE id = @character_id")

        local CoreFunctions = {}

        CoreFunctions.getAccountIdByIdentifiers = function(ids)
            if ids and #ids then
                for i=1,#ids do
                    if (string.find(ids[i],"ip:") == nil) then
                        local rows = NyoFw.querySync("Nfw:accountIdByIdentifier",{ identifier = ids[i] })
                        if #rows > 0 then
                            return rows[1].account_id
                        end
                    end
                end
        
                local rows,affected = NyoFw.querySync("Nfw:create_user",{})
                if rows then
                    local account_id = rows.insertId
                    for l,w in pairs(ids) do
                        if (string.find(w,"ip:") == nil) then
                            NyoFw.querySync("Nfw:addIdentifier",{ account_id = account_id, identifier = w })
                        end
                    end
                    return account_id
                end
            end
        end

        CoreFunctions.isAccountBanned = function(account_id)
            local rows = NyoFw.querySync("Nfw:getAccountBanned",{ account_id = account_id })
            if #rows > 0 then
                local d = rows[1].banned 
                return d
            else
                return false
            end
        end

        CoreFunctions.isBanned = function(characterId)
            local account_id = NyoFw.raccount_user[characterId]            
            return NyoFw.isAccountBanned(account_id)
        end

        CoreFunctions.setAccountBanned = function(account_id,banned)
            if account_id then 
                NyoFw.querySync("Nfw:setAccountBanned",{account_id = account_id, banned = banned})
            end
        end

        CoreFunctions.setBanned = function(characterId,banned)
            local account_id = NyoFw.raccount_user[characterId]
            if not account_id then 
                local rows = NyoFw.querySync("Nfw:getAccountByCharacterId",{character_id = characterId})
                if #rows > 0 then 
                    account_id = rows[1]['account_id']
                else 
                    return
                end
            end
            NyoFw.querySync("Nfw:setAccountBanned",{account_id = account_id, banned = banned})
        end

        CoreFunctions.isAccountWhitelisted = function(account_id)
            local rows = NyoFw.querySync("Nfw:getAccountWhitelisted",{ account_id = account_id })
            if #rows > 0 then
                local d = rows[1].whitelisted
                return d
            else
                return false
            end
        end

        CoreFunctions.isWhitelisted = function(characterId)
            local account_id = NyoFw.raccount_user[characterId]
            return NyoFw.isAccountWhitelisted(account_id)
        end     

        CoreFunctions.setWhitelisted = function(characterId,whitelisted,type)
            if type == 'character' then 
                local account_id = NyoFw.raccount_user[characterId]
                if not account_id then 
                    local rows = NyoFw.querySync("Nfw:getAccountByCharacterId",{character_id = characterId})
                    if #rows > 0 then 
                        account_id = rows[1]['account_id']
                    else 
                        return
                    end
                end
            else 
                NyoFw.querySync("Nfw:setAccountWhitelisted",{account_id = characterId, whitelisted = whitelisted})
            end
        end

        CoreFunctions.getUsers = function()
            local users = {}
            for k,v in pairs(NyoFw.user_sources) do
                users[k] = v
            end
            return users
        end

        CoreFunctions.getUserSource = function(character_id)
            if character_id then 
                return NyoFw.user_sources[character_id]
            end
        end
    
        CoreFunctions.getCharId = function(source)
            if source ~= nil then
                local ids = GetPlayerIdentifiers(source)
                if ids ~= nil and #ids > 0 then
                    return NyoFw.users[ids[1]]
                end
            end
            return nil
        end
        
        CoreFunctions.getAccountId = function(source)
            if source ~= nil then
                local ids = GetPlayerIdentifiers(source)
                if ids ~= nil and #ids > 0 then
                    return NyoFw.accounts[ids[1]]
                end
            end
            return nil
        end
                
        CoreFunctions.getAccountIdentifier = function(account_id)
            if account_id then 
                if NyoFw.raccounts[account_id] then 
                    return NyoFw.raccounts[account_id]
                end
            end
            return nil
        end        

        CoreFunctions.getUserTable = function(character_id)
            return NyoFw.user_tables[character_id]
        end

        -- NyoFw.setUserTable = function(char_id, data)
        --     NyoFw.user_tables[character_id] = data
        -- end
        
        CoreFunctions.getNearestPlayer = function(player, radius)
            return RPC.trigger('core-getNearestPlayer', player, radius)
        end

        CoreFunctions.isAccountVip = function(account_id)
            if account_id then 
                local data = NyoFw.account_vip[account_id]
                if data then 
                    if #data > 0 then 
                        return true
                    end
                else 
                    local data = NyoFw.querySync("nyoCharacter:getAccountVip",{account = account_id})
                    if data[1] then 
                        local vData = json.decode(data[1].vip)
                        if #vData > 0 then 
                            return true 
                        end
                    end
                end
            end 
            return false
        end

        CoreFunctions.isAccountVipByChar = function(character_id)
            if character_id then 
                local account_id = NyoFw.raccount_user[character_id]
                if account_id then 
                    local data = NyoFw.account_vip[account_id]
                    if data then 
                        if #data > 0 then 
                            return true
                        end
                    else 
                        local data = NyoFw.querySync("nyoCharacter:getAccountVip",{account = account_id})
                        if data[1] then 
                            local vData = json.decode(data[1].vip)
                            if #vData > 0 then 
                                return true 
                            end
                        end
                    end
                end               
            end
            return false
        end

        CoreFunctions.isCharVip = function(character_id)
            if character_id then 
                local charData = NyoFw.getUserTable(character_id)
                if charData then
                    if charData.playerVip and #charData.playerVip > 0 then 
                        return true     
                    end                    
                else 
                    local data = NyoFw.querySync("nyoCharacter:getCharacterVip",{character = character_id})
                    if data[1] then 
                        local vData = json.decode(data[1].vip)
                        if #vData > 0 then 
                            return true 
                        end
                    end
                end
            end
            return false
        end

        CoreFunctions.getAccountVip = function(account_id, vip)
            if account_id then 
                local data = NyoFw.account_vip[account_id]
                if data then 
                    if data[vip] then 
                        return true
                    end
                else 
                    local data = NyoFw.querySync("nyoCharacter:getAccountVip",{account = account_id})
                    if data[1] then 
                        local vData = json.decode(data[1].vip)
                        if vData[vip] then 
                            return true 
                        end
                    end
                end
            end
            return false
        end

        CoreFunctions.getAccountVipByChar = function(character_id, vip)
            if character_id then 
                local account_id = NyoFw.raccount_user[character_id]
                if account_id then 
                    local data = NyoFw.account_vip[account_id]
                    if data then 
                        if data[vip] then 
                            return true
                        end
                    else 
                        local data = NyoFw.querySync("nyoCharacter:getAccountVip",{account = account_id})
                        if data[1] then 
                            local vData = json.decode(data[1].vip)
                            if vData[vip] then 
                                return true 
                            end
                        end
                    end
                end               
            end
            return false
        end

        CoreFunctions.getCharacterVip = function(character_id, vip)
            if character_id then 
                local charData = NyoFw.getUserTable(character_id)
                if charData then
                    if charData.playerVip and charData.playerVip[vip] then 
                        return true     
                    end                    
                else 
                    local data = NyoFw.querySync("nyoCharacter:getCharacterVip",{character = character_id})
                    if data[1] then 
                        local vData = json.decode(data[1].vip)
                        if vData[vip] then 
                            return true 
                        end
                    end
                end
            end
            return false
        end

        CoreFunctions.addAccountVip = function(account_id, vip)
            if account_id then 
                local data = NyoFw.account_vip[account_id]
                if data then 
                    data[vip] = true
                    NyoFw.query("nyoCharacter:setAccountVip",{vip = json.encode(data), account = account_id})
                else 
                    local data = NyoFw.querySync("nyoCharacter:getAccountVip",{account = account_id})
                    if data[1] then 
                        local vData = json.decode(data[1].vip)
                        vData[vip] = true 
                        NyoFw.query("nyoCharacter:setAccountVip",{vip = json.encode(vData), account = account_id})
                    end
                end
            end
        end

        CoreFunctions.addAccountVipByChar = function(character_id, vip)
            if character_id then 
                local account_id = NyoFw.raccount_user[character_id]
                if account_id then 
                    local data = NyoFw.account_vip[account_id]
                    if data then 
                        data[vip] = true
                        NyoFw.query("nyoCharacter:setAccountVip",{vip = json.encode(data), account = account_id})
                    else 
                        local data = NyoFw.querySync("nyoCharacter:getAccountVip",{account = account_id})
                        if data[1] then 
                            local vData = json.decode(data[1].vip)
                            vData[vip] = true 
                            NyoFw.query("nyoCharacter:setAccountVip",{vip = json.encode(vData), account = account_id})
                        end
                    end
                end               
            end
        end

        CoreFunctions.addCharacterVip = function(character_id, vip)
            if character_id then 
                local charData = NyoFw.getUserTable(character_id)
                if charData then 
                    if charData.playerVip then 
                        charData.playerVip[vip] = true
                    end                    
                else 
                    local data = NyoFw.querySync("nyoCharacter:getCharacterVip",{character = character_id})
                    if data[1] then 
                        local vData = json.decode(data[1].vip)
                        vData[vip] = true 
                        NyoFw.query("nyoCharacter:setCharacterVip",{vip = json.encode(vData), character = character_id})
                    end
                end
            end
        end

        CoreFunctions.removeAccountVip = function(account_id, vip)
            if account_id then 
                local data = NyoFw.account_vip[account_id]
                if data then 
                    if data[vip] then 
                        data[vip] = nil
                        NyoFw.query("nyoCharacter:setAccountVip",{vip = json.encode(data), account = account_id})
                    end                    
                else 
                    local data = NyoFw.querySync("nyoCharacter:getAccountVip",{account = account_id})
                    if data[1] then 
                        local vData = json.decode(data[1].vip)
                        if vData[vip] then 
                            vData[vip] = nil 
                            NyoFw.query("nyoCharacter:setAccountVip",{vip = json.encode(vData), account = account_id})
                        end                        
                    end
                end
            end
        end

        CoreFunctions.removeAccountVipByChar = function(character_id, vip)
            if character_id then 
                local account_id = NyoFw.raccount_user[character_id]
                if account_id then 
                    local data = NyoFw.account_vip[account_id]
                    if data and data[vip] then 
                        data[vip] = nil
                        NyoFw.query("nyoCharacter:setAccountVip",{vip = json.encode(data), account = account_id})
                    end
                else 
                    local data = NyoFw.querySync("nyoCharacter:getCharacterVip",{character = character_id})
                    if data[1] then 
                        local account_id = data[1].account_id
                        local data2 = NyoFw.querySync("nyoCharacter:getAccountVip",{account = account_id})
                        if data2[1] then 
                            local vData = json.decode(data2[1].vip)
                            if vData[vip] then 
                                vData[vip] = nil 
                                NyoFw.query("nyoCharacter:setAccountVip",{vip = json.encode(vData), account = account_id})
                            end                        
                        end    
                    end                    
                end              
            end
        end

        CoreFunctions.removeCharacterVip = function(character_id, vip)
            if character_id then 
                local charData = NyoFw.getUserTable(character_id)
                if charData then
                    if charData.playerVip and charData.playerVip[vip] then 
                        charData.playerVip[vip] = nil
                    end                    
                else 
                    local data = NyoFw.querySync("nyoCharacter:getCharacterVip",{character = character_id})
                    if data[1] then 
                        local vData = json.decode(data[1].vip)
                        if vData[vip] then 
                            vData[vip] = nil 
                            NyoFw.query("nyoCharacter:setCharacterVip",{vip = json.encode(vData), character = character_id})
                        end                       
                    end
                end
            end
        end

        local IDGenerator = {}

        CoreFunctions.generateId = function()
            local newId = #IDGenerator + 1
            IDGenerator[newId] = true 
            return newId
        end 

        CoreFunctions.removeId = function(id)
            IDGenerator[id] =  nil
        end

        CoreFunctions.playSound = function(s, d, n)
            SafeEvents.triggerClient("nfw:core:playSound", s, d, n)
        end
    
        CoreFunctions.playScreenEffect = function(s, n, d)
            SafeEvents.triggerClient("nfw:core:playScreenEffect", s, n, d)
        end

        CoreFunctions.formatChest = function(chest)
            local newChest = {i = {}, w = {}}    
            if chest.i then 
                for k,v in pairs(chest.i) do 
                    newChest.i[#newChest.i + 1] = v
                end
            end

            if chest.w then 
                newChest.w = chest.w
            end

            if chest.d then 
                newChest.d = chest.d
            end

            return newChest
        end

        for exportName, exportHandler in pairs(CoreFunctions) do
            exports(exportName, exportHandler)
            NyoFw[exportName] = exportHandler
        end

        RegisterServerEvent("nfw:selectCharacter", function(characterId)
            local invGConfig = NfwConfigs['inventoryGeneralConfig']
            local multiConfig = NfwConfigs['multiConfig']
            
            local source = source
            local account_id = NyoFw.getAccountId(source)
            local identifier = NyoFw.getAccountIdentifier(account_id) 
            SetPlayerRoutingBucket(source, 0)
            local accountData = NyoFw.querySync("nyoCharacter:getAccountData", {account = account_id})
            local characterData = NyoFw.querySync("nyoCharacter:checkCharacterAuth", {character = characterId, account = account_id})

            if identifier and characterData[1] then 
                -- if NyoFw.users[identifier] and NyoFw.users[identifier] == characterId then 
                --     print('relogando com mesmo personagem')
                -- else 			
                --     print('logando com o mesmo personagem')
                -- end

                Player(source).state:set('char_id', characterId, true) 
                
                NyoFw.users[identifier] = characterId
                NyoFw.rusers[characterId] = identifier
                NyoFw.user_tables[characterId] = {}
                NyoFw.user_sources[characterId] = source
                NyoFw.account_user[account_id] = characterId 
                NyoFw.raccount_user[characterId] = account_id

                local tmp = NyoFw.user_tables[characterId]
                tmp.spawns = 0
                --TriggerEvent("vRP:playerJoin",characterId,source,name)
          
                tmp.groups = json.decode(characterData[1]['groups'])
                tmp.health = characterData[1]['health']
                tmp.hunger = characterData[1]['hunger']
                tmp.thirst = characterData[1]['thirst']
                tmp.armor = characterData[1]['armor']

                Player(source).state:set('hunger', tmp.hunger, true) 
                Player(source).state:set('thirst', tmp.thirst , true) 

                Player(source).state:set('np_health', tonumber(characterData[1]['health']), true) 
                Player(source).state:set('np_armor', tonumber(characterData[1]['armor']), true) 
                Player(source).state:set('np_invensible', false, true) 
                Player(source).state:set('np_visible', false, true) 
                Player(source).state:set('spawned', false, true) 

                tmp.customization = json.decode(characterData[1]['customization'])
                tmp.position = json.decode(characterData[1]['position'])
                tmp.inventory = characterData[1]['inventory'] and NyoFw.formatChest(json.decode(characterData[1]['inventory'])) or {w = {}, i = {}, d = {mw = invGConfig.defaultWeight}}
                --tmp.money = tonumber(characterData[1]['money'])
                tmp.bank_money = tonumber(characterData[1]['bank_money'])
                tmp.spawns = tmp.spawns+1
                tmp.cloak = { login = os.time() }
                NyoFw.account_vip[account_id] = json.decode(accountData[1]['vip'])
                tmp.playerVip = json.decode(characterData[1]['vip'])
                local first_spawn = (tmp.spawns == 1)

                TriggerEvent("nfw:playerSpawn",characterId,source,first_spawn)

                if multiConfig and multiConfig.usePro5MBot then                     
                    Pro5MContent = accountData[1]['discord_id']..' '..characterId..' '..characterData[1]['name']..' '..characterData[1]['last_name']
                    PerformHttpRequest(multiConfig.Pro5MWebHook, function(err, text, headers) end, 'POST', json.encode({content = Pro5MContent}), { ['Content-Type'] = 'application/json' })
                end
                
                TriggerClientEvent("nfw:initPermissions", source)			
                if first_spawn then 
                    TriggerClientEvent("nfw:SpawnSelector", source)
                end
           
            end            
        end)

        RegisterServerEvent("nyoModule/core/playerSpawned")
        AddEventHandler("nyoModule/core/playerSpawned",function()
            local source = source
            local account_id = NyoFw.getAccountId(source)
            TriggerEvent("nfw:openMultiCharacter", source, account_id)
        end)

        AddEventHandler("onResourceStop", function(resource)
            if resource == GetCurrentResourceName() then
                GlobalState:set('coreAccounts', NyoFw.accounts, false)
                GlobalState:set('coreRAccounts', NyoFw.raccounts, false)
                GlobalState:set('coreAccountsSource', NyoFw.account_source, false)
                GlobalState:set('coreRAccountsSource', NyoFw.raccount_source, false)
                GlobalState:set('coreUsers', NyoFw.users, false)
                GlobalState:set('coreRUsers', NyoFw.rusers, false)
                GlobalState:set('coreAccountU', NyoFw.account_user, false)
                GlobalState:set('coreRAccountU', NyoFw.raccount_user, false)
                GlobalState:set('coreUserSources', NyoFw.user_sources, false)
                GlobalState:set('coreUserTables', NyoFw.user_tables, false)
                GlobalState:set('coreAccountsVip', NyoFw.account_vip , false)
            end
        end)

        CreateThread(function()
            while true do 
                for k,v in pairs(NyoFw.user_tables) do
                    local source = NyoFw.user_sources[k] 
                    local data = NyoFw.user_tables[k]
                    local pedPos = GetEntityCoords(GetPlayerPed(source))
                    data.position = {x = pedPos.x, y = pedPos.y, z = pedPos.z}
                    data.health = GetEntityHealth(GetPlayerPed(source)) 
                    data.armor = GetPedArmour(GetPlayerPed(source))
                    if not data.playerSave then data.playerSave = 1 else data.playerSave = data.playerSave + 1 end

                    if data.playerSave > 10 then 
                        data.playerSave = nil
                        local characterId = NyoFw.getCharId(source)
                        if characterId then 
                            local health = data.health
                            local armour = data.armor
                            local position = {x = pedPos.x, y = pedPos.y, z = pedPos.z}

                            local hunger = Player(source).state.hunger
                            local thirst = Player(source).state.thirst

                            local playerData = NyoFw.user_tables[characterId]
                            local groups = json.encode(playerData.groups)
                            local inventory = json.encode(NyoFw.formatChest(playerData.inventory))
                            local customization = json.encode(playerData.customization)
                            local bank_money = playerData.bank_money
                            local vip = json.encode(playerData.playerVip)

                            NyoFw.querySync("Nfw:saveCharacter", { health = health, armour = armour, hunger = hunger, thirst = thirst, position = json.encode(position), customization = customization, groups = groups, inventory = inventory, bank_money = bank_money, vip = vip, character_id = characterId })
                        end                        
                    end
                end
                Wait(10000)
            end
        end)

        AddEventHandler("playerDropped",function(reason)
            local source = source
            local characterId = NyoFw.getCharId(source) 
            if characterId then 
                local playerPed = GetPlayerPed(source)
                local pedPos = GetEntityCoords(playerPed)            
                local health = GetEntityHealth(playerPed)  
                local armour = GetPedArmour(playerPed)
                local position = {x = pedPos.x, y = pedPos.y, z = pedPos.z}

                local hunger = Player(source).state.hunger
                local thirst = Player(source).state.thirst

                local playerData = NyoFw.user_tables[characterId]
                local groups = json.encode(playerData.groups)
                local inventory = json.encode(playerData.inventory)
                local customization = json.encode(playerData.customization)
                local bank_money = playerData.bank_money
                local vip = json.encode(playerData.playerVip)

                local pIdentifier = NyoFw.rusers[characterId]
                local pAccount = NyoFw.raccount_user[characterId]

                NyoFw.users[pIdentifier] = nil
                NyoFw.rusers[characterId] = nil
                NyoFw.user_tables[characterId] = nil
                NyoFw.user_sources[characterId] = nil
                NyoFw.account_user[pAccount] = nil 
                NyoFw.raccount_user[characterId] = nil
                NyoFw.account_vip[pAccount] = nil

                NyoFw.querySync("Nfw:saveCharacter", { health = health, armour = armour, hunger = hunger, thirst = thirst, position = json.encode(position), customization = customization, groups = groups, inventory = inventory, bank_money = bank_money, vip = vip, character_id = characterId })
            end            
        end)  
        
    end)
else
    error 'Module name has been modified'
    Nfw.preventCheat()
end