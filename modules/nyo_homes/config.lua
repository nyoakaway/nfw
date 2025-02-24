Nfw.registerConfig({
    config = {
        ['homesInteriorConfig'] = {
            ['interior1'] = {
                name = '',
                price = 10000,
                doorEnter = vec4(-348.99, 877.67, 2195.21, 357.17),
                vault = vec3(-351.44, 887.79, 2195.21),
                wardrobe = vec4(-352.65, 879.15, 2195.19, 272.13)
            },
        },
      
        ['homeConfig'] = {
            type = 'home', -- não alterar
            input = 'home', -- não alterar
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
                name = 'Home', -- Name to display on the map!
                blipId = 73, -- blip id = https://docs.fivem.net/docs/game-references/blips/
                blipColor = 13, -- color id
                blipScale = 0.5, -- scale for blip
            },  

            -- General Settings
            perm = "", -- permissao para acessar o blip  
            homeConfig = {
                type = 'house',
                interior = 'interior1',
                price = 100000,                
                taxType = 1, 
                taxTime = 15, 
                taxPrice = 0.10, 
                initMaxHab = 2, 
                initVault = 100
            } 
        },
    },

    locs = {
        { showBlip = false, coord = vector3(21.05, -879.77, 30.24), heading = 359.29, config = 'homeConfig', id = 1 },
    }
})
-- vec3(21.05, -879.77, 30.24)

-- p1
-- vec4(-348.99, 877.67, 2195.21, 357.17)

-- e
-- vec4(-536.8, 477.32, 103.18, 76.54)