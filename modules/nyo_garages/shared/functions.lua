Nfw.extendModule(function()

    GaragesFunctions = {}

    GaragesFunctions.getVehicleTax = function(vehHash, char_id, work)
        if NfwConfigs.garagesGeneralConfig.taxPrice.type == 1 then
            return NfwConfigs.garagesGeneralConfig.taxPrice.value * NyoFw.getVehiclePrice(vehHash)
        elseif NfwConfigs.garagesGeneralConfig.taxPrice.type == 2 then
            return NfwConfigs.garagesGeneralConfig.taxPrice.value
        else
            return NfwConfigs.garagesGeneralConfig.taxPrice.value(vehHash, char_id, work)
        end
    end

    GaragesFunctions.getScrappedVehicleInsuranceTax = function(vehHash, char_id, work)
        if NfwConfigs.garagesGeneralConfig.scrappedVehicleInsuranceTax.type == 1 then
            return NfwConfigs.garagesGeneralConfig.scrappedVehicleInsuranceTax.value * NyoFw.getVehiclePrice(vehHash)
        elseif NfwConfigs.garagesGeneralConfig.scrappedVehicleInsuranceTax.type == 2 then
            return NfwConfigs.garagesGeneralConfig.scrappedVehicleInsuranceTax.value
        else
            return NfwConfigs.garagesGeneralConfig.scrappedVehicleInsuranceTax.value(vehHash, char_id, work)
        end
    end

    GaragesFunctions.getVehicleDetentionTax = function(vehHash, char_id, work)
        if NfwConfigs.garagesGeneralConfig.detentionTax.type == 1 then
            return NfwConfigs.garagesGeneralConfig.detentionTax.value * NyoFw.getVehiclePrice(vehHash)
        elseif NfwConfigs.garagesGeneralConfig.detentionTax.type == 2 then
            return NfwConfigs.garagesGeneralConfig.detentionTax.value
        else
            return NfwConfigs.garagesGeneralConfig.detentionTax.value(vehHash, char_id, work)
        end
    end
    
    GaragesFunctions.getVehicleExplodedVehicleInsuranceTax = function(vehHash, char_id, work)
        if NfwConfigs.garagesGeneralConfig.explodedVehicleInsuranceTax.type == 1 then
            return NfwConfigs.garagesGeneralConfig.explodedVehicleInsuranceTax.value * NyoFw.getVehiclePrice(vehHash)
        elseif NfwConfigs.garagesGeneralConfig.explodedVehicleInsuranceTax.type == 2 then
            return NfwConfigs.garagesGeneralConfig.explodedVehicleInsuranceTax.value
        else
            return NfwConfigs.garagesGeneralConfig.explodedVehicleInsuranceTax.value(vehHash, char_id, work)
        end
    end

    GaragesFunctions.getVehicleGarageTax = function(vehHash, char_id, work, config)
        local gConfig = NfwConfigs[config].garagemConfig.payment
        if gConfig then
            if gConfig.type == 1 then
                return gConfig.value * NyoFw.getVehiclePrice(vehHash)
            elseif gConfig.type == 2 then
                return gConfig.value
            else
                return gConfig.value(vehHash, char_id, work)
            end
        end
        return false
    end 

    for exportName, exportHandler in pairs(GaragesFunctions) do
        exports(exportName, exportHandler)
    end

end)