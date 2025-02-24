- [Configuration Parameters](#configuration-parameters)
  - [lapsAmount](#lapsamount)
  - [raceMaxTime](#racemaxtime)
  - [lapMaxTime](#lapmaxtime)
  - [explodeAtRaceTimerEnd](#explodeatracetimerend)
  - [explodeAtLapTimerEnd](#explodeatlaptimerend)
  - [disabledVehicleClasses](#disabledvehicleclasses)
  - [disabledVehicleModels](#disabledvehiclemodels)
  - [disabledPermissions](#disabledpermissions)


# Configuration Parameters
```lua
raceConfig = {
    lapsAmount = 4,
    raceMaxTime = 1 * 60 * 1000,
    lapMaxTime = 1 * 60 * 1000,
    explodeAtRaceTimerEnd = true,
    explodeAtLapTimerEnd = true,
    disabledVehicleClasses = {
        [18] = true
    },
    disabledVehicleModels = {
        [`police3`] = true
    },
    disabledPermissions = {
        'policia.permissao',
        'paramedico.permissao'
    }
}
```

## lapsAmount
> Quantidade de voltas da corrida
```lua
lapsAmount = 4
```

## raceMaxTime
> Tempo máximo para finalizar a corrida.
- Definindo como tempo infinito.
    ```lua
    raceMaxTime = false
    ```
- Definindo tempo limitado. Valor em milissegundos.
    ```lua
    raceMaxTime = 1 * 60 * 1000
    ```

## lapMaxTime
> Tempo máximo para finalizar a volta.
- Definindo como tempo infinito.
    ```lua
    lapMaxTime = false
    ```
- Definindo tempo limitado. Valor em milissegundos.
     ```lua
    lapMaxTime = 1 * 60 * 1000
    ```

## explodeAtRaceTimerEnd
> Explodir o jogador do veículo ao acabar o tempo total da corrida definido em [raceMaxTime](#raceMaxTime). Valor booleano (`true` ou `false`)
```lua
    explodeAtRaceTimerEnd = true
```

## explodeAtLapTimerEnd
> Explodir o jogador do veículo ao acabar o tempo total da volta definido em [lapMaxTime](#lapMaxTime). Valor booleano (`true` ou `false`)
```lua
    explodeAtLapTimerEnd = true
```

## disabledVehicleClasses
> Classes de veículos desabilitados a participar de corridas.

Lista de classes:
- 0: Compacts  
- 1: Sedans  
- 2: SUVs  
- 3: Coupes  
- 4: Muscle  
- 5: Sports Classics  
- 6: Sports  
- 7: Super  
- 8: Motorcycles  
- 9: Off-road  
- 10: Industrial  
- 11: Utility  
- 12: Vans  
- 13: Cycles  
- 14: Boats  
- 15: Helicopters  
- 16: Planes  
- 17: Service  
- 18: Emergency  
- 19: Military  
- 20: Commercial  
- 21: Trains

```lua
disabledVehicleClasses = {
    [18] = true,
    [19] = true,
    [vehicle class here] = true,
}
```

## disabledVehicleModels
> Modelos de veículos desabilitados a participar de corridas.

```lua
disabledVehicleModels = {
    [`police3`] = true,
    [`police2`] = true,
    [`vehicle model here`] = true
}
```

## disabledPermissions
> Impede jogadores com essas permissões de participarem da corrrida.

```lua
disabledPermissions = {
    'policia.permissao',
    'paramedico.permissao',
    'your user permission here',
}   
```