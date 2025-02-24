Nfw.registerNyoModule('nyo_bennys', {}, false, function()    
    local resetIgnore = false
    local bennysCamera,gameplaycam,inBennys,bennysFocusInput
    local modTypes = {
        [0]  = { name = 'Aerofólio', category = 'customization' },
        [1]  = { name = 'Parachoque Frontal', category = 'customization' },
        [2]  = { name = 'Parachoque Traseiro', category = 'customization' },
        [3]  = { name = 'Saia Lateral', category = 'customization' },
        [4]  = { name = 'Escapamento', category = 'performance' },
        [5]  = { name = 'Chassi', category = 'customization' },
        [6]  = { name = 'Grade Frontal', category = 'customization' },
        [7]  = { name = 'Capô', category = 'customization' },
        [8]  = { name = 'Paralamas', category = 'customization' },
        [9]  = { name = 'Paralama Direita', category = 'customization' },
        [10] = { name = 'Teto', category = 'customization' },
        [11] = { name = 'Motor', category = 'performance' },
        [12] = { name = 'Freio', category = 'performance' },
        [13] = { name = 'Transmissão', category = 'performance' },
        [14] = { name = 'Buzina', category = 'customization' },
        [15] = { name = 'Suspensão', category = 'performance' },
        [16] = { name = 'Resistência', category = 'performance' },
        [17] = { name = 'Nitro', category = 'performance' },
        [18] = { name = 'Turbo', category = 'performance' },
        [19] = { name = 'Som', category = 'customization' },
        [20] = { name = 'Fumaça da Roda', category = 'wheels' },
        [21] = { name = 'Hidráulica', category = 'performance' },
        [22] = { name = 'Faróis Xenson', category = 'appearance' },
        [23] = { name = 'Rodas', category = 'wheels' },
        [24] = { name = 'Inclinação das Rodas', category = 'wheels' },
        [25] = { name = 'Decoração de Placa', category = 'customization' },
        [26] = { name = 'Placa Customizada', category = 'customization' },
        [27] = { name = 'Painel', category = 'interior' },
        [28] = { name = 'Gaiola de Proteção', category = 'interior' },
        [29] = { name = 'Interior 3', category = 'interior' },
        [30] = { name = 'Velocímetro', category = 'interior' },
        [31] = { name = 'Portas', category = 'interior' },
        [32] = { name = 'Assentos', category = 'interior' },
        [33] = { name = 'Volante', category = 'interior' },
        [34] = { name = 'Decoração Interna', category = 'interior' },
        [35] = { name = 'Decoração', category = 'customization' },
        [36] = { name = 'Alto Falantes', category = 'customization' },
        [37] = { name = 'Porta Malas', category = 'customization' },
        [38] = { name = 'Suspensão a ar', category = 'performance' },
        [39] = { name = 'Motor', category = 'customization' },
        [40] = { name = 'Customização de Motor 1', category = 'performance' },
        [41] = { name = 'Customização de Motor 2', category = 'performance' },
        [42] = { name = 'Cobertura Frontal', category = 'customization' },
        [43] = { name = 'Antenas', category = 'customization' },
        [44] = { name = 'Chassi 4', category = 'customization' },
        [45] = { name = 'Armas', category = 'customization' },
        [46] = { name = 'Porta Esquerda', category = 'customization' },
        [47] = { name = 'Porta Direita', category = 'customization' },
        [48] = { name = 'Pintura', category = 'appearance' },
        [49] = { name = 'Luz', category = 'appearance' },
    }

    local paymentType
    local bennysConfig = {}
    local playerVeh,vehModifications,newModifications,avaiableModifications

    local function openBennys(config)
        console.debug('^3[ BENNYS ] ^7Open bennys UI')
        resetIgnore = false
        local ped = PlayerPedId()
        playerVeh = GetVehiclePedIsIn(ped,false)
        if playerVeh == 0 then
            return
        end

        if config.disableTuningWorkVehicles and Nfw.isModuleActive('nyo_garages') then
            local isWork = RPC.trigger('bennys-checkIsWork', VehToNet(playerVeh))
            if isWork then
                return
            end
        end

        if config.hidePlayers then
            NfwClient.enableHidingPlayers()
        end

        if config.hideVehicles then
            NfwClient.enableHidingVehicles()
        end

        NfwClient.disableMarkerType(1)

        inBennys = true

        paymentType = config.paymentType
        bennysConfig = config.bennysConfig
        newModTypes = table.clone(modTypes)

        gameplaycam = GetRenderingCam()
        SetVehicleModKit(playerVeh,0)

        local isBike = IsThisModelABike(GetEntityModel(playerVeh))

        local r1,g1,b1 = GetVehicleCustomPrimaryColour(playerVeh)
        local r2,g2,b2 = GetVehicleCustomSecondaryColour(playerVeh)
        local r3,g3,b3 = GetVehicleTyreSmokeColor(playerVeh)
        local r4,g4,b4 = GetVehicleNeonLightsColour(playerVeh)
        local wheelType = GetVehicleWheelType(playerVeh)
        local pearlescentColour, wheelColour = GetVehicleExtraColours(playerVeh)

        vehModifications = {}
        availableModifications = {}

        for i = 0,49 do
            vehModifications[i] = GetVehicleMod(playerVeh,i)
            local numMods = GetNumVehicleMods(playerVeh,i)
            local modSlotName = GetModSlotName(playerVeh,i)
            if modSlotName and modSlotName ~= "" then
                local labelName = GetLabelText(modSlotName)
                if labelName and labelName ~= 'NULL' then
                    newModTypes[i].name = labelName
                else
                    newModTypes[i].name = modSlotName
                end
            end
            newModTypes[i].price = bennysConfig[i] and bennysConfig[i].price or 1000
            newModTypes[i].increaseBy = bennysConfig[i] and bennysConfig[i].increaseBy or 0
            local modsNames = {}
            if i == 9 then
                goto restart
            end
            if i == 23 then
                for j = 0, 12 do
                    SetVehicleWheelType(playerVeh,j)
                    numMods = GetNumVehicleMods(playerVeh,i)
                    modsNames[j] = {}
                    for r = 0, numMods - 1 do
                        modsNames[j][r] = GetLabelText(GetModTextLabel(playerVeh,23,r))
                    end
                    modsNames[j].numMods = numMods
                end
                availableModifications[i] = {1,modsNames}
            else
                for j = -1, numMods -1 do
                    local modTextLabel = GetModTextLabel(playerVeh,i,j)
                    if modTextLabel then
                        local label = GetLabelText(modTextLabel)
                        if label and label ~= "NULL" then
                            modsNames[j] = label
                        end
                    end
                end
                availableModifications[i] = {numMods,modsNames}
            end
            ::restart::
        end
        -- SetVe

        vehModifications.primaryPaintType   = GetVehicleModColor_1(playerVeh)
        vehModifications.secondaryPaintType = GetVehicleModColor_2(playerVeh)
        -- vehModifications.dashboardColour    = GetVehicleDashboardColor(playerVeh)
        -- vehModifications.interiorColour     = GetVehicleInteriorColour(playerVeh)
        vehModifications[20]                = IsToggleModOn(playerVeh, 20)
        vehModifications[18]                = IsToggleModOn(playerVeh, 18)
        vehModifications[22]                = IsToggleModOn(playerVeh, 22)
        vehModifications.windowTint         = GetVehicleWindowTint(playerVeh)
        vehModifications.xenonColour        = GetVehicleXenonLightsColor(playerVeh)
        vehModifications.wheelType          = wheelType
        vehModifications.pearlescentColour  = pearlescentColour
        vehModifications.wheelColour        = wheelColour
        vehModifications.primaryColour      = {r = r1,g = g1, b = b1}
        vehModifications.secondaryColour    = {r = r2,g = g2, b = b2}
        vehModifications.tyreSmokeColour    = {r = r3,g = g3, b = b3}
        vehModifications.neon               = { color = { r = r4, g = g4, b = b4} }
        vehModifications.plate              = GetVehicleNumberPlateTextIndex(playerVeh)
        vehModifications.customTires1       = GetVehicleModVariation(playerVeh, 23)
        vehModifications.bulletProofTyres   = GetVehicleTyresCanBurst(playerVeh)

        SetVehicleWheelType(playerVeh,wheelType)
        SetVehicleMod(playerVeh, 23, vehModifications[23], vehModifications.customTires1)

        if isBike then
            vehModifications.customTires2 = GetVehicleModVariation(playerVeh, 24)
            vehModifications[24] = GetVehicleMod(playerVeh,24)
            SetVehicleMod(playerVeh, 24, vehModifications[24],vehModifications.customTires1 or vehModifications.customTires2)
        end

        if vehModifications.primaryPaintType == 6 then
            vehModifications.primaryPaintType = 0
            SetVehicleModColor_1(playerVeh, 0, 0, vehModifications.pearlescentColour)
            SetVehicleCustomPrimaryColour(playerVeh, vehModifications.primaryColour.r, vehModifications.primaryColour.g, vehModifications.primaryColour.b)
        end

        if vehModifications.secondaryPaintType == 6 then
            vehModifications.secondaryPaintType = 0
            SetVehicleModColor_2(playerVeh, 0, 0)
            SetVehicleCustomSecondaryColour(playerVeh, vehModifications.secondaryColour.r, vehModifications.secondaryColour.g, vehModifications.secondaryColour.b)
        end

        if vehModifications.windowTint == -1 then
            vehModifications.windowTint = 0
            SetVehicleWindowTint(playerVeh,0)
        end

        for i = 0, 3 do
            vehModifications.neon[i] = IsVehicleNeonLightEnabled(playerVeh,i)
        end

        newModifications = table.clone(vehModifications)

        local vehicle, netvehicle, plate, vname = NyoFw.getClosestVehiclesInfo(2.0)

        FreezeEntityPosition(playerVeh,true)
        SetNuiFocus(true, true)
        NfwClient.openUI({
            config = bennysConfig,
            vehModifications = vehModifications,
            availableModifications = availableModifications,
            modTypes = newModTypes,
            vname = vname,
            isBike = isBike,
            rawConfig = config
        })

    end

    NfwClient.registerInterface(1)
    NfwClient.registerKeyPress(function(v,k)
        openBennys(NfwConfigs[v.config])
    end)

    Nfw.registerCommand(function(v)
        openBennys(NfwConfigs[v.config])    
    end)

    local function setCustomization(veh, data)
        local isBike = IsThisModelABike(GetEntityModel(veh))

        SetVehicleModKit(veh,0)
        SetVehicleWheelType(veh,data.wheelType)

        local boolIndexes = {[18] = true, [22] = true, [20] = true, ['18'] = true, ['22'] = true, ['20'] = true}

        for i = 0, 49 do
            local index = tostring(i)
            if type(data[index] or data[i]) == "boolean" or boolIndexes[data[index] and index or i] then
                ToggleVehicleMod(veh,i,data[index] or data[i])
            elseif i == 23 or (isBike and i == 24) then
                SetVehicleMod(veh,i,data[index] or data[i], i == 23 and data.customTires1 or data.customTires2)
            else
                SetVehicleMod(veh,i,data[index] or data[i])
            end
        end

        if data.neon then 
            for i = 0, 3 do
                if data.neon[i] == 1 then
                    data.neon[i] = IsVehicleNeonLightEnabled(playerVeh,i)
                else
                    SetVehicleNeonLightEnabled(veh, i, data.neon[tostring(i)])
                end
            end
        end
      

        SetVehicleModColor_1(veh, data.primaryPaintType, 0, data.pearlescentColour)
        SetVehicleModColor_2(veh, data.secondaryPaintType, 0)
        SetVehicleCustomPrimaryColour(veh, data.primaryColour.r, data.primaryColour.g, data.primaryColour.b)
        SetVehicleCustomSecondaryColour(veh, data.secondaryColour.r, data.secondaryColour.g, data.secondaryColour.b)
        -- SetVehicleDashboardColor(veh, data.dashboardColour)
        -- SetVehicleInteriorColour(veh, data.interiorColour)
        SetVehicleTyreSmokeColor(veh, data.tyreSmokeColour.r, data.tyreSmokeColour.g, data.tyreSmokeColour.b)
        SetVehicleExtraColours(veh, data.pearlescentColour, data.wheelColour)
        SetVehicleWindowTint(veh, data.windowTint)
        SetVehicleNeonLightsColour(veh,data.neon.color.r,data.neon.color.g,data.neon.color.b)
        SetVehicleXenonLightsColor(veh, data.xenonColour)
        SetVehicleNumberPlateTextIndex(veh, data.plate)
        SetVehicleTyresCanBurst(veh, data.bulletProofTyres == true)
    end

    NfwClient.registerNUICallback('bennysClose', function(data,cb)
        console.debug('^3[ BENNYS ] ^7Close bennys UI')
        NfwClient.enableMarkerType(1)
        NfwClient.disableHidingPlayers()
        NfwClient.disableHidingVehicles()
        if resetIgnore then return end
        inBennys,bennysFocusInput = false, false

        SetNuiFocus(false, false)
        SetNuiFocusKeepInput(false)
        FreezeEntityPosition(playerVeh,false)

        setCustomization(playerVeh, vehModifications)
        
        vehModifications,newModifications,availableModifications = nil,nil,nil

        cb({})
    end)

    NfwClient.registerNUICallback("bennysSave",function(data,cb)
        console.debug('^3[ BENNYS ] ^7Save custom')
        resetIgnore = true
        inBennys,bennysFocusInput = false, false

        SetNuiFocus(false, false)
        SetNuiFocusKeepInput(false)
        FreezeEntityPosition(playerVeh,false)

        NfwClient.closeUI()

        local payPrice = 0
        local vehicle, netvehicle, plate, vname = NyoFw.getClosestVehiclesInfo(2.0)

        if not vname then return end

        local success, error = RPC.trigger('bennys-tryPayment', vname, vehModifications, newModifications, bennysConfig, plate, paymentType, netvehicle)

        if not success then
            TriggerEvent("Notify", "erro", error, 8000, "fa-heartbeat")
            setCustomization(playerVeh, vehModifications)
        else
            TriggerEvent("Notify", "sucesso","Tunagens aplicadas com sucesso", 8000)
        end

        vehModifications,newModifications,availableModifications = nil,nil,nil

        cb({})
    end)

    NfwClient.registerNUICallback('bennysSetFocus', function(data,cb)
        console.debug('^3[ BENNYS ] ^7Change UI Focus')
        if inBennys then
            bennysFocusInput = not bennysFocusInput
            SetNuiFocusKeepInput(bennysFocusInput)
            while bennysFocusInput do
                DisableControlAction(0,200,true)
                DisableControlAction(0,263,true)
                DisableControlAction(0,264,true)
                DisableControlAction(0,257,true)
                DisableControlAction(0,140,true)
                DisableControlAction(0,141,true)
                DisableControlAction(0,142,true)
                DisableControlAction(0,121,true)
                DisableControlAction(0,114,true)
                DisableControlAction(0,92,true)
                DisableControlAction(0,70,true)
                DisableControlAction(0,69,true)
                DisableControlAction(0,24,true)
                DisableControlAction(0,25,true)
                Wait(4)
            end
        end
        cb({})
    end)

    RegisterNetEvent('nfw:applyVehicleCustomization',function(netid,data,_veh)
        console.debug('^3[ BENNYS ] ^7Apply vehicle custom')
        if not data then return end
        local veh = _veh or NetToVeh(netid)
        if type(data) == 'string' then data = json.decode(data) end
        setCustomization(veh, data)
    end)

    local setModHandlers = {}

    local function setModChangeHandler(modIndex, handler)
        setModHandlers[modIndex] = handler
    end

    local function getCartValue()
        local payPrice = 0

        for k,v in pairs(newModifications) do
            local kCfg = bennysConfig[k]
            local typeV = type(v)
            if k == 'wheelType' then
            elseif k == 23 then
                if v ~= vehModifications[k] or newModifications.wheelType ~= vehModifications.wheelType then
                    if kCfg.price then
                        payPrice = payPrice + (kCfg.price + (kCfg.increaseBy * v))
                    end
                end
            elseif k == 'neon' then
                for i = 0,3 do
                    if v[i] ~= vehModifications[k][i] then
                        if kCfg.toggle.price then
                            payPrice = payPrice + (kCfg.toggle.price)
                        end
                    end
                end
                if not table.compare(v.color,vehModifications[k].color) then
                    if kCfg.color.price then
                        payPrice = payPrice + (kCfg.color.price)
                    end
                end
            elseif k == 'customTires1' or k == 'customTires2' then
                if typeV == 'table' and not table.compare(v,vehModifications[k]) or v ~= vehModifications[k] and typeV ~= 'table' then
                    kCfg = bennysConfig.customTires
                    if kCfg.price then
                        payPrice = payPrice + (kCfg.price)
                    end
                end
            else
                if typeV == 'table' and not table.compare(v,vehModifications[k]) or v ~= vehModifications[k] and typeV ~= 'table' then
                    if kCfg.price then
                        if typeV == 'table' or typeV == 'boolean' then                                 
                            payPrice = payPrice + kCfg.price
                        else                                 
                            payPrice = payPrice + (kCfg.price + (kCfg.increaseBy * v))
                        end
                    end
                end
            end
        end

        return payPrice
    end

    NfwClient.registerNUICallback('setMod', function(data,cb)
        if setModHandlers[data.mod] then
            setModHandlers[data.mod](data)
        else
            if data.modIndex then
                if not data.hover then newModifications[data.mod] = data.modIndex end
                SetVehicleMod(playerVeh, data.mod, data.modIndex)
            else
                if not data.hover then newModifications[data.mod] = data.state end
                ToggleVehicleMod(playerVeh, data.mod, data.state)
            end
        end
        cb({cart = getCartValue()})
    end)

    setModChangeHandler('plateIndex', function(data)
        if not data.hover then newModifications.plate = data.plate end
        SetVehicleNumberPlateTextIndex(playerVeh, data.plate)
    end)

    setModChangeHandler('xenonColour', function(data)
        if not data.hover then newModifications.xenonColour = data.value end
        SetVehicleXenonLightsColor(playerVeh, data.value)
    end)

    setModChangeHandler('neonColor', function(data)
        if not data.hover then newModifications.neon.color = data end
        SetVehicleNeonLightsColour(playerVeh,data.r,data.g,data.b)
    end)

    setModChangeHandler('neon', function(data)
        if not data.hover then newModifications.neon[data.index] = data.state end
        SetVehicleNeonLightEnabled(playerVeh,data.index,data.state)
    end)

    setModChangeHandler('windowTint', function(data)
        if not data.hover then newModifications.windowTint = data.value end
        SetVehicleWindowTint(playerVeh, data.value)
    end)

    local burningout

    NfwClient.registerNUICallback('startBurnout', function(data,cb)
        burningout = true
        FreezeEntityPosition(playerVeh, false)
        TaskVehicleTempAction(plyPed, playerVeh, 30, 1000000000)
        cb({})
        while burningout do
            for i = 0, 10  do
                SetVehicleTyreFixed(playerVeh, i)
                SetVehicleWheelHealth(playerVeh, i, 100)
            end
            Wait(5000)
        end
    end)

    NfwClient.registerNUICallback('stopBurnout', function(data,cb)
        burningout = false
        FreezeEntityPosition(playerVeh, true)
        ClearPedTasks(plyPed)
        SetPedIntoVehicle(plyPed, playerVeh, -1)
        for i = 0, 10  do
            SetVehicleTyreFixed(playerVeh, i)
            SetVehicleWheelHealth(playerVeh, i, 100)
        end
        cb({})   
    end)

    setModChangeHandler('tyreSmokeColor', function(data)
        if not data.hover then newModifications.tyreSmokeColour = {r = data.r, g = data.g, b = data.b} end
        SetVehicleTyreSmokeColor(playerVeh, data.r, data.g, data.b)
    end)

    setModChangeHandler('wheelColour', function(data)
        if not data.hover then newModifications.wheelColour = data.colourIndex end
        SetVehicleExtraColours(playerVeh, newModifications.pearlescentColour, data.colourIndex)
    end)

    setModChangeHandler('pearlescentColour', function(data)
        if not data.hover then newModifications.pearlescentColour = data.colourIndex end
        SetVehicleExtraColours(playerVeh, newModifications.pearlescentColour, newModifications.wheelColour)
    end)

    setModChangeHandler('paintType', function(data)
        if not data.hover then newModifications[(data.type == 1 and 'primary' or 'secondary')..'PaintType'] = data.paintType end
        local rgb = newModifications[(data.type == 1 and 'primary' or 'secondary')..'Colour']
        _G['SetVehicleModColor_'..data.type](playerVeh,data.paintType,0,newModifications.pearlescentColour)
        _G['SetVehicleCustom'..(data.type == 1 and 'Primary' or 'Secondary')..'Colour'](playerVeh,rgb.r,rgb.g,rgb.b)
    end)

    setModChangeHandler('colour', function(data)
        if not data.hover then newModifications[(data.type == 1 and 'primary' or 'secondary')..'Colour'] = { r = data.r,g = data.g,b = data.b} end
        _G['SetVehicleCustom'..(data.type == 1 and 'Primary' or 'Secondary')..'Colour'](playerVeh,data.r,data.g,data.b)
    end)

    setModChangeHandler('bulletProofTyres', function(data)
        if not data.hover then newModifications.bulletProofTyres = data.state end
        SetVehicleTyresCanBurst(playerVeh, not data.state)
    end)

    setModChangeHandler('customTires', function(data)
        if data.customTiresType == 1 then
            if not data.hover then newModifications.customTires1 = data.customTires end
            SetVehicleMod(playerVeh, 23, newModifications[23], data.customTires)
        else
            if not data.hover then newModifications.customTires2 = data.customTires end
            SetVehicleMod(playerVeh, 24, newModifications[24], data.customTires)
        end
    end)

    setModChangeHandler('wheel', function(data)
        if not data.hover then 
            newModifications.wheelType = data.wheelType
            newModifications[data.rearWheel and 24 or 23] = data.wheelIndex
        end
        SetVehicleWheelType(playerVeh,data.wheelType)
        SetVehicleMod(playerVeh, data.rearWheel and 24 or 23, data.wheelIndex, data.rearWheel and newModifications.customTires2 or newModifications.customTires1)
    end)

    RegisterNetEvent("nfw:bennys:repairAll", function()
        local veh = NyoFw.getClosestEntity('vehicle', nil, 3.0, 'all')
        if veh then 
            if NetworkHasControlOfEntity(veh) then
                SetVehicleFixed(veh)
                SetVehicleOnGroundProperly(veh)
                SetVehicleDirtLevel(veh,0.0)
                SetVehicleUndriveable(veh,false)
            end
        end
    end)

    RegisterNetEvent("nfw:bennys:repairEngine", function()
        local veh = NyoFw.getClosestEntity('vehicle', nil, 3.0, 'all')
        if veh then 
            if NetworkHasControlOfEntity(veh) then
                SetVehicleEngineHealth(veh, 1000.00)
            end
        end
    end)

    AddEventHandler("nfw:closeUi", function()
        NfwClient.closeUI()
    end)
    
    -- RegisterCommand('tcolor', function(source, args)
    --     local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    --     SetVehicleModKit(veh, 1)
    --     SetVehicleColours(veh, tonumber(args[1]), tonumber(args[1]))

    -- end)

end)
