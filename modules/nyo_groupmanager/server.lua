local module = 'nyo_groupmanager'
local traceback = debug.traceback()
local valid_traceback = string.format('@nfw/modules/%s/server.lua', module)

if traceback:find(valid_traceback) then
    Nfw.registerNyoModule(module, "1.0.0", {"nyo_core", "nyo_multi"}, false, function()

        -- LOGS TYPES
        --[[
            1 - TRANSFER
            2 - DEPOSIT
            3 - WITHDRAW
        ]]

        local gm_config = NfwConfigs.gm_general_config

        local organizations,groups = {},{}       
        local _organizations = NyoFw.querySync("SELECT * FROM nyo_gm_organizations")
        local _groups = NyoFw.querySync("SELECT * FROM nyo_gm_groups")
        local _permissions = NyoFw.querySync("SELECT * FROM nyo_gm_permissions")
        local _chars = NyoFw.querySync("SELECT members.org_id, members.char_id, members.donated_money, members.owner, members.contracted_by, members.date, chars.groups, chars.name, chars.last_name FROM nyo_gm_orgs_members members LEFT JOIN nyo_character chars ON chars.id = members.char_id")
        allUpgrades = {}

        local gmService = GlobalState.gmService or {}

        AddEventHandler("onResourceStop", function(resource)
            if resource == GetCurrentResourceName() then
                GlobalState:set('gmService', gmService, false)
            end
        end)

        for k,v in pairs(_organizations) do
            if not v.transfer_code then
                v.transfer_code = NyoFw.generateStringNumber('DLDLDDL')
                NyoFw.query('UPDATE nyo_gm_organizations SET transfer_code = ? WHERE id = ?', { v.transfer_code, v.id })
            end
            local gmUpgrade = json.decode(v.upgrades)
            organizations[v.id] = { icon = v.icon, name = v.name, max_members = v.max_members, money = v.money, config = v.config, creation_date = v.creation_date, groups = {}, members = {}, transfer_code = v.transfer_code, upgrades = gmUpgrade, prefix = v.prefix, type = v.type}
            if not gmService[v.name] then 
                gmService[v.name] = {}
            end           

            for k2, v2 in pairs(gmUpgrade) do 
               allUpgrades[v2] = true
            end
        end
        for k,v in pairs(_groups) do
            groups[v.id] = { org_id = v.org_id, name = v.name, permissions = {}}
            if organizations[v.org_id] then
                table.insert(organizations[v.org_id].groups, v.id)
            end
        end
        for k,v in pairs(_permissions) do
            if groups[v.group_id] then
                table.insert(groups[v.group_id].permissions, v.permission)
            end
        end
        for k,v in pairs(_chars) do
            local org_id, char_id, groups, owner, donated_money, name, photo, contracted_by, date = v.org_id, v.char_id, json.decode(v.groups) or {}, v.owner, v.donated_money,( v.name or '') ..' '.. (v.last_name or ''), v.photo, v.contracted_by, v.date
            if organizations[org_id] then
                local group
                for k,v in pairs(groups) do
                    for l,w in pairs(organizations[org_id].groups) do
                        if v == w then
                            group = w
                            break
                        end
                    end
                end
                organizations[org_id].members[char_id] = { name = name, photo = photo, group = group, donatedMoney = donated_money, owner = owner, contracted_by = contracted_by, date = date }
            end
        end
        _organizations, _groups, _permissions, _chars = nil, nil, nil, nil
       
        local openedGM = {}

        RegisterCommand("gm", function(source,args,rawCommand)
            if openedGM[source] then
                openedGM[source] = false
                SafeEvents.triggerClient("gm:close", source)
            end

            if args[1] then 
                local char_id = NyoFw.getCharId(source)
                local char_groups = NyoFw.getUserTable(char_id)
                local org
                
                for k,v in pairs(organizations) do
                    if v.prefix == args[1] and v.members[char_id] then
                        org = k
                        break
                    end
                end

                if org then
                    local data = table.clone(organizations[org])
                    data.groups = {}
                    for k,v in pairs(organizations[org].groups) do
                        data.groups[v] = {groups[v].name, groups[v].permissions}
                    end
                    data.members[''] = true
                    data.groups[''] = true
                    data.toogle = gmService[data.name]
                    openedGM[source] = org
                    local moneyLogs = NyoFw.querySync('SELECT * FROM nyo_gm_logs WHERE type IN(1,2,3) ORDER BY id DESC LIMIT 15')
                    for k,v in pairs(moneyLogs) do
                        moneyLogs[k].data = json.decode(v.data)
                    end
                    data.moneyLogs = moneyLogs
                    SafeEvents.triggerClient('gm:open', source, data)
                end
            else 
                NfwGlobalFunctions.notify(source, 'Erro', 'Informe um grupo para estar abrindo o GM.', "#FF0000", 5000)
                return     
            end
        end)

        SafeEvents.register("gm:close", function(source)
            openedGM[source] = false
        end)

        SafeEvents.register("gm:toogleService", function(src)
            local char_id = NyoFw.getCharId(src)
            local organization = organizations[openedGM[src]]
            local orgName = organization.name
            local atualToogle = gmService[orgName][src] or false
            if atualToogle then 
                gmService[orgName][src] = nil
            else 
                gmService[orgName][src] = {source = src, char_id = char_id, time = os.time()}
            end
        end)

        SafeEvents.register('gm:updateInfo', function(src, data)
            local char_id = NyoFw.getCharId(src)
            local organization = organizations[openedGM[src]]
            if organization and organization.members[char_id] and organization.members[char_id].owner then
                NyoFw.query('UPDATE nyo_gm_organizations SET name = ?, icon = ? WHERE id = ?', {data.name, data.icon, openedGM[src]})
                if not organization.creation_date then
                    NyoFw.query('UPDATE nyo_gm_organizations SET creation_date = ? WHERE id = ?', {os.time(), openedGM[src]})
                end
            end
        end)

        SafeEvents.register('gm:changeGroupPermission', function(src,data,groupId, groupName)
            local char_id = NyoFw.getCharId(src)
            local organization = organizations[openedGM[src]]
            if organization and organization.members[char_id] and organization.members[char_id].owner then
                if groups[groupId].name ~= groupName then 
                    groups[groupId].name = groupName
                    NyoFw.query('UPDATE nyo_gm_groups SET name = ? WHERE id = ?',{groupName,groupId})
                end

                for k,v in pairs(data[1]) do
                    NyoFw.query("INSERT INTO nyo_gm_permissions(group_id, permission) VALUES(?,?)", {groupId, v})
                    table.insert(groups[groupId].permissions, v)
                end
                for k,v in pairs(data[2]) do
                    NyoFw.query('DELETE FROM nyo_gm_permissions WHERE group_id = ? AND permission = ?', {groupId, v})
                    for l,w in pairs(groups[groupId].permissions) do
                        if w == v then
                            table.remove(groups[groupId].permissions, l)
                            break
                        end
                    end
                end

            end
        end)

        SafeEvents.register("gm:deleteGroup", function(src,groupId)
            local char_id = NyoFw.getCharId(src)
            local organization = organizations[openedGM[src]]
            if organization and organization.members[char_id] and organization.members[char_id].owner then
                NyoFw.query('DELETE FROM nyo_gm_groups WHERE id = ?', {groupId})
                groups[groupId] = nil
                for k,v in pairs(organization.groups) do 
                    if tonumber(v) == tonumber(groupId) then 
                        organization.groups[k] = nil
                        return
                    end
                end
            end
        end)

        -- SafeEvents.register("gm:renameGroup", function(src,groupId,name)
        --     local char_id = NyoFw.getCharId(src)
        --     local organization = organizations[openedGM[src]]
        --     if organization and organization.members[char_id] and organization.members[char_id].owner then
        --         NyoFw.query('UPDATE nyo_gm_groups SET name = ? WHERE id = ?',{name,groupId})
        --         groups[groupId].name = name
        --         for k,v in pairs(organization.groups) do 
        --             if v == groupId then 
        --                 return
        --             end
        --         end
        --         table.insert(organization.groups, groupId)
        --     end
        -- end)

        RPC.addHandler("gm:createGroup", function(src, name, perm)
            local char_id = NyoFw.getCharId(src)
            local organization = organizations[openedGM[src]]
            if organization and organization.members[char_id] and organization.members[char_id].owner then
                orgName = name
                orgPerm = perm
                local data = NyoFw.querySync('INSERT INTO nyo_gm_groups(org_id, name) VALUES(?, ?)', {openedGM[src], orgName})
                groups[data.insertId] = {name = orgName, permissions = {}}

                for k,v in pairs(orgPerm) do
                    NyoFw.query("INSERT INTO nyo_gm_permissions(group_id, permission) VALUES(?,?)", {data.insertId, v})
                    table.insert(groups[data.insertId].permissions, v)
                end

                table.insert(organization.groups, data.insertId)
                return data.insertId
            end
        end)

        SafeEvents.register("gm:contractId", function(src, id)
            local char_id = NyoFw.getCharId(src)
            local organization = organizations[openedGM[src]]
            if organization and organization.members[char_id] and (organization.members[char_id].owner or NyoFw.hasPermission(char_id, 'contract-members', openedGM[src])) then
                local player = NyoFw.getUserSource(id)
                local numMembers = 0
                for k,v in pairs(organization.members) do
                    numMembers += 1
                end
                if numMembers >= organization.max_members then
                    NfwGlobalFunctions.notify(src, 'Erro', 'Sua organização não pode contratar mais membros.', "#FF0000", 5000)
                    return
                end
                if not player then
                    NfwGlobalFunctions.notify(src, 'Erro', 'Parece que essa pessoa está indisponível, tente novamente mais tarde!', "#FF0000", 5000)
                    return 
                end
                for k,v in pairs(organizations) do
                    if v.members[id] then
                        if k == openedGM[src] then
                            NfwGlobalFunctions.notify(src, 'Erro', 'Essa pessoa já faz parte da sua organização.', "#FF0000", 5000)
                            return false
                        elseif v.type ~= 0 and v.type == organization.type then
                            NfwGlobalFunctions.notify(src, 'Erro', 'Ops, não foi possível convidar essa pessoa.', "#FF0000", 5000)
                            return false
                        end
                    end
                end
                local organizationId = openedGM[src]
                if NyoFw.request(player, 'Deseja entrar para a organização <b>'..organization.name..'</b>? Você foi convidado por <b>'..organization.members[char_id].name.. '</b>.', 30) then
                    NfwGlobalFunctions.notify(src, 'Sucesso', 'A pessoa foi contratada com sucesso.', '#00FF00', 5000)
                    NfwGlobalFunctions.notify(player, 'Sucesso', 'Você foi contratado com sucesso.', '#00FF00', 5000)
                    NyoFw.query('INSERT INTO nyo_gm_orgs_members(org_id, char_id, contracted_by, date) VALUES(?,?,?,?)',{organizationId, id, char_id, os.time()})
                    local identity = NyoFw.getCharacterIdentity(id)
                    organizations[organizationId].members[id] = { name = identity.name..' '..identity.middle_name..' '..identity.last_name, photo = nil, group = nil, donatedMoney = 0, owner = false, contracted_by = char_id, date = os.time() }
                end
            end
        end)

        SafeEvents.register('gm:changeGroup', function(src,id,groupId)
            local char_id = NyoFw.getCharId(src)
            local organization = organizations[openedGM[src]]
            if organization and organization.members[char_id] and (organization.members[char_id].owner or NyoFw.hasPermission(char_id, 'change-groups', openedGM[src])) then
                NyoFw.remUserGroup(id, organization.members[id].group)
                NyoFw.addUserGroup(id, groupId)
                organizations[openedGM[src]].members[id].group = groupId
            end
        end)

        SafeEvents.register('gm:kickMember', function(src, id)
            local char_id = NyoFw.getCharId(src)
            local organization = organizations[openedGM[src]]
            if organization and organization.members[char_id] and (organization.members[char_id].owner or NyoFw.hasPermission(char_id, 'kick-member', openedGM[src])) then
                NyoFw.query('DELETE FROM nyo_gm_orgs_members WHERE char_id = ? AND org_id = ?',{id, openedGM[src]})
                NyoFw.remUserGroup(id, organization.members[id].group)
                organizations[openedGM[src]].members[id] = nil
            end
        end)

        SafeEvents.register('gm:buyUpgrade', function(src,upgradeId)
            local char_id = NyoFw.getCharId(src)
            local organization = organizations[openedGM[src]]
            if organization and organization.members[char_id] and (organization.members[char_id].owner or NyoFw.hasPermission(char_id, 'buy-upgrades', openedGM[src])) then
                local upgrade = NfwConfigs.gm_general_config.organizations[organization.config].upgrades[upgradeId]
                if organization.money >= upgrade.price then
                    organizations[openedGM[src]].money -= upgrade.price
                    table.insert(organizations[openedGM[src]].upgrades, upgradeId)
                    allUpgrades[upgradeId] = true
                    NyoFw.query('UPDATE nyo_gm_organizations SET money = ?, upgrades = ? WHERE id = ?', {organizations[openedGM[src]].money,json.encode(organizations[openedGM[src]].upgrades),openedGM[src]})
                    if upgrade.type == 'ipl' then
                        local ipls = {}
                        for iplName,iplType in pairs(upgrade.iplList) do 
                            table.insert(ipls, { name = iplName, type = iplType } )
                        end
                        TriggerClientEvent('gm:setipl', -1, ipls)
                    elseif upgrade.type == 'maxmember' then 
                        organizations[openedGM[src]].max_members = organizations[openedGM[src]].max_members + upgrade.addMaxMember
                        NyoFw.query('UPDATE nyo_gm_organizations SET max_members = ? WHERE id = ?', {organizations[openedGM[src]].max_members,openedGM[src]})
                    end
                    TriggerClientEvent("gm:setUpgradeList", -1, upgradeId)
                end
            end
        end)

        RPC.addHandler('gm:withdraw', function(src,amount)
            local char_id = NyoFw.getCharId(src)
            local organization = organizations[openedGM[src]]
            if organization and organization.members[char_id] and (organization.members[char_id].owner or NyoFw.hasPermission(char_id, 'money-management', openedGM[src])) then
                if organization.money >= amount then
                    organization.money -= amount
                    NyoFw.query('UPDATE nyo_gm_organizations SET money = ? WHERE id = ?', {organization.money, openedGM[src]})
                    NyoFw.query('INSERT INTO nyo_gm_logs(org_id, type, data) VALUES(?,?,?)', {openedGM[src], 3, json.encode({amount, char_id})})
                    NyoFw.giveMoney(char_id, amount)
                    return true
                end
            end
        end)

        RPC.addHandler('gm:deposit', function(src,amount)
            local char_id = NyoFw.getCharId(src)
            local organization = organizations[openedGM[src]]
            if organization and organization.members[char_id] and (organization.members[char_id].owner or NyoFw.hasPermission(char_id, 'money-management', openedGM[src])) then
                if not NyoFw.tryFullPayment(char_id, amount) then return false end
                organization.money += amount
                NyoFw.query('UPDATE nyo_gm_organizations SET money = ? WHERE id = ?', {organization.money, openedGM[src]})
                NyoFw.query('UPDATE nyo_gm_orgs_members SET donated_money = donated_money + ? WHERE char_id = ? AND org_id = ?', {amount, char_id, openedGM[src]})
                NyoFw.query('INSERT INTO nyo_gm_logs(org_id, type, data) VALUES(?,?,?)', {openedGM[src], 2, json.encode({amount, char_id})})
                organization.members[char_id].donatedMoney += amount
                return true
            end
        end)

        RPC.addHandler('gm:transfer', function(src,amount,transfer_code)
            local char_id = NyoFw.getCharId(src)
            local organization = organizations[openedGM[src]]

            if organization and organization.members[char_id] and (organization.members[char_id].owner or NyoFw.hasPermission(char_id, 'money-management', openedGM[src])) then
                if organization.money >= amount then
                    local org, orgId
                    for k,v in pairs(organizations) do
                        if v.transfer_code == transfer_code then
                            org = organizations[k]
                            orgId = k
                            break
                        end
                    end
                    if org then
                        organization.money -= amount
                        org.money += amount
                        
                        NyoFw.query('UPDATE nyo_gm_organizations SET money = ? WHERE id = ?', {organization.money, openedGM[src]})
                        NyoFw.query('UPDATE nyo_gm_organizations SET money = ? WHERE id = ?', {org.money, orgId})
                        NyoFw.query('INSERT INTO nyo_gm_logs(org_id, type, data) VALUES(?,?,?)', {openedGM[src], 2, json.encode({amount, char_id, orgId})})
                        return true
                    end
                end
            end
        end)

        NyoFw.hasGroup = function(char_id, group)
            local gtype = type(group)
            local groups = NyoFw.getUserGroups(char_id)
            for k,v in pairs(groups) do
                if gtype == 'number' then
                    if v == group then return true end
                else
                    if groups[v] then
                        if groups[v].name == group then return true end
                    end
                end
            end
            return false
        end

        NyoFw.getUserGroups = function(char_id)
            return NyoFw.getUserTable(char_id).groups or {}
        end

        NyoFw.hasPermission = function(char_id, perm, org_id)
            local char_groups = NyoFw.getUserGroups(char_id)
            for k,v in pairs(char_groups) do
                if groups[v] then
                    if not org_id or groups[v].org_id == org_id then
                        for l,w in pairs(groups[v].permissions) do
                            if w == perm then
                                return true
                            end
                        end
                    end
                end
            end
            return false
        end

        NyoFw.addUserGroup = function(char_id, group_id)
            local data = NyoFw.getUserTable(char_id)
            if data then
                for k,v in pairs(data.groups) do
                    if v == group_id then
                        return
                    end
                end
                local insertPerms = {}
                for k,v in pairs(groups[group_id].permissions) do
                    if not NyoFw.hasPermission(char_id, v) then
                        insertPerms[#insertPerms + 1] = v
                    end
                end
                table.insert(data.groups, group_id)
                SafeEvents.triggerClient('core:addPerms', NyoFw.getUserSource(char_id), group_id, insertPerms)
                NyoFw.query("UPDATE nyo_character SET groups = ? WHERE id = ?", {json.encode(data.groups), char_id})
            else
                local data = NyoFw.querySync('SELECT groups FROM nyo_character WHERE id = ?', {char_id})
                if not data[1] then return end
                local groups = json.decode(data[1].groups) or {}
                for k,v in pairs(groups) do
                    if v == group_id then
                        return
                    end
                end
                table.insert(groups, group_id)
                NyoFw.query("UPDATE nyo_character SET groups = ? WHERE id = ?", {json.encode(groups), char_id})
            end
        end

        NyoFw.remUserGroup = function(char_id, group_id)
            local data = NyoFw.getUserTable(char_id)
            if data then
                for k,v in pairs(data.groups) do
                    if v == group_id then
                        table.remove(data.groups, k)
                        local removePerms = {}
                        for k,v in pairs(groups[group_id].permissions) do
                            if not NyoFw.hasPermission(char_id, v) then
                                removePerms[#removePerms + 1] = v
                            end
                        end
                        SafeEvents.triggerClient('core:remPerms', NyoFw.getUserSource(char_id), group_id, removePerms)
                        return
                    end
                end
            else                
                local data = NyoFw.querySync('SELECT groups FROM nyo_character WHERE id = ?', {char_id})
                if not data[1] then return end
                local groups = json.decode(data[1].groups) or {}
                for k,v in pairs(groups) do
                    if v == group_id then
                        table.remove(groups, k)
                        NyoFw.query("UPDATE nyo_character SET groups = ? WHERE id = ?", {json.encode(groups), char_id})
                        return
                    end
                end
            end
        end

        NyoFw.getGroupName = function(group_id)
            return groups[group_id] and groups[group_id].name or ""
        end

        NyoFw.getUsersByPermission = function(perm)
            local rusers = {}
            local users = NyoFw.getUsers()
            for k,v in pairs(users) do
                if NyoFw.hasPermission(k, perm) then
                    table.insert(rusers, k)
                end
            end
            return rusers
        end

        NyoFw.inService = function(orgName)
            if gmService[orgName] then 
                return gmService[orgName]
            end
            return {}
        end

        exports('getUserGroups', NyoFw.getUserGroups)
        exports('hasPermission', NyoFw.hasPermission)
        exports('hasGroup', NyoFw.hasGroup)
        exports('addUserGroup', NyoFw.addUserGroup)
        exports('remUserGroup', NyoFw.remUserGroup)
        exports('getGroupName', NyoFw.getGroupName)
        exports('getUsersByPermission', NyoFw.getUsersByPermission)
        exports('inService', NyoFw.inService)

        AddEventHandler('nfw:playerSpawn', function(char_id, src)
            local char_groups = NyoFw.getUserGroups(char_id)
            local char_perms = {}
            for k,v in pairs(char_groups) do
                local g = groups[v]
                if g then
                    for k,v in pairs(g.permissions) do
                        table.insert(char_perms, v)
                    end
                end
            end
            local ipls = {}
            for k,organization in pairs(organizations) do
                for _, upgradeId in pairs(organization.upgrades) do
                    local upgrade = NfwConfigs.gm_general_config.organizations[organization.config].upgrades[upgradeId]
                    if upgrade.type == 'ipl' then
                        for iplName,iplType in pairs(upgrade.iplList) do 
                            table.insert(ipls, { name = iplName, type = iplType } )
                        end
                        
                    end
                end
            end
            TriggerClientEvent('gm:setipls', src, ipls)
            TriggerClientEvent('gm:setUpgradesList', src, allUpgrades)
            SafeEvents.triggerClient('core:setGroups', src, char_groups, char_perms)
        end)

    end)
else
    error 'Module name has been modified'
    Nfw.preventCheat()
end