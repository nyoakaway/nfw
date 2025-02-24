Nfw.registerNyoModule('nyo_groupmanager', {}, false, function()
    
    NfwClient.registerInterface(1)

    -- RegisterCommand('gm', function()
    --     NfwClient.openUI({})   
    -- end)

    local gmdata = {}
    allUpgrades = GlobalState.allUpgrades or {}

    AddEventHandler("onResourceStop", function(resource)
        if resource == GetCurrentResourceName() then
            GlobalState:set('allUpgrades', allUpgrades, false)
        end 
    end)

    NfwClient.registerNUICallback('close', function(data,cb)
        SafeEvents.triggerServer('gm:close')
        SetNuiFocus(false, false)
        cb({})
    end)

    NfwClient.registerNUICallback('updateInfo', function(data,cb)
        SafeEvents.triggerServer('gm:updateInfo', data)
    end)

    NfwClient.registerNUICallback('changeGroupPermissions', function(data,cb)
        local groupId = tonumber(data.gId)
        local groupName = data.gName
        local perms = gmdata.groups[groupId][2]
        local perms2 = {{},{}}
        for k,v in pairs(data) do
            local find
            if k ~= 'gName' and k ~= 'gId' then 
                for l,w in pairs(perms) do
                    if w == k then
                        find = true
                    end
                end
                if not find then
                    table.insert(perms2[1], k)
                    table.insert(gmdata.groups[groupId][2], k)
                end 
            end            
           
        end
        for k,v in pairs(perms) do
            if not data[v] then
                table.insert(perms2[2], v)
                gmdata.groups[groupId][2][k] = nil
            end
        end

        if #perms2[1] > 0 or #perms2[2] > 0 then
            SafeEvents.triggerServer('gm:changeGroupPermission', perms2, groupId, groupName)
        end
    end)

    NfwClient.registerNUICallback('deleteGroup', function(data,cb)
        SafeEvents.triggerServer('gm:deleteGroup', data.groupId)
    end)

    -- NfwClient.registerNUICallback('renameGroup', function(data,cb)
    --     SafeEvents.triggerServer('gm:renameGroup', data[1], data[2])
    -- end)

    NfwClient.registerNUICallback('createGroup', function(data,cb)
        local perms = {}
        for k,v in pairs(data) do 
            if k ~= 'gName' then 
                table.insert(perms, k)
            end
        end
        local groupId = RPC.trigger('gm:createGroup', data.gName, perms)

        cb({groupId = groupId})
    end)

    NfwClient.registerNUICallback('contractId', function(data,cb)
        SafeEvents.triggerServer('gm:contractId', tonumber(data.id))
    end)

    NfwClient.registerNUICallback('changeGroup', function(data,cb)
        SafeEvents.triggerServer('gm:changeGroup', tonumber(data.char_id), tonumber(data.groupId))
    end)

    NfwClient.registerNUICallback('kickMember', function(data,cb)
        SafeEvents.triggerServer('gm:kickMember', tonumber(data[1]))
    end)

    NfwClient.registerNUICallback('buyUpgrade', function(data,cb)
        SafeEvents.triggerServer('gm:buyUpgrade', data.upgradeId)
    end)

    NfwClient.registerNUICallback('withdraw', function(data,cb)
        local success = RPC.trigger('gm:withdraw', tonumber(data.amount))
        cb({success = success})
    end)

    NfwClient.registerNUICallback('deposit', function(data,cb)
        local success = RPC.trigger('gm:deposit', tonumber(data.amount))
        cb({success = success})
    end)

    NfwClient.registerNUICallback('transfer', function(data,cb)
        local success = RPC.trigger('gm:transfer', tonumber(data.amount), data.orgTransferCode)
        cb({success = success})
    end)

    NfwClient.registerNUICallback('toogleService', function(data,cb)
        SafeEvents.triggerServer("gm:toogleService")
    end)


    
    SafeEvents.register('gm:open', function(data)
        gmdata = table.merge(data, {
            char_id = Player(-1).state.char_id,
            char_permissions = GlobalState.permissions
        })
        gmdata.config = NfwConfigs.gm_general_config.organizations[data.config]
        NfwClient.openUI(gmdata, true, true)
    end)

    SafeEvents.register('gm:close', function()
        NfwClient.closeUI()
    end)

    SafeEvents.register('core:setGroups', function(groups, permissions)
        local perms = {}
        for k,v in pairs(permissions) do
            perms[v] = true
        end
        local gr = {}
        for k,v in pairs(groups) do
            gr[v] = true
        end
        GlobalState.permissions = perms
        GlobalState.groups = gr
    end)

    SafeEvents.register('core:addPerms', function(group, perms)
        local gpermissions = GlobalState.permissions
        local ggroups = GlobalState.groups
        ggroups[group] = true
        for k,v in pairs(perms) do
            gpermissions[v] = true
        end
        GlobalState.permissions = gpermissions
        GlobalState.groups = ggroups
    end)

    SafeEvents.register('core:remPerms', function(group, perms)
        local gpermissions = GlobalState.permissions
        local ggroups = GlobalState.groups
        ggroups[group] = false
        for k,v in pairs(perms) do
            gpermissions[v] = false
        end
        GlobalState.permissions = gpermissions
        GlobalState.groups = ggroups
    end)

    RegisterNetEvent("gm:setipls", function(ipls)
        local iplRequest = {}
        local iplRemove = {}
        for _, iplData in pairs(ipls) do
            if iplData.type then                 
                iplRequest[iplData.name] = true
            else    
                iplRemove[iplData.name] = true
            end
        end

        for k,v in pairs(iplRequest) do 
            RequestIpl(k)
        end

        for k,v in pairs(iplRemove) do 
            RemoveIpl(k)
        end
    end)

    RegisterNetEvent("gm:setipl", function(iplData)
        for k,v in pairs(iplData) do 
            if v.type then 
                RequestIpl(v.name)
            else 
                RemoveIpl(v.name)
            end   
        end           
    end)

    RegisterNetEvent("gm:setUpgradesList", function(upgrades)
        for k,v in pairs(upgrades) do 
            allUpgrades[k] = true   
        end        
    end)

    RegisterNetEvent("gm:setUpgradeList", function(upgradeId)
        allUpgrades[upgradeId] = true
    end)

    NyoFw.hasPermission = function(perm)
        if not perm or perm == '' then return true end
        return GlobalState.permissions[perm] or false
    end

    NyoFw.checkUpgrade = function(upgrade)
        if allUpgrades[upgrade] then 
            return true
        end
        return false
    end

    AddEventHandler("nfw:closeUi", function()
        NfwClient.closeUI()
    end)

end)