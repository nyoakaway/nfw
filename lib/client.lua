function drawTxt2D(text,font,x,y,scale,r,g,b,a)
    SetTextFont(font)
    SetTextScale(scale,scale)
    SetTextColour(r,g,b,a)
    SetTextOutline()
    SetTextCentre(1)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x,y)
end

function DrawText3Ds(x,y,z,text)
    SetDrawOrigin(x, y, z, 0);
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(0.25,0.25)
    SetTextColour(255,255,255,150)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

LocalPlayer.state.playerId = PlayerId()
LocalPlayer.state.playerServerId = GetPlayerServerId(LocalPlayer.state.playerId)

local scripts = nil

SafeEvents.register('مترجم كامبريدج | الإنجليزية البرتغالية', function(_scripts/*, newToken*/)
    scripts = _scripts
    Nfw.loadModules(scripts)
end)

NfwClient = {}
NfwClient.nuiReady = false

registered_click_functions = {}
registered_marker_functions = {}
registered_marker_types = {}
disabled_marker_types = {false, false}
local registered_nui_callbacks   = {}
local pending_nui_messages       = {}

NfwClient.registerKeyPress = function(func)
    local module = Nfw.getModuleByTraceback()
    registered_click_functions[module] = func
end

NfwClient.registerMarkerFunction = function(func)
    local module = Nfw.getModuleByTraceback()
    registered_marker_functions[module] = func
end

NfwClient.setMarkerType = function(type)
    local module = Nfw.getModuleByTraceback()
    registered_marker_types[module] = type
end

NfwClient.disableMarkerType = function(type)
    disabled_marker_types[type] = true
end

NfwClient.enableMarkerType = function(type)
    disabled_marker_types[type] = false
end

NfwClient.registerInterface = function(nuiType)
    local module = Nfw.getModuleByTraceback()
    if NfwClient.nuiReady then
        SendNUIMessage({
            action = 'RegisterInterface',
            moduleName = module,
            nuiType = nuiType
        })
    else
        pending_nui_messages[#pending_nui_messages + 1] = {
            action = 'RegisterInterface',
            moduleName = module,
            nuiType = nuiType
        }
    end
end

NfwClient.openUI = function(data, keyboardFocus, cursorFocus)
    local module = Nfw.getModuleByTraceback()
    local info = {
        action = 'OpenUI',
        moduleName = module,
        data = data
    }
    if (keyboardFocus or keyboardFocus == nil) or (cursorFocus or cursorFocus == nil) then
        SetNuiFocus(keyboardFocus or keyboardFocus == nil, cursorFocus or cursorFocus == nil)
    end
    if NfwClient.nuiReady then
        SendNUIMessage(info)
    else
        pending_nui_messages[#pending_nui_messages + 1] = info
    end
end

NfwClient.closeUI = function(data)
    local module = Nfw.getModuleByTraceback()
    local info = {
        action = 'CloseUI',
        moduleName = module,
        data = data
    }
    if NfwClient.nuiReady then
        SendNUIMessage(info)
    else
        pending_nui_messages[#pending_nui_messages + 1] = info
    end
end

NfwClient.registerNUICallback = function(name,cb)
    local module = Nfw.getModuleByTraceback()
    RegisterNUICallback(module..'/'..name, cb)
end

NfwClient.sendNUIMessage = function(action, data)
    local module = Nfw.getModuleByTraceback()
    data.action = module..'-sendMessage'
    data._action = action
    SendNUIMessage(data)
end

if config.development then
    RegisterCommand('nfw:openUI', function(source, args, rawCommand)
        local module = args[1]
        if module and Nfw.isModuleActive(module) then
            local info = {
                action = 'OpenUI',
                moduleName = module,
                ignoreOpenUIHandler = true
            }
            SendNUIMessage(info)
            SetNuiFocus(true, true)
        end
    end)

    RegisterCommand('nfw:closeUI', function(source, args, rawCommand)
        local module = args[1]
        if module and Nfw.isModuleActive(module) then
            local info = {
                action = 'CloseUI',
                moduleName = module,
                ignoreCloseUIHandler = true
            }
            SendNUIMessage(info)
            SetNuiFocus(false, false)
        end
    end)
end

-- NUI Ready
RegisterNUICallback('nui-ready', function(data, cb)
    SafeEvents.triggerServer('مترجم كامبريدج | الإنجليزية البرتغالية')
    NfwClient.nuiReady = true
    for index = 1, #pending_nui_messages do
        SendNUIMessage(pending_nui_messages[index])
    end
    pending_nui_messages = nil
    cb({})
end)

function GetClosestVehiclesFromCoords(coords, radius)
    local vehPool = GetGamePool('CVehicle')
    local returnVehicles = {}
    for _,vehicle in pairs(vehPool) do
        local vehCoords = GetEntityCoords(vehicle)
        local distance = #(vehCoords - coords)
        if distance <= radius then
            minorDistance = distance
            returnVehicles[#returnVehicles + 1] = vehicle
        end
    end
    return returnVehicles
end

function GetClosestVehicleFromCoords(coords, radius)
    local vehPool = GetGamePool('CVehicle')
    local minorDistance = radius
    local returnVehicle = nil
    for k,vehicle in pairs(vehPool) do
        local vehCoords = GetEntityCoords(vehicle)
        local distance = #(vehCoords - coords)
        if distance <= radius and distance <= minorDistance then
            minorDistance = distance
            returnVehicle = vehicle
        end
    end
    return returnVehicle
end

function GetClosestVehicleFromPlayer(radius)
    local veh = GetVehiclePedIsIn(plyPed)
    if veh ~= 0 then
        return veh
    else
        return GetClosestVehicleFromCoords(plyCoords, radius)
    end
end

function GetClosestVehiclesFromPlayer(radius)
    return GetClosestVehiclesFromCoords(plyCoords, radius)
end

function GetClosestPedFromCoords(coords, radius)
    local pedPool = GetGamePool('CPed')
    local minorDistance = radius
    local returnPed = nil
    for k,ped in pairs(pedPool) do
        if ped ~= plyPed then
            local pedCoords = GetEntityCoords(ped)
            local distance = #(pedCoords - coords)
            if distance <= radius and distance <= minorDistance then
                minorDistance = distance
                returnPed = ped
            end
        end
    end
    pedPool = nil
    minorDistance = nil
    return returnPed
end

function GetClosestPlayerFromCoords(coords, radius)
    local pedPool = GetGamePool('CPed')
    local minorDistance = radius
    local returnPed = nil
    local returnPlayer = nil
    for k,ped in pairs(pedPool) do
        if ped ~= plyPed and IsPedAPlayer(ped) then
            local pedCoords = GetEntityCoords(ped)
            local distance = #(pedCoords - coords)
            if distance <= radius and distance <= minorDistance then
                minorDistance = distance
                returnPed = ped
                returnPlayer = NetworkGetPlayerIndexFromPed(ped)
            end
        end
    end
    pedPool = nil
    minorDistance = nil
    return returnPed, returnPlayer
end

function GetClosestPedFromPlayer(radius)
    return GetClosestPedFromCoords(plyCoords, radius)
end

function GetClosestPlayerFromPlayer(radius)
    return GetClosestPlayerFromCoords(plyCoords, radius)
end

local hidingPlayers = false
local hidingVehicles = false

NfwClient.enableHidingPlayers = function()
    if not hidingPlayers then
        hidingPlayers = true
        CreateThread(function()
            while hidingPlayers do
                for k,v in pairs(GetGamePool('CPed')) do
                    if GetEntityAlpha(v) > 0 and v ~= plyPed then
                        SetEntityAlpha(v, 0, false)
                    end
                end
                Wait(100)
            end
            for k,v in pairs(GetGamePool('CPed')) do
                ResetEntityAlpha(v)
            end
        end)
    end
end

NfwClient.enableHidingVehicles = function()
    if not hidingVehicles then
        hidingVehicles = true
        CreateThread(function()
            local hidedEntities = {}
            while hidingVehicles do
                for k,v in pairs(GetGamePool('CVehicle')) do
                    if not hidedEntities[v] and v ~= GetVehiclePedIsIn(plyPed) then
                        SetEntityAlpha(v, 0, false)
                        hidedEntities[v] = true
                    end
                end
                Wait(100)
            end
            for k,v in pairs(GetGamePool('CVehicle')) do
                ResetEntityAlpha(v)
            end
        end)
    end
end

NfwClient.disableHidingPlayers = function()
    hidingPlayers = false
end

NfwClient.disableHidingVehicles = function()
    hidingVehicles = false
end