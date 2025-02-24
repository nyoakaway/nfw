Nfw.registerConfig({
    config = {
        ['skinShopGeneralConfig'] = {
            commands = {
                ['mascara'] = {
                    prefix = 'mascara',
                    id = '1',
                    perm = '',
                    item = '',
                    clothWithDraw = {
                        id = 0, 
                        color = 0
                    },
                    anim = {
                        use = {
                            active = true, 
                            dict = 'misscommon@van_put_on_masks', 
                            anim = 'put_on_mask_ps',
                            time = 1500
                        },
                        withdraw = {
                            active = true, 
                            dict = 'missfbi4', 
                            anim = 'takeoff_mask',
                            time = 1100
                        }                        
                    }
                },

                ['maos'] = {
                    prefix = 'maos',
                    id = '3',
                    perm = '',
                    item = '',
                    clothWithDraw = {
                        id = 15, 
                        color = 0
                    },
                    anim = {
                        use = {
                            active = true, 
                            dict = 'clothingshirt', 
                            anim = 'try_shirt_positive_d',
                            time = 2500
                        },
                        withdraw = {
                            active = true, 
                            dict = 'clothingshirt', 
                            anim = 'try_shirt_positive_d',
                            time = 2500
                        }                        
                    }
                },

                ['calca'] = {
                    prefix = 'calca',
                    id = '4',
                    perm = '',
                    item = '',
                    clothWithDraw = {
                        id = 18, 
                        color = 0
                    },
                    anim = {
                        use = {
                            active = true, 
                            dict = 'clothingshirt', 
                            anim = 'try_shirt_positive_d',
                            time = 2500
                        },
                        withdraw = {
                            active = true, 
                            dict = 'clothingshirt', 
                            anim = 'try_shirt_positive_d',
                            time = 2500
                        }                        
                    }
                },

                ['sapatos'] = {
                    prefix = 'sapatos',
                    id = '6',
                    perm = '',
                    item = '',
                    clothWithDraw = {
                        id = 34, 
                        color = 0
                    },
                    anim = {
                        use = {
                            active = true, 
                            dict = 'clothingshoes', 
                            anim = 'try_shoes_positive_d',
                            time = 2700
                        },
                        withdraw = {
                            active = true, 
                            dict = 'clothingshoes', 
                            anim = 'try_shoes_positive_d',
                            time = 2700
                        }                        
                    }
                },

                ['acessorios'] = {
                    prefix = 'acessorios',
                    id = '7',
                    perm = '',
                    item = '',
                    clothWithDraw = {
                        id = 0, 
                        color = 0
                    },
                    anim = {
                        use = {
                            active = false, 
                            dict = '', 
                            anim = '',
                            time = 2500
                        },
                        withdraw = {
                            active = false, 
                            dict = '', 
                            anim = '',
                            time = 2500
                        }                        
                    }
                },

                ['blusa'] = {
                    prefix = 'blusa',
                    id = '8',
                    perm = '',
                    item = '',
                    clothWithDraw = {
                        id = 15, 
                        color = 0
                    },
                    anim = {
                        use = {
                            active = true, 
                            dict = 'clothingshirt', 
                            anim = 'try_shirt_positive_d',
                            time = 2500
                        },
                        withdraw = {
                            active = true, 
                            dict = 'clothingshirt', 
                            anim = 'try_shirt_positive_d',
                            time = 2500
                        }                        
                    }
                },

                ['colete'] = {
                    prefix = 'colete',
                    id = '9',
                    perm = '',
                    item = '',
                    clothWithDraw = {
                        id = 0, 
                        color = 0
                    },
                    anim = {
                        use = {
                            active = true, 
                            dict = 'clothingshirt', 
                            anim = 'try_shirt_positive_d',
                            time = 2500
                        },
                        withdraw = {
                            active = true, 
                            dict = 'clothingshirt', 
                            anim = 'try_shirt_positive_d',
                            time = 2500
                        }                        
                    }
                },

                ['jaqueta'] = {
                    prefix = 'jaqueta',
                    id = '11',
                    perm = '',
                    item = '',
                    clothWithDraw = {
                        id = 15, 
                        color = 0
                    },
                    anim = {
                        use = {
                            active = true, 
                            dict = 'clothingshirt', 
                            anim = 'try_shirt_positive_d',
                            time = 2500
                        },
                        withdraw = {
                            active = true, 
                            dict = 'clothingshirt', 
                            anim = 'try_shirt_positive_d',
                            time = 2500
                        }                        
                    }
                },

                ['chapeu'] = {
                    prefix = 'chapeu',
                    id = 'p0',
                    perm = '',
                    item = '',
                    anim = {
                        use = {
                            active = true, 
                            dict = 'veh@common@fp_helmet@', 
                            anim = 'put_on_helmet',
                            time = 1700
                        },
                        withdraw = {
                            active = true, 
                            dict = 'veh@common@fp_helmet@', 
                            anim = 'take_off_helmet_stand',
                            time = 700
                        }
                    }
                },

                ['oculos'] = {
                    prefix = 'oculos',
                    id = 'p1',
                    perm = '',
                    item = '',
                    anim = {
                        use = {
                            active = true, 
                            dict = 'misscommon@van_put_on_masks', 
                            anim = 'put_on_mask_ps',
                            time = 800
                        },
                        withdraw = {
                            active = true, 
                            dict = 'mini@ears_defenders', 
                            anim = 'takeoff_earsdefenders_idle',
                            time = 500
                        }
                    }
                },
            }
            
        },
        ['configSkinShopAll'] = {
            type = 'skinShop', -- não alterar
            input = 'skinshop', -- não alterar
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
                    name = 'skinshop'
                }
            },
            actionKey = 38,
            -- Map Configuration
            blip = {
                name = 'Loja de Roupas', -- Name to display on the map!
                blipId = 73, -- blip id = https://docs.fivem.net/docs/game-references/blips/
                blipColor = 13, -- color id
                blipScale = 0.5, -- scale for blip
            },  

            -- General Settings
            perm = "", -- permissao para acessar o blip
            shopType = "all", -- all (show all clouth), exclusive (displays only the set clothes), exclude (excludes set clothing)
            hidePlayers = true,
            shopConfig = {
                [1] = {price = 500, item = {Male = {}, Female = {}}}, -- mascara
                [3] = {price = 500, item = {Male = {}, Female = {}}}, -- maos
                [4] = {price = 500, item = {Male = {}, Female = {}}}, -- calca
                [5] = {price = 500, item = {Male = {}, Female = {}}}, -- mochila
                [6] = {price = 500, item = {Male = {}, Female = {}}}, -- sapato
                [7] = {price = 500, item = {Male = {}, Female = {}}}, -- gravata
                [8] = {price = 500, item = {Male = {}, Female = {}}}, -- camisa
                [9] = {price = 500, item = {Male = {}, Female = {}}}, -- colete
                [10] = {price = 500, item = {Male = {}, Female = {}}}, -- decals (adesivos)
                [11] = {price = 500, item = {Male = {}, Female = {}}}, -- jaqueta
                ['p0'] = {price = 500, item = {Male = {}, Female = {}}}, -- bone/chapeu
                ['p1'] = {price = 500, item = {Male = {}, Female = {}}}, -- oculos
                ['p2'] = {price = 500, item = {Male = {}, Female = {}}}, -- brinco
                ['p6'] = {price = 500, item = {Male = {}, Female = {}}}, -- relogio
                ['p7'] = {price = 500, item = {Male = {}, Female = {}}}, -- bracelete
            }    
        },

        ['configSkinShopExlude'] = {
            type = 'skinShop', -- não alterar
            input = 'skinshop', -- não alterar
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
                    name = 'skinshop'
                }
            },
            actionKey = 38,
            -- Map Configuration
            blip = {
                name = 'Loja de Roupas', -- Name to display on the map!
                blipId = 73, -- blip id = https://docs.fivem.net/docs/game-references/blips/
                blipColor = 13, -- color id
                blipScale = 0.5, -- scale for blip
            },  

            -- General Settings
            perm = "", -- permissao para acessar o blip
            shopType = "exclude", -- all (show all clouth), exclusive (displays only the set clothes), exclude (excludes set clothing)
            hidePlayers = true,
            shopConfig = {
                [1] = {price = 500, item = {Male = {1,2,3,4,5,6,7,8,9,10}, Female = {}}}, -- mascara
                [3] = {price = 500, item = {Male = {}, Female = {}}}, -- maos
                [4] = {price = 500, item = {Male = {}, Female = {}}}, -- calca
                [5] = {price = 500, item = {Male = {}, Female = {}}}, -- mochila
                [6] = {price = 500, item = {Male = {}, Female = {}}}, -- sapato
                [7] = {price = 500, item = {Male = {}, Female = {}}}, -- gravata
                [8] = {price = 500, item = {Male = {}, Female = {}}}, -- camisa
                [9] = {price = 500, item = {Male = {}, Female = {}}}, -- colete
                [10] = {price = 500, item = {Male = {}, Female = {}}}, -- decals (adesivos)
                [11] = {price = 500, item = {Male = {}, Female = {}}}, -- jaqueta
                ['p0'] = {price = 500, item = {Male = {}, Female = {}}}, -- bone/chapeu
                ['p1'] = {price = 500, item = {Male = {}, Female = {}}}, -- oculos
                ['p2'] = {price = 500, item = {Male = {}, Female = {}}}, -- brinco
                ['p6'] = {price = 500, item = {Male = {}, Female = {}}}, -- relogio
                ['p7'] = {price = 500, item = {Male = {}, Female = {}}}, -- bracelete
            }    
        },

        ['configSkinShopExclusive'] = {
            type = 'skinShop', -- não alterar
            input = 'skinshop', -- não alterar
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
                    name = 'skinshop'
                }
            },
            actionKey = 38,
            -- Map Configuration
            blip = {
                name = 'Loja de Roupas', -- Name to display on the map!
                blipId = 73, -- blip id = https://docs.fivem.net/docs/game-references/blips/
                blipColor = 13, -- color id
                blipScale = 0.5, -- scale for blip
            },  

            -- General Settings
            perm = "", -- permissao para acessar o blip
            shopType = "exclusive", -- all (show all clouth), exclusive (displays only the set clothes), exclude (excludes set clothing)
            hidePlayers = true,
            shopConfig = {
                [1] = {price = 500, item = {Male = {1,2,3,4,5,6,7,8,9,10}, Female = {}}}, -- mascara
                [3] = {price = 500, item = {Male = {}, Female = {}}}, -- maos
                [4] = {price = 500, item = {Male = {}, Female = {}}}, -- calca
                [5] = {price = 500, item = {Male = {}, Female = {}}}, -- mochila
                [6] = {price = 500, item = {Male = {}, Female = {}}}, -- sapato
                [7] = {price = 500, item = {Male = {}, Female = {}}}, -- gravata
                [8] = {price = 500, item = {Male = {}, Female = {}}}, -- camisa
                [9] = {price = 500, item = {Male = {}, Female = {}}}, -- colete
                [10] = {price = 500, item = {Male = {}, Female = {}}}, -- decals (adesivos)
                [11] = {price = 500, item = {Male = {}, Female = {}}}, -- jaqueta
                ['p0'] = {price = 500, item = {Male = {}, Female = {}}}, -- bone/chapeu
                ['p1'] = {price = 500, item = {Male = {}, Female = {}}}, -- oculos
                ['p2'] = {price = 500, item = {Male = {}, Female = {}}}, -- brinco
                ['p6'] = {price = 500, item = {Male = {}, Female = {}}}, -- relogio
                ['p7'] = {price = 500, item = {Male = {}, Female = {}}}, -- bracelete
            }    
        },

        ['configSkinShopPerm'] = {
            type = 'skinShop', -- não alterar
            input = 'skinshop', -- não alterar
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
                    name = 'skinshop'
                }
            },
            actionKey = 38,
            -- Map Configuration
            blip = {
                name = 'Loja de Roupas', -- Name to display on the map!
                blipId = 73, -- blip id = https://docs.fivem.net/docs/game-references/blips/
                blipColor = 13, -- color id
                blipScale = 0.5, -- scale for blip
            },  

            -- General Settings
            perm = "policia.permissao", -- permissao para acessar o blip
            shopType = "all", -- all (show all clouth), exclusive (displays only the set clothes), exclude (excludes set clothing)
            hidePlayers = true,
            shopConfig = {
                [1] = {price = 500, item = {Male = {}, Female = {}}}, -- mascara
                [3] = {price = 500, item = {Male = {}, Female = {}}}, -- maos
                [4] = {price = 500, item = {Male = {}, Female = {}}}, -- calca
                [5] = {price = 500, item = {Male = {}, Female = {}}}, -- mochila
                [6] = {price = 500, item = {Male = {}, Female = {}}}, -- sapato
                [7] = {price = 500, item = {Male = {}, Female = {}}}, -- gravata
                [8] = {price = 500, item = {Male = {}, Female = {}}}, -- camisa
                [9] = {price = 500, item = {Male = {}, Female = {}}}, -- colete
                [10] = {price = 500, item = {Male = {}, Female = {}}}, -- decals (adesivos)
                [11] = {price = 500, item = {Male = {}, Female = {}}}, -- jaqueta
                ['p0'] = {price = 500, item = {Male = {}, Female = {}}}, -- bone/chapeu
                ['p1'] = {price = 500, item = {Male = {}, Female = {}}}, -- oculos
                ['p2'] = {price = 500, item = {Male = {}, Female = {}}}, -- brinco
                ['p6'] = {price = 500, item = {Male = {}, Female = {}}}, -- relogio
                ['p7'] = {price = 500, item = {Male = {}, Female = {}}}, -- bracelete
            }    
        },
    },

    locs = {
        -- Loja de Roupa 1
        {showBlip = true, coord = vector3(70.87,-1399.49,29.39), heading = 359.29, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(72.41,-1399.49,29.39), heading = 356.65, config = 'configSkinShopExlude'},
        {showBlip = false, coord = vector3(73.85,-1399.49,29.39), heading = 3.41, config = 'configSkinShopExclusive'},
        {showBlip = false, coord = vector3(75.37,-1399.49,29.39), heading = 0.1, config = 'configSkinShopPerm'},

        -- Loja de Roupa 2
        {showBlip = true, coord = vector3(430.1,-799.67,29.52), heading = 177.1, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(428.62,-799.67,29.52), heading = 173.11, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(427.06,-799.67,29.52), heading = 192.52, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(425.62,-799.67,29.52), heading = 181.76, config = 'configSkinShopAll'},

        -- Loja de Roupa 3
        {showBlip = true, coord = vector3(128.63,-220.14,54.56), heading = 115.46, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(129.23,-218.53,54.56), heading = 107.44, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(129.94,-216.27,54.56), heading = 128.95, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(130.7,-214.05,54.56), heading = 95.77, config = 'configSkinShopAll'},

        -- Loja de Roupa 4
        {showBlip = true, coord = vector3(-165.9,-310.94,39.74), heading = 248.85, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(-165.6,-309.52,39.74), heading = 251.32, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(-165.09,-308.15,39.74), heading = 213.57, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(-164.74,-306.74,39.74), heading = 286.29, config = 'configSkinShopAll'},

        -- Loja de Roupa 5
        {showBlip = true, coord = vector3(-830.4,-1072.88,11.33), heading = 292.33, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(-829.63,-1074.25,11.33), heading = 311.26, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(-828.85,-1075.51,11.33), heading = 304.74, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(-828.07,-1076.79,11.33), heading = 312.29, config = 'configSkinShopAll'},

        -- Loja de Roupa 6
        {showBlip = true, coord = vector3(-714.24,-145.74,37.42), heading = 141.83, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(-713.1,-147.37,37.42), heading = 130.49, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(-712.46,-148.6,37.42), heading = 80.07, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(-711.74,-149.56,37.42), heading = 178.12, config = 'configSkinShopAll'},

        -- Loja de Roupa 7
        {showBlip = true, coord = vector3(-1198.0,-769.28,17.32), heading = 222.52, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(-1199.6,-770.57,17.32), heading = 217.49, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(-1201.26,-771.96,17.32), heading = 179.08, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(-1202.65,-773.12,17.32), heading = 214.11, config = 'configSkinShopAll'},

        -- Loja de Roupa 8
        {showBlip = true, coord = vector3(-1448.24,-235.21,49.82), heading = 95.97, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(-1446.95,-233.58,49.82), heading = 10.74, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(-1445.87,-232.37,49.82), heading = 56.05, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(-1444.85,-231.29,49.82), heading = 50.59, config = 'configSkinShopAll'},

        -- Loja de Roupa 9
        {showBlip = true, coord = vector3(-3167.29,1047.19,20.87), heading = 84.66, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(-3166.22,1049.4,20.87), heading = 95.4, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(-3165.14,1051.79,20.87), heading = 74.04, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(-3164.5,1053.44,20.87), heading = 66.15, config = 'configSkinShopAll'},

        -- Loja de Roupa 10
        {showBlip = true, coord = vector3(-1109.44,2709.55,19.11), heading = 311.52, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(-1108.37,2708.43,19.11), heading = 314.75, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(-1107.43,2707.32,19.11), heading = 307.39, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(-1106.33,2706.17,19.11), heading = 325.3, config = 'configSkinShopAll'},

        -- Loja de Roupa 11
        {showBlip = true, coord = vector3(612.87,2758.49,42.09), heading = 292.48, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(613.12,2756.56,42.09), heading = 283.19, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(613.13,2753.29,42.09), heading = 264.95, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(613.26,2751.39,42.09), heading = 280.25, config = 'configSkinShopAll'},

        -- Loja de Roupa 12
        {showBlip = true, coord = vector3(1190.08,2714.76,38.23), heading = 267.87, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(1190.18,2713.24,38.23), heading = 276.04, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(1190.09, 2711.73,38.23), heading = 280.45, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(1190.07,2710.23,38.23), heading = 283.45, config = 'configSkinShopAll'},

        -- Loja de Roupa 13
        {showBlip = true, coord = vector3(1697.49,4829.94,42.07), heading = 179.54, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(1695.95,4829.75,42.07), heading = 201.35, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(1694.54,4829.57,42.07), heading = 186.38, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(1693.04,4829.35,42.07), heading = 190.91, config = 'configSkinShopAll'},

        -- Loja de Roupa 14
        {showBlip = true, coord = vector3(12.7,6513.6,31.878), heading = 134.57, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(11.7,6514.76,31.878), heading = 134.28, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(10.74,6515.8,31.878), heading = 138.6, config = 'configSkinShopAll'},
        {showBlip = false, coord = vector3(9.66,6516.88,31.878), heading = 150.98, config = 'configSkinShopAll'},

        {showBlip = false, coord = vector3(-1511.7705078125,-3014.4389648438,-80.242195129395), heading = 355.70, config = 'configSkinShopAll'}
    },

    commands = {
        {showBlip = true, coords = { {vec3(89.606704711914,-1393.6149902344,29.21325302124), 5.0}, {vec3(104.64386749268,-1400.646484375,29.263059616089), 5.0} }, command = "openSkinshop", config = 'configSkinShopAll'},
    }
})