Nfw.registerConfig({
    config = {
        ['homeWardrobeConfig'] = {
            type = 'chest', -- não alterar
            input = 'chest', -- não alterar
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
                name = 'Chest', -- Name to display on the map!
                blipId = 1, -- blip id = https://docs.fivem.net/docs/game-references/blips/
                blipColor = 1, -- color id
                blipScale = 0.5, -- scale for blip
            },  

            -- General Settings
            perm = "",        
        },
    },

    locs = {

    }
})