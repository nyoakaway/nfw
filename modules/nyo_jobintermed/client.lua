Nfw.registerNyoModule('nyo_jobintermed', {}, false, function()
    local jobfunctions = {}
    local jobstopfunctions = {}
    local blipEmprego = nil
    local working = false
    local function criarBlipEmprego(x, y, z, type, color, scale, routeColor, text)
        blipEmprego = AddBlipForCoord(x, y, z)
        SetBlipSprite(blipEmprego, type)
        SetBlipColour(blipEmprego, color)
        SetBlipScale(blipEmprego, scale)
        SetBlipAsShortRange(blipEmprego, false)
        SetBlipRoute(blipEmprego, true)
        SetBlipRouteColour(blipEmprego, routeColor)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(text)
        EndTextCommandSetBlipName(blipEmprego)
    end

    local function removerBlipEmprego()
        if DoesBlipExist(blipEmprego) then
            RemoveBlip(blipEmprego)
        end
    end

    NfwClient.setMarkerType(2)
    NfwClient.registerInterface(3)

    NfwClient.registerKeyPress(function(v, k)
        NfwClient.disableMarkerType(2)
        NfwClient.openUI({
            job = NfwConfigs[v.config].displayName
        }, false, false)
        working = NfwConfigs[v.config].jobtype
        jobfunctions[NfwConfigs[v.config].jobtype]()
    end)

    RegisterCommand('nfw:jobIntermed:stopWorking', function()
        if working then
            removerBlipEmprego()
            NfwClient.closeUI()
            NfwClient.enableMarkerType(2)
            jobstopfunctions[working]()
            working = false
        end
    end)
    RegisterKeyMapping('nfw:jobIntermed:stopWorking', 'Leave the current job', 'KEYBOARD', 'F7')

    if NfwConfigs.jobIntermedGeneralConfig.garbageman then
        ------------ START EMP GARBAGE V2
        local workingAsGarbageManV2 = false
        local gamePoolGarbage = {}
        local pedGarbage = nil
        local cdsGarbage = nil
        local coordsGarbageV2 = {}
        local cfgGarbage = NfwConfigs.jobIntermedGeneralConfig.garbagemanConfig

        local function checkCoords(l)
            for k,v in pairs(coordsGarbageV2) do
                if #(v - l) <= 1.5 then
                    return false
                end
            end
            return true
        end

        local function findDumpsterProps()
            CreateThread(function()
                while workingAsGarbageManV2 do
                    local pool = GetGamePool('CObject')
                    local insertPool = {}
                    for k,v in pairs(pool) do
                        if cfgGarbage['garbageProps'][GetEntityModel(v)] then
                            local cds = GetEntityCoords(v)
                            if checkCoords(cds) then
                                table.insert(insertPool,cds)
                            end
                        end
                    end
                    gamePoolGarbage = insertPool
                    Wait(1000)
                end
            end)
        end

        local function getGarbageProp()
            local dict = 'mini@repair'
            local anim = 'fixing_a_ped'
            RequestAnimDict(dict)
            while not HasAnimDictLoaded(dict) do
                Wait(10)
            end
            TaskPlayAnim(pedGarbage, dict, anim, 8.0, 8.0, -1, 15, 0.0, 0, 0, 0)
            Wait(2500)
            ClearPedTasks(pedGarbage)
            RemoveAnimDict(dict)
        end

        jobfunctions.garbage = function()
            workingAsGarbageManV2 = true
            pedGarbage = plyPed
            coordsGarbageV2 = RPC.trigger('garbagev2/addPlayerToEmp')
            findDumpsterProps()
            CreateThread(function()
                while workingAsGarbageManV2 do   
                    local sleepGarbageV2 = 1000
                    cdsGarbage = GetEntityCoords(pedGarbage)
                    for k,v in pairs(gamePoolGarbage) do
                        local dist = #(cdsGarbage - v)
                        if dist <= 5.0 then
                            sleepGarbageV2 = 4
                            DrawMarker(cfgGarbage.garbageV2Marker.type,v.x,v.y,v.z+1.5,0.0,0.0,0.0,0.0,0.0,0.0,cfgGarbage.garbageV2Marker.scalex,cfgGarbage.garbageV2Marker.scaley,cfgGarbage.garbageV2Marker.scalez,cfgGarbage.garbageV2Marker.r,cfgGarbage.garbageV2Marker.g,cfgGarbage.garbageV2Marker.b,cfgGarbage.garbageV2Marker.a,cfgGarbage.garbageV2Marker.bobUpAndDown,false,2,cfgGarbage.garbageV2Marker.rotate,false,false,false)
                            if dist <= 2.0 and IsControlJustPressed(0,38) and checkCoords(v)  then
                                SafeEvents.triggerServer('garbagev2/UpCheckCoords', v)
                                getGarbageProp()                                
                            end
                        end
                    end
                    Wait(sleepGarbageV2)
                end
            end)   
        end

        jobstopfunctions.garbage = function()
            workingAsGarbageManV2 = false
            TriggerServerEvent("nfw:garbagev2/remPlayerFromEmp")
            gamePoolGarbage = {}
        end

        RegisterNetEvent('nfw:garbagev2/updateCoords', function(cds, status)
            if status then
                coordsGarbageV2[#coordsGarbageV2 + 1] = cds
            else
                for k,v in pairs(coordsGarbageV2) do
                    if #(cds - v) <= 0 then
                        coordsGarbageV2[k] = nil
                        return
                    end
                end
            end
        end)

    end

    if NfwConfigs.jobIntermedGeneralConfig.farmer then
        ------------ START EMP FAZENDEIRO
        local cfgFarmer = nil
        local workingAsFarmer = false
        local pedFarmer = nil

        jobfunctions.farmer = function()
            workingAsFarmer = true
            local ped = plyPed
            cfgFarmer = RPC.trigger('farmer/addPlayerTofarmerEmp')
            cfgFarmer['farmerAnimationsByIndex'] = {
                ['cow'] = function(ped)
                    local dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@'
                    local anim = 'weed_crouch_checkingleaves_idle_01_inspector'
                    RequestAnimDict(dict)
                    while not HasAnimDictLoaded(dict) do
                        Wait(10)
                    end
                    TaskPlayAnim(ped,dict,anim,8.0,8.0,-1,15,0.0,0,0,0)
                    Wait(5000)
                    ClearPedTasks(ped)
                end,
                ['tomato'] = function(ped)
                    local dict = 'anim@amb@business@weed@weed_inspecting_lo_med_hi@'
                    local anim = 'weed_crouch_checkingleaves_idle_01_inspector'
                    RequestAnimDict(dict)
                    while not HasAnimDictLoaded(dict) do
                        Wait(10)
                    end
                    TaskPlayAnim(ped,dict,anim,8.0,8.0,-1,15,0.0,0,0,0)
                    Wait(5000)
                    ClearPedTasks(ped)
                end,
                ['orange'] = function(ped)
                    local dict = 'amb@prop_human_movie_bulb@base'
                    local anim = 'base'
                    RequestAnimDict(dict)
                    while not HasAnimDictLoaded(dict) do
                        Wait(10)
                    end
                    TaskPlayAnim(ped,dict,anim,8.0,8.0,-1,15,0.0,0,0,0)
                    Wait(5000)
                    ClearPedTasks(ped)
                end,
                ['apple'] = function(ped)
                    local dict = 'amb@prop_human_movie_bulb@base'
                    local anim = 'base'
                    RequestAnimDict(dict)
                    while not HasAnimDictLoaded(dict) do
                        Wait(10)
                    end
                    TaskPlayAnim(ped,dict,anim,8.0,8.0,-1,15,0.0,0,0,0)
                    Wait(5000)
                    ClearPedTasks(ped)
                end,
            }
            local qtd = {
                ['orange'] = 0,
                ['apple'] = 0,
                ['cow'] = 0,
                ['tomato'] = 0,
            }
            
            for k,v in pairs(cfgFarmer['collectFarmerLocations']) do
                qtd[v.type] = qtd[v.type] + 1
            end

            CreateThread(function()
                while workingAsFarmer do
                    local sleepFarmer = 1000
                    local cds = GetEntityCoords(ped)
                    for k,v in pairs(cfgFarmer['collectFarmerLocations']) do
                        local dist = #(cds - v.cds)
                        if dist <= 25.0 and not v.status then
                            sleepFarmer = 4
                            DrawMarker(cfgFarmer.farmerMarker.type,v.cds,0.0,0.0,0.0,0.0,0.0,0.0,cfgFarmer.farmerMarker.scalex,cfgFarmer.farmerMarker.scaley,cfgFarmer.farmerMarker.scalez,cfgFarmer.farmerMarker.r,cfgFarmer.farmerMarker.g,cfgFarmer.farmerMarker.b,cfgFarmer.farmerMarker.a,cfgFarmer.farmerMarker.bobUpAndDown,false,2,cfgFarmer.farmerMarker.rotate,false,false,false)
                            if dist <= 1.0 and IsControlJustPressed(0,38) then
                                farmerIni = false 
                                cfgPayment = cfgFarmer.requirePayment[v.type]
                                if cfgPayment.requireItem then 
                                    farmerIni = RPC.trigger('farmer:checkItem', cfgPayment.requireItemData)
                                   -- farmerIni = true

                                else 
                                    farmerIni = true
                                end
                                
                                if farmerIni then 
                                    cfgFarmer['farmerAnimationsByIndex'][v.type](ped)
                                    SafeEvents.triggerServer('checkFarmerCoords',k, v.type)
                                    SetEntityCoords(ped,cds.x,cds.y,cds.z-0.9)
                                end
                            end
                        end
                    end
                    Wait(sleepFarmer)
                end
            end) 
        end

        jobstopfunctions.farmer = function()
            workingAsFarmer = false
            TriggerServerEvent('nfw:farmer/remPlayerFromfarmerEmp')
        end

        RegisterNetEvent('nfw:farmer/updateConfig', function(k,status)
            cfgFarmer['collectFarmerLocations'][k]['status'] = status
        end)

        CreateThread(function()
            local peds = NfwConfigs.jobIntermedGeneralConfig.farmerConfig.pedlocations
            RequestModel(`a_c_cow`)
            while not HasModelLoaded(`a_c_cow`) do
                Wait(10)
            end
            for k,v in pairs(peds) do
                local ped = CreatePed(5,`a_c_cow`,v.x,v.y,v.z-0.95,v.w,false,false)
                FreezeEntityPosition(ped,true)
                SetBlockingOfNonTemporaryEvents(ped,true)
                SetEntityInvincible(ped,true)
            end
            SetModelAsNoLongerNeeded(`a_c_cow`)
        end)
    end

    if NfwConfigs.jobIntermedGeneralConfig.scubaDiver then
        ------------ START EMP MERGULHADOR
        local workingAsScubaDiver = false
        local sonarActive = false
        local cfgScuba = NfwConfigs.jobIntermedGeneralConfig.scubaDiverConfig
        local activeKScuba = 1
        local animDictScuba = 'amb@world_human_gardener_plant@female@base'
        local animNameScuba = 'base_female'
        local hashObjScuba = GetHashKey('prop_buck_spade_09')
        local cdsScuba = nil
        local pedScuba = nil

        jobfunctions.scubaDiver = function()
            workingAsScubaDiver = true
            local ped = plyPed
            cfgScuba = RPC.trigger('scubaDiver/addPlayerToScubaDiverEmp')
            AllowSonarBlips(true)
            RequestAnimDict(animDictScuba)
            while not HasAnimDictLoaded(animDictScuba) do
                Wait(10)
            end
            RequestModel(hashObjScuba)
            while not HasModelLoaded(hashObjScuba) do
                Wait(10)
            end
            initScubaBlips()
            Wait(1000)
            CreateThread(function()
                while workingAsScubaDiver do
                    local sleepScubaDiver = 1000
                    for k,v in pairs(cfgScuba['collectLocations']) do
                        local dist = #(cds - v[1])
                        if dist <= 5.0 and not v[2] then
                            sleepScubaDiver = 4
                            DrawMarker(cfgScuba.scubaDiverMarker.type,v[1],0.0,0.0,0.0,0.0,0.0,0.0,cfgScuba.scubaDiverMarker.scalex,cfgScuba.scubaDiverMarker.scaley,cfgScuba.scubaDiverMarker.scalez,cfgScuba.scubaDiverMarker.r,cfgScuba.scubaDiverMarker.g,cfgScuba.scubaDiverMarker.b,cfgScuba.scubaDiverMarker.a,cfgScuba.scubaDiverMarker.bobUpAndDown,false,2,cfgScuba.scubaDiverMarker.rotate,false,false,false)
                            if dist <= 1.0 and IsControlJustPressed(0,38) then
                                FreezeEntityPosition(ped,true)
                                local obj = CreateObject(hashObjScuba,v[1],true,true,true)
                                SafeEvents.triggerServer("nfw:نص عربي لترجمة قرن! إذا كنت تقرأ هذا ... أنت ديوث!", ObjToNet(obj))
                                AttachEntityToEntity(obj,ped,GetPedBoneIndex(ped,28422),0.00,0.01,-0.1,110.0,180.0,-25.0,false,false,false,false,0,true)
                                TaskPlayAnim(ped,animDictScuba,animNameScuba,8.0,8.0,-1,49,0.0,false,false,false)

                                local initScuba = false 
                                if cfgScuba.skillBar then 
                                    local exp = exports['nfw']:skillBarStart()
                                    if exp then 
                                        initScuba = true
                                    end
                                else                                                                     
                                    Wait(5000)
                                    initScuba = true
                                end
                                
                                if initScuba then     
                                    ClearPedTasks(ped)
                                    DetachEntity(obj, true, true)
                                    DeleteEntity(obj)
                                    FreezeEntityPosition(ped,false)
                                    SafeEvents.triggerServer('scubaDiver/upCheckCoords',k)
                                end
                                
                            end
                        end
                    end
                    Wait(sleepScubaDiver)
                end                    
                RemoveAnimDict(animDictScuba)
                SetModelAsNoLongerNeeded(hashObj)
            end)
            if cfgScuba['sonarType'] == 2 then 
                sonarActive = true
                SetMinimapSonarEnabled(true)
            end
        end

        jobstopfunctions.scubaDiver = function()
            workingAsScubaDiver = false
            stopScubaDiver()
            if sonarActive then 
                sonarActive = false 
                SetMinimapSonarEnabled(false)
            end
        end

        RegisterNetEvent('nfw:scubaDiver/updateConfig' ,function(k,status)
            cfgScuba['collectLocations'][k][2] = status
        end)

        function initScubaDiver()
            
            
        end

        function createBlipScuba(k)
            local blip = AddBlipForCoord(cfgScuba['collectLocations'][k][1])
            SetBlipSprite(blip,148)
            SetBlipScale(blip,1.0)
            SetBlipColour(blip,1)
            SetBlipAlpha(blip,70)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString('Localização para vasculhar')
            EndTextCommandSetBlipName(blip)
            SetBlipAsShortRange(blip,true)
            return blip
        end

        function initScubaBlips()
            ped = PlayerPedId()
            CreateThread(function()
                while workingAsScubaDiver do
                    cds = GetEntityCoords(ped)
                    local retval = IsPauseMenuActive()
                    for k,v in pairs(cfgScuba['collectLocations']) do
                        local dist = #(cds - v[1])
                        if dist <= 200.0 and not v[2] and not retval and sonarActive then
                            if not v[5] then
                                v[5] = createBlipScuba(k)
                            end
                        else
                            if v[5] then
                                RemoveBlip(v[5])
                                v[5] = nil
                            end
                        end
                    end
                    Wait(1000)
                end
            end)
        end

        function stopScubaDiver()
            sonarActive = false
            SetMinimapSonarEnabled(false)
            AllowSonarBlips(false)
            TriggerServerEvent('nfw:scubaDiver/remPlayerFromScubaDiverEmp')
            for k,v in pairs(cfgScuba['collectLocations']) do
                if v[5] then
                    RemoveBlip(v[5])
                end
            end
        end
        
    end
end)