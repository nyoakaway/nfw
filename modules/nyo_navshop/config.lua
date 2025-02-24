Nfw.registerConfig({
    config = {
        ['generalConfigNavShop'] = {
            illegalMoneyItem = 'dinheirosujo',
        },
        ['configNavShop1'] = {
            type = 'navShop', -- não alterar
            input = 'navShop', -- não alterar
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
                name = 'Central | Pescador (VENDA)', -- Name to display on the map!
                blipId = 73, -- blip id = https://docs.fivem.net/docs/game-references/blips/
                blipColor = 13, -- color id
                blipScale = 0.5, -- scale for blip
            },  

            -- General Settings
            perm = "", -- permissao para acessar o blip               
            shopConfig = {             
               { type = 'buy', index = 'isca', name = 'Isca 1x', typeMoney = 'legal', price = 50, qtd = 1, paymentType = 1 },
               { type = 'buy', index = 'isca', name = 'Isca 10x', typeMoney = 'legal', price = 500, qtd = 10, paymentType = 1 },
            --    { type = 'sell', index = 'dourado', name = 'Dourado', typeMoney = 'ilegal', price = 50 },
            --    { type = 'sell', index = 'corvina', name = 'Corvina', typeMoney = 'legal', price = 100, paymentType = 1 },
            }
        },
        ['configNavShop2'] = {
            type = 'navShop', -- não alterar
            input = 'navShop', -- não alterar
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
                name = 'Central | Pescador (VENDA)', -- Name to display on the map!
                blipId = 73, -- blip id = https://docs.fivem.net/docs/game-references/blips/
                blipColor = 13, -- color id
                blipScale = 0.5, -- scale for blip
            },  

            -- General Settings
            perm = "", -- permissao para acessar o blip               
            shopConfig = {             
               { type = 'buy', index = 'isca', name = 'Isca 1x', typeMoney = 'legal', price = 50, qtd = 1, paymentType = 1 },
               { type = 'buy', index = 'isca', name = 'Isca 10x', typeMoney = 'ilegal', price = 500, qtd = 10 },
               { type = 'sell', index = 'dourado', name = 'Dourado', typeMoney = 'ilegal', price = 50 },
               { type = 'sell', index = 'corvina', name = 'Corvina', typeMoney = 'legal', price = 100, paymentType = 1 },
            }
        },
    },

    locs = {
        {showBlip = true, coord = vector3(99.136856079102,-1393.2055664062,29.300785064697), heading = 359.29, config = 'configNavShop1'},
        {showBlip = true, coord = vector3(101.0046, -1394.575, 29.29038), heading = 359.29, config = 'configNavShop2'},
    }
})