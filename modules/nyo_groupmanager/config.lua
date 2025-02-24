Nfw.registerConfig({
    config = {

        ['gm_general_config'] = {

            organizations = {
                ['staff'] = {
                    serviceToogle = true,
                    customPermissions = {
                        {'Admin', 'admin.permissao'},
                        {'noclip', 'noclip.permissao'},
                        {'Policia', 'policia.permissao'}
                    },
                    upgrades = {
                        ['map_1'] = {
                            type = "ipl",
                            price = 100,
                            request = "",
                            title = "Map lv1",
                            description = "org-upgrade-description-map_1",
                            image = "https://media.discordapp.net/attachments/986808903977299998/1005583325961932962/unknown.png?width=1194&height=671",
                            iplList = {
                                ['brofx_01_mlo'] = true,
                                ['apa_ch2_08_strm_1'] = true,
                                ['apa_ch2_occl_02'] = true,
                                ['apa_ch2_occl_03'] = true,
                                ['ch2_08_strm_0'] = true,
                                ['ch2_occl_02'] = true
                            }
                        },
                        ['map_2'] = {
                            type = "ipl",
                            price = 100,
                            request = "map_1",
                            title = "map Lv2",
                            description = "org-upgrade-description-map_1",
                            image = "assets/system-update.png",
                            iplList = {
                                ['favela20'] = true,
                            }
                        },
                        ['map_3'] = {
                            type = "ipl",
                            price = 100,
                            request = "map_2",
                            title = "Map lv 3",
                            description = "org-upgrade-description-map_1",
                            image = "assets/system-update.png",
                            iplList = {
                                ['logos'] = true,
                            }
                        },
                        ['garages_1'] = {
                            type = "custom",
                            price = 1000000,
                            request = "",
                            title = "Upgrade Garagem",
                            description = "org-upgrade-description-map_1",
                            image = "assets/system-update.png"
                        }
                    }
                },
                ['policia'] = {
                    customPermissions = {
                        {'Admin', 'admin.permissao'},
                        {'noclip', 'noclip.permissao'},
                        {'Policia', 'policia.permissao'}
                    },
                    serviceToogle = true,
                    upgrades = {
                        ['map_1'] = {
                            type = "ipl",
                            price = 100,
                            title = "org-upgrade-title-map_1",
                            description = "org-upgrade-description-map_1",
                            image = "assets/system-update.png",
                            iplList = {
                                ['ruad13'] = true, 
                                ['logos'] = false
                            }
                            --iplname = 'ruad13'
                        },
                        ['pm_max1'] = {
                            type = "maxmember",
                            price = 100,
                            title = "org-upgrade-title-pm_max_1",
                            description = "org-upgrade-description-map_1",
                            image = "assets/system-update.png",
                            addMaxMember = 2
                        }
                    }
                },
                ['mecanica'] = {
                    customPermissions = {
                        {'Admin', 'admin.permissao'},
                        {'noclip', 'noclip.permissao'},
                        {'Policia', 'policia.permissao'}
                    },
                    upgrades = {
                        ['map_1'] = {
                            type = "ipl",
                            price = 100,
                            title = "org-upgrade-title-map_1",
                            description = "org-upgrade-description-map_1",
                            image = "assets/system-update.png",
                            iplList = {
                                ['ruad13'] = true, 
                                ['logos'] = false
                            }
                            --iplname = 'ruad13'
                        },
                        ['pm_max1'] = {
                            type = "maxmember",
                            price = 100,
                            title = "org-upgrade-title-pm_max_1",
                            description = "org-upgrade-description-map_1",
                            image = "assets/system-update.png",
                            addMaxMember = 2
                        }
                    }
                }
            }
        }

    },

    locs = {

    }
})