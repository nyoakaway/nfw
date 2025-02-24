Nfw.registerConfig({
    config = {

        ['robberyGeneralConfig'] = {
            policePermission = 'policia.permissao'
        },

        ['configRobberyAtm'] = {
            type = 'robbery', -- não alterar
            input = 'robbery', -- não alterar
            -- Input configuration
            marker = { -- set custom marker if the type is marker
                id = 20, -- marker id = https://docs.fivem.net/docs/game-references/markers/
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

            blip = {
                name = 'xx', -- Name to display on the map!
                blipId = 1, -- blip id = https://docs.fivem.net/docs/game-references/blips/
                blipColor = 1, -- color id
                blipScale = 0.5, -- scale for blip
            },  
            actionKey = 38,
            -- Map Configuration
  

            -- General Settings
            perm = "", -- permissao para iniciar o roubo 


            qtdPolice = 0, -- quantidade de policia necessaria
            policeChance = 100, -- chance de acionar a policia durante o roubo
            policeText = 'Roubo a Caixa eletronico! Vá até o local e intercepte o assaltante!', -- Texto que ira aparecer aos policiais durante o roubo
            minigame = '', -- game para efetuar o roubo (Vazio para nenhum ou: nptask, skillbar, keymaster, pdsafe)

            robberyRequestItem = false, -- precisa de um item para roubar?
            robberyItem = {item = 'dourado', qtd = 10}, -- Item e quantidade caso robberyRequestItem = true
            robberyTime = 15, -- tempo para concluir o roubo e somente apos concluir da o payment
            robberyIndex = 'registradora', -- nome que sera levado em conta para o StandBy            
            robberyStandByType = 2, -- Tipo do StandBy (1 = individual, 2 = global (mesmo grupo de roubo))
            robberyStandByRobbery = 10, -- Tempo do StandBy entre roubos naquele roubo em especifico
            robberyCheckStandBy = true, -- Verificar se a pessoa esta procurada ou não para liberar ela roubar
            robberySetStandBy = false, -- Vai setar a pessoa como procurado ou não
            robberyStandByPerson = 30, -- tempo que a pessoa vai ficar procurada apos efetuar o roubo (não integrado com outros sistemas de procurado)

            paymentType = {
                money = false, -- vai dar dinheiro limpo ao efetuar o roubo?
                item = true -- vai dar item ao efetuar o roubo?
            },
            paymentMoney = { min = 100, max = 100}, -- caso money = true, qual valor de dinheiro limpo vai dar 
            paymentItemType = 2, -- caso item = true, qual tipo de entrega (1 = randomico, 2 = todos os itens)
            paymentItem = {
                {item = 'agua', min = 1, max = 1},
                {item = 'faca', min = 1, max = 1},
                {item = 'isca', min = 1, max = 1},
            }
        },


        ['departamento'] = {
            type = 'robbery', -- não alterar
            input = 'robbery', -- não alterar   
            -- Input configuration
            marker = { -- set custom marker if the type is marker
                id = 20, -- marker id = https://docs.fivem.net/docs/game-references/markers/
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

            blip = {
                name = 'xx', -- Name to display on the map!
                blipId = 1, -- blip id = https://docs.fivem.net/docs/game-references/blips/
                blipColor = 1, -- color id
                blipScale = 0.5, -- scale for blip
            }, 

            actionKey = 38,
            -- Map Configuration


            -- General Settings
            perm = "", -- permissao para iniciar o roubo 


            qtdPolice = 0, -- quantidade de policia necessaria
            policeChance = 100, -- chance de acionar a policia durante o roubo
            policeText = 'Roubo a Lojinha de Departamento! Vá até os local e intercepte o assaltantes!', -- Texto que ira aparecer aos policiais durante o roubo
            minigame = 'skillbar', -- game para efetuar o roubo (Vazio para nenhum ou: nptask, skillbar, keymaster, pdsafe)

            robberyRequestItem = false, -- precisa de um item para roubar?
            robberyItem = {item = '', qtd = 1}, -- Item e quantidade caso robberyRequestItem = true
            robberyTime = 15, -- tempo para concluir o roubo e somente apos concluir da o payment
            robberyIndex = 'departamento', -- nome que sera levado em conta para o StandBy            
            robberyStandByType = 2, -- Tipo do StandBy (1 = individual, 2 = global (mesmo grupo de roubo))
            robberyStandByRobbery = 1200, -- Tempo do StandBy entre roubos naquele roubo em especifico
            robberyCheckStandBy = true, -- Verificar se a pessoa esta procurada ou não para liberar ela roubar
            robberySetStandBy = false, -- Vai setar a pessoa como procurado ou não
            robberyStandByPerson = 30, -- tempo que a pessoa vai ficar procurada apos efetuar o roubo (não integrado com outros sistemas de procurado)

            paymentType = {
                money = false, -- vai dar dinheiro limpo ao efetuar o roubo?
                item = true -- vai dar item ao efetuar o roubo?
            },
            paymentMoney = { min = 100, max = 100}, -- caso money = true, qual valor de dinheiro limpo vai dar 
            paymentItemType = 2, -- caso item = true, qual tipo de entrega (1 = randomico, 2 = todos os itens)
            paymentItem = {
                {item = 'dinheirosujo', min = 1, max = 1}, -- COLOCAR O PREÇO
            }    
        },
        ['ammunation'] = {
            type = 'robbery', -- não alterar
            input = 'robbery', -- não alterar   
            -- Input configuration
            marker = { -- set custom marker if the type is marker
                id = 20, -- marker id = https://docs.fivem.net/docs/game-references/markers/
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

            blip = {
                name = 'xx', -- Name to display on the map!
                blipId = 1, -- blip id = https://docs.fivem.net/docs/game-references/blips/
                blipColor = 1, -- color id
                blipScale = 0.5, -- scale for blip
            }, 
            actionKey = 38,
            -- Map Configuration


            -- General Settings
            perm = "", -- permissao para iniciar o roubo 


            qtdPolice = 3, -- quantidade de policia necessaria
            policeChance = 100, -- chance de acionar a policia durante o roubo
            policeText = 'Roubo a Ammunation! Vá até o local e intercepte os assaltantes!', -- Texto que ira aparecer aos policiais durante o roubo
            minigame = 'pdsafe', -- game para efetuar o roubo (Vazio para nenhum ou: nptask, skillbar, keymaster, pdsafe)

            robberyRequestItem = false, -- precisa de um item para roubar?
            robberyItem = {item = 'crowbar', qtd = 10}, -- Item e quantidade caso robberyRequestItem = true
            robberyTime = 15, -- tempo para concluir o roubo e somente apos concluir da o payment
            robberyIndex = 'ammunation', -- nome que sera levado em conta para o StandBy            
            robberyStandByType = 2, -- Tipo do StandBy (1 = individual, 2 = global (mesmo grupo de roubo))
            robberyStandByRobbery = 900, -- Tempo do StandBy entre roubos naquele roubo em especifico
            robberyCheckStandBy = true, -- Verificar se a pessoa esta procurada ou não para liberar ela roubar
            robberySetStandBy = false, -- Vai setar a pessoa como procurado ou não
            robberyStandByPerson = 30, -- tempo que a pessoa vai ficar procurada apos efetuar o roubo (não integrado com outros sistemas de procurado)

            paymentType = {
                money = false, -- vai dar dinheiro limpo ao efetuar o roubo?
                item = true -- vai dar item ao efetuar o roubo?
            },
            paymentMoney = { min = 100, max = 100}, -- caso money = true, qual valor de dinheiro limpo vai dar 
            paymentItemType = 2, -- caso item = true, qual tipo de entrega (1 = randomico, 2 = todos os itens)
            paymentItem = {
                {item = 'dinheirosujo', min = 1, max = 1}, -- COLOCAR O PREÇO
            }
        },
        ['atms'] = {
            type = 'robbery', -- não alterar
            input = 'robbery', -- não alterar   
            -- Input configuration
            marker = { -- set custom marker if the type is marker
                id = 20, -- marker id = https://docs.fivem.net/docs/game-references/markers/
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

            blip = {
                name = 'xx', -- Name to display on the map!
                blipId = 1, -- blip id = https://docs.fivem.net/docs/game-references/blips/
                blipColor = 1, -- color id
                blipScale = 0.5, -- scale for blip
            }, 
            actionKey = 38,
            -- Map Configuration


            -- General Settings
            perm = "", -- permissao para iniciar o roubo 


            qtdPolice = 3, -- quantidade de policia necessaria
            policeChance = 50, -- chance de acionar a policia durante o roubo
            policeText = 'Roubo a Caixinha eletrônico! Vá até o local e intercepte o assaltante!', -- Texto que ira aparecer aos policiais durante o roubo
            minigame = 'nptask', -- game para efetuar o roubo (Vazio para nenhum ou: nptask, skillbar, keymaster, pdsafe)

            robberyRequestItem = false, -- precisa de um item para roubar?
            robberyItem = {item = 'crowbar', qtd = 10}, -- Item e quantidade caso robberyRequestItem = true
            robberyTime = 15, -- tempo para concluir o roubo e somente apos concluir da o payment
            robberyIndex = 'atms', -- nome que sera levado em conta para o StandBy            
            robberyStandByType = 1, -- Tipo do StandBy (1 = individual, 2 = global (mesmo grupo de roubo))
            robberyStandByRobbery = 120, -- Tempo do StandBy entre roubos naquele roubo em especifico
            robberyCheckStandBy = true, -- Verificar se a pessoa esta procurada ou não para liberar ela roubar
            robberySetStandBy = false, -- Vai setar a pessoa como procurado ou não
            robberyStandByPerson = 30, -- tempo que a pessoa vai ficar procurada apos efetuar o roubo (não integrado com outros sistemas de procurado)

            paymentType = {
                money = false, -- vai dar dinheiro limpo ao efetuar o roubo?
                item = true -- vai dar item ao efetuar o roubo?
            },
            paymentMoney = { min = 100, max = 100}, -- caso money = true, qual valor de dinheiro limpo vai dar 
            paymentItemType = 2, -- caso item = true, qual tipo de entrega (1 = randomico, 2 = todos os itens)
            paymentItem = {
                {item = 'dinheirosujo', min = 1, max = 1}, -- COLOCAR PREÇO
            }
        },

        ['registradora'] = {
            type = 'robbery', -- não alterar
            input = 'robbery', -- não alterar   
            -- Input configuration
            marker = { -- set custom marker if the type is marker
                id = 20, -- marker id = https://docs.fivem.net/docs/game-references/markers/
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

            blip = {
                name = 'xx', -- Name to display on the map!
                blipId = 1, -- blip id = https://docs.fivem.net/docs/game-references/blips/
                blipColor = 1, -- color id
                blipScale = 0.5, -- scale for blip
            }, 
            actionKey = 38,
            -- Map Configuration


            -- General Settings
            perm = "", -- permissao para iniciar o roubo 


            qtdPolice = 3, -- quantidade de policia necessaria
            policeChance = 50, -- chance de acionar a policia durante o roubo
            policeText = 'Roubo a Registradora! Vá até o local e intercepte o assaltante!', -- Texto que ira aparecer aos policiais durante o roubo
            minigame = 'nptask', -- game para efetuar o roubo (Vazio para nenhum ou: nptask, skillbar, keymaster, pdsafe)

            robberyRequestItem = false, -- precisa de um item para roubar?
            robberyItem = {item = 'dourado', qtd = 10}, -- Item e quantidade caso robberyRequestItem = true
            robberyTime = 15, -- tempo para concluir o roubo e somente apos concluir da o payment
            robberyIndex = 'registradora', -- nome que sera levado em conta para o StandBy            
            robberyStandByType = 1, -- Tipo do StandBy (1 = individual, 2 = global (mesmo grupo de roubo))
            robberyStandByRobbery = 5, -- Tempo do StandBy entre roubos naquele roubo em especifico
            robberyCheckStandBy = true, -- Verificar se a pessoa esta procurada ou não para liberar ela roubar
            robberySetStandBy = false, -- Vai setar a pessoa como procurado ou não
            robberyStandByPerson = 30, -- tempo que a pessoa vai ficar procurada apos efetuar o roubo (não integrado com outros sistemas de procurado)

            paymentType = {
                money = false, -- vai dar dinheiro limpo ao efetuar o roubo?
                item = true -- vai dar item ao efetuar o roubo?
            },
            paymentMoney = { min = 100, max = 100}, -- caso money = true, qual valor de dinheiro limpo vai dar 
            paymentItemType = 2, -- caso item = true, qual tipo de entrega (1 = randomico, 2 = todos os itens)
            paymentItem = {
                {item = 'dinheirosujo', min = 1, max = 1},
            }
        },


        ['cartoes'] = {
            type = 'robbery', -- não alterar
            input = 'robbery', -- não alterar   
            -- Input configuration
            marker = { -- set custom marker if the type is marker
                id = 20, -- marker id = https://docs.fivem.net/docs/game-references/markers/
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

            blip = {
                name = 'xx', -- Name to display on the map!
                blipId = 1, -- blip id = https://docs.fivem.net/docs/game-references/blips/
                blipColor = 1, -- color id
                blipScale = 0.5, -- scale for blip
            }, 
            actionKey = 38,
            -- Map Configuration


            -- General Settings
            perm = "", -- permissao para iniciar o roubo 


            qtdPolice = 3, -- quantidade de policia necessaria
            policeChance = 50, -- chance de acionar a policia durante o roubo
            policeText = 'Roubo de Cartões! Vá até o local e intercepte o assaltante!', -- Texto que ira aparecer aos policiais durante o roubo
            minigame = 'nptask', -- game para efetuar o roubo (Vazio para nenhum ou: nptask, skillbar, keymaster, pdsafe)

            robberyRequestItem = false, -- precisa de um item para roubar?
            robberyItem = {item = 'dourado', qtd = 10}, -- Item e quantidade caso robberyRequestItem = true
            robberyTime = 15, -- tempo para concluir o roubo e somente apos concluir da o payment
            robberyIndex = 'cartoes', -- nome que sera levado em conta para o StandBy            
            robberyStandByType = 1, -- Tipo do StandBy (1 = individual, 2 = global (mesmo grupo de roubo))
            robberyStandByRobbery = 10, -- Tempo do StandBy entre roubos naquele roubo em especifico
            robberyCheckStandBy = true, -- Verificar se a pessoa esta procurada ou não para liberar ela roubar
            robberySetStandBy = false, -- Vai setar a pessoa como procurado ou não
            robberyStandByPerson = 30, -- tempo que a pessoa vai ficar procurada apos efetuar o roubo (não integrado com outros sistemas de procurado)

            paymentType = {
                money = false, -- vai dar dinheiro limpo ao efetuar o roubo?
                item = true -- vai dar item ao efetuar o roubo?
            },
            paymentMoney = { min = 100, max = 100}, -- caso money = true, qual valor de dinheiro limpo vai dar 
            paymentItemType = 2, -- caso item = true, qual tipo de entrega (1 = randomico, 2 = todos os itens)
            paymentItem = {
                {item = 'dinheirosujo', min = 1, max = 1}, -- COLOCAR PREÇO
            }
        },


        ['galinheiro'] = {
            type = 'robbery', -- não alterar
            input = 'robbery', -- não alterar   
            -- Input configuration
            marker = { -- set custom marker if the type is marker
                id = 20, -- marker id = https://docs.fivem.net/docs/game-references/markers/
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

            blip = {
                name = 'xx', -- Name to display on the map!
                blipId = 1, -- blip id = https://docs.fivem.net/docs/game-references/blips/
                blipColor = 1, -- color id
                blipScale = 0.5, -- scale for blip
            }, 
            actionKey = 38,
            -- Map Configuration

            -- General Settings
            perm = "", -- permissao para iniciar o roubo 


            qtdPolice = 8, -- quantidade de policia necessaria
            policeChance = 100, -- chance de acionar a policia durante o roubo
            policeText = 'Roubo ao Galinheiro! Vá até o local e intercepte os assaltantes!', -- Texto que ira aparecer aos policiais durante o roubo
            minigame = 'pdsafe', -- game para efetuar o roubo (Vazio para nenhum ou: nptask, skillbar, keymaster, pdsafe)

            robberyRequestItem = false, -- precisa de um item para roubar?
            robberyItem = {item = 'dourado', qtd = 10}, -- Item e quantidade caso robberyRequestItem = true
            robberyTime = 15, -- tempo para concluir o roubo e somente apos concluir da o payment
            robberyIndex = 'galinheiro', -- nome que sera levado em conta para o StandBy            
            robberyStandByType = 2, -- Tipo do StandBy (1 = individual, 2 = global (mesmo grupo de roubo))
            robberyStandByRobbery = 18000, -- Tempo do StandBy entre roubos naquele roubo em especifico
            robberyCheckStandBy = true, -- Verificar se a pessoa esta procurada ou não para liberar ela roubar
            robberySetStandBy = false, -- Vai setar a pessoa como procurado ou não
            robberyStandByPerson = 30, -- tempo que a pessoa vai ficar procurada apos efetuar o roubo (não integrado com outros sistemas de procurado)

            paymentType = {
                money = false, -- vai dar dinheiro limpo ao efetuar o roubo?
                item = true -- vai dar item ao efetuar o roubo?
            },
            paymentMoney = { min = 100, max = 100}, -- caso money = true, qual valor de dinheiro limpo vai dar 
            paymentItemType = 2, -- caso item = true, qual tipo de entrega (1 = randomico, 2 = todos os itens)
            paymentItem = {
                {item = 'dinheirosujo', min = 1, max = 1}, -- COLOCAR PREÇO
            }
        },

        ['paleto'] = {
            type = 'robbery', -- não alterar
            input = 'robbery', -- não alterar   
            -- Input configuration
            marker = { -- set custom marker if the type is marker
                id = 20, -- marker id = https://docs.fivem.net/docs/game-references/markers/
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

            blip = {
                name = 'xx', -- Name to display on the map!
                blipId = 1, -- blip id = https://docs.fivem.net/docs/game-references/blips/
                blipColor = 1, -- color id
                blipScale = 0.5, -- scale for blip
            }, 
            actionKey = 38,
            -- Map Configuration

            -- General Settings
            perm = "", -- permissao para iniciar o roubo 


            qtdPolice = 0, -- quantidade de policia necessaria
            policeChance = 100, -- chance de acionar a policia durante o roubo
            policeText = 'Roubo ao Banco de Paleto! Vá até o local e intercepte os assaltantes!', -- Texto que ira aparecer aos policiais durante o roubo
            minigame = 'pdsafe', -- game para efetuar o roubo (Vazio para nenhum ou: nptask, skillbar, keymaster, pdsafe)

            robberyRequestItem = false, -- precisa de um item para roubar?
            robberyItem = {item = 'dourado', qtd = 10}, -- Item e quantidade caso robberyRequestItem = true
            robberyTime = 15, -- tempo para concluir o roubo e somente apos concluir da o payment
            robberyIndex = 'paleto', -- nome que sera levado em conta para o StandBy            
            robberyStandByType = 2, -- Tipo do StandBy (1 = individual, 2 = global (mesmo grupo de roubo))
            robberyStandByRobbery = 43200, -- Tempo do StandBy entre roubos naquele roubo em especifico
            robberyCheckStandBy = true, -- Verificar se a pessoa esta procurada ou não para liberar ela roubar
            robberySetStandBy = false, -- Vai setar a pessoa como procurado ou não
            robberyStandByPerson = 30, -- tempo que a pessoa vai ficar procurada apos efetuar o roubo (não integrado com outros sistemas de procurado)

            paymentType = {
                money = false, -- vai dar dinheiro limpo ao efetuar o roubo?
                item = true -- vai dar item ao efetuar o roubo?
            },
            paymentMoney = { min = 100, max = 100}, -- caso money = true, qual valor de dinheiro limpo vai dar 
            paymentItemType = 2, -- caso item = true, qual tipo de entrega (1 = randomico, 2 = todos os itens)
            paymentItem = {
                {item = 'dinheirosujo', min = 1, max = 1}, -- COLOCAR PREÇO
            },  
        },

        ['roubo1'] = {
            type = 'robbery', -- não alterar
            input = 'robbery', -- não alterar   
            -- Input configuration
            marker = { -- set custom marker if the type is marker
                id = 20, -- marker id = https://docs.fivem.net/docs/game-references/markers/
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

            blip = {
                name = 'xx', -- Name to display on the map!
                blipId = 1, -- blip id = https://docs.fivem.net/docs/game-references/blips/
                blipColor = 1, -- color id
                blipScale = 0.5, -- scale for blip
            }, 
            actionKey = 38,
            -- Map Configuration

            -- General Settings
            perm = "", -- permissao para iniciar o roubo 


            qtdPolice = 0, -- quantidade de policia necessaria
            policeChance = 100, -- chance de acionar a policia durante o roubo
            policeText = 'Roubo ao Banco de Paleto! Vá até o local e intercepte os assaltantes!', -- Texto que ira aparecer aos policiais durante o roubo
            minigame = '', -- game para efetuar o roubo (Vazio para nenhum ou: nptask, skillbar, keymaster, pdsafe)

            robberyRequestItem = false, -- precisa de um item para roubar?
            robberyItem = {item = 'dourado', qtd = 10}, -- Item e quantidade caso robberyRequestItem = true
            robberyTime = 15, -- tempo para concluir o roubo e somente apos concluir da o payment
            robberyIndex = 'roubosyncado', -- nome que sera levado em conta para o StandBy            
            robberyStandByType = 2, -- Tipo do StandBy (1 = individual, 2 = global (mesmo grupo de roubo))
            robberyStandByRobbery = 43200, -- Tempo do StandBy entre roubos naquele roubo em especifico
            robberyCheckStandBy = true, -- Verificar se a pessoa esta procurada ou não para liberar ela roubar
            robberySetStandBy = false, -- Vai setar a pessoa como procurado ou não
            robberyStandByPerson = 30, -- tempo que a pessoa vai ficar procurada apos efetuar o roubo (não integrado com outros sistemas de procurado)

            paymentType = {
                money = false, -- vai dar dinheiro limpo ao efetuar o roubo?
                item = true -- vai dar item ao efetuar o roubo?
            },
            paymentMoney = { min = 100, max = 100}, -- caso money = true, qual valor de dinheiro limpo vai dar 
            paymentItemType = 2, -- caso item = true, qual tipo de entrega (1 = randomico, 2 = todos os itens)
            paymentItem = {
                {item = 'dinheirosujo', min = 1, max = 1}, -- COLOCAR PREÇO
            },  
        },

        ['roubo2'] = {
            type = 'robbery', -- não alterar
            input = 'robbery', -- não alterar   
            -- Input configuration
            marker = { -- set custom marker if the type is marker
                id = 20, -- marker id = https://docs.fivem.net/docs/game-references/markers/
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

            blip = {
                name = 'xx', -- Name to display on the map!
                blipId = 1, -- blip id = https://docs.fivem.net/docs/game-references/blips/
                blipColor = 1, -- color id
                blipScale = 0.5, -- scale for blip
            }, 
            actionKey = 38,
            -- Map Configuration

            -- General Settings
            perm = "", -- permissao para iniciar o roubo 


            qtdPolice = 0, -- quantidade de policia necessaria
            policeChance = 100, -- chance de acionar a policia durante o roubo
            policeText = 'Roubo ao Banco de Paleto! Vá até o local e intercepte os assaltantes!', -- Texto que ira aparecer aos policiais durante o roubo
            minigame = '', -- game para efetuar o roubo (Vazio para nenhum ou: nptask, skillbar, keymaster, pdsafe)

            robberyRequestItem = false, -- precisa de um item para roubar?
            robberyItem = {item = 'dourado', qtd = 10}, -- Item e quantidade caso robberyRequestItem = true
            robberyTime = 15, -- tempo para concluir o roubo e somente apos concluir da o payment
            robberyIndex = 'roubosyncado', -- nome que sera levado em conta para o StandBy            
            robberyStandByType = 2, -- Tipo do StandBy (1 = individual, 2 = global (mesmo grupo de roubo))
            robberyStandByRobbery = 43200, -- Tempo do StandBy entre roubos naquele roubo em especifico
            robberyCheckStandBy = true, -- Verificar se a pessoa esta procurada ou não para liberar ela roubar
            robberySetStandBy = false, -- Vai setar a pessoa como procurado ou não
            robberyStandByPerson = 30, -- tempo que a pessoa vai ficar procurada apos efetuar o roubo (não integrado com outros sistemas de procurado)

            paymentType = {
                money = false, -- vai dar dinheiro limpo ao efetuar o roubo?
                item = true -- vai dar item ao efetuar o roubo?
            },
            paymentMoney = { min = 100, max = 100}, -- caso money = true, qual valor de dinheiro limpo vai dar 
            paymentItemType = 2, -- caso item = true, qual tipo de entrega (1 = randomico, 2 = todos os itens)
            paymentItem = {
                {item = 'dinheirosujo', min = 1, max = 1}, -- COLOCAR PREÇO
            },  
        },
    },



 locs = {

       -- {showBlip = true, coord = vector3(0.0,0.0,0.0), heading = 0.0, config = 'configRobberyAtm', id = 1},  -- NAO TIRAR NEM MEXER
       -- {showBlip = true, coord = vector3(0.0,0.0,0.0), heading = 0.0, config = 'configRobberyAtm', id = 2},  -- NAO TIRAR NEM MEXER

        {showBlip = true, coord = vector3(157.92483520508,-980.85034179688,30.09143447876), heading = 3.6, config = 'roubo1', id = 3},
        {showBlip = true, coord = vector3(166.21076965332,-986.7470703125,30.091930389404), heading = 87.8, config = 'roubo2', id = 4},
        {showBlip = true, coord = vector3(1159.5458984375,-314.08810424805,69.20516204834), heading = 106.1, config = 'departamento', id = 5},
        {showBlip = true, coord = vector3(-709.76385498047,-904.10394287109,19.215585708618), heading = 84.0, config = 'departamento', id = 6},
        {showBlip = true, coord = vector3(-43.504806518555,-1748.4359130859,29.421016693115), heading = 49.7, config = 'departamento', id = 7},
        {showBlip = true, coord = vector3(378.13977050781,333.36053466797,103.56635284424), heading = 341.5, config = 'departamento', id = 8},
        {showBlip = true, coord = vector3(-3250.0234375,1004.4215698242,12.830704689026), heading = 86.4, config = 'departamento', id = 9},
        {showBlip = true, coord = vector3(1734.8670654297,6420.8017578125,35.037220001221), heading = 320.3, config = 'departamento', id = 10},
        {showBlip = true, coord = vector3(546.41076660156,2662.8103027344,42.156505584717), heading = 183.1, config = 'departamento', id = 11},
        {showBlip = true, coord = vector3(1959.3227539063,3748.9074707031,32.343746185303), heading = 31.4, config = 'departamento', id = 12},
        {showBlip = true, coord = vector3(2672.7563476563,3286.58203125,55.241138458252), heading = 60.1, config = 'departamento', id = 12},
        {showBlip = true, coord = vector3(1708.0015869141,4920.3837890625,42.063682556152), heading = 331.5, config = 'departamento', id = 14},
        {showBlip = true, coord = vector3(-1829.1619873047,798.74835205078,138.19090270996), heading = 133.8, config = 'departamento', id = 15},
        {showBlip = true, coord = vector3(-2963.3159179688,391.91119384766,15.043312072754), heading = 356.0, config = 'departamento', id = 16},
        {showBlip = true, coord = vector3(-3047.84765625,585.43621826172,7.9089298248291), heading = 117.0, config = 'departamento', id = 17},
        {showBlip = true, coord = vector3(1131.1545410156,-984.18280029297,46.415843963623), heading = 195.0, config = 'departamento', id = 18},
        {showBlip = true, coord = vector3(1164.61328125,2713.4731445313,38.157707214355), heading = 79.3, config = 'departamento', id = 19},
        {showBlip = true, coord = vector3(-1484.9324951172,-374.97549438477,40.163520812988), heading = 57.1, config = 'departamento', id = 20},
        {showBlip = true, coord = vector3(-1219.3806152344,-909.99566650391,12.326356887817), heading = 305.5, config = 'departamento', id = 21}

        
    },

})