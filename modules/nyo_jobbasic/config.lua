Nfw.registerConfig({
    config = {
        ['jobBasicGeneralConfig'] = {
            garbageman = true,
            busDriver = true,
            fisherman = true,
            miner = true,

            ['garbagemanConfig'] = {
                paymentType = {
                    money = true,
                    itens = false
                },
                
                minMoney = 50,
                maxMoney = 100,
                
                paymentItensType = 1,
                --  1 = todos itens
                --  2 = item randomico,
                
                paymentItens = {
                    {item = 'laranja', min = 1, max = 2},
                },
                
                jobVehicles = {
                    [`trash`] = true,
                    [`trash2`] = true,
                },
                
                garbageCollectBlipConfig = {
                    sprite = 318,
                    colour = 1,
                    scale = 0.6,
                    routeColor = 5,
                    text = 'Coletar lixo'
                },
                
                markerConfig = { -- Configuração do marker nos pontos de coleta
                    markerId = 21,
                    markerColor = {255,0,0,50},  -- RGBA
                    markerRotationXYZ = {180.0,0.0,0.0}, -- rotation x,y,z
                    markerScale = {2.0,2.0,1.0}, --)Scale x,y,z
                    markerUpDown = true, -- marker ficar pulando
                    markerFace = true, -- marker segue a visão do player
                    markerRotation = true -- marker ficar rotacionando entre seu eixo
                },
                
                
                garbageLocations = {
                    vector3(-364.39,-1864.58,20.24),
                    vector3(119.92,-2049.79,18.00),
                    vector3(140.51,-1876.13,23.52),
                    vector3(159.26,-1814.52,28.13),
                    vector3(241.46,-1944.45,23.12),
                    vector3(447.58,-1936.93,24.31),
                    vector3(487.06,-1515.02,29.00),
                    vector3(419.46,-1526.35,28.99),
                    vector3(266.11,-1493.93,28.92),
                    vector3(120.39,-1545.78,28.95),
                    vector3(136.37,-1369.56,28.95),
                    vector3(-13.08,-1388.95,29.10),
                    vector3(482.05,-1279.73,29.25),
                    vector3(430.18,-1066.45,28.92),
                    vector3(305.60,-1038.61,28.89),
                    vector3(241.49,-831.53,29.62),
                    vector3(18.98,-544.66,36.34),
                    vector3(7.39,-366.43,40.23),
                    vector3(303.37,-259.79,53.67),
                    vector3(973.44,-158.95,73.09),
                    vector3(921.25,47.69,80.48),
                    vector3(916.12,-194.66,72.63),
                    vector3(587.96,67.51,93.18),
                    vector3(312.00,329.08,105.16),
                    vector3(-381.52,289.96,84.55),
                    vector3(-601.73,270.61,81.69),
                    vector3(-1239.73,405.86,75.35),
                    vector3(-1772.09,-478.61,39.42),
                    vector3(-1977.30,-488.59,11.45),
                    vector3(-1320.02,-1216.42,4.49),
                    vector3(-1208.72,-1411.40,3.89),
                    vector3(-1111.55,-1549.99,4.08),
                    vector3(-574.54,-857.53,25.97),
                    vector3(-352.88,-959.45,30.79),
                    vector3(49.47,-1240.88,28.94),
                    vector3(-148.22,-1296.49,30.78),
                    vector3(-333.68,-1366.33,31.01),
                    vector3(-303.08,-1538.89,26.32)
                },
            },

            ['busDriverConfig'] = {
                paymentType = {
                    money = true,
                    itens = false
                },
                
                minMoney = 200,
                maxMoney = 300,
                
                paymentItensType = 2,
                --  1 = todos itens
                --  2 = item randomico,
                
                paymentItens = {
                    {item = 'dollars', min = 50, max = 100},
                    {item = 'garbage', min = 50, max = 100},
                    {item = 'cellphone', min = 50, max = 100},
                    {item = 'radio', min = 50, max = 100},
                },
                
                blipConfig = { -- Configuração do blip nos pontos de coleta
                    blipId = 1,
                    blipColor = 5,
                    blipScale = 0.4,
                    routeColor = 5,
                },
                
                jobVehicles = {
                    [`coach`] = true,
                    [`airbus`] = true,
                },
                
                markerConfig = { -- Configuração do marker nos pontos de coleta
                    markerId = 21,
                    markerColor = {255,0,0,50},  -- RGBA
                    markerRotationXYZ = {180.0,0.0,0.0}, -- rotation x,y,z
                    markerScale = {2.0,2.0,1.0}, --)Scale x,y,z
                    markerUpDown = false, -- marker ficar pulando
                    markerFace = true, -- marker segue a visão do player
                    markerRotation = false -- marker ficar rotacionando entre seu eixo
                },
                
                route = { -- Pontos da Rota
                    vector3(309.95,-760.52,30.09),
                    vector3(69.59,-974.80,30.14),
                    vector3(95.00,-634.89,45.02),
                    vector3(58.27,-283.32,48.20),
                    vector3(47.74,-160.44,56.03),
                    vector3(323.93,-267.58,54.71),
                    vector3(443.75,119.16,100.41),
                    vector3(125.62,-4.42,68.48),
                    vector3(-524.08,133.59,63.91),
                    vector3(-586.64,268.39,83.24),
                    vector3(-640.38,-163.16,38.49),
                    vector3(-597.89,-361.27,35.77),
                    vector3(-646.06,-804.09,25.78),
                    vector3(-932.63,-1199.67,5.91),
                    vector3(-1234.65,-1080.87,9.12),
                    vector3(-1373.99,-793.23,20.09),
                    vector3(-2011.25,-160.04,29.40),
                    vector3(-2981.70,404.50,15.75),
                    vector3(-3101.58,1112.65,21.28),
                    vector3(-2556.10,2322.01,33.89),
                    vector3(-1094.86,2675.87,20.08),
                    vector3(-72.63,2813.83,54.60),
                    vector3(540.55,2685.25,43.20),
                    vector3(1119.93,2682.04,39.31),
                    vector3(1470.51,2725.47,38.48),
                    vector3(2002.62,2603.65,55.07),
                    vector3(379.58,-599.20,29.58),
                    vector3(-153.29,6212.22,32.04), 
                    vector3(-18.38,6507.26,32.11), 
                    vector3(750.1,6492.87,26.96), 
                    vector3(1605.67,6382.96,28.04), 
                    vector3(2523.1,5397.13,43.79), 
                    vector3(2417.2,5146.35,46.22), 
                    vector3(2483.1,4447.83,34.72), 
                    vector3(2009.0,3754.48,31.68),
                    vector3(1784.69,3784.43,34.56), 
                    vector3(1645.95,3594.46,34.77), 
                    vector3(2028.34,3086.08,46.26), 
                    vector3(1243.86,2685.01,36.89), 
                    vector3(301.27,2643.21,43.81), 
                    vector3(-457.07,2854.16,34.26), 
                    vector3(-1117.01,2668.0,17.46), 
                    vector3(-2220.02,2304.25,32.1), 
                    vector3(-2697.39,2289.02,18.42), 
                    vector3(-2542.61,3416.97,12.56), 
                    vector3(-2208.02,4298.45,47.47), 
                    vector3(-1530.62,4954.68,61.37), 
                    vector3(-1050.17,5333.97,44.0), 
                    vector3(-790.13,5551.25,32.34), 
                    vector3(-453.36,6069.5,30.66), 
                    vector3(-333.46,6331.06,29.42), 
                    vector3(-51.08,6602.36,29.08), 
                    vector3(-64.9,6472.86,30.68), 
                    vector3(-292.38,6246.41,30.71), 
                },
            },

            ['fishermanConfig'] = {
                paymentType = {
                    money = false,
                    itens = true
                },
                
                minMoney = 50,
                maxMoney = 100,
                
                paymentItensType = 2,
                --  1 = todos itens
                --  2 = item randomico,
                
                paymentItens = {
                    {item = 'dourado', min = 1, max = 1},
                    {item = 'corvina', min = 1, max = 1},
                    {item = 'salmao', min = 1, max = 1},
                    {item = 'pacu', min = 1, max = 1},
                    {item = 'pintado', min = 1, max = 1},
                    {item = 'pirarucu', min = 1, max = 1},
                    {item = 'tilapia', min = 1, max = 1},
                    {item = 'tucunare', min = 1, max = 1},
                },
                
                locations = {
                    {vector3(10.54,3996.82,30.22),40.0},
                },
                
                fishingTipe = 2, -- Tipo para pescar (1 = tempo, 2 = skillbar)
                fishingTime = 10,
                
                requestItem = { require = true, item = 'isca', qtd = 1}, -- Requer algum item para pescar? Caso sim coloque TRUE e o item, caso não coloque FALSE
                
                
                markerConfig = { -- Configuração do marker nos pontos de coleta
                    markerId = 28,
                    markerColor = {255,215,0,50},  -- RGBA
                    markerRotationXYZ = {180.0,0.0,0.0}, -- rotation x,y,z
                    markerUpDown = false, -- marker ficar pulando
                    markerFace = false, -- marker segue a visão do player
                    markerRotation = false -- marker ficar rotacionando entre seu eixo
                },
                
                fisherBlipConfig = {
                    sprite = 68,
                    colour = 57,
                    scale = 0.6,
                    shortRange = false,
                    text = 'Local de Pesca'
                },
            },

            ['minerConfig'] = {
                paymentType = {
                    money = false,
                    itens = true
                },
                
                minMoney = 50,
                maxMoney = 100,
                
                paymentItensType = 2,
                --  1 = todos itens
                --  2 = item randomico,
                
                paymentItens = {
                    {item = 'bronze', min = 1, max = 1}, 
                    {item = 'ferro', min = 1, max = 1},
                    {item = 'ouro', min = 1, max = 1},
                    {item = 'rubi', min = 1, max = 1},
                    {item = 'esmeralda', min = 1, max = 1},
                    {item = 'safira', min = 1, max = 1},
                    {item = 'diamante', min = 1, max = 1},
                    {item = 'topazio', min = 1, max = 1},
                    {item = 'ametista', min = 1, max = 1},
                },
                
                timerMining = 5000,
                
                jobVehicles = {
                    [`tiptruck`] = true,
                    [`tiptruck2`] = true,
                },

                --jobVehicles = false,
                
                markerConfig = { -- Configuração do marker nos pontos de coleta
                    markerId = 21,
                    markerColor = {255,0,0,50},  -- RGBA
                    markerRotationXYZ = {180.0,0.0,0.0}, -- rotation x,y,z
                    markerScale = {1.0,1.0,1.0}, --)Scale x,y,z
                    markerUpDown = true, -- marker ficar pulando
                    markerFace = true, -- marker segue a visão do player
                    markerRotation = true -- marker ficar rotacionando entre seu eixo
                },
                
                mineLocations = {
                    vector3(2956.11,2772.93,40.22),
                    vector3(2957.54,2772.76,40.32),
                    vector3(2953.58,2770.19,39.59),
                    vector3(2952.57,2768.19,40.03),
                    vector3(2948.31,2767.55,39.91),
                    vector3(2947.96,2765.65,40.55),
                    vector3(2942.52,2760.60,42.82),
                    vector3(2943.45,2756.52,43.66),
                    vector3(2947.35,2754.58,43.97),
                    vector3(2954.03,2754.14,43.96),
                    vector3(2955.20,2756.07,44.32),
                    vector3(2959.33,2758.81,42.57),
                    vector3(2959.82,2765.70,41.92),
                    vector3(2958.33,2767.20,41.42),
                    vector3(2974.34,2745.34,43.91),
                    vector3(2983.58,2763.12,43.66),
                    vector3(2988.45,2753.75,43.52),
                    vector3(2991.07,2776.31,43.78),
                    vector3(2959.03,2819.98,43.69),
                    vector3(2956.01,2820.06,43.19),
                    vector3(2951.13,2816.52,42.92),
                    vector3(2948.04,2820.89,43.61),
                    vector3(2944.52,2820.23,43.53),
                    vector3(2944.25,2818.68,43.53),
                    vector3(2938.35,2813.00,43.44),
                    vector3(2936.61,2814.16,44.02),
                    vector3(2925.64,2796.38,41.47),
                    vector3(2925.34,2794.84,41.51),
                    vector3(2925.83,2792.54,41.23),
                    vector3(2927.94,2789.11,40.65),
                    vector3(2928.14,2790.74,40.80),
                    vector3(2930.75,2786.90,40.14),
                    vector3(2934.45,2784.03,40.09),
                    vector3(2936.94,2774.47,39.66),
                    vector3(2938.30,2774.27,39.74),
                    vector3(2937.25,2771.71,39.90),
                    vector3(2939.04,2769.32,39.63),
                },
            },
        },

        ['configJobMotorista'] = {
            type = 'job',
            jobtype = 'busdriver',
            displayName = "Onibus",
            -- Input configuration
            marker = { -- set custom marker if the type is marker
                id = 9, -- marker id = https://docs.fivem.net/docs/game-references/markers/
                color = {255, 255, 255, 255}, -- marker color (R,G,B,A)
                scale = vec3(0.6, 0.6, 0.6),
                rotacao = vec3(90.0, 0.0, 0.0), -- marker Rotation (x,y,z)
                bobUpAndDown = false, -- marker bopUpAndDown
                faceCamera = true, -- marker faceCamera
                rotation = false, -- marker rotation
                custom = { -- Custom Marker
                    active = true,
                    dict = 'nfw_marker',
                    name = 'busdrive'
                }
            },
            actionKey = 38,
            perm = "",
            -- Map Configuration
            blip = {
                name = 'Central | Motorista de Onibus', -- Name to display on the map!
                blipId = 513, -- blip id = https://docs.fivem.net/docs/game-references/blips/
                blipColor = 13, -- color id
                blipScale = 0.5, -- scale for blip
            },  
        },

        -- Config do Ponto inicial do emprego de Lixeiro
        ['configJobGarbage'] = {
            type = 'job',
            jobtype = 'garbageman',
            displayName = 'Lixeiro',
            -- Input configuration
            marker = { -- set custom marker if the type is marker
                id = 9, -- marker id = https://docs.fivem.net/docs/game-references/markers/
                color = {255, 255, 255, 255}, -- marker color (R,G,B,A)
                scale = vec3(0.6, 0.6, 0.6),
                rotacao = vec3(90.0, 0.0, 0.0), -- marker Rotation (x,y,z)
                bobUpAndDown = false, -- marker bopUpAndDown
                faceCamera = true, -- marker faceCamera
                rotation = false, -- marker rotation
                custom = { -- Custom Marker
                    active = true,
                    dict = 'nfw_marker',
                    name = 'garbage'
                }
            },
            actionKey = 38,
            perm = "",

            -- Map Configuration
            blip = {
                name = 'Central | Lixeiro', -- Name to display on the map!
                blipId = 318, -- blip id = https://docs.fivem.net/docs/game-references/blips/
                blipColor = 13, -- color id
                blipScale = 0.5, -- scale for blip
            },  
        },

        -- Config do Ponto inicial do emprego de Minerador
        ['configJobMinerador'] = {
            type = 'job',
            jobtype = 'miner',
            displayName = 'Minerador',
            -- Input configuration
            marker = { -- set custom marker if the type is marker
                id = 9, -- marker id = https://docs.fivem.net/docs/game-references/markers/
                color = {255, 255, 255, 255}, -- marker color (R,G,B,A)
                scale = vec3(0.6, 0.6, 0.6),
                rotacao = vec3(90.0, 0.0, 0.0), -- marker Rotation (x,y,z)
                bobUpAndDown = false, -- marker bopUpAndDown
                faceCamera = true, -- marker faceCamera
                rotation = false, -- marker rotation
                custom = { -- Custom Marker
                    active = true,
                    dict = 'nfw_marker',
                    name = 'miner'
                }
            },
            actionKey = 38,
            perm = "",

            -- Map Configuration
            blip = {
                name = 'Central | Minerador', -- Name to display on the map!
                blipId = 477, -- blip id = https://docs.fivem.net/docs/game-references/blips/
                blipColor = 13, -- color id
                blipScale = 0.5, -- scale for blip
            },  
        },

        -- Config do Ponto inicial do emprego de pescador 
        ['configJobPescador'] = {
            type = 'job',
            jobtype = 'fisherman',
            displayName = 'Pescador',
            -- Input configuration
            marker = { -- set custom marker if the type is marker
                id = 9, -- marker id = https://docs.fivem.net/docs/game-references/markers/
                color = {255, 255, 255, 255}, -- marker color (R,G,B,A)
                scale = vec3(0.6, 0.6, 0.6),
                rotacao = vec3(90.0, 0.0, 0.0), -- marker Rotation (x,y,z)
                bobUpAndDown = false, -- marker bopUpAndDown
                faceCamera = true, -- marker faceCamera
                rotation = false, -- marker rotation
                custom = { -- Custom Marker
                    active = true,
                    dict = 'nfw_marker',
                    name = 'fish'
                }
            },
            actionKey = 38,
            perm = "",

            -- Map Configuration
            blip = {
                name = 'Central | Pescador', -- Name to display on the map!
                blipId = 68, -- blip id = https://docs.fivem.net/docs/game-references/blips/
                blipColor = 13, -- color id
                blipScale = 0.5, -- scale for blip
            },  
        },
    },

    locs = {
        {showBlip = true, coord = vector3(453.34765625,-607.71734619141,28.581958770752), heading = 359.29, config = 'configJobMotorista'},
        {showBlip = true, coord = vector3(-349.84,-1569.79,25.32), heading = 359.29, config = 'configJobGarbage'},
        {showBlip = true, coord = vector3(1054.13,-1952.76,32.29), heading = 359.29, config = 'configJobMinerador'},
        {showBlip = true, coord = vector3(1514.40,3784.3022,34.66), heading = 359.29, config = 'configJobPescador'},
    }
})