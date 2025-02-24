Nfw.registerConfig({
    config = {
        ['configDoors'] = {
            type = 'doorGates', -- não alterar
            input = 'doorgate', -- não alterar
            -- Input configuration
            -- marker = { -- set custom marker if the type is marker
            --     id = 27, -- marker id = https://docs.fivem.net/docs/game-references/markers/
            --     color = {0,255,0,75}, -- marker color (R,G,B,A)
            --     scale = {1.0, 1.0, 1.0},
            --     rotacao = {0.0, 180.0, 130.0}, -- marker Rotation (x,y,z)
            --     bobUpAndDown = false, -- marker bopUpAndDown
            --     faceCamera = false, -- marker faceCamera
            --     rotation = true, -- marker rotation
            --     custom = { -- Custom Marker
            --         active = false,
            --         dict = '',
            --         name = ''
            --     }
            -- },
            text3d = true,
            actionKey = 38,
            -- Map Configuration
            blip = {
                name = 'Porta', -- Name to display on the map!
                blipId = 1, -- blip id = https://docs.fivem.net/docs/game-references/blips/
                blipColor = 1, -- color id
                blipScale = 0.5, -- scale for blip
            },  

            -- General Settings
            perm = {"policia.permissao", "admin.permissao"}, -- permissão para acessar a porta (vazio = todo mundo)

            dataOpen = {
                enableAction = true,
                animDict = 'veh@mower@base',
                anim = 'start_engine',
                animDictVehicle = '',
                animVehicle = '',

                miniGame = '', -- miniGame para abrir a porta ou vazio para keypress

                requestItem = true, 
                removeItem = false, 
                item = {index = 'bomba', qtd = 1},

                openTime = 5, -- segundos para destrancar a porta
            },

            dataClose = {
                enableAction = true,
                animDict = 'veh@mower@base',
                anim = 'start_engine',
                animDictVehicle = '',
                animVehicle = '',

                miniGame = '', -- miniGame para fechar a porta ou vazio para keypress

                requestItem = true, 
                removeItem = false, 
                item = {index = 'bomba', qtd = 1},

                openTime = 5, -- segundos para trancar a porta
            },
            

            autoClose = false, -- (true para trancar automaticamente, false para não trancar automaticamente)
            autoCloseTime = 6, -- tempo em minutos para se auto trancar
        },
    },

    locs = {
        {showBlip = false, coord = vector3(434.71,-982.60,30.71), heading = 359.29, config = 'configDoors', hash = '320433149', group = 'police', drawText = true, lock = true, distance = 2, id = "D1"},
        {showBlip = false, coord = vector3(434.76,-981.30,30.70), heading = 359.29, config = 'configDoors', hash = '-1215222675', group = 'police', drawText = false, lock = true, distance = 2, id = "D2"},
        {showBlip = false, coord = vector3(452.30,-1001.30,25.70), heading = 359.29, config = 'configDoors', hash = '-190780785', group = '', drawText = true, lock = true, distance = 10, id = "D3"},
        {showBlip = false, coord = vector3(476.59545898438,-3115.9948730469,6.0700535774231), heading = 359.29, config = 'configDoors', hash = '1286392437', group = '', drawText = true, lock = true, distance = 15, id = "D4"},
    }
})