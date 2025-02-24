Nfw.registerConfig({
    config = {
        ['creatorConfig'] = {
            characterRequire = {
                name = true, 
                nameMinCharacter = 1,
                midName = true, 
                midNameMinCharacter = 1,
                lastName = true,
                lastNameMinCharacter = 1,
                ageMin = 18, 
                ageMax = 100
            },
            spawnPedCoord = vec4(403.00,-996.37,-99.91,180),
            spawnPedCamCoord = vec4(403.00,-996.87,-98.25,180),
            spawnPedCamCoordRotate = vec3(0,0,0),
            startMoney = 10000,
            startBankMoney = 10000,
            pedBasicClothes = {
                [1885233650] = { -- mp_m_freemode_01
                    [1] = { -1,0 },
                    [3] = { 15,0 },
                    [4] = { 61,0 },
                    [5] = { -1,0 },
                    [6] = { 16,0 },
                    [7] = { -1,0 },
                    [8] = { 15,0 },
                    [10] = { -1,0 },
                    [11] = { 104,0 },
                    ['p2'] = { -1, 0 },
                    ['p6'] = { -1, 0 }, 
                    ['p7'] = { -1, 0 },
                },
                [-1667301416] = { -- mp_f_freemode_01
                    [1] = { -1,0 },
                    [3] = { 15,0 },
                    [4] = { 15,0 },
                    [5] = { -1,0 },
                    [6] = { 5,0 },
                    [7] = { -1,0 },
                    [8] = { 7,0 },
                    [9] = { -1,0 },
                    [10] = { -1,0 },
                    [11] = { 5,0 },
                    ['p2'] = { -1, 0 },
                    ['p6'] = { -1, 0 }, 
                    ['p7'] = { -1, 0 },
                }
            }
        }
    }
})