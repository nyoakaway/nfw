Nfw.registerConfig({
    config = {
        ['configConceGeneral'] = {
            enableSimilarVehicles = true -- Permite ter mais de um veiculo igual
        },
        ['configConce'] = {
            type = 'conce', -- não alterar
            input = 'conce', -- não alterar
            -- Input configuration
            marker = { -- set custom marker if the type is marker
                id = 27, -- marker id = https://docs.fivem.net/docs/game-references/markers/
                color = {0,255,0,75}, -- marker color (R,G,B,A)
                scale = vec3(1.0, 1.0, 1.0),
                rotacao = vec3(0.0, 180.0, 130.0), -- marker Rotation (x,y,z)
                bobUpAndDown = false, -- marker bopUpAndDown
                faceCamera = false, -- marker faceCamera
                rotation = true, -- marker rotation
                custom = { -- Custom Marker
                    active = false,
                    dict = '',
                    name = ''
                }
            },
            actionKey = 38,
            -- Map Configuration
            blip = {
                name = 'Concessionaria', -- Name to display on the map!
                blipId = 73, -- blip id = https://docs.fivem.net/docs/game-references/blips/
                blipColor = 13, -- color id
                blipScale = 0.5, -- scale for blip
            },  
            
            paymentType = 1,
            -- General Settings
            perm = "", -- permissao para acessar o blip               
            dealershipConfig = {
                playerSell = false, -- habilita a venda de veiculo para outro player (pela conce)
                playerSellTax = 10, -- taxa em % para venda de veiculo a outro player
                playerVehicle = true, -- habilita venda de veiculo para a cidade
                playerVehicleSellTax = 0.2, -- taxa em % para venda de veiculo para a cidade
                showroomVehicleCoords = vector4(45.43,-887.75,30.21,67.44),
                vehicleCamCords = vector3(56.083316802979,-891.59344482422,30.690559387207),
                testDriveStartCoords = vector4(51.5,-880.26,30.33,359.87),
                index = 'conce1',
                name = 'auto motors',
                categories = {
                    /*
                        ICON EXEMPLE:
                        LINK: <img src="https://cdn-icons-png.flaticon.com/512/3202/3202926.png">
                        FontAwesome: <i class="fa-solid fa-car" style="color: #FFFFFF;"></i>
                    */
                    boats = {
                        icon =  '',
                        title = "boats"
                    },
                    commercials = {
                        icon = '<i class="fa-solid fa-car" style="color: #FFFFFF;"></i>',
                        title = 'commercials',
                    },
                    compacts  = {
                        icon = '<i class="fa-solid fa-car" style="color: #FFFFFF;"></i>',
                        title = 'Compacts',
                    },
                    coupes  = {
                        icon = '<i class="fa-solid fa-car" style="color: #FFFFFF;"></i>',
                        title = 'coupes',
                    },
                    cycles  = {
                        icon = '<i class="fa-solid fa-car" style="color: #FFFFFF;"></i>',
                        title = 'Cycles',
                    },
                    emergency  = {
                        icon = '<i class="fa-solid fa-car" style="color: #FFFFFF;"></i>',
                        title = 'Emergency',
                    },
                    helicopters  = {
                        icon = '<i class="fa-solid fa-car" style="color: #FFFFFF;"></i>',
                        title = 'Helicopters',
                    },
                    industrial  = {
                        icon = '<i class="fa-solid fa-car" style="color: #FFFFFF;"></i>',
                        title = 'Industrial',
                    },
                    military  = {
                        icon = '<i class="fa-solid fa-car" style="color: #FFFFFF;"></i>',
                        title = 'Military',
                    },
                    motorcycles  = {
                        icon = '<i class="fa-solid fa-car" style="color: #FFFFFF;"></i>',
                        title = 'Motorcycles',
                    },
                    muscle  = {
                        icon = '<i class="fa-solid fa-car" style="color: #FFFFFF;"></i>',
                        title = 'Muscle',
                    },
                    offroad  = {
                        icon = '<i class="fa-solid fa-car" style="color: #FFFFFF;"></i>',
                        title = 'Off-Road',
                    },
                    openwheel  = {
                        icon = '<i class="fa-solid fa-car" style="color: #FFFFFF;"></i>',
                        title = 'Open Wheel',
                    },
                    planes  = {
                        icon = '<i class="fa-solid fa-car" style="color: #FFFFFF;"></i>',
                        title = 'Planes',
                    },
                    suvs  = {
                        icon = '<i class="fa-solid fa-car" style="color: #FFFFFF;"></i>',
                        title = 'SUVs',
                    },
                    sedans  = {
                        icon = '<i class="fa-solid fa-car" style="color: #FFFFFF;"></i>',
                        title = 'Sedans',
                    },
                    service  = {
                        icon = '<i class="fa-solid fa-car" style="color: #FFFFFF;"></i>',
                        title = 'Service',
                    },
                    sports  = {
                        icon = '<i class="fa-solid fa-car" style="color: #FFFFFF;"></i>',
                        title = 'Sports',
                    },
                    sportsclassic  = {
                        icon = '<i class="fa-solid fa-car" style="color: #FFFFFF;"></i>',
                        title = 'Sports Classic',
                    },
                    super  = {
                        icon = '<i class="fa-solid fa-car" style="color: #FFFFFF;"></i>',
                        title = 'super',
                    },
                    trailer  = {
                        icon = '<i class="fa-solid fa-car" style="color: #FFFFFF;"></i>',
                        title = 'trailer',
                    },
                    trains  = {
                        icon = '<i class="fa-solid fa-car" style="color: #FFFFFF;"></i>',
                        title = 'trains',
                    },
                    utility  = {
                        icon = '<i class="fa-solid fa-car" style="color: #FFFFFF;"></i>',
                        title = 'utility',
                    },
                    vans  = {
                        icon = '<i class="fa-solid fa-car" style="color: #FFFFFF;"></i>',
                        title = 'vans',
                    },
                    
                }
            }
        },
    },

    locs = {
        {showBlip = true, coord = vector3(30.751703262329,-899.93487548828,29.984991073608), heading = 359.29, config = 'configConce'},
    },

    commands = {
        {showBlip = true, command = "openConce", config = 'configConce'},
    }
})