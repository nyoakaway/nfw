Nfw.extendModule(2, function()

    function NyoFw.generatePlate()
        local plate = NyoFw.generateStringNumber(NfwConfigs.garagesGeneralConfig.plateGenerationPattern)
        if NyoFw.querySync('SELECT id FROM nyo_users_vehicles WHERE plate = ?', {plate})[1] then
            return NyoFw.generatePlate()
        end
        return plate
    end
    
    NyoFw['generatePlate'] = NyoFw.generatePlate
end)