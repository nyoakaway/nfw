Nfw.registerConfig({
    config = {
        ['routes1'] = {
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
            perm = "policia.permissao",
            routesConfig = {
                ['weapons'] = {
                    icon = 'fa-duotone fa-gun-squirt',
                    name = 'Armamentos',
                    routes = {
                        {
                            name = 'Tecido XYZ',
                            image = 'tecido',
                            resultItens = {
                                {index = 'alianca', min = 10, max = 20, type = 'item'},
                                {index = 'metalfrag', min = 5, max = 10, type = 'item'},
                                {index = 'corrente', min = 1, max = 2, type = 'item'},
                                {index = 'dinheirosujo', min = 8, max = 10, type = 'money'},
                            },
                            requiredItens = {
                                {index = 'dinheirosujo', min = 1, max = 1, multiplier = 0.2, type = 'item'},
                                {index = 'dinheirosujo', min = 1, max = 1, multiplier = 0.2, type = 'money', paymentType = 1}
                            },
                            callPolice = function(source, user_id, position, routeConfig)
                                local policia = NyoFw.getUsersByPermission(NfwConfigs.robberyGeneralConfig.policePermission)
                                local chamaPolicia = math.random(0, 100)
                                if chamaPolicia <= 70 then
                                    for l, w in pairs(policia) do
                                        local player = NyoFw.getUserSource(w)
                                        if player then
                                            NfwGlobalFunctions.alertPolice(player, position.x, position.y, position.z, 'Rota em andamento')
                                        end
                                    end
                                end
                            end,
                            routes = {
                                {
                                    type = 'random', -- static / random / sequential
                                    resetTime = 1,
                                    drawDistance = 10.0,
                                    pressDistance = 1.0,
                                    disableVehicle = true,
                                    inputControl = 38,
                                    blipId = 51,
                                    blipColor = 11,
                                    blipScale = 0.6,
                                    blipName = 'Rota de Coleta',
                                    text = 'Pression ~y~E~w~ para coletar',
                                    coords = {
                                        vector3(12.94022, -895.9075, 29.97652),
                                        vector3(11.53896, -900.5058, 29.90075),
                                        vector3(9.602955, -905.4802, 29.8148),
                                        vector3(7.692702, -910.7223, 29.7244),
                                        vector3(6.309213, -915.1654, 29.64499),
                                        vector3(4.386248, -920.0797, 29.54947)
                                    },
                                    executeAnimation = function()
                                        ExecuteCommand('e mecanico')
                                        Wait(1000)
                                        NyoFw.stopAnim()
                                    end
                                }
                            },
                        }
                    }
                },
                ['weapons2'] = {
                    icon = 'fad fa-sword',
                    name = 'Armamentos XXX',
                    routes = {
                        {
                            name = 'Tecido XYZ ASD',
                            image = 'tecido',
                            resultItens = {
                                {index = 'tecido', min = 3, max = 5, type = 'item'},
                                {index = 'vodka', min = 8, max = 10, type = 'item'},
                                {index = 'dinheirosujo', min = 8, max = 10, type = 'money'},
                            },
                            requiredItens = {
                                {index = 'dinheirosujo', min = 1, max = 1, multiplier = 0.2, type = 'item'},
                                {index = 'dinheirosujo', min = 1, max = 1, multiplier = 0.2, type = 'money', paymentType = 1}
                            },
                            callPolice = function(source, user_id, position, routeConfig)
                                TriggerClientEvent('Notify', -1, 'importante', 'Entrega de coisa legalizadas em andamento')
                            end,
                            routes = {
                                {
                                    type = 'random', -- static / random / sequential
                                    resetTime = 1,
                                    drawDistance = 10.0,
                                    pressDistance = 1.0,
                                    disableVehicle = true,
                                    inputControl = 38,
                                    blipId = 51,
                                    blipColor = 11,
                                    blipScale = 0.6,
                                    blipName = 'Rota de Coleta',
                                    text = 'Pression ~y~E~w~ para coletar',
                                    coords = {
                                        vector3(12.94022, -895.9075, 29.97652),
                                        vector3(11.53896, -900.5058, 29.90075),
                                        vector3(9.602955, -905.4802, 29.8148),
                                        vector3(7.692702, -910.7223, 29.7244),
                                        vector3(6.309213, -915.1654, 29.64499),
                                        vector3(4.386248, -920.0797, 29.54947)
                                    },
                                    executeAnimation = function()
                                        ExecuteCommand('e mecanico')
                                        Wait(1000)
                                        NyoFw.stopAnim()
                                    end
                                }
                            },
                        }
                    }
                }
            }
        }
    },

    locs = {
        {showBlip = true, coord = vector3(35.60421, -901.983, 29.01), config = 'routes1'},
    },

    commands = {
        {showBlip = true, coord = vector3(-75.770088195801,-818.69323730469,326.17532348633), distance = 100000000, command = "openRoutes", config = 'routes1'},
    }
})
