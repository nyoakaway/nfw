Nfw.registerConfig({
    config = {
        ['nomequalquer'] = {
            type = 'barberShop', -- não alterar
            input = 'barberShop', -- não alterar
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
                    name = 'barbershop'
                }
            },
            actionKey = 38,
            -- Map Configuration
            blip = {
                name = 'Cabelereiro', -- Name to display on the map!
                blipId = 71, -- blip id = https://docs.fivem.net/docs/game-references/blips/
                blipColor = 4, -- color id
                blipScale = 0.5, -- scale for blip
            },  

            -- General Settings
            perm = "", -- permissão para acessar o blip
            hidePlayers = true,
            
        }
    },

    locs = {

    }
})