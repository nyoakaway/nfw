Nfw.registerFunctions('nyofw',function()

    local lang = Nfw.getModuleLanguage()
    local errorMessages = {
        'insufficientItems',
        'insufficientMoney',
        'vehicleClassNotAllowed',
        'vehicleModelNotAllowed',
        'maxAmountOfRunnersReached'
    }

    local function replaceTable(str, table)
        return str:gsub("$(%w+)%s", function(n) return table[n] end)
    end

    return {
        onFailToStartRace = function(errorCode, errorData)
            local rTable = {}
            if errorCode == 1 then rTable = { item = NyoFw.getItemName(errorData[1]), amount = errorData[2] }
            elseif errorCode == 2 then rTable = { money = errorData[1] } 
            end
            NfwGlobalFunctions.notify('Erro', replaceTable(lang["notify-"..errorMessages[errorCode]], rTable), "red", 5000) 
        end,
        policeAlert = function(config)
            local blip = AddBlipForCoord(config.checkpoints[1][1])
            local bconfig = config.policeAlertBlip
            SetBlipSprite(blip,bconfig.id)
            SetBlipColour(blip,bconfig.color)
            SetBlipScale(blip,bconfig.scale)
            SetBlipAsShortRange(blip,true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(lang[bconfig.nameLangIndex])
            EndTextCommandSetBlipName(blip)
            NfwGlobalFunctions.notify(lang[config.policeTextLangIndex..'-title'], lang[config.policeTextLangIndex..'-subtitle'], "yellow", 5000)
            Wait(15000)
            RemoveBlip(blip)
        end
    }

end)