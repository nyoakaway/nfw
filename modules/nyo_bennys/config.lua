Nfw.registerConfig({
    config = { 
        ['configBennys'] = {
            type = 'bennys', -- não alterar
            input = 'bennys', -- não alterar
            -- Input configuration
            marker = { -- set custom marker if the type is marker
                id = 27, -- marker id = https://docs.fivem.net/docs/game-references/markers/
                color = {0,255,0,75}, -- marker color (R,G,B,A)
                scale = vec3(4.0, 4.0, 1.0),
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
                name = 'Bennys', -- Name to display on the map!
                blipId = 73, -- blip id = https://docs.fivem.net/docs/game-references/blips/
                blipColor = 13, -- color id
                blipScale = 0.5, -- scale for blip
            },  

            -- General Settings
            perm = "", -- permissao para acessar o blip      
            paymentType = 1,         
            disableTuningWorkVehicles = false,
            hidePlayers = true,
            hideVehicles = true,
            previewOnItemHover = true,
            playAudioOnModChange = false,
            bennysConfig = {

                [0] = {
                    price = 1500,
                    increaseBy = 500,       
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 2
                    }
                },
        
                [1] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [2] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [3] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [4] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [5] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [6] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [7] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [8] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [9] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [10] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [11] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [12] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [13] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [14] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [15] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [16] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [17] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [18] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [19] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [20] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [21] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [22] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [23] = {
                    price = 1500,
                    increaseBy = 1500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [24] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [25] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [26] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [27] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [28] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [29] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [30] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [31] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [32] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [33] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [34] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [35] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [36] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [37] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [38] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [39] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [40] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [41] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [42] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [43] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [44] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [45] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [46] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [47] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [48] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
        
                [49] = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },

                primaryPaintType = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },

                secondaryPaintType = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },

                windowTint = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },
                
                xenonColour = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },

                wheelType = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },

                pearlescentColour = {
                    price = 1500,
                    increaseBy = 0,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },

                wheelColour = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },

                primaryColour = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },

                secondaryColour = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 1
                    }
                },

                tyreSmokeColour = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 5
                    }
                },

                neon = {

                    toggle = {
                        price = 1500,
                        increaseBy = 500,
                        requireItem = false,
                        item = {
                            index = '',
                            qtd = 1
                        }
                    },

                    color = {
                        price = 1500,
                        increaseBy = 500,
                        requireItem = false,
                        item = {
                            index = '',
                            qtd = 1
                        }
                    }

                },

                plate = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 5
                    }
                },

                customTires = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 5
                    }
                },

                bulletProofTyres = {
                    price = 1500,
                    increaseBy = 500,
                    requireItem = false,
                    item = {
                        index = '',
                        qtd = 5
                    }
                },
            }
        },
    },

    locs = {
        {showBlip = true, markerDistance = 50.0, distance = 3.0, coord = vector3(48.318790435791,-853.38610839844,29.938374710083), heading = 359.29, config = 'configBennys'},
    },

    commands = {
        {showBlip = true, coord = vector3(-75.770088195801,-818.69323730469,326.17532348633), distance = 100000000, command = "openBennys", config = 'configBennys'},
    }
})

