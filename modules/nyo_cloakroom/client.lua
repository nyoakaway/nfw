Nfw.registerNyoModule('nyo_cloakroom', {}, false, function()
    local cloakRoomConfig = {} 
    local configIndex

    NfwClient.registerInterface(1)

    local parse_part = function(key)
        if type(key) == "string" and string.sub(key,1,1) == "p" then
            return true,tonumber(string.sub(key,2))
        else
            return false,tonumber(key)
        end
    end

    NfwClient.registerKeyPress(function(v,k)
        configIndex = v.config
        NfwClient.disableMarkerType(1)
        local config = NfwConfigs[v.config].cloakConfig
        local ped = plyPed
        cloakRoomConfig = config

        local pedModel = GetEntityModel(ped)
        local sexo = ''
        local prefix = ''

        if pedModel == GetHashKey("mp_m_freemode_01") then
            sexo = 'Male'
            prefix = 'M'                
        elseif pedModel == GetHashKey("mp_f_freemode_01") then 
            sexo = 'Female'
            prefix = 'F'
        end

        NfwClient.openUI({
            sexo = prefix,
            config = config
        })
        SetNuiFocus(true, true)
    end)

    NfwClient.registerNUICallback("close", function(data, cb)
        NfwClient.enableMarkerType(1)
        SetNuiFocus(false, false)
    end)

    NfwClient.registerNUICallback("changeClothe",function(data,cb)
        local custom = RPC.trigger('cloakroom-changeCloakClothe', data.id, configIndex, data.sexo, NyoFw.getCustomization())
        if custom then
            NyoFw.setCustomization(custom)
        end
    end)

    AddEventHandler("nfw:closeUi", function()
        NfwClient.closeUI()
    end)
end)