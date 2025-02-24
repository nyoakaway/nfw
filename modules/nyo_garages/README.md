- [Events](#events)
  - [Delete Vehicle](#delete-vehicle)
- [Exports](#exports)
  - [Create Vehicle - *Server*](#create-vehicle---server)
  - [Add Vehicle To Player - *Server*](#add-vehicle-to-player---server)
  - [Rem Vehicle From Player - *Server*](#rem-vehicle-from-player---server)
  - [Player Has Vehicle - *Server*](#player-has-vehicle---server)
- [Commands Examples](#commands-examples)
    - [/dv - Delete vehicle](#dv---delete-vehicle)
    - [/addcar - Adds a car for a player](#addcar---adds-a-car-for-a-player)
    - [/remcar - Removes a car from a player](#remcar---removes-a-car-from-a-player)
    - [/hascar - Checks if a player has a car](#hascar---checks-if-a-player-has-a-car)
    - [/car - Create a vehicle at player position](#car---create-a-vehicle-at-player-position)

# Events

## Delete Vehicle
```lua
-- server
TriggerServerEvent('nyo_module:delete_vehicle', netId, vehicleModel)
```
```lua
-- client
TriggerEvent('nyo_module:delete_vehicle', netId, vehicleModel)
```

# Exports

## Create Vehicle - *Server*
Cria um veículo com os parâmetros especificados. Parâmetros com `?` não são obrigatórios. 
```lua
local vehicle, netid = exports['nfw']:createVehicle(model, spawnCoords, ?plate, ?engine, ?body, ?fuel, ?mods, ?damage, ?livery, ?extras)
```

## Add Vehicle To Player - *Server*
Adiciona um veículo para um jogador.
```lua
exports['nfw']:addVehicleToPlayer(user_id, vehicle)
```

## Rem Vehicle From Player - *Server*
Remove um veículo de um jogador.
```lua
exports['nfw']:remVehicleFromPlayer(user_id, vehicle)
```

## Player Has Vehicle - *Server*
Checa se um jogador tem tal veículo.
```lua
local hasVehicle = exports['nfw']:playerHasVehicle(user_id, vehicle)
```

# Commands Examples
### /dv - Delete vehicle
```lua
RegisterCommand('dv',function(source)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, 'admin.permissao') then
        local veh, netId, plate, vName = vRPclient.vehList(source, 25.0)
        TriggerEvent('nyo_module:delete_vehicle',netId,vName)
    end
end)
```

### /addcar - Adds a car for a player
```lua
RegisterCommand('addcar',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local nuser_id = tonumber(args[2])
    if vRP.hasPermission(user_id,"admin.permissao") then
        if args[1] and args[2] then
            local identity = vRP.getUserIdentity(user_id)
            local identitynu = vRP.getUserIdentity(nuser_id)
            exports['nfw']:addVehicleToPlayer(nuser_id, args[1])
        end
    end
end)
```
### /remcar - Removes a car from a player
```lua
RegisterCommand('remcar',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local nuser_id = tonumber(args[2])
    if vRP.hasPermission(user_id,"admin.permissao") then
        if args[1] and args[2] then
            local identity = vRP.getUserIdentity(user_id)
            local identitynu = vRP.getUserIdentity(nuser_id)
            exports['nfw']:remVehicleFromPlayer(nuser_id, args[1])
        end
    end
end)
```

### /hascar - Checks if a player has a car
```lua
RegisterCommand('hascar',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local nuser_id = tonumber(args[2])
    if vRP.hasPermission(user_id,"admin.permissao") then
        if args[1] and args[2] then  
            local hasCar = exports['nfw']:playerHasVehicle(nuser_id, args[1])
            TriggerClientEvent("Notify",source,"sucesso", hasCar and 'Tem o veículo' or 'Não tem o veículo') 
        end
    end
end)
```

### /car - Create a vehicle at player position
```lua
RegisterCommand('car',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"mod.permissao") or vRP.hasPermission(user_id,"vendedor.permissao") then
		if args[1] then
            local ped = GetPlayerPed(source)
            local cds = GetEntityCoords(ped)
            local h = GetEntityHeading(ped)
            local spawnCoords = vec4(cds.x,cds.y,cds.z,h)
            exports['nfw']:createVehicle(args[1], spawnCoords, vRP.getUserIdentity(user_id).registration)
		end
	end
end)
```