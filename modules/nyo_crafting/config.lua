Nfw.registerConfig({
    config = {
        ['crafting1'] = {
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
                name = 'Crafting', -- Name to display on the map!
                blipId = 73, -- blip id = https://docs.fivem.net/docs/game-references/blips/
                blipColor = 13, -- color id
                blipScale = 0.5, -- scale for blip
            },  
            perm = "",
            showMakerWithoutPermission = true,
            craftingConfig = {
                ['weapons'] = {
                    icon = 'fad fa-sword',
                    name = 'Armamentos',
                    executeAnimation = function()
                        ExecuteCommand("e dancar")
                    end,
                    stopAnimation = function()
                        NyoFw.stopAnim()
                    end,
                    itens = {
                        ['tecido'] = {
                            minAmount = 1,
                            maxAmount = 10,
                            resultAmount = 10,
                            productionTime = 20,
                            requiredItens = {
                                ['metalfrag'] = 5,
                                ['corrente'] = 1,
                                ['alianca'] = 10
                            }
                        },
                        ['ferramenta'] = {
                            minAmount = 1,
                            maxAmount = 10,
                            resultAmount = 1,
                            productionTime = 20,
                            requiredItens = {
                                ['metalfrag'] = 5,
                                ['corrente'] = 1,
                                ['alianca'] = 10
                            }
                        },
                    }
                },
                ['weapons2'] = {
                    icon = 'fad fa-sword',
                    name = 'Armamentos Bélicos',
                    executeAnimation = function()

                    end,
                    stopAnimation = function()

                    end,
                    itens = {
                        ['tecido'] = {
                            minAmount = 1,
                            maxAmount = 10,
                            productionTime = 20,
                            requiredItens = {
                                ['metalfrag'] = 5,
                                ['corrente'] = 1,
                                ['alianca'] = 10
                            }
                        },
                        -- ['ferramenta'] = {
                        --     minAmount = 1,
                        --     maxAmount = 10,
                        --     productionTime = 20,
                        --     requiredItens = {
                        --         ['metalfrag'] = 5,
                        --         ['corrente'] = 1,
                        --         ['alianca'] = 10
                        --     }
                        -- },
                    }
                }
            }
        }
    },

    locs = {
        {showBlip = true, coord = vector3(40.52092, -903.4103, 29.01), config = 'crafting1'},
    }
})