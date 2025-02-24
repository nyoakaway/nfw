Nfw.registerNyoModule('nyo_routes', {}, false, function()
    Nfw.onReady(function()
        local module_funcs = Nfw.getModuleFunctions()

        for k,v in pairs(NfwConfigs) do
            if v.type == 'nyo_routes' then
                for l,w in pairs(v.routesConfig) do
                    for x,y in pairs(w.routes) do
                        for _, item in ipairs(y.resultItens) do
                            if item.type == 'money' then
                                NfwConfigs[k].routesConfig[l].routes[x].resultItens[_].name = 'Dinheiro'
                            else
                                NfwConfigs[k].routesConfig[l].routes[x].resultItens[_].name = NyoFw.getItemName(item.index)
                            end
                        end
                        for _, item in ipairs(y.requiredItens) do
                            if item.type == 'money' then
                                NfwConfigs[k].routesConfig[l].routes[x].requiredItens[_].name = 'Dinheiro'
                            else
                                NfwConfigs[k].routesConfig[l].routes[x].requiredItens[_].name =  NyoFw.getItemName(item.index)
                            end
                        end
                    end
                end
            end
        end
    
        local currentConfig
        local currentConfigIndex
    
        NfwClient.registerInterface(1)   
    
        NfwClient.registerKeyPress(function(v,k)
            NfwClient.disableMarkerType(1)
            currentConfig = NfwConfigs[v.config]
            currentConfigIndex = v.config
            SetNuiFocus(true, true)
            local safeConfig = table.clone(currentConfig.routesConfig)
            for k,v in pairs(safeConfig) do
                for l,w in pairs(v.routes) do
                    safeConfig[k].routes[l].callPolice = nil
                    for x,y in pairs(w.routes) do
                        safeConfig[k].routes[l].routes[x].executeAnimation = nil
                    end
                end
            end
            module_funcs.onUiOpen(currentConfig)
            NfwClient.openUI({
                config = safeConfig
            })
        end)
    
        Nfw.registerCommand(function(v)
            NfwClient.disableMarkerType(1)
            currentConfig = NfwConfigs[v.config]
            currentConfigIndex = v.config
            SetNuiFocus(true, true)
            local safeConfig = table.clone(currentConfig.routesConfig)
            for k,v in pairs(safeConfig) do
                for l,w in pairs(v.routes) do
                    safeConfig[k].routes[l].callPolice = nil
                    for x,y in pairs(w.routes) do
                        safeConfig[k].routes[l].routes[x].executeAnimation = nil
                    end
                end
            end
            module_funcs.onUiOpen(currentConfig)
            NfwClient.openUI({
                config = safeConfig
            })
        end)
    
        NfwClient.registerNUICallback('close', function(data,cb)
            module_funcs.onUiClose(currentConfig)
            NfwClient.enableMarkerType(1)
            SetNuiFocus(false, false)
            currentConfig = nil
            currentConfigIndex = nil
        end)
    
        local inRoute
        local currentRouteCategory
        local currentRouteIndex
    
        NfwClient.registerNUICallback('cancelRoute', function(data,cb)
            inRoute = false
            module_funcs.onRouteStop()
        end)
    
        NfwClient.registerNUICallback('startRoute', function(data,cb)
            if not inRoute then
                inRoute = true
                currentRouteCategory = data.category
                currentRouteIndex = data.route + 1
                SafeEvents.triggerServer('routes-addPlayer', currentConfigIndex, currentRouteCategory, currentRouteIndex)
                module_funcs.onRouteStart(currentConfigIndex, currentRouteCategory, currentRouteIndex)
                local config = currentConfig.routesConfig[currentRouteCategory].routes[currentRouteIndex]
                local selectedRoute = math.random(#config.routes)
                local routeConfig = config.routes[selectedRoute]
                local currentPosition = 1
                NfwClient.closeUI()
                if routeConfig.type == 'static' then
                    local usedPositions = {}
                    local blips = {}
                    for k,v in pairs(routeConfig.coords) do
                        local blip = AddBlipForCoord(v)
                        SetBlipSprite(blip,routeConfig.blipId)
                        SetBlipColour(blip,routeConfig.blipColor)
                        SetBlipScale(blip,routeConfig.blipScale)
                        SetBlipAsShortRange(blip,true)
                        BeginTextCommandSetBlipName("STRING")
                        AddTextComponentString(routeConfig.blipName)
                        EndTextCommandSetBlipName(blip)
                        blips[k] = blip
                    end
                    while inRoute do
                        local msec = 1000
                        for k,v in pairs(routeConfig.coords) do
                            if #(v - plyCoords) <= routeConfig.drawDistance and not usedPositions[k] then
                                msec = 4
                                DrawText3Ds(v.x, v.y, v.z, routeConfig.text)
                                if (#(v - plyCoords) <= routeConfig.pressDistance) and (routeConfig.disableVehicle == false and true or not IsPedInAnyVehicle(plyPed)) and IsControlJustPressed(0, routeConfig.inputControl) then
                                    local success, failReason = RPC.trigger('routes-tryPayment')
                                    if success then
                                       -- module_funcs.onSuccessToCollectItem(routeConfig)
                                        FreezeEntityPosition(plyPed, true)
                                        routeConfig.executeAnimation()
                                        usedPositions[k] = success
                                        SetBlipDisplay(blips[k], 0)
                                        FreezeEntityPosition(plyPed, false)
                                        SetTimeout(routeConfig.resetTime * 60000, function()
                                            usedPositions[k] = false
                                            SetBlipDisplay(blips[k], 2)
                                        end)
                                    else
                                       -- module_funcs.onFailToCollectItem(failReason, routeConfig)
                                    end
                                    Wait(1000)
                                end
                            end
                        end
                        Wait(msec)
                    end
                    for k,v in pairs(routeConfig.coords) do
                        RemoveBlip(blips[k])
                    end
                else
                    local selectedCoords
                    if routeConfig.type == 'random' then
                        selectedCoords = math.random(#routeConfig.coords)
                    else
                        selectedCoords = 1
                    end
                    local blip = AddBlipForCoord(routeConfig.coords[selectedCoords])
                    SetBlipSprite(blip,routeConfig.blipId)
                    SetBlipColour(blip,routeConfig.blipColor)
                    SetBlipScale(blip,routeConfig.blipScale)
                    SetBlipAsShortRange(blip, false)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString(routeConfig.blipName)
                    EndTextCommandSetBlipName(blip)
                    SetBlipRoute(blip, true)
                    while inRoute do
                        local msec = 1000
                        local cds = routeConfig.coords[selectedCoords]
                        if #(cds - plyCoords) <= routeConfig.drawDistance then
                            msec = 4
                            DrawText3Ds(cds.x, cds.y, cds.z, routeConfig.text)
                            if (#(cds - plyCoords) <= routeConfig.pressDistance) and (routeConfig.disableVehicle == false and true or not IsPedInAnyVehicle(plyPed)) and IsControlJustPressed(0, routeConfig.inputControl) then
                                routeConfig.executeAnimation()
                                local success, failReason = RPC.trigger('routes-tryPayment')
                                if success then
                                    --module_funcs.onSuccessToCollectItem(routeConfig, failReason)
                                    if routeConfig.type == 'random' then
                                        local newCoords = math.random(#routeConfig.coords)
                                        while newCoords == selectedCoords do
                                            Wait(0)
                                            newCoords = math.random(#routeConfig.coords)
                                        end
                                        selectedCoords = newCoords
                                    else
                                        selectedCoords = selectedCoords + 1
                                        if selectedCoords > #routeConfig.coords then
                                            selectedCoords = 1
                                        end
                                    end
                                    SetBlipCoords(blip, routeConfig.coords[selectedCoords])
                                    SetBlipRoute(blip, true)
                                else
                                    --module_funcs.onFailToCollectItem(failReason, routeConfig)
                                end
                                Wait(1000)
                            end
                        end
                        Wait(msec)
                    end
                    RemoveBlip(blip)
                end
                SafeEvents.triggerServer('routes-remPlayer')
            end
        end)

        AddEventHandler("nfw:closeUi", function()
            NfwClient.closeUI()
        end)
    end)
end)