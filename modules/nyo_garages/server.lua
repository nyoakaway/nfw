local module = 'nyo_garages'
local traceback = debug.traceback()
local valid_traceback = string.format('@nfw/modules/%s/server.lua', module)

if traceback:find(valid_traceback) then
    Nfw.registerNyoModule(module, "1.0.8", {"nyo_core", "nyo_multi"}, false, function()
        local module_funcs = Nfw.getModuleFunctions()
        local vehicleClasses = {
            [0] = "carro",
            [1] = "carro",
            [2] = "carro",
            [3] = "carro",
            [4] = "carro",
            [5] = "carro",
            [6] = "carro",
            [7] = "carro",
            [8] = "moto",
            [9] = "carro",
            [10] = "caminhao",
            [11] = "servico",
            [12] = "carro",
            [13] = "bicicleta",
            [14] = "barco",
            [15] = "helicoptero",
            [16] = "aviao",
            [17] = "servico",
            [18] = "emergencia",
            [19] = "emergencia",
            [20] = "caminhao",
        }

        local temporaryVehicleData = {}
        local spawnedVehicles = {}

        NyoFw.prepare("nfw/num_vehicles", "SELECT COUNT(*) as num_vehs FROM nyo_users_vehicles WHERE char_id = @char_id")
        NyoFw.prepare("nfw/garages/getVehicleByPlate", "SELECT id, char_id FROM nyo_users_vehicles WHERE plate = @plate")
        NyoFw.prepare("nfw/garages/getGaragemPerm", "SELECT * FROM nyo_homes_permission WHERE charId = @charId AND homes_id = @homesId")


        local OpenUIVehicleDataCache = {}
        local SpawnedVehicles        = {}
        local SpawnedVehiclesIds     = {}

        -- GlobalState:set('SpawnedVehicles', nil, false)
        -- GlobalState:set('SpawnedVehiclesIds', nil, false)

        -- AddEventHandler('onResourceStop', function(rName)
        --     if rName == 'nfw' then
        --         GlobalState:set('SpawnedVehicles', SpawnedVehicles, false)
        --         GlobalState:set('SpawnedVehiclesIds', SpawnedVehiclesIds, false)
        --     end
        -- end)

        AddEventHandler('playerDropped', function()
            OpenUIVehicleDataCache[source] = nil
        end)

        RPC.addHandler('garage-open', function(source, cfgIndex, homeName)
            local char_id = NyoFw.getCharId(source)
            local config = NfwConfigs[cfgIndex]
            local vehicles = {}
            local queryVehicles = NyoFw.querySync('SELECT * FROM nyo_users_vehicles WHERE char_id = ? AND garage_id = ? AND work = ?', {char_id, config.garagemConfig.garageId, config.garagemConfig.garagemType == 'work'})

            OpenUIVehicleDataCache[source] = { cfgIndex = cfgIndex }

            for k,v in pairs(queryVehicles) do

                if config.garagemConfig.garagemType == 'public' or config.garagemConfig.garagemType == 'home' then 
                    if config.garagemConfig.garagemType == 'home' then 
                        if not module_funcs.checkHomeGarage(char_id,homeName) then
                            return false   
                        end                        
                    end
                    local vehhash = GetHashKey(v.vehname)
                    local vehtype = NyoFw.getVehicleType(vehhash)
                    if config.garagemConfig.garagemMenu[vehtype] then
                        table.insert(vehicles, {v.id, vehhash, v.plate})
                        OpenUIVehicleDataCache[source][v.id] = v
                    end
                else 
                    for k2, v2 in pairs(config.garagemConfig.vehicles) do 
                        if v2.vehicle == v.vehname then 
                            local vehhash = GetHashKey(v.vehname)
                            local vehtype = NyoFw.getVehicleType(vehhash)
                            if config.garagemConfig.garagemMenu[vehtype] then
                                table.insert(vehicles, {v.id, vehhash, v.plate})
                                OpenUIVehicleDataCache[source][v.id] = v
                            end
                            break
                        end
                    end
                end
              
               
            end

            return vehicles
        end)

        RPC.addHandler('garage-getVehicleInfo', function(source, vehId)
            if OpenUIVehicleDataCache[source] and OpenUIVehicleDataCache[source][vehId] then
                local v = OpenUIVehicleDataCache[source][vehId]
                local taxLate = v.tax + 86400 * NfwConfigs.garagesGeneralConfig.taxTime < os.time()
                local vehSpawned = SpawnedVehicles[vehId] and DoesEntityExist(SpawnedVehicles[vehId].entity)
                local nextTax = math.floor((v.tax + 86400 * NfwConfigs.garagesGeneralConfig.taxTime - os.time()) / 86400)
                return {taxLate,v.impounded,v.scrapped,v.body,v.engine,v.fuel,vehSpawned,nextTax}
            end
        end)

        RPC.addHandler('garage-payVehicleTax', function(source, vehId)
            local user_id = NyoFw.getCharId(source)
            if not OpenUIVehicleDataCache[source] or not OpenUIVehicleDataCache[source][vehId] then
                NfwGlobalFunctions.notify(source, 'Erro', 'Não foi possível identificar o veículo.', "#FF0000", 5000)
                return false
            end
            local taxPrice = GaragesFunctions.getVehicleTax(OpenUIVehicleDataCache[source][vehId].vehname, user_id, NfwConfigs[OpenUIVehicleDataCache[source].cfgIndex].garagemConfig.garagemType == 'work')
            if NfwGlobalFunctions.tryPayment(user_id, taxPrice, NfwConfigs.garagesGeneralConfig.taxPrice.paymentType) then
                local ctime = os.time()
                OpenUIVehicleDataCache[source][vehId].tax = ctime
                NyoFw.querySync('UPDATE nyo_users_vehicles SET tax = ? WHERE id = ?',{ctime, vehId})
                return true
            else
                NfwGlobalFunctions.notify(source, 'Erro', 'Dinheiro insuficiente para pagar a taxa.', "#FF0000", 5000)
                return false
            end
        end)

        RPC.addHandler('garage-payDetentionTax', function(source, vehId)
            local user_id = NyoFw.getCharId(source)
            if not OpenUIVehicleDataCache[source] or not OpenUIVehicleDataCache[source][vehId] then
                NfwGlobalFunctions.notify(source, 'Erro', 'Não foi possível identificar o veículo.', "#FF0000", 5000)
                return false
            end
            local detentionTax = GaragesFunctions.getVehicleDetentionTax(OpenUIVehicleDataCache[source][vehId].vehname, user_id, NfwConfigs[OpenUIVehicleDataCache[source].cfgIndex].garagemConfig.garagemType == 'work')
            if NfwGlobalFunctions.tryPayment(user_id, detentionTax, NfwConfigs.garagesGeneralConfig.detentionTax.paymentType) then
                OpenUIVehicleDataCache[source][vehId].impounded = false
                NyoFw.querySync('UPDATE nyo_users_vehicles SET impounded = 0 WHERE id = ?',{vehId})
                return true
            else
                NfwGlobalFunctions.notify(source, 'Erro', 'Dinheiro insuficiente para pagar a taxa.', "#FF0000", 5000)
                return false
            end
        end)

        RPC.addHandler('garage-payScrappedVehicleInsuranceTax', function(source, vehId)
            local user_id = NyoFw.getCharId(source)
            if not OpenUIVehicleDataCache[source] or not OpenUIVehicleDataCache[source][vehId] then
                NfwGlobalFunctions.notify(source, 'Erro', 'Não foi possível identificar o veículo.', "#FF0000", 5000)
                return false
            end
            local scrappedInsuranceTax = GaragesFunctions.getVehicleDetentionTax(OpenUIVehicleDataCache[source][vehId].vehname, user_id, NfwConfigs[OpenUIVehicleDataCache[source].cfgIndex].garagemConfig.garagemType == 'work')
            if NfwGlobalFunctions.tryPayment(user_id, scrappedInsuranceTax, NfwConfigs.garagesGeneralConfig.scrappedVehicleInsuranceTax.paymentType) then
            OpenUIVehicleDataCache[source][vehId].scrapped = false
                NyoFw.querySync('UPDATE nyo_users_vehicles SET scrapped = 0 WHERE id = ?',{vehId})
                return true
            else
                NfwGlobalFunctions.notify(source, 'Erro', 'Dinheiro insuficiente para pagar a taxa.', "#FF0000", 5000)
                return false
            end
        end)

        RPC.addHandler('garage-spawnVehicle', function(source, vehId, workConfig, spawnCoords)
            local user_id = NyoFw.getCharId(source)
            if not module_funcs.checkCanSpawnVehicle(user_id, vehId) then return end
            if not OpenUIVehicleDataCache[source] or not OpenUIVehicleDataCache[source][vehId] and not workConfig then
                NfwGlobalFunctions.notify(source, 'Erro', 'Não foi possível identificar o veículo.', "#FF0000", 5000)
                return false
            end
            local vehData = OpenUIVehicleDataCache[source][vehId]
            local config = NfwConfigs[OpenUIVehicleDataCache[source].cfgIndex]
            if vehData and (vehData.impounded or vehData.scrapped or (vehData.tax + 86400 * NfwConfigs.garagesGeneralConfig.taxTime < os.time())) then
                NfwGlobalFunctions.notify(source, 'Erro', 'O veículo não pode ser retirado.', "#FF0000", 5000)
                return false
            end
            local vehHash = GetHashKey((vehData and vehData.vehname) or config.garagemConfig.vehicles[workConfig].vehicle)
            local garageTax = GaragesFunctions.getVehicleGarageTax(vehHash, user_id, config.garagemConfig.garagemType == 'work', OpenUIVehicleDataCache[source].cfgIndex)
            if garageTax then
                if not NfwGlobalFunctions.tryPayment(user_id, garageTax, config.garagemConfig.payment.paymentType) then
                    NfwGlobalFunctions.notify(source, 'Erro', 'Dinheiro insuficiente para pagar taxa de serviço.', "#FF0000", 5000)
                    return  false
                end
            end
            local vehKeys = {}
            if not vehData and config.garagemConfig.garagemType == 'work' then
                local workVehicleConfig = config.garagemConfig.vehicles[workConfig]
                local plate = NyoFw.generatePlate()
                local data = NyoFw.querySync('INSERT INTO nyo_users_vehicles(char_id, garage_id, vehname, plate, work, tax) VALUES(?, ?, ?, ?, 1, ?)',{user_id, config.garagemConfig.garageId, workVehicleConfig.vehicle, plate, os.time()})
                vehData = {
                    id = data.insertId,
                    vehname = workVehicleConfig.vehicle,
                    plate = plate,
                    body = 1000,
                    engine = 1000,
                    fuel = 100,
                }
            else
                local keys = NyoFw.querySync("SELECT char_id FROM nyo_users_vehicles_keys WHERE veh_id = ?",{vehData.id})
                for k,v in pairs(keys) do
                    vehKeys[#vehKeys + 1] = v.char_id
                end
            end
            local entity, netVehId
            entity = CreateVehicle(vehHash,spawnCoords.x,spawnCoords.y,spawnCoords.z,spawnCoords.w,true,true,true)            
            if not entity or entity == 0 then return false end
            NyoFw.setSpawnProtect(entity)
            SpawnedVehiclesIds[entity] = vehData.id
            SpawnedVehicles[vehData.id] = { entity = entity, owner = user_id, keys = vehKeys, work = config.garagemConfig.garagemType == 'work', plate = vehData.plate }
            while not DoesEntityExist(entity) do Wait(100) end
            while NetworkGetEntityOwner(entity) == -1 do Wait(100) end
            netVehId = NetworkGetNetworkIdFromEntity(entity)
            SetVehicleNumberPlateText(entity, vehData.plate)
            SetVehicleDoorsLocked(veh, 2)
            if Nfw.isModuleActive('nyo_fuel') then
                Entity(entity).state:set("fuel", tonumber(vehData.fuel), true)
                --TriggerEvent('nyoModule:fuelAddVehicle', netVehId, vehData.fuel)
            end
            Entity(entity).state:set("customization", vehData.custom, true)
            Entity(entity).state:set("plate", vehData.plate, true)
            Entity(entity).state:set("damage", vehData.damage, true)
            return true, netVehId, vehData.id, vehData.plate, vehData.custom, vehData.damage
        end)

        AddEventHandler('entityCreating', function(entity)  
            CreateThread(function()
                Wait(500)                
                if DoesEntityExist(entity) and NyoFw.getSpawnProtect(entity) then
                    local eData = Entity(entity).state                   
                    if eData.customization or eData.plate or eData.damage then 
                        netVehId = NetworkGetNetworkIdFromEntity(entity)
                        TriggerClientEvent("nfw:nyo_garages:safeCustomization", -1, netVehId)
                    end                   
                end            
            end)
        end)

        RPC.addHandler("garages-lockVehicle", function(source, netVehId, vehLock, plate)
            local char_id = NyoFw.getCharId(source)
            local entity = NetworkGetEntityFromNetworkId(netVehId)
            if SpawnedVehiclesIds[entity] then
                local data = SpawnedVehicles[SpawnedVehiclesIds[entity]]
                local allowed = data.owner == char_id

                if not allowed then 
                    for k,v in pairs(data.keys) do
                        if v == char_id then
                            allowed = true
                            break
                        end
                    end
                end 

                if allowed then
                    SetVehicleDoorsLocked(entity, vehLock == 1 and 2 or 1)
                    return true
                end
            else 
                if plate == NyoFw.getCharacterIdentity(char_id).registration:upper() then 
                    SetVehicleDoorsLocked(entity, vehLock == 1 and 2 or 1)
                    return true
                end  
            end
        end)

        NyoFw.getVehicleWork = function(entity)
            if entity then 
                entityId = SpawnedVehiclesIds[entity]
                if entityId then 
                    return SpawnedVehicles[entityId].work
                end
            end
            return false
        end

        exports('createVehicle', function(src, model, spawnCoords, plate, engine, body, fuel, mods, damage, livery, extras )
            local vehicleHash = type(model) == 'number' and model or GetHashKey(model)
            local veh = CreateVehicle(vehicleHash,spawnCoords.x,spawnCoords.y,spawnCoords.z,spawnCoords.w,true,true,true)
            NyoFw.setSpawnProtect(veh)
            while not DoesEntityExist(veh) do 
                Wait(500)
            end
            SetVehicleNumberPlateText(veh, plate)
            local netid = NetworkGetNetworkIdFromEntity(veh)
            SafeEvents.triggerClient('nyo_module:applyVehInfo', src, netid, nil, damage, extras or {}, livery, plate or 'AAAA-AAAA', engine or 1000, body or 1000, fuel or 100, vehicle, mods)
            return veh, netid
        end)
      
        RegisterNetEvent('nyo_module:close_garage',function()
            local source = source
            OpenUIVehicleDataCache[source] = nil
        end)

        RegisterNetEvent('nyo_module:delete_vehicle')
        AddEventHandler('nyo_module:delete_vehicle',function(source, netId,vName)
            local entity = NetworkGetEntityFromNetworkId(netId)
            if not DoesEntityExist(entity) then return end
            -- if Nfw.isModuleActive('nyo_fuel') then
            --     TriggerEvent("nyoModule:fuelDelVehicle", netId)
            -- end
            if SpawnedVehiclesIds[entity] then
                local vehId = SpawnedVehiclesIds[entity]
                local engine, body, fuel, damage = RPC.trigger('garage-getVehicleDamage', source, netId)
                NyoFw.querySync("UPDATE nyo_users_vehicles SET damage = ?, engine = ?, body = ?, fuel = ? WHERE id = ?", {json.encode(damage),engine,body,fuel,vehId})
                SpawnedVehiclesIds[entity] = nil
                SpawnedVehicles[vehId] = nil
            end
            DeleteEntity(entity)
        end)

        RPC.addHandler('garage-sellVehicle', function(src, vehId, id, value)
            local user_id = NyoFw.getCharId(src)
            local player = NyoFw.getUserSource(id)

            print("tentativa de vender veiculo")
            print(src..' | '..vehId..' | '..user_id)
            print(OpenUIVehicleDataCache[user_id])
            print(json.encode(OpenUIVehicleDataCache))
            print(OpenUIVehicleDataCache[user_id][vehId])
            if not OpenUIVehicleDataCache[user_id] or not OpenUIVehicleDataCache[user_id][vehId] then
                NfwGlobalFunctions.notify( src, 'Erro', 'Não foi possível identificar o veículo', "#FF0000", 5000)
                return false
            end
           
            if not player then
                NfwGlobalFunctions.notify( src, 'Erro', 'O cidadão não está disponível para fazer a compra do veículo', "#FF0000", 5000)
                return false
            end
            local nuser_id = id

            if user_id == nuser_id then 
                return false 
            end 

            if SpawnedVehicles[vehId] and DoesEntityExist(SpawnedVehicles[vehId]) then
                NfwGlobalFunctions.notify( src, 'Erro', 'O veículo precisa estar na garagem para ser vendido', "#FF0000", 5000)
                return false
            end
            local vehName = NyoFw.getVehicleName(OpenUIVehicleDataCache[user_id][vehId].vehname)
            if NyoFw.request(src, 'Deseja vender o veículo '..vehName..' por $'..value..' ?', 30) then
                if NyoFw.request(player, 'Deseja comprar o veículo '..vehName..' por $'..value..' ?', 30) then
                    if module_funcs.checkCanBuyVehicle(id, user_id, vehId, value) then
                        if NfwGlobalFunctions.tryPayment(id, value, 2) then
                            NyoFw.giveMoney(user_id, value)
                            NyoFw.query('UPDATE nyo_users_vehicles SET char_id = ? WHERE id = ?', {id, vehId})
                            NyoFw.query('DELETE FROM nyo_users_vehicles_keys WHERE veh_id = ?', {vehId})
                            NfwGlobalFunctions.notify( src, 'Sucesso', 'Você vendeu o veículo '..vehName..' por $'..value..'.', "green", 5000)  
                            NfwGlobalFunctions.notify( player, 'Sucesso', 'Você comprou o veículo '..vehName..' por $'..value..'.', "green", 5000) 
                            return true
                        else
                            NfwGlobalFunctions.notify( src, 'Erro', 'O comprador não possui dinheiro suficiente.', "#FF0000", 5000)
                            NfwGlobalFunctions.notify( player, 'Erro', 'Você não possui dinheiro suficiente para efetuar a compra.', "#FF0000", 5000)
                        end
                    end
                else
                    NfwGlobalFunctions.notify( src, 'Erro', 'A compra foi recusada', "#FF0000", 5000)
                end
            end
            return false
        end)

        RPC.addHandler('garage-storeVehicle', function(source, vehId, distance)
            local data = SpawnedVehicles[vehId]
            if data and DoesEntityExist(data.entity) then
                local ped = GetPlayerPed(source)
                local pedCoord = GetEntityCoords(ped)
                local vehCoord = GetEntityCoords(data.entity)
                local cDist = #(pedCoord - vehCoord)
                if cDist < distance then 
                    local engine, body, fuel, damage = RPC.trigger('garage-getVehicleDamage', source, NetworkGetNetworkIdFromEntity(data.entity))
                    NyoFw.querySync("UPDATE nyo_users_vehicles SET damage = ?, engine = ?, body = ?, fuel = ? WHERE id = ?", {json.encode(damage),engine,body,fuel,vehId})
                    SpawnedVehiclesIds[data.entity] = nil
                    SpawnedVehicles[vehId] = nil
                    DeleteEntity(data.entity)
                    return true
                else 
                    NfwGlobalFunctions.notify(source, 'Erro', 'Você não pode guardar este veiculo pois ele esta muito longe!.', "#FF0000", 5000)
                    return false
                end
            end
        end)

        RPC.addHandler('garage-getVehicleKeys', function(source, vehId)
            local rows = NyoFw.querySync("SELECT name, last_name, char_id FROM nyo_users_vehicles_keys LEFT JOIN nyo_character ON id = char_id WHERE veh_id = ?",{vehId})
            local data = {}
            for k,v in pairs(rows) do
                table.insert(data, {(v.name or '') .. ' '..(v.last_name or ''), v.char_id})
            end
            return data
        end)

        SafeEvents.register('garage-removeKey', function(source, id, vehId)
            NyoFw.query("DELETE FROM nyo_users_vehicles_keys WHERE veh_id = ? AND char_id = ?",{vehId, id})
        end)

        RPC.addHandler("garage-addKey", function(source, vehId, id)
            NyoFw.query("INSERT INTO nyo_users_vehicles_keys VALUES(?,?)",{vehId, id})
            local row = NyoFw.querySync('SELECT name, last_name FROM nyo_character WHERE id = ?',{id})
            return row[1] and row[1].name .. ' '.. row[1].last_name or ''
        end)

    end)
else
    Nfw.preventCheat()
    error 'Module name has been modified'
end
