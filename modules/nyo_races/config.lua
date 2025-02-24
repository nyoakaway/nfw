Nfw.registerConfig({
    config = {
        ['races1'] = {
            marker = {
                id = 4,
                color = {255,0,0,75},
                scale = vec3(1.0, 1.0, 1.0),
                rotacao = vec3(0.0, 180.0, 130.0),
                bobUpAndDown = false,
                faceCamera = false,
                rotation = true,
                custom = {
                    active = false,
                    dict = '',
                    name = ''
                }
            },
            actionKey = 38,
            blip = {
                name = 'Corrida',
                blipId = 38,
                blipColor = 1,
                blipScale = 0.5,
            }, 
            perm = "",

            raceConfig = {
                lapsAmount = 2,
                raceMaxTime = 1 * 15 * 100000,
                explodeAtRaceTimerEnd = true,
                explodeWhenLeftingCar = true,
                disabledVehicleClasses = {
                    [18] = false
                },
                disabledVehicleModels = {
                    [`police3`] = true
                },
                disabledPermissions = {
                    'policia.permissao',
                    'paramedico.permissao'
                },
                requiredItems = {
                   -- {"informacao", 1}
                },
                entryPrice = 0,
                entryPaymentType = 1,
                rewards = {
                    [1] = {
                        { type = "item", item = "dinheirosujo", min = 800, max = 1000 },
                        { type = "money", min = 800, max = 1000 }
                    },
                    [2] = {
                        { type = "item", item = "dinheirosujo", min = 400, max = 600 },
                        { type = "money", min = 400, max = 600 }
                    },
                    [3] = {
                        { type = "item", item = "dinheirosujo", min = 100, max = 200 },
                        { type = "money", min = 100, max = 200 }
                    },
                    ['*'] = {
                        { type = "item", item = "dinheirosujo", min = 5, max = 10},
                        { type = "money", min = 5, max = 10}
                    }
                },
                startPositions = {
                    vec4(40.97, -841.81, 30.46, 155.91),
                    vec4(37.57, -840.61, 30.46, 158.74),
                    vec4(34.43, -839.21, 30.48, 158.74)
                },
                maxAmountOfRunners = 2,
                startRaceWaitTime = 15,
                disabledControlsDuringPrepareFase = { 75 },
                checkpoints = {
                    -- {vec3(18.78, -887.91, 29.6), false, 5 * 1000},
                    -- {vec3(51.59, -901.58, 29.58), false, 5 * 1000},
                    -- {vec3(74.24, -841.67, 30.48), false, 5 * 1000},
                    -- {vec3(46.23, -849.85, 30.34), false, 5 * 1000}
                    {vec3(51.69, -908.41, 29.52), false, 5 * 1000},
                    {vec3(39.43, -994.35, 28.96), false, 5 * 1000},
                    {vec3(29.16, -1039.83, 28.91), false, 5 * 1000},
                    {vec3(168.16, -1084.8, 28.76), false, 5 * 1000},
                    {vec3(219.89, -1119.76, 28.89), false, 5 * 1000},
                    {vec3(445.07, -1134.75, 28.94), false, 5 * 1000},
                    {vec3(475.15, -1086.62, 28.76), false, 5 * 1000},
                    -- {vec3(504.46, -838.54, 24.41), false, 5 * 1000},
                    -- {vec3(460.73, -819.78, 26.74), false, 5 * 1000},
                    -- {vec3(462.95, -656.31, 27.27), false, 5 * 1000},
                    -- {vec3(447.6, -583.35, 28.07), false, 5 * 1000},
                    -- {vec3(409.54, -694.67, 28.74), false, 5 * 1000},
                    -- {vec3(367.54, -769.31, 28.86), false, 5 * 1000},
                    -- {vec3(361.31, -846.22, 28.89), false, 5 * 1000},
                    -- {vec3(168.9, -822.73, 30.76), false, 5 * 1000},
                    -- {vec3(105.11, -987.24, 28.98), false, 5 * 1000},
                    -- {vec3(-16.5, -936.65, 28.96), false, 5 * 1000},
                    -- {vec3(32.48, -801.02, 43.75), false, 5 * 1000},
                    -- {vec3(-98.48, -716.24, 43.59), false, 5 * 1000},
                    -- {vec3(-333.05, -658.8, 31.98), false, 5 * 1000},
                    -- {vec3(-352.91, -796.88, 33.19), false, 5 * 1000},
                    -- {vec3(-311.97, -859.15, 31.27), false, 5 * 1000},
                    -- {vec3(-228.18, -698.93, 33.1), false, 5 * 1000},
                    -- {vec3(-104.73, -720.71, 43.45), false, 5 * 1000},
                    -- {vec3(46.47, -779.99, 43.67), false, 5 * 1000},
                    -- {vec3(222.51, -824.14, 29.94), false, 5 * 1000},
                    -- {vec3(226.52, -751.54, 30.39), false, 5 * 1000},
                    -- {vec3(266.41, -747.64, 34.2), false, 5 * 1000},
                    -- {vec3(178.55, -722.73, 33.07), false, 5 * 1000},
                    -- {vec3(78.22, -690.36, 31.15), false, 5 * 1000},
                    -- {vec3(101.64, -589.77, 31.2), false, 5 * 1000},
                    -- {vec3(56.22, -629.16, 31.23), false, 5 * 1000},
                    -- {vec3(13.31, -680.08, 31.91), false, 5 * 1000},
                    -- {vec3(-102.42, -674.41, 34.94), false, 5 * 1000},
                    -- {vec3(-99.6, -726.13, 34.45), false, 5 * 1000},
                    -- {vec3(22.55, -777.47, 31.12), false, 5 * 1000},
                    -- {vec3(22.68, -825.3, 30.53), false, 5 * 1000},
                    -- {vec3(77.06, -850.56, 30.39), false, 5 * 1000},
                    -- {vec3(33.11, -958.92, 28.61), false, false},
                    -- {vec3(104.0, -1001.34, 28.76), false, false},
                    -- {vec3(162.05, -874.0, 30.0), vec3(213.43, -1033.64, 28.72), 10 * 1000, 5 * 1000},
                    -- {vec3(61.37, -777.22, 31.12), false, 25 * 1000},
                    -- {vec3(13.12, -814.6, 30.51), false, false},
                },
                checkpointDistance = 25.0,
                checkpointConfig = {
                    primaryColor = {255,255,0,150},
                    secondaryColor = {255,255,255,50},
                    height = 10.0,
                    type = 7,
                },
                lastCheckpointConfig = {
                    primaryColor = {255,0,0,150},
                    secondaryColor = {255,255,255,50},
                    height = 10.0,
                    type = 10,
                },
                repairCheckpointConfig = {
                    primaryColor = {0,255,0,150},
                    secondaryColor = {255,255,255,50},
                    height = 10.0,
                    type = 11,
                },
                callPolice = true,
                policePermission = 'admin.permissao',
                policeTextLangIndex = 'notify-callpolice-races1',
                policeAlertBlip = {
                    nameLangIndex = 'blip-callpolice-races1',
                    id = 38,
                    color = 1,
                    scale = 0.5,
                },
                showCheckpointBlips = true,
                showRunnersBlip = true,
                repair = {
                    price = 10000,
                    paymentType = 1,
                    requiredItems = {
                        {"reapairkit", 1} 
                    },
                    fadeInTime = 500,
                    fadeWaitTime = 1000,
                    fadeOutTime = 500,
                }
            }
        }
    },

    locs = {
        {showBlip = true, coord = vec3(35.76, -849.13, 30.75), distance = 10.0, markerDistance = 25.0, config = 'races1'},
    }
})