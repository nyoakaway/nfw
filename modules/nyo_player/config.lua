Nfw.registerConfig({
    config = {
        ['playerGeneralConfig'] = { -- Salario
            handCuffedPerm = 'algemar.permissao', -- permissao para algemar 
            holdPerm = 'segurar.permissao', -- permissao para segurar 
            rmascaraPerm = 'admin.permissao', -- permissao /rmascara
            rchapeuPerm = 'admin.permissao', -- permissao /rchapeu
            policiaPerm = 'admin.permissao',
            hospitalPerm = 'hospital.permissao',

            multa = {  -- config de multa
                bonuspolicia = true,
                valuebonus = math.random(90,150)
            },

            detido = {  -- config de detido
                bonuspolicia = true,
                valuebonus = math.random(90,150)
            },

            prender = {  -- config de prender
                bonuspolicia = true,
                valuebonus = math.random(90,150),
                mesesdiminuir = 20,
                diminuircaixa = 2
            },

            wage = {  -- config de Salario

                ['policia'] = {
                    name = 'Policia',
                    requireService = 'Policia',
                    requirePerm = 'policia.permissao',
                    requireVipAccount = '',
                    requireVipCharacter = '',
                    time = 30, 
                    value = 3000
                },

                ['admin'] = {
                    name = 'Admin',
                    requireService = '',
                    requirePerm = 'admin.permissao',
                    requireVipAccount = '',
                    requireVipCharacter = '',
                    time = 30, 
                    value = 1500
                },
            }
        },

        ['PLAYER_COMMAND_'] = {
            enabled = true,
            command = '',
            perm = '',
            sendLog = true
        },

    },
})