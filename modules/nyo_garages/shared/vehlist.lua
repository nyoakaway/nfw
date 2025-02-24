Nfw.extendModule(function()

    local IsServer = IsDuplicityVersion()
    local function _h(model)
        if type(model) == 'string' then
            model = GetHashKey(model)
        end
        return model
    end

    local funcs = {}
    
    funcs.getVehicleList = function()
        return NfwConfigs['garagesGeneralConfig'].vehicleList
    end

    funcs.getVehicleInfo = function(model)
        model = _h(model)
        local info = NfwConfigs['garagesGeneralConfig'].vehicleList[model]
        if not IsServer then
            local displayName = GetDisplayNameFromVehicleModel(model)
            if not info then
                info = {
                    modelname = displayName:lower(),
                    name = GetLabelText(displayName),
                    price = 0,
                    trunk = 0,
                    banned = false, 
                    type = 'UNKNOWN',
                    notFound = true
                }
            end
        end
        return info
    end

    funcs.getVehiclePrice = function(model)
        model = _h(model)
        return NfwConfigs['garagesGeneralConfig'].vehicleList[model] and NfwConfigs['garagesGeneralConfig'].vehicleList[model].price or 0
    end

    funcs.getVehicleType = function(model)
        model = _h(model)
        return NfwConfigs['garagesGeneralConfig'].vehicleList[model] and NfwConfigs['garagesGeneralConfig'].vehicleList[model].type or 'UNKNOWN'
    end

    funcs.getVehicleTrunk = function(model)
        model = _h(model)
        return NfwConfigs['garagesGeneralConfig'].vehicleList[model] and NfwConfigs['garagesGeneralConfig'].vehicleList[model].trunk or 0
    end

    funcs.getVehicleGloveCompartment = function(model)
        model = _h(model)
        return NfwConfigs['garagesGeneralConfig'].vehicleList[model] and NfwConfigs['garagesGeneralConfig'].vehicleList[model].gloveCompartment or 0
    end

    funcs.getVehicleName = function(model)
        model = _h(model)
        if NfwConfigs['garagesGeneralConfig'].vehicleList[model] and NfwConfigs['garagesGeneralConfig'].vehicleList[model].name then
            return NfwConfigs['garagesGeneralConfig'].vehicleList[model].name
        end
        if not IsServer then
            local displayName = GetDisplayNameFromVehicleModel(model)
            if displayName == 'CARNOTFOUND' then
                return 'UNKNOWN'
            end
            local name = GetLabelText(displayName)
            return name
        end
        return 'UNKNOWN'
    end

    funcs.getVehicleModelName = function(model)
        model = _h(model)
        local modelname = NfwConfigs['garagesGeneralConfig'].vehicleList[model] and NfwConfigs['garagesGeneralConfig'].vehicleList[model].modelname
        if not modelname and not IsServer then
            modelname = GetDisplayNameFromVehicleModel(model):lower()
        end
        return modelname or 'UNKNOWN'
    end

    funcs.isVehicleBanned = function(model)
        model = _h(model)
        return NfwConfigs['garagesGeneralConfig'].vehicleList[model] and NfwConfigs['garagesGeneralConfig'].vehicleList[model].banned or false
    end

    funcs.getVehicleAttribute = function(model, attr)
        model = _h(model)
        return NfwConfigs['garagesGeneralConfig'].vehicleList[model] and NfwConfigs['garagesGeneralConfig'].vehicleList[model][attr] or false
    end

    -- funcs.getClosestVehicleFromPlayer = function(radius)
    --     print(radius)
    --     return GetClosestVehicleFromPlayer(radius)
    -- end

    -- funcs.getClosestVehiclesFromPlayer = function(radius)
    --     return GetClosestVehiclesFromPlayer(radius)
    -- end

    for exportName, exportHandler in pairs(funcs) do
        exports(exportName, exportHandler)
        NyoFw[exportName] = exportHandler
    end

end)