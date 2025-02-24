Nfw.registerConfig({
    config = {
        ['inventoryGeneralConfig'] = {
            defaultWeight = 6, -- mochila inicial
            maxWeight = 90, -- tamanho maximo da mochila
            maxWeaponAmmo = 200, -- numero maximo de munições por arma
            hotKeyBlockTime = 3, -- coolDown das HotKey
            ammoSyncThreadTime = 5000, -- coolDown para syncar munição client-side
            disableAutoReload = true, -- obriga o player apertar R para recarregar a arma!

            -- inspect config 
            inspectCommand = 'revistar', -- comando para revistar 
            inspectPerm = '', -- perm do comando revistar

            -- Trash Ids 
            trashProps = {
                -- trash grande
                [218085040] = true,
                [-58485588] = true,
                [666561306] = true,
                [-206690185] = true,
                -- trash pequeno
                [1437508529] = true,
                [-1426008804] = true,
                [1329570871] = true,
                [1614656839] = true,
                [865150065] = true,
            }
        },
        ['inventoryItensConfig'] = {
            --ARMAS BRANCAS Weapon
            ['punhal'] = {
                index = 'weapon_dagger', name = 'punhal',  img = '',  type = 'weapon',  weight = 0.2,  use = false,  drop = true,  send = true,  store = true 
            },
            ['bastao'] = {
                index = 'weapon_bat', name = 'Bastão de Baseball',  img = '',  type = 'weapon',  weight = 0.4,  use = false,  drop = true,  send = true,  store = true 
            },
            ['garrafaquebrada'] = {
                index = 'weapon_bottle', name = 'garrafa quebrada',  img = '',  type = 'weapon',  weight = 0.2,  use = false,  drop = true,  send = true,  store = true 
            },
            ['pedecabra'] = {
                index = 'weapon_crowbar', name = 'pé de cabra',  img = '',  type = 'weapon',  weight = 2.2,  use = false,  drop = true,  send = true,  store = true 
            },
            ['lanterna'] = {
                index = 'weapon_flashlight', name = 'lanterna',  img = '',  type = 'weapon',  weight = 0.2,  use = false,  drop = true,  send = true,  store = true 
            },
            ['tacodegolf'] = {
                index = 'weapon_golfclub', name = 'taco de golf',  img = '',  type = 'weapon',  weight = 0.2,  use = false,  drop = true,  send = true,  store = true 
            },
            ['martelo'] = {
                index = 'weapon_hammer', name = 'martelo',  img = '',  type = 'weapon',  weight = 0.2,  use = false,  drop = true,  send = true,  store = true 
            },
            ['machadinha'] = {
                index = 'weapon_hatchet', name = 'machadinha',  img = '',  type = 'weapon',  weight = 0.2,  use = false,  drop = true,  send = true,  store = true 
            },
            ['socoingles'] = {
                index = 'weapon_knuckle', name = 'soco ingles',  img = '',  type = 'weapon',  weight = 0.2,  use = false,  drop = true,  send = true,  store = true 
            },
            ['faca'] = {
                index = 'weapon_knife', name = 'faca',  img = '',  type = 'weapon',  weight = 0.2,  use = false,  drop = true,  send = true,  store = true 
            },
            ['facao'] = {
                index = 'weapon_machete', name = 'facão',  img = '',  type = 'weapon',  weight = 0.2,  use = false,  drop = true,  send = true,  store = true 
            },
            ['canivete'] = {
                index = 'weapon_switchblade', name = 'canivete',  img = '',  type = 'weapon',  weight = 0.2,  use = false,  drop = true,  send = true,  store = true 
            },
            ['cassetete'] = {
                index = 'weapon_nightstick', name = 'cassetete',  img = '',  type = 'weapon',  weight = 0.2,  use = false,  drop = true,  send = true,  store = true 
            },
            ['chaveinglesa'] = {
                index = 'weapon_wrench', name = 'chave inglesa',  img = '',  type = 'weapon',  weight = 0.2,  use = false,  drop = true,  send = true,  store = true 
            },
            ['machadodebatalha'] = {
                index = 'weapon_battleaxe', name = 'Machado de Batalha',  img = '',  type = 'weapon',  weight = 0.2,  use = false,  drop = true,  send = true,  store = true 
            },
            ['tacodesinuca'] = {
                index = 'weapon_poolcue', name = 'taco de Sinuca',  img = '',  type = 'weapon',  weight = 0.2,  use = false,  drop = true,  send = true,  store = true 
            },
            ['machadodepedra'] = {
                index = 'weapon_stone_hatchet', name = 'Machado de Pedra',  img = '',  type = 'weapon',  weight = 0.2,  use = false,  drop = true,  send = true,  store = true 
            },
            
            
            --armas leves weapons 9mm
            ['pistol'] = {
                index = 'weapon_pistol', name = 'Pistol',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },
            ['pistolmk2'] = {
                index = 'weapon_pistol_mk2', name = 'Pistol mk2',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },
            ['combatpistol'] = {
                index = 'weapon_combatpistol', name = 'Combat pistol',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },
            ['appistol'] = {
                index = 'weapon_appistol', name = 'Ap pistol',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },
            ['snspistol'] = {
                index = 'weapon_snspistol', name = 'Sns Pistol',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },
            ['snspistolmk2'] = {
                index = 'weapon_snspistol_mk2', name = 'Sns Pistol mk2',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },
            ['heavypistol'] = {
                index = 'weapon_heavypistol', name = 'Heavy Pistol',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },
            ['vintagepistol'] = {
                index = 'weapon_vintagepistol', name = 'Vintage Pistol',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },
            ['ceramicpistol'] = {
                index = 'weapon_ceramicpistol', name = 'Ceramic Pistol',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },

            --armas mediana weapons 9mm
            ['microsmg'] = {
                index = 'weapon_microsmg', name = 'Micro SMG',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },
            ['smg'] = {
                index = 'weapon_smg', name = 'SMG',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },
            ['smgmk2'] = {
                index = 'weapon_smg_mk2', name = 'SMG Mk II',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },
            ['assaultsmg'] = {
                index = 'weapon_assaultsmg', name = 'Assault SMG',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },
            ['combatpdw'] = {
                index = 'weapon_combatpdw', name = 'Combat PDW',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },
            ['machinepistol'] = {
                index = 'weapon_machinepistol', name = 'Machine Pistol',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },
            ['minismg'] = {
                index = 'weapon_minismg', name = 'Mini SMG',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },
            
            -- OUTROS
            ['stungun'] = {
                index = 'weapon_stungun', name = 'Stungun',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },
            ['flaregun'] = {
                index = 'weapon_flaregun', name = 'flaregun',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },
            ['raypistol'] = {
                index = 'weapon_raypistol', name = 'Up n Atomizer',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },  
            ['stungunmp'] = {
                index = 'weapon_stungun_mp', name = 'Stun Gun 2',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },   
            ['raycarbine'] = {
                index = 'weapon_raycarbine', name = 'Unholy Hellbringer',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },   


            -- armas leves weapons 38mm
            ['revolver'] = {
                index = 'weapon_revolver', name = 'Heavy Revolver',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },
            ['revolvermk2'] = {
                index = 'weapon_revolver_mk2', name = 'Heavy Revolver Mk II',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },
            ['doubleactionrevolver'] = {
                index = 'weapon_doubleaction', name = 'Double Action Revolver',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },
            ['navyrevolver'] = {
                index = 'weapon_navyrevolver', name = 'Navy Revolver',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },
            ['gadgetpistol'] = {
                index = 'weapon_gadgetpistol', name = 'Perico Pistol',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },
          
            -- armas leves weapons Calibre 12
            ['pumpshotgun'] = {
                index = 'weapon_pumpshotgun', name = 'Pump Shotgun',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },
            ['pumpshotgunmk2'] = {
                index = 'weapon_pumpshotgun_mk2', name = 'Pump Shotgun Mk II',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },
            ['sawnoffshotgun'] = {
                index = 'weapon_sawnoffshotgun', name = 'Sawed-Off Shotgun',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },
            ['assaultshotgun'] = {
                index = 'weapon_assaultshotgun', name = 'Assault Shotgun',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },
            ['bullpupshotgun'] = {
                index = 'weapon_bullpupshotgun', name = 'Bullpup Shotgun',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },

            ['musket'] = {
                index = 'weapon_musket', name = 'Musket',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },
            ['heavyshotgun'] = {
                index = 'weapon_heavyshotgun', name = 'Heavy Shotgun',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },
            ['dbshotgun'] = {
                index = 'weapon_dbshotgun', name = 'Double Barrel Shotgun',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },
            ['autoshotgun'] = {
                index = 'weapon_autoshotgun', name = 'Double Barrel Shotgun',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },
            ['combatshotgun'] = {
                index = 'weapon_combatshotgun', name = 'Combat Shotgun',  img = '',  type = 'weapon',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },

            --ARMAS 762
            ['ak47'] = {
                index = 'weapon_assaultrifle', name = 'AK47',  img = '',  type = 'weapon',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['ak47mk2'] = {
                index = 'weapon_assaultrifle_mk2', name = 'Assault Rifle Mk II',  img = '',  type = 'weapon',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['bullpuprifle'] = {
                index = 'weapon_bullpuprifle', name = 'QBZ',  img = '',  type = 'weapon',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['bullpupriflemk2'] = {
                index = 'weapon_bullpuprifle_mk2', name = 'QBZ Mk II',  img = '',  type = 'weapon',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['compactrifle'] = {
                index = 'weapon_compactrifle', name = 'Carabina compacta',  img = '',  type = 'weapon',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['militaryrifle'] = {
                index = 'weapon_militaryrifle', name = 'AUG',  img = '',  type = 'weapon',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['heavyrifle'] = {
                index = 'weapon_heavyrifle', name = 'Heavy Rifle',  img = '',  type = 'weapon',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },

            --ARMAS 556
            ['m4a1'] = {
                index = 'weapon_carbinerifle', name = 'M4A1',  img = '',  type = 'weapon',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['m4a1mk2'] = {
                index = 'weapon_carbinerifle_mk2', name = 'M4A1C',  img = '',  type = 'weapon',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['advancedrifle'] = {
                index = 'weapon_advancedrifle', name = 'G36',  img = '',  type = 'weapon',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['specialcarbine'] = {
                index = 'weapon_specialcarbine', name = 'Special Carbine',  img = '',  type = 'weapon',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['specialcarbinemk2'] = {
                index = 'weapon_specialcarbine_mk2', name = 'Special Carbine Mk II',  img = '',  type = 'weapon',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            
            --LMGS 
            ['mg'] = {
                index = 'weapon_mg', name = 'MG',  img = '',  type = 'weapon',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['combatmg'] = {
                index = 'weapon_combatmg', name = 'Combat MG',  img = '',  type = 'weapon',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['combatmgmk2'] = {
                index = 'weapon_combatmg_mk2', name = 'Combat MG Mk II',  img = '',  type = 'weapon',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['gusenberg'] = {
                index = 'weapon_gusenberg', name = 'Gusenberg Sweeper',  img = '',  type = 'weapon',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },

            --armas leves weapons .50mm
            ['pistol50'] = {
                index = 'weapon_pistol50', name = 'Pistol .50',  img = '',  type = 'weapon',  weight = 1.2,  use = false,  drop = true,  send = true,  store = true 
            },

            --EXTRAS
            ['bzgas'] = {
                index = 'weapon_bzgas', name = 'BZ Gas',  img = '',  type = 'weapon',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['molotov'] = {
                index = 'weapon_molotov', name = 'molotov',  img = '',  type = 'weapon',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['parachute'] = {
                index = '', name = 'Parachute',  img = '',  type = 'weapon',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['grenade'] = {
                index = 'weapon_grenade', name = 'Grenade',  img = '',  type = 'weapon',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['stickybomb'] = {
                index = 'weapon_stickybomb', name = 'Sticky Bomb',  img = '',  type = 'weapon',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['proxmine'] = {
                index = 'weapon_proxmine', name = 'Proximity Mines',  img = '',  type = 'weapon',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['snowball'] = {
                index = 'weapon_snowball', name = 'Snowballs',  img = '',  type = 'weapon',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['pipebomb'] = {
                index = 'weapon_pipebomb', name = 'Pipe Bombs',  img = '',  type = 'weapon',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['ball'] = {
                index = 'weapon_ball', name = 'Baseball',  img = '',  type = 'weapon',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['smokegrenade'] = {
                index = 'weapon_smokegrenade', name = 'Tear Gas',  img = '',  type = 'weapon',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['flare'] = {
                index = 'weapon_flare', name = 'Flare',  img = '',  type = 'weapon',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['fireextinguisher'] = {
                index = 'weapon_fireextinguisher', name = 'Fire Extinguishe',  img = '',
                type = 'weapon',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },


            --EXTRAS ammo
            ['munbzgas'] = {
                index = 'weapon_bzgas', name = 'munição BZ Gas',  img = '',  type = 'ammo',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['mungrenade'] = {
                index = 'weapon_grenade', name = 'munição Grenade',  img = '',  type = 'ammo',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['munmolotov'] = {
                index = 'weapon_molotov', name = 'munição molotov',  img = '',  type = 'ammo',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['munstickybomb'] = {
                index = 'weapon_stickybomb', name = 'munição Sticky Bomb',  img = '',  type = 'ammo',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['munproxmine'] = {
                index = 'weapon_proxmine', name = 'munição Sticky Bomb',  img = '',  type = 'ammo',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['munsnowball'] = {
                index = 'weapon_snowball', name = 'munição Snowballs',  img = '',  type = 'ammo',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['munpipebomb'] = {
                index = 'weapon_pipebomb', name = 'munição Pipe Bombs',  img = '',  type = 'ammo',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['munball'] = {
                index = 'weapon_ball', name = 'munição Baseball',  img = '',  type = 'ammo',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['munsmokegrenade'] = {
                index = 'weapon_smokegrenade', name = 'munição Tear Gas',  img = '',  type = 'ammo',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['munsflare'] = {
                index = 'weapon_flare', name = 'munição Flare',  img = '',  type = 'ammo',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['munsparachute'] = {
                index = 'gadget_parachute', name = 'munição parachute',  img = '',  type = 'ammo',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['munfireextinguisher'] = {
                index = 'weapon_fireextinguisher', name = 'munição Fire Extinguishe',  img = '',  type = 'ammo',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },

           
            --SNIPERS
            ['sniperrifle'] = {
                index = 'weapon_sniperrifle', name = 'Sniper Rifle',  img = '',  type = 'weapon',  weight = 2.2,  use = false,  drop = true,  send = true,  store = true 
            },
            ['heavysniper'] = {
                index = 'weapon_heavysniper', name = 'Heavy Sniper',  img = '',  type = 'weapon',  weight = 2.2,  use = false,  drop = true,  send = true,  store = true 
            },
            ['heavysnipermk2'] = {
                index = 'weapon_heavysniper_mk2', name = 'Heavy Sniper Mk II',  img = '',  type = 'weapon',  weight = 2.2,  use = false,  drop = true,  send = true,  store = true 
            },
            ['marksmanrifle'] = {
                index = 'weapon_marksmanrifle', name = 'Marksman Rifle',  img = '',  type = 'weapon',  weight = 2.2,  use = false,  drop = true,  send = true,  store = true 
            },


            --Armas pesadas
            ['rpg'] = {
                index = 'weapon_rpg', name = 'RPG',  img = '',  type = 'weapon',  weight = 1.5,  use = true,  drop = false,  send = false,  store = true 
            },
            ['grenadelauncher'] = {
                index = 'weapon_grenadelauncher', name = 'Grenade Launcher',  img = '',  type = 'weapon',  weight = 1.5,  use = false,  drop = true,  send = true,  store = true 
            },
            ['grenadelaunchersmoke'] = {
                index = 'weapon_grenadelauncher_smoke', name = 'Grenade Launcher Smoke',  img = '',  type = 'weapon',  weight = 1.5,  use = false,  drop = true,  send = true,  store = true 
            },
            ['minigun'] = {
                index = 'weapon_minigun', name = 'Minigun',  img = '',  type = 'weapon',  weight = 1.5,  use = false,  drop = true,  send = true,  store = true 
            },
            ['firework'] = {
                index = 'weapon_firework', name = 'Firework Launcher',  img = '',  type = 'weapon',  weight = 1.5,  use = false,  drop = true,  send = true,  store = true 
            },
            ['railgun'] = {
                index = 'weapon_railgun', name = 'Firework railgun',  img = '',  type = 'weapon',  weight = 1.5,  use = false,  drop = true,  send = true,  store = true 
            },
            ['hominglauncher'] = {
                index = 'weapon_hominglauncher', name = 'Homing Launcher',  img = '',  type = 'weapon',  weight = 1.5,  use = false,  drop = true,  send = true,  store = true 
            },
            ['compactlauncher'] = {
                index = 'weapon_compactlauncher', name = 'Compact Grenade Launcher',  img = '',  type = 'weapon',  weight = 1.5,  use = false,  drop = true,  send = true,  store = true 
            },
            ['rayminigun'] = {
                index = 'weapon_rayminigun', name = 'Widowmaker',  img = '',  type = 'weapon',  weight = 1.5,  use = false,  drop = true,  send = true,  store = true 
            },
            ['emplauncher'] = {
                index = 'weapon_emplauncher', name = 'Compact EMP Launcher',  img = '',  type = 'weapon',  weight = 1.5,  use = false,  drop = true,  send = true,  store = true 
            },


            --MUNIÇÕES GERAIS (CONFIG+FOTOS)
            ['mun9mm'] = {
                index = 'weapon_pistol_mk2', name = 'Munição 9mm',  img = '',  type = 'ammo',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },
            ['mun50mm'] = {
                index = 'weapon_pistol50', name = 'Munição .50mm',  img = '',  type = 'ammo',  weight = 1.3,  use = false,  drop = true,  send = true,  store = true 
            },
            ['mun38mm'] = {
                index = 'weapon_revolver', name = 'Munição .38mm',  img = '',  type = 'ammo',  weight = 0.8,  use = false,  drop = true,  send = true,  store = true 
            },
            ['muncalibre12'] = {
                index = 'weapon_pumpshotgun', name = 'Munição Calibre 12',  img = '',  type = 'ammo',  weight = 0.8,  use = false,  drop = true,  send = true,  store = true 
            },
            ['mun762'] = {
                index = 'weapon_assaultrifle', name = 'Munição .762mm',  img = '',  type = 'ammo',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            ['mun556'] = {
                index = 'weapon_carbinerifle', name = 'Munição .556mm',  img = '',  type = 'ammo',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },
            --MUNIÇÕES GERAIS OUTROS (CONFIG+FOTOS)
            ['munflare'] = {
                index = 'weapon_flaregun', name = 'Munição flare',  img = '',  type = 'ammo',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },
            ['munraycarbine'] = {
                index = 'weapon_raycarbine', name = 'Unholy Hellbringer',  img = '',  type = 'ammo',  weight = 0.9,  use = false,  drop = true,  send = true,  store = true 
            },
            ['mun308'] = {
                index = 'weapon_sniperrifle', name = 'Munição .308mm',  img = '',  type = 'ammo',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },

            --MUNIÇÕES GERAIS RPGs (CONFIG+FOTOS)
            ['munrpg'] = {
                index = 'weapon_rpg', name = 'Munição RPG',  img = '',  type = 'ammo',  weight = 0.9,  use = false,  drop = false,  send = false,  store = true 
            },
            ['mungrenadelauncher'] = {
                index = 'weapon_grenadelauncher', name = 'Munição Grenade Launcher',  img = '',  type = 'ammo',  weight = 1.5,  use = false,  drop = false,  send = false,  store = true 
            },
            ['mungrenadelaunchersmoke'] = {
                index = 'weapon_grenadelauncher_smoke', name = 'Grenade Launcher Smoke',  img = '',  type = 'ammo',  weight = 1.5,  use = false,  drop = false,  send = false,  store = true 
            },
            ['munminigun'] = {
                index = 'weapon_minigun', name = 'Munição Minigun',  img = '',  type = 'ammo',  weight = 1.5,  use = false,  drop = false,  send = false,  store = true 
            },
            ['munfirework'] = {
                index = 'weapon_firework', name = 'Munição firework',  img = '',  type = 'ammo',  weight = 1.5,  use = false,  drop = false,  send = false,  store = true 
            },
            ['munrailgun'] = {
                index = 'weapon_railgun', name = 'Munição railgun',  img = '',  type = 'ammo',  weight = 1.5,  use = false,  drop = false,  send = false,  store = true 
            },
            ['munhominglauncher'] = {
                index = 'weapon_hominglauncher', name = 'Munição hominglauncher',  img = '',  type = 'ammo',  weight = 1.5,  use = false,  drop = false,  send = false,  store = true 
            },
            ['muncompactlauncher'] = {
                index = 'weapon_compactlauncher', name = 'Munição compact launcher',  img = '',  type = 'ammo',  weight = 1.5,  use = false,  drop = false,  send = false,  store = true 
            },
            ['munrayminigun'] = {
                index = 'weapon_rayminigun', name = 'Munição rayminigun',  img = '',  type = 'ammo',  weight = 1.5,  use = false,  drop = false,  send = false,  store = true 
            },
            ['munemplauncher'] = {
                index = 'weapon_emplauncher', name = 'Munição emplauncher',  img = '',  type = 'ammo',  weight = 1.5,  use = false,  drop = false,  send = false,  store = true 
            },
            
            -- R ATTACHS AK 47 
            ['extendedclipak47'] = {
                index = 'component_assaultrifle_clip_02', name = 'Pente Extendido Ak47',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['drumextendedclipak47'] = {
                index = 'component_assaultrifle_clip_03', name = 'Drum Extendido Ak47',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['silenciadorak47'] = {
                index = 'component_at_ar_supp_02', name = 'Silenciador AK47',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['scopeak47'] = {
                index = 'component_at_scope_macro', name = 'Mira AK47',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['flashak47'] = {
                index = 'component_at_ar_flsh', name = 'Lanterna AK47',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['gripak47'] = {
                index = 'component_at_ar_afgrip', name = 'Grip AK47',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureak47'] = {
                index = 'component_assaultrifle_varmod_luxe', name = 'Luxure AK47',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            -- R ATTACHS M4A1
            ['extendedclipm4a1'] = {
                index = 'component_carbinerifle_clip_02', name = 'Pente Extendido M4A1',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['drumextendedclipm4a1'] = {
                index = 'component_carbinerifle_clip_03', name = 'Drum Extendido M4A1',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['flasham4a1'] = {
                index = 'component_at_ar_flsh', name = 'Lanterna M4A1',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['scopem4a1'] = {
                index = 'component_at_scope_medium', name = 'Mira M4A1',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['silenciadorm4a1'] = {
                index = 'component_at_ar_supp', name = 'Silenciador M4A1',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['gripm4a1'] = {
                index = 'component_at_ar_afgrip', name = 'Grip M4A1',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxurem4a1'] = {
                index = 'component_carbinerifle_varmod_luxe', name = 'Luxure M4A1',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            -- R ATTACHS advancedrifle
            ['extendedcliadvancedifle'] = {
                index = 'component_advancedrifle_clip_02', name = 'Pente Extendido Fuzil',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['flashadvancedifle'] = {
                index = 'component_at_ar_flsh', name = 'Lanterna Fuzil Avançado',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['scopeadvancedifle'] = {
                index = 'component_at_scope_small', name = 'Mira Fuzil Avançado',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['silenciadoradvancedrifle'] = {
                index = 'component_at_ar_supp', name = 'Silenciador Fuzil Avançado',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxuremetaladvancedrifle'] = {
                index = 'component_advancedrifle_varmod_luxe', name = 'Luxure Metal Fuzil',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },

            -- R ATTACHS specialcarbine (G36)

            ['extendedclipg36'] = {
                index = 'component_specialcarbine_clip_02', name = 'Pente Extendido G36',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['drumextendedclig36'] = {
                index = 'component_specialcarbine_clip_03', name = 'Drum Extendido G36',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['flashag36'] = {
                index = 'component_at_ar_flsh', name = 'Lanterna G36',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['scopeg36'] = {
                index = 'component_at_scope_medium', name = 'Mira G36',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['silenciadorg36'] = {
                index = 'component_at_ar_supp_02', name = 'Silenciador G36',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['gripg36'] = {
                index = 'component_at_ar_afgrip', name = 'Grip G36',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxuremetalg36'] = {
                index = 'component_specialcarbine_varmod_lowrider', name = 'Luxure Metal G36',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            -- R ATTACHS bullpup rifle (QBZ) 
            ['extendedclipqbz'] = {
                index = 'component_bullpuprifle_clip_02', name = 'Pente Extendido QBZ',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['flashqbz'] = {
                index = 'component_at_ar_flsh', name = 'Lanterna QBZ',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['scopeqbz'] = {
                index = 'component_at_scope_small', name = 'Mira QBZ',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['silenciadorqbz'] = {
                index = 'component_at_ar_supp', name = 'Silenciador QBZ',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['gripqbz'] = {
                index = 'component_at_ar_afgrip', name = 'Grip QBZ',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxurelqbz'] = {
                index = 'component_bullpuprifle_varmod_low', name = 'Luxure QBZ',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },

            -- R ATTACHS bullpupriflemk2 (QBZ Mk II) 

            ['extendedclipqbzc'] = {
                index = 'component_bullpuprifle_mk2_clip_02', name = 'Pente Extendido QBZMK',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['flashqbzc'] = {
                index = 'component_at_ar_flsh', name = 'Lanterna QBZMK',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['silenciadorqbzcmk'] = {
                index = 'component_at_ar_supp', name = 'Silenciador QBZMK',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['gripqbz'] = {
                index = 'component_at_ar_afgrip_02', name = 'Grip QBZMK',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            -- munições extras
            ['muntracerqbzc'] = {
                index = 'component_bullpuprifle_mk2_clip_tracer', name = 'Muni Traçante QBZMK',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['munincendyaryqbzc'] = {
                index = 'component_bullpuprifle_mk2_clip_incendiary', name = 'Muni Incendiaria QBZMK',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['munarmorpicercingqbzc'] = {
                index = 'component_bullpuprifle_mk2_clip_armorpiercing', name = 'Muni FColete QBZMK',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['munarmorpicercingqbzc'] = {
                index = 'component_bullpuprifle_mk2_clip_fmj', name = 'Muni FMJ QBZMK',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            -- miras
            ['scopeholoqbzc'] = {
                index = 'component_at_sights', name = 'Mira Holografica QBZMK',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['scopeqbzc2x'] = {
                index = 'component_at_scope_macro_02_mk2', name = 'Mira 2X QBZMK',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['scopeqbzc4x'] = {
                index = 'component_at_scope_small_mk2', name = 'Mira 4X QBZMK',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            -- Cano PESADO
            ['scopeqbzcanopesado'] = {
                index = 'component_at_bp_barrel_02', name = 'Cano Pesado QBZMK',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },

            -- FREIO DE BOCA

            ['freiodebocaqbzcpano'] = {
                index = 'component_at_muzzle_01', name = 'Freiodeboca Pano QBZMK',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocaqbzctatico'] = {
                index = 'component_at_muzzle_02', name = 'Freiodeboca Tatico QBZMK',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocaqbzcgorda'] = {
                index = 'component_at_muzzle_03', name = 'Freiodeboca Gorda QBZMK',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocaqbzcprecisao'] = {
                index = 'component_at_muzzle_04', name = 'Freiodeboca precisão QBZMK',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocaqbzcpesado'] = {
                index = 'component_at_muzzle_05', name = 'Freiodeboca pesado QBZMK',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocaqbzcinclinado'] = {
                index = 'component_at_muzzle_06', name = 'Freiodeboca inclinado QBZMK',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocaqbzcpontadividida'] = {
                index = 'component_at_muzzle_07', name = 'Freiodeboca pontadividida QBZMK',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            -- SKINS QBZC
            ['luxureqbzcdigitalcamo'] = {
                index = 'component_bullpuprifle_mk2_camo', name = 'Luxure DigitalCamo QBZMK',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureqbzccamuflagem'] = {
                index = 'component_bullpuprifle_mk2_camo_02', name = 'Luxure Camuflagem QBZMK',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureqbzccamuflagemfloresta'] = {
                index = 'component_bullpuprifle_mk2_camo_03', name = 'Luxure CamuflagemFloresta QBZMK',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureqbzccaveira'] = {
                index = 'component_bullpuprifle_mk2_camo_04', name = 'Luxure Caveira QBZMK',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureqbzcnovela'] = {
                index = 'component_bullpuprifle_mk2_camo_05', name = 'Luxure Novela QBZMK',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureqbzcperceu'] = {
                index = 'component_bullpuprifle_mk2_camo_06', name = 'Luxure Perceu QBZMK',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureqbzcleopardo'] = {
                index = 'component_bullpuprifle_mk2_camo_07', name = 'Luxure Leopardo QBZMK',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureqbzczebra'] = {
                index = 'component_bullpuprifle_mk2_camo_08', name = 'Luxure Zebra QBZMK',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureqbzcgeometria'] = {
                index = 'component_bullpuprifle_mk2_camo_09', name = 'Luxure Geometria QBZMK',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureqbzcboom'] = {
                index = 'component_bullpuprifle_mk2_camo_10', name = 'Luxure BOOM QBZMK',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureqbzcpatriot'] = {
                index = 'component_bullpuprifle_mk2_camo_ind_01', name = 'Luxure Patriot QBZMK',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },

            -- R ATTACHS weapon_specialcarbine_mk2  (G36C) 

            ['extendedclig36c'] = {
                index = 'component_specialcarbine_mk2_clip_02', name = 'Pente Extendido G36C',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['silenciadorg36c'] = {
                index = 'component_at_ar_supp_02', name = 'Silenciador G36C',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['flashqg36c'] = {
                index = 'component_at_ar_flsh', name = 'Lanterna G36C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['gripg36c'] = {
                index = 'component_at_ar_afgrip_02', name = 'Grip G36C',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            --MIRAS
            ['scopeholog36c'] = {
                index = 'component_at_sights', name = 'Mira Holografica G36C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['scopeg36c2x'] = {
                index = 'component_at_scope_macro_mk2', name = 'Mira 2X G36C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['scopeqg36c4x'] = {
                index = 'component_at_scope_medium_mk2', name = 'Mira 4X G36C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            -- Cano PESADO
            ['scopeg36ccanopesado'] = {
                index = 'component_at_sc_barrel_02', name = 'Cano Pesado G36C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            -- FREIO DE BOCA

            ['freiodebocag36ccpano'] = {
                index = 'component_at_muzzle_01', name = 'Freiodeboca Pano G36C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocag36cctatico'] = {
                index = 'component_at_muzzle_02', name = 'Freiodeboca Tatico G36C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocag36ccgorda'] = {
                index = 'component_at_muzzle_03', name = 'Freiodeboca Gorda G36C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocag36ccprecisao'] = {
                index = 'component_at_muzzle_04', name = 'Freiodeboca precisão G36C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocag36ccpesado'] = {
                index = 'component_at_muzzle_05', name = 'Freiodeboca pesado G36C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocag36ccinclinado'] = {
                index = 'component_at_muzzle_06', name = 'Freiodeboca inclinado G36C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocag36ccpontadividida'] = {
                index = 'component_at_muzzle_07', name = 'Freiodeboca pontadividida G36C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },

            -- SKINS (G36C) 
            ['luxureg36cdigitalcamo'] = {
                index = 'component_specialcarbine_mk2_camo', name = 'Luxure DigitalCamo G36C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureg36ccamuflagem'] = {
                index = 'component_specialcarbine_mk2_camo_02', name = 'Luxure Camuflagem G36C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureg36ccamuflagemfloresta'] = {
                index = 'component_specialcarbine_mk2_camo_03', name = 'Luxure CamuflagemFloresta G36C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureg36ccaveira'] = {
                index = 'component_specialcarbine_mk2_camo_04', name = 'Luxure Caveira G36C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureg36cnovela'] = {
                index = 'component_specialcarbine_mk2_camo_05', name = 'Luxure Novela G36C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureg36cperceu'] = {
                index = 'component_specialcarbine_mk2_camo_06', name = 'Luxure Perceu G36C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureg36cleopardo'] = {
                index = 'component_specialcarbine_mk2_camo_07', name = 'Luxure Leopardo G36C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureg36czebra'] = {
                index = 'component_specialcarbine_mk2_camo_08', name = 'Luxure Zebra G36C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureg36cgeometria'] = {
                index = 'component_specialcarbine_mk2_camo_09', name = 'Luxure Geometria G36C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureg36cboom'] = {
                index = 'component_specialcarbine_mk2_camo_10', name = 'Luxure BOOM G36C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureg36cpatriot'] = {
                index = 'component_specialcarbine_mk2_camo_ind_01', name = 'Luxure Patriot G36C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },

            -- R ATTACHS weapon_assaultrifle_mk2  (ak47c) 

            ['extendedcliak47c'] = {
                index = 'component_assaultrifle_mk2_clip_02', name = 'Pente Extendido AK47C',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['flashqak47c'] = {
                index = 'component_at_ar_flsh', name = 'Lanterna AK47C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['gripak47c'] = {
                index = 'component_at_ar_afgrip_02', name = 'Grip AK47C',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            --MIRAS
            ['scopeholoak47c'] = {
                index = 'component_at_sights', name = 'Mira Holografica AK47C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['scopeak47c2x'] = {
                index = 'component_at_scope_macro_mk2', name = 'Mira 2X AK47C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['scopeqak47c4x'] = {
                index = 'component_at_scope_medium_mk2', name = 'Mira 4X AK47C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            -- Cano PESADO
            ['scopeak47ccanopesado'] = {
                index = 'component_at_ar_barrel_02', name = 'Cano Pesado AK47C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            -- FREIO DE BOCA

            ['freiodebocaak47ccpano'] = {
                index = 'component_at_muzzle_01', name = 'Freiodeboca Pano AK47C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocaak47cctatico'] = {
                index = 'component_at_muzzle_02', name = 'Freiodeboca Tatico AK47C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocaak47ccgorda'] = {
                index = 'component_at_muzzle_03', name = 'Freiodeboca Gorda AK47C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocaak47ccprecisao'] = {
                index = 'component_at_muzzle_04', name = 'Freiodeboca precisão AK47C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocaak47ccpesado'] = {
                index = 'component_at_muzzle_05', name = 'Freiodeboca pesado AK47C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocaak47ccinclinado'] = {
                index = 'component_at_muzzle_06', name = 'Freiodeboca inclinado AK47C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocaak47ccpontadividida'] = {
                index = 'component_at_muzzle_07', name = 'Freiodeboca pontadividida AK47C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },

            -- SKINS (ak47c) 
            ['luxureak47cdigitalcamo'] = {
                index = 'component_assaultrifle_mk2_camo', name = 'Luxure DigitalCamo AK47C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureak47ccamuflagem'] = {
                index = 'component_assaultrifle_mk2_camo_02', name = 'Luxure Camuflagem AK47C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureak47ccamuflagemfloresta'] = {
                index = 'component_assaultrifle_mk2_camo_03', name = 'Luxure CamuflagemFloresta AK47C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureak47ccaveira'] = {
                index = 'component_assaultrifle_mk2_camo_04', name = 'Luxure Caveira AK47C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureak47cnovela'] = {
                index = 'component_assaultrifle_mk2_camo_05', name = 'Luxure Novela AK47C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureak47cperceu'] = {
                index = 'component_assaultrifle_mk2_camo_06', name = 'Luxure Perceu AK47C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureak47cleopardo'] = {
                index = 'component_assaultrifle_mk2_camo_07', name = 'Luxure Leopardo AK47C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureak47czebra'] = {
                index = 'component_assaultrifle_mk2_camo_08', name = 'Luxure Zebra AK47C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureak47cgeometria'] = {
                index = 'component_assaultrifle_mk2_camo_09', name = 'Luxure Geometria AK47C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureak47cboom'] = {
                index = 'component_assaultrifle_mk2_camo_10', name = 'Luxure BOOM AK47C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureak47cpatriot'] = {
                index = 'component_assaultrifle_mk2_camo_ind_01', name = 'Luxure Patriot AK47C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },




            -- R ATTACHS weapon_carbinerifle_mk2  (m4a1c) 

            ['extendedclim4a1c'] = {
                index = 'component_carbinerifle_mk2_clip_02', name = 'Pente Extendido M4A1C',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['silenciadorm4a1c'] = {
                index = 'component_at_ar_supp', name = 'Silenciador M4A1C',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['flashqm4a1c'] = {
                index = 'component_at_ar_flsh', name = 'Lanterna M4A1C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['gripm4a1c'] = {
                index = 'component_at_ar_afgrip_02', name = 'Grip M4A1C',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            --MIRAS
            ['scopeholom4a1c'] = {
                index = 'component_at_sights', name = 'Mira Holografica M4A1C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['scopem4a1c2x'] = {
                index = 'component_at_scope_macro_mk2', name = 'Mira 2X M4A1C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['scopeqm4a1c4x'] = {
                index = 'component_at_scope_medium_mk2', name = 'Mira 4X M4A1C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            -- Cano PESADO
            ['scopem4a1ccanopesado'] = {
                index = 'component_at_cr_barrel_02', name = 'Cano Pesado M4A1C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            -- FREIO DE BOCA

            ['freiodebocam4a1ccpano'] = {
                index = 'component_at_muzzle_01', name = 'Freiodeboca Pano M4A1C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocam4a1cctatico'] = {
                index = 'component_at_muzzle_02', name = 'Freiodeboca Tatico M4A1C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocam4a1ccgorda'] = {
                index = 'component_at_muzzle_03', name = 'Freiodeboca Gorda M4A1C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocam4a1ccprecisao'] = {
                index = 'component_at_muzzle_04', name = 'Freiodeboca precisão M4A1C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocam4a1ccpesado'] = {
                index = 'component_at_muzzle_05', name = 'Freiodeboca pesado M4A1C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocam4a1ccinclinado'] = {
                index = 'component_at_muzzle_06', name = 'Freiodeboca inclinado M4A1C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocam4a1ccpontadividida'] = {
                index = 'component_at_muzzle_07', name = 'Freiodeboca pontadividida M4A1C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },

            -- SKINS (m4a1c) 
            ['luxurem4a1cdigitalcamo'] = {
                index = 'component_carbinerifle_mk2_camo', name = 'Luxure DigitalCamo M4A1C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxurem4a1ccamuflagem'] = {
                index = 'component_carbinerifle_mk2_camo_02', name = 'Luxure Camuflagem M4A1C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxurem4a1ccamuflagemfloresta'] = {
                index = 'component_carbinerifle_mk2_camo_03', name = 'Luxure CamuflagemFloresta M4A1C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxurem4a1ccaveira'] = {
                index = 'component_carbinerifle_mk2_camo_04', name = 'Luxure Caveira M4A1C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxurem4a1cnovela'] = {
                index = 'component_carbinerifle_mk2_camo_05', name = 'Luxure Novela M4A1C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxurem4a1cperceu'] = {
                index = 'component_carbinerifle_mk2_camo_06', name = 'Luxure Perceu M4A1C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxurem4a1cleopardo'] = {
                index = 'component_carbinerifle_mk2_camo_07', name = 'Luxure Leopardo M4A1C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxurem4a1czebra'] = {
                index = 'component_carbinerifle_mk2_camo_08', name = 'Luxure Zebra M4A1C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxurem4a1cgeometria'] = {
                index = 'component_carbinerifle_mk2_camo_09', name = 'Luxure Geometria M4A1C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxurem4a1cboom'] = {
                index = 'component_carbinerifle_mk2_camo_10', name = 'Luxure BOOM M4A1C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxurem4a1cpatriot'] = {
                index = 'component_carbinerifle_mk2_camo_ind_01', name = 'Luxure Patriot M4A1C',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },

            -- compactrifle (Carabina compacta)
            ['extendedclipakcompacta'] = {
                index = 'component_compactrifle_clip_02', name = 'Pente Extendido AKcompacta',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['drumextendedclipcompacta'] = {
                index = 'component_compactrifle_clip_03', name = 'Drum Extendido AKcompacta',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ----------------- militaryrifle (AUG)

            ['extendedclipaug'] = {
                index = 'component_militaryrifle_clip_02', name = 'Pente Extendido AUG',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['miradeferroaug'] = {
                index = 'component_militaryrifle_sight_01', name = 'Mira de ferro AUG',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },

            --['miradeferroaug'] = {
           --     index = 'component_militaryrifle_sight_01', name = 'Mira de ferro AUG',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            --},-- não tem mudança

            ['scopeaug2x'] = {
                index = 'component_at_scope_small', name = 'Mira 2X AUG',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            
            --['flashlightaug'] = { 
           --     index = 'component_at_pi_flsh', name = 'Flashlight AUG',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            --}, -- não tem mudança
            
            ['suppressoraug'] = {
                index = 'component_at_ar_supp', name = 'Suppressor AUG',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },

            ----------------- weapon_mg (MG)

            ['extendedclipmg'] = {
                index = 'component_mg_clip_02', name = 'Pente Extendido MG',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['scopemg2x'] = {
                index = 'component_at_scope_small_02', name = 'Mira 2X MG',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxuremg'] = {
                index = 'component_mg_varmod_lowrider', name = 'Luxure MG',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ----------------- weapon_combatmg (CAMBAT MG)
            ['extendedclipcombatmg'] = {
                index = 'component_combatmg_clip_02', name = 'Extendido MG Combate',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['scopecombatmg2x'] = {
                index = 'component_at_scope_medium', name = 'Mira 2X MG Combate',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxurecombatmg'] = {
                index = 'component_combatmg_varmod_lowrider', name = 'Luxure MG Combate',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['gripcombatmg'] = {
                index = 'component_at_ar_afgrip', name = 'Grip MG Combate',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },




            -- R ATTACHS weapon_combatmg_mk2 
            
            ['extendedclicombatmgc'] = {
                index = 'component_combatmg_mk2_clip_02', name = 'Extendido CombatMGC',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['gripcombatmgc'] = {
                index = 'component_at_ar_afgrip_02', name = 'Grip CombatMGC',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            --MIRAS
            ['scopeholocombatmgc'] = {
                index = 'component_at_sights', name = 'Mira Holografica CombatMGC',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['scopecombatmgc2x'] = {
                index = 'component_at_scope_small_mk2', name = 'Mira 2X CombatMGC',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['scopeqcombatmgc4x'] = {
                index = 'component_at_scope_medium_mk2', name = 'Mira 4X CombatMGC',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            -- Cano PESADO
            ['scopecombatmgccanopesado'] = {
                index = 'component_at_mg_barrel_02', name = 'Cano Pesado CombatMGC',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            -- FREIO DE BOCA

            ['freiodebocacombatmgccpano'] = {
                index = 'component_at_muzzle_01', name = 'Freiodeboca Pano CombatMGC',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocacombatmgcctatico'] = {
                index = 'component_at_muzzle_02', name = 'Freiodeboca Tatico CombatMGC',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocacombatmgccgorda'] = {
                index = 'component_at_muzzle_03', name = 'Freiodeboca Gorda CombatMGC',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocacombatmgccprecisao'] = {
                index = 'component_at_muzzle_04', name = 'Freiodeboca precisão CombatMGC',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocacombatmgccpesado'] = {
                index = 'component_at_muzzle_05', name = 'Freiodeboca pesado CombatMGC',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocacombatmgccinclinado'] = {
                index = 'component_at_muzzle_06', name = 'Freiodeboca inclinado CombatMGC',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocacombatmgccpontadividida'] = {
                index = 'component_at_muzzle_07', name = 'Freiodeboca pontadividida CombatMGC',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },

            -- SKINS (combatmgc) 
            ['luxurecombatmgcdigitalcamo'] = {
                index = 'component_combatmg_mk2_camo', name = 'Luxure DigitalCamo CombatMGC',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxurecombatmgccamuflagem'] = {
                index = 'component_combatmg_mk2_camo_02', name = 'Luxure Camuflagem CombatMGC',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxurecombatmgccamuflagemfloresta'] = {
                index = 'component_combatmg_mk2_camo_03', name = 'Luxure CamuflagemFloresta CombatMGC',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxurecombatmgccaveira'] = {
                index = 'component_combatmg_mk2_camo_04', name = 'Luxure Caveira CombatMGC',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxurecombatmgcnovela'] = {
                index = 'component_combatmg_mk2_camo_05', name = 'Luxure Novela CombatMGC',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxurecombatmgcperceu'] = {
                index = 'component_combatmg_mk2_camo_06', name = 'Luxure Perceu CombatMGC',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxurecombatmgcleopardo'] = {
                index = 'component_combatmg_mk2_camo_07', name = 'Luxure Leopardo CombatMGC',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxurecombatmgczebra'] = {
                index = 'component_combatmg_mk2_camo_08', name = 'Luxure Zebra CombatMGC',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxurecombatmgcgeometria'] = {
                index = 'component_combatmg_mk2_camo_09', name = 'Luxure Geometria CombatMGC',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxurecombatmgcboom'] = {
                index = 'component_combatmg_mk2_camo_10', name = 'Luxure BOOM CombatMGC',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxurecombatmgcpatriot'] = {
                index = 'component_combatmg_mk2_camo_ind_01', name = 'Luxure Patriot CombatMGC',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },

            -- SKINS (marksmanrifle) 
            ['luxuremarksmanrifledigitalcamo'] = {
                index = 'component_marksmanrifle_mk2_camo', name = 'Luxure DigitalCamo marksmanrifle',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxuremarksmanriflecamuflagem'] = {
                index = 'component_marksmanrifle_mk2_camo_02', name = 'Luxure Camuflagem marksmanrifle',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxuremarksmanriflecamuflagemfloresta'] = {
                index = 'component_marksmanrifle_mk2_camo_03', name = 'Luxure CamuflagemFloresta marksmanrifle',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxuremarksmanriflecaveira'] = {
                index = 'component_marksmanrifle_mk2_camo_04', name = 'Luxure Caveira marksmanrifle',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxuremarksmanriflenovela'] = {
                index = 'component_marksmanrifle_mk2_camo_05', name = 'Luxure Novela marksmanrifle',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxuremarksmanrifleperceu'] = {
                index = 'component_marksmanrifle_mk2_camo_06', name = 'Luxure Perceu marksmanrifle',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxuremarksmanrifleleopardo'] = {
                index = 'component_marksmanrifle_mk2_camo_07', name = 'Luxure Leopardo marksmanrifle',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxuremarksmanriflezebra'] = {
                index = 'component_marksmanrifle_mk2_camo_08', name = 'Luxure Zebra marksmanrifle',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxuremarksmanriflegeometria'] = {
                index = 'component_marksmanrifle_mk2_camo_09', name = 'Luxure Geometria marksmanrifle',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxuremarksmanrifleboom'] = {
                index = 'component_marksmanrifle_mk2_camo_10', name = 'Luxure BOOM marksmanrifle',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxuremarksmanriflepatriot'] = {
                index = 'component_marksmanrifle_mk2_camo_ind_01', name = 'Luxure Patriot marksmanrifle',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },



            -- R ATTACHS weapon_marksmanrifle  (marksmanrifle) 

            ['extendedclimarksmanriflec'] = {
                index = 'component_marksmanrifle_mk2_clip_02', name = 'Pente Extendido marksmanrifle',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['silenciadormarksmanriflec'] = {
                index = 'component_at_ar_supp', name = 'Silenciador marksmanrifle',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['flashqmarksmanriflec'] = {
                index = 'component_at_ar_flsh', name = 'Lanterna marksmanrifle',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['gripmarksmanriflec'] = {
                index = 'component_at_ar_afgrip_02', name = 'Grip marksmanrifle',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            --MIRAS
            ['scopeholomarksmanriflec'] = {
                index = 'component_at_sights', name = 'Mira Holografica marksmanrifle',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['scopemarksmanriflec10x'] = {
                index = 'component_at_scope_medium_mk2', name = 'Mira 10X marksmanrifle',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['scopeqmarksmanrifle15x'] = {
                index = 'component_at_scope_large_fixed_zoom_mk2', name = 'Mira 15X marksmanrifle',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            -- Cano PESADO
            ['scopemarksmanriflecanopesado'] = {
                index = 'component_at_mrfl_barrel_02', name = 'Cano Pesado marksmanrifle',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            -- FREIO DE BOCA

            ['freiodebocamarksmanriflecpano'] = {
                index = 'component_at_muzzle_01', name = 'Freiodeboca Pano marksmanrifle',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocamarksmanriflectatico'] = {
                index = 'component_at_muzzle_02', name = 'Freiodeboca Tatico marksmanrifle',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocamarksmanriflecgorda'] = {
                index = 'component_at_muzzle_03', name = 'Freiodeboca Gorda marksmanrifle',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocamarksmanriflecprecisao'] = {
                index = 'component_at_muzzle_04', name = 'Freiodeboca precisão marksmanrifle',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocamarksmanriflecpesado'] = {
                index = 'component_at_muzzle_05', name = 'Freiodeboca pesado marksmanrifle',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocamarksmanriflecinclinado'] = {
                index = 'component_at_muzzle_06', name = 'Freiodeboca inclinado marksmanrifle',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['freiodebocamarksmanriflecpontadividida'] = {
                index = 'component_at_muzzle_07', name = 'Freiodeboca pontadividida marksmanrifle',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },

            -- R ATTACHS weapon_marksmanrifle  (heavysnipermk2) 

            ['extendedheavysnipermk2riflec'] = {
                index = 'component_heavysniper_mk2_clip_02', name = 'Pente Extendido heavysnipermk2rifle',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['silenciadorheavysnipermk2riflec'] = {
                index = 'component_at_sr_supp_03', name = 'Silenciador heavysnipermk2rifle',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['heavysnipermk2nitvision'] = {
                index = 'component_at_scope_nv', name = 'Nitvision heavysnipermk2rifle',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['heavysnipermk2thermal'] = {
                index = 'component_at_scope_thermal', name = 'thermal heavysnipermk2rifle',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            -- SKINS (heavysnipermk2) 


            ['luxureheavysnipermk2digitalcamo'] = {
                index = 'component_heavysniper_mk2_camo', name = 'Luxure DigitalCamo heavysnipermk2',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureheavysnipermk2camuflagem'] = {
                index = 'component_heavysniper_mk2_camo_02', name = 'Luxure Camuflagem heavysnipermk2',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureheavysnipermk2camuflagemfloresta'] = {
                index = 'component_heavysniper_mk2_camo_03', name = 'Luxure CamuflagemFloresta heavysnipermk2',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureheavysnipermk2caveira'] = {
                index = 'component_heavysniper_mk2_camo_04', name = 'Luxure Caveira heavysnipermk2',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureheavysnipermk2novela'] = {
                index = 'component_heavysniper_mk2_camo_05', name = 'Luxure Novela heavysnipermk2',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureheavysnipermk2perceu'] = {
                index = 'component_heavysniper_mk2_camo_06', name = 'Luxure Perceu heavysnipermk2',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureheavysnipermk2leopardo'] = {
                index = 'component_heavysniper_mk2_camo_07', name = 'Luxure Leopardo heavysnipermk2',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureheavysnipermk2zebra'] = {
                index = 'component_heavysniper_mk2_camo_08', name = 'Luxure Zebra heavysnipermk2',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureheavysnipermk2geometria'] = {
                index = 'component_heavysniper_mk2_camo_09', name = 'Luxure Geometria heavysnipermk2',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureheavysnipermk2boom'] = {
                index = 'component_heavysniper_mk2_camo_10', name = 'Luxure BOOM heavysnipermk2',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxureheavysnipermk2patriot'] = {
                index = 'component_heavysniper_mk2_camo_ind_01', name = 'Luxure Patriot heavysnipermk2',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },


            --ATTACHS weapon_sniperrifle
            ['suppressorsniperrifle'] = {
                index = 'component_at_ar_supp_02', name = 'Suppressor Sniper Rifle',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['scopesniperrifle15x'] = {
                index = 'component_at_scope_max', name = 'Mira 15x Sniper Rifle',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxuresniperrifle'] = {
                index = 'component_sniperrifle_varmod_luxe', name = 'Luxure Sniper Rifle',  img = 'dourado',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            
            --ATTACHS Gusenberg
            ['extendedgusenberg'] = {
                index = 'component_gusenberg_clip_02', name = 'Extendido Gusenberg',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },


            --ATTACHS PISTOL 9mm
            ['suppressorpistol'] = {
                index = 'component_at_pi_supp_02', name = 'Suppressor Pistol',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['extendedpistol'] = {
                index = 'component_pistol_clip_02', name = 'Extended Clip Pistol',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['flashlightpistol'] = {
                index = 'component_at_pi_flsh', name = 'Flashlight Pistol',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxurypistol'] = {
                index = 'component_pistol_varmod_luxe', name = 'Luxury Pistol',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            
            --ATTACHS COMBAT PISTOL 9mm
            ['extendedcombatpistol'] = {
                index = 'component_combatpistol_clip_02', name = 'Extended CombatPistol',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['flashcombatpistol'] = {
                index = 'component_at_pi_flsh', name = 'Flashlight CombatPistol',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['suppressorcombatpistol'] = {
                index = 'component_at_pi_supp', name = 'Suppressor CombatPistol',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['luxurycombatpistol'] = {
                index = 'component_combatpistol_varmod_lowrider', name = 'Luxury CombatPistol',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            
            --ATTACHS APP PISTOL 9mm
            ['extendedappistol'] = {
                index = 'component_appistol_clip_02', name = 'Extended APP Pistol',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['flashappistol'] = {
                index = 'component_at_pi_flsh', name = 'Flashlight APP Pistol',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['suppressorappistol'] = {
                index = 'component_at_pi_supp', name = 'Suppressor APP Pistol',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['metalappistol'] = {
                index = 'component_appistol_varmod_luxe', name = 'Metal APP Pistol',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            
            
            --ATTACHS  PISTOL 50mm
            ['extendedpistol50'] = {
                index = 'component_pistol50_clip_02', name = 'Extended Pistol .50',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['flashpistol50'] = {
                index = 'component_at_pi_flsh', name = 'Flashlight Pistol .50',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['suppressorpistol50'] = {
                index = 'component_at_ar_supp_02', name = 'Suppressor Pistol .50',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['deluxepistol50'] = {
                index = 'component_pistol50_varmod_luxe', name = 'Deluxe Pistol .50',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            
            
            --ATTACHS  heavyRevolver 
            ['vipheavyrevolver'] = {
                index = 'component_revolver_varmod_boss', name = 'Vip heavy Revolver',  img = 'corvina',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['bodyguardheavyrevolver'] = {
                index = 'component_revolver_varmod_goon', name = 'Bodyguard heavy Revolver',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            
            --ATTACHS  snspistol
            ['extendedsnspistol'] = {
                index = 'component_snspistol_clip_02', name = 'Extended Sns Pistol',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['woodgripsnspistol'] = {
                index = 'component_snspistol_varmod_lowrider', name = 'WoodGrip  Sns Pistol',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            
            --ATTACHS  heavyPistol
            ['extendedheavypistol'] = {
                index = 'component_heavypistol_clip_02', name = 'Extended Heavy Pistol',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['flashheavypistol'] = {
                index = 'component_at_pi_flsh', name = 'Flashlight Heavy Pistol',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['suppressorheavypistol'] = {
                index = 'component_at_pi_supp', name = 'Suppressor Heavy Pistol',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },
            ['deluxeheavypistol'] = {
                index = 'component_heavypistol_varmod_luxe', name = 'Deluxe Heavy Pistol',  img = '',  type = 'attachs',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true 
            },

            -- ITEM EMPREGROS

            -- FAZENDEIRO
            ['laranja'] = {
                index = 'laranja', name = 'laranja',  img = '',  type = 'use',  weight = 0.9,  use = false,  drop = false,  send = false,  store = true 
            },
            ['tomate'] = {
                index = 'tomate', name = 'tomate',  img = '',  type = 'use',  weight = 0.9,  use = false,  drop = false,  send = false,  store = true 
            },
            ['garrafadeleite'] = {
                index = 'garrafadeleite', name = 'garrafadeleite',  img = '',  type = 'use',  weight = 0.9,  use = false,  drop = false,  send = false,  store = true 
            },
            ['garrafavazia'] = {
                index = 'garrafavazia', name = 'garrafavazia',  img = '',  type = 'use',  weight = 0.9,  use = false,  drop = false,  send = false,  store = true 
            },

            -- PESCADOR
            ['isca'] = {
                index = 'isca', name = 'isca',  img = '',  type = 'use',  weight = 0.9,  use = false,  drop = false,  send = false,  store = true 
            },
            ['dourado'] = {
                index = 'dourado', name = 'dourado',  img = 'dourado',  type = 'use',  weight = 0.9,  use = false,  drop = false,  send = false,  store = true 
            },
            ['corvina'] = {
                index = 'corvina', name = 'corvina',  img = '',  type = 'use',  weight = 0.9,  use = false,  drop = false,  send = false,  store = true 
            },
            ['salmao'] = {
                index = 'salmao', name = 'salmao',  img = '',  type = 'use',  weight = 0.9,  use = false,  drop = false,  send = false,  store = true 
            },
            ['pacu'] = {
                index = 'pacu', name = 'pacu',  img = '',  type = 'use',  weight = 0.9,  use = false,  drop = false,  send = false,  store = true 
            },
            ['pintado'] = {
                index = 'pintado', name = 'pintado',  img = '',  type = 'use',  weight = 0.9,  use = false,  drop = false,  send = false,  store = true 
            },
            ['pirarucu'] = {
                index = 'pirarucu', name = 'pirarucu',  img = '',  type = 'use',  weight = 0.9,  use = false,  drop = false,  send = false,  store = true 
            },
            ['tilapia'] = {
                index = 'tilapia', name = 'tilapia',  img = '',  type = 'use',  weight = 0.9,  use = false,  drop = false,  send = false,  store = true 
            },
            ['tucunare'] = {
                index = 'tucunare', name = 'tucunare',  img = '',  type = 'use',  weight = 0.9,  use = false,  drop = false,  send = false,  store = true 
            },

            -- MINERADOR
            ['bronze'] = {
                index = 'bronze', name = 'bronze',  img = '',  type = 'use',  weight = 0.9,  use = false,  drop = false,  send = false,  store = true 
            },
            ['ferro'] = {
                index = 'ferro', name = 'ferro',  img = '',  type = 'use',  weight = 0.9,  use = false,  drop = false,  send = false,  store = true 
            },
            ['ouro'] = {
                index = 'ouro', name = 'ouro',  img = '',  type = 'use',  weight = 0.9,  use = false,  drop = false,  send = false,  store = true 
            },
            ['rubi'] = {
                index = 'rubi', name = 'rubi',  img = '',  type = 'use',  weight = 0.9,  use = false,  drop = false,  send = false,  store = true 
            },
            ['esmeralda'] = {
                index = 'esmeralda', name = 'esmeralda',  img = '',  type = 'use',  weight = 0.9,  use = false,  drop = false,  send = false,  store = true 
            },
            ['safira'] = {
                index = 'safira', name = 'safira',  img = '',  type = 'use',  weight = 0.9,  use = false,  drop = false,  send = false,  store = true 
            },
            ['diamante'] = {
                index = 'diamante', name = 'diamante',  img = '',  type = 'use',  weight = 0.9,  use = false,  drop = false,  send = false,  store = true 
            },
            ['topazio'] = {
                index = 'topazio', name = 'topazio',  img = '',  type = 'use',  weight = 0.9,  use = false,  drop = false,  send = false,  store = true 
            },
            ['ametista'] = {
                index = 'ametista', name = 'ametista',  img = '',  type = 'use',  weight = 0.9,  use = false,  drop = false,  send = false,  store = true 
            },

            
            ['corrente'] = {
                index = 'corrente', name = 'Corrente',  img = '',  type = 'use',  weight = 0.9,  use = true,  drop = false,  send = false,  store = true 
            },           

            ['algema'] = {
                index = 'algema', name = 'Algema',  img = 'dourado',  type = 'use',  weight = 0.8,  use = true,  drop = true,  send = true,  store = false
            },

            -- OUTROS ITENS

            ['dinheiro'] = {
                index = 'dinheiro', name = 'Dinheiro',  img = 'dourado',  type = 'use',  weight = 0.0,  use = true,  drop = true,  send = true, store = true
            },

            -- ITENS USAVEIS
            ['mochila1'] = {
                index = 'mochila1', name = 'Mochila Basica',  img = '',  type = 'use',  weight = 3.0,  use = true,  drop = true,  send = true,  store = true,
                action = function(src, charId)
                    local configInventory = NfwConfigs['inventoryGeneralConfig']
                    local data = NyoFw.getUserTable(charId)
                    local newWeight = 0
                    local atualizarMochila = false
                    if data and data.inventory and data.inventory.d and data.inventory.d.mw then 
                        local weight = data.inventory.d.mw 

                        if weight < configInventory.maxWeight then 
                            newWeight = weight + 10 
                            if newWeight <= configInventory.maxWeight then 
                                atualizarMochila = true
                            else 
                                atualizarMochila = true
                                newWeight = configInventory.maxWeight
                                TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-max-bag-weight', '#FF0000', 5000)
                            end
                        else 
                            TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-max-bag-weight2', '#FF0000', 5000)
                        end                       
                    else                       
                        newWeight = configInventory.defaultWeight + 10
                        atualizarMochila = true
                    end

                    if atualizarMochila then 
                        if NyoFw.tryGetInventoryItem(charId, 'mochila1', 1) then
                            data.inventory.d = {mw = newWeight}
                            local userInventory = NyoFw.getUserTable(charId).inventory
                            SafeEvents.triggerClient('Nfw/inventory/updateInventory',src,userInventory,NyoFw.computerItensWeight(userInventory), NyoFw.getInventoryMaxWeight(charId))
                        end                       
                    end
                end
            },

            ['mochila2'] = {
                index = 'mochila2', name = 'Mochila Intermediaria',  img = '',  type = 'use',  weight = 4.0,  use = true,  drop = true,  send = true,  store = true,
                action = function(src, charId)
                    local configInventory = NfwConfigs['inventoryGeneralConfig']
                    local data = NyoFw.getUserTable(charId)
                    local newWeight = 0
                    local atualizarMochila = false
                    if data and data.inventory and data.inventory.d and data.inventory.d.mw then 
                        local weight = data.inventory.d.mw 
                        if weight < configInventory.maxWeight then 
                            newWeight = weight + 20 
                            if newWeight <= configInventory.maxWeight then 
                                atualizarMochila = true
                            else 
                                atualizarMochila = true
                                newWeight = configInventory.maxWeight
                                TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-max-bag-weight', '#FF0000', 5000)
                            end
                        else 
                            TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-max-bag-weight2', '#FF0000', 5000)
                        end     
                    else                       
                        newWeight = configInventory.defaultWeight + 20
                        atualizarMochila = true
                    end

                    if atualizarMochila then 
                        if NyoFw.tryGetInventoryItem(charId, 'mochila2', 1) then
                            data.inventory.d = {mw = newWeight}
                            local userInventory = NyoFw.getUserTable(charId).inventory
                            SafeEvents.triggerClient('Nfw/inventory/updateInventory',src,userInventory,NyoFw.computerItensWeight(userInventory), NyoFw.getInventoryMaxWeight(charId))
                        end                       
                    end
                end
            },

            ['mochila3'] = {
                index = 'mochila3', name = 'Mochila Avançada',  img = '',  type = 'use',  weight = 5.0,  use = true,  drop = true,  send = true,  store = true,
                action = function(src, charId)
                    local configInventory = NfwConfigs['inventoryGeneralConfig']
                    local data = NyoFw.getUserTable(charId)
                    local newWeight = 0
                    local atualizarMochila = false
                    if data and data.inventory and data.inventory.d and data.inventory.d.mw then 
                        local weight = data.inventory.d.mw 
                        if weight < configInventory.maxWeight then 
                            newWeight = weight + 30 
                            if newWeight <= configInventory.maxWeight then 
                                atualizarMochila = true
                            else 
                                atualizarMochila = true
                                newWeight = configInventory.maxWeight
                                TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-max-bag-weight', '#FF0000', 5000)
                            end
                        else 
                            TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-max-bag-weight2', '#FF0000', 5000)
                        end     
                    else                       
                        newWeight = configInventory.defaultWeight + 30
                        atualizarMochila = true
                    end

                    if atualizarMochila then 
                        if NyoFw.tryGetInventoryItem(charId, 'mochila3', 1) then
                            data.inventory.d = {mw = newWeight}
                            local userInventory = NyoFw.getUserTable(charId).inventory
                            SafeEvents.triggerClient('Nfw/inventory/updateInventory',src,userInventory,NyoFw.computerItensWeight(userInventory), NyoFw.getInventoryMaxWeight(charId))
                        end                       
                    end
                end
            },

            ['galao'] = {
                index = 'galao', name = 'Galão de Combustivel',  img = '',  type = 'use',  weight = 5.0,  use = true,  drop = true,  send = true,  store = true,  
                action = function(src, charId)
                    local vehicle,vnetid,placa,vname,lock,banned,trunk = RPC.trigger("garages-getClosestVehicleInfo", src, 7.0)
                    if vehicle then 
                        if NyoFw.fuelCheckCar('car', vname) then 
                            if NyoFw.fuelCheckFuel(vnetid) then 
                                if NyoFw.tryGetInventoryItem(charId, 'galao', 1) then 
                                    if RPC.trigger("nfw:inventory:close_ui", src) then 
                                        NyoFw.playAnim(src,false,{{"timetable@gardener@filling_can","gar_ig_5_filling_can"}},true)
                                        TriggerClientEvent("progress",src,15000,"Abastecendo")
                                        SetTimeout(15000,function()
                                            NyoFw.stopAnim(src,false)
                                            NyoFw.fuelSetFuel(vnetid, 25)
                                            print('abasteceu')
                                        end)
                                    end                                    
                                else 
                                    print('voce não possui o item')
                                end                               
                            else 
                                -- Notify que veiculo esta acima de 75% de combustivel
                                print('veiculo não localizado ou com tanque cheio')
                            end
                        else 
                            -- Notify que veiculo não pode receber este combustivel
                            print('combustivel errado')
                        end                        
                    else 
                        -- Notify que não localizou veiculo
                        print('não localizou')
                    end
                end
            },

            ['bateria'] = {
                index = 'bateria', name = 'Bateria',  img = '',  type = 'use',  weight = 5.0,  use = true,  drop = true,  send = true,  store = true,
                action = function(src, charId)
                    local vehicle,vnetid,placa,vname,lock,banned,trunk = RPC.trigger("garages-getClosestVehicleInfo", src, 7.0)
                    if vehicle then 
                        if NyoFw.fuelCheckCar('eletrical', vname) then 
                            if NyoFw.fuelCheckFuel(vnetid) then 
                                if NyoFw.tryGetInventoryItem(charId, 'bateria', 1) then 
                                    TriggerClientEvent("nfw:blockAnim", src, true)
                                    if RPC.trigger("nfw:inventory:close_ui", src) then 
                                        NyoFw.playAnim(src,false,{{"timetable@gardener@filling_can","gar_ig_5_filling_can"}},true)
                                        TriggerClientEvent("progress",src,15000,"Abastecendo")
                                        SetTimeout(15000,function()
                                            NyoFw.stopAnim(src,false)
                                            NyoFw.fuelSetFuel(vnetid, 25)
                                            TriggerClientEvent("nfw:blockAnim", src, false)
                                        end)
                                    end                                    
                                else 
                                    print('voce não possui o item')
                                end                               
                            else 
                                TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-invalid-vehicle-fuel2', '#FF0000', 5000)
                            end
                        else 
                            TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-invalid-vehicle-fuel', '#FF0000', 5000)
                        end                        
                    else 
                        TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-invalid-vehicle', '#FF0000', 5000)
                    end
                end
            },

            ['kitreparo'] = {
                index = 'kitreparo', name = 'Kit Reparo',  img = '',  type = 'use',  weight = 5.0,  use = true,  drop = true,  send = true,  store = true,
                action = function(src, charId)
                    local vehicle,vnetid,placa,vname,lock,banned,trunk = RPC.trigger("garages-getClosestVehicleInfo", src, 7.0)
                    if vehicle then 
                        if NyoFw.tryGetInventoryItem(charId, 'kitreparo', 1) then 
                            TriggerClientEvent("nfw:blockAnim", src, true)
                            if RPC.trigger("nfw:inventory:close_ui", src) then
                                NyoFw.playAnimByName(src, 'mecanico2')    
                                TriggerClientEvent("progress",src,15000,"Reparando") 
                                SetTimeout(15000,function()
                                    NyoFw.stopAnim(src,false)
                                    TriggerClientEvent("nfw:bennys:repairAll", src)
                                    TriggerClientEvent("nfw:blockAnim", src, false)
                                end)
                            end                            
                        end
                        
                    else 
                        TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-invalid-vehicle', '#FF0000', 5000)
                    end
                end
            },

            ['militec'] = {
                index = 'militec', name = 'Militec',  img = '',  type = 'use',  weight = 5.0,  use = true,  drop = true,  send = true,  store = true,
                action = function(src, charId)
                    local vehicle,vnetid,placa,vname,lock,banned,trunk = RPC.trigger("garages-getClosestVehicleInfo", src, 7.0)
                    if vehicle then 
                        if NyoFw.tryGetInventoryItem(charId, 'militec', 1) then 
                            TriggerClientEvent("nfw:blockAnim", src, true)
                            if RPC.trigger("nfw:inventory:close_ui", src) then
                                NyoFw.playAnimByName(src, 'mecanico2')    
                                TriggerClientEvent("progress",src,15000,"Reparando Motor") 
                                SetTimeout(15000,function()
                                    NyoFw.stopAnim(src,false)
                                    TriggerClientEvent("nfw:bennys:repairEngine", src)
                                    TriggerClientEvent("nfw:blockAnim", src, false)
                                end)
                            end                            
                        end
                        
                    else 
                        TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-invalid-vehicle', '#FF0000', 5000)
                    end
                end
            },

            ['lockpick'] = {
                index = 'lockpick', name = 'LockPick',  img = '',  type = 'use',  weight = 1.0,  use = true,  drop = true,  send = true,  store = true,
                action = function(src, charId)
                    local vehicle,vnetid,placa,vname,lock,banned,trunk = RPC.trigger("garages-getClosestVehicleInfo", src, 7.0)
                    if vehicle then
                        if lock == 2 then           
                             if NyoFw.tryGetInventoryItem(charId, 'lockpick', 1) then 
                                TriggerClientEvent("nfw:blockAnim", src, true)
                                if RPC.trigger("nfw:inventory:close_ui", src) then
                                    NyoFw.playAnimByName(src, 'mecanico2')    
                                    TriggerClientEvent("progress",src,10000,"Destrancando veiculo") 
                                    SetTimeout(10000,function()
                                        NyoFw.stopAnim(src,false)
                                        local entity = NetworkGetEntityFromNetworkId(vnetid)
                                        SetVehicleDoorsLocked(entity, 1)
                                        TriggerClientEvent("nfw:garagem:playVehicleAlarm", src, vnetid, 60000)
                                        TriggerClientEvent("nfw:blockAnim", src, false)
                                    end)
                                end                            
                            end
                        else 
                            TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-vehicleNotLock', '#FF0000', 5000)
                        end
                       
                        
                    else 
                        TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'action-error', 'action-error-invalid-vehicle', '#FF0000', 5000)
                    end
                end
            },          
            
            ['hamburger'] = {
                index = 'hamburger', name = 'Hamburger',  img = '',  type = 'use',  weight = 0.5,  use = true,  drop = true,  send = true,  store = true,
                action = function(src, charId)
                    if NyoFw.tryGetInventoryItem(charId, 'hamburger', 1) then 
                        TriggerClientEvent("nfw:blockAnim", src, true)
                        if RPC.trigger("nfw:inventory:close_ui", src) then
                            NyoFw.carregarObjeto(src, 'amb@code_human_wander_eating_donut@male@idle_a', 'idle_c',"prop_cs_burger_01", 49, 28422)
                            TriggerClientEvent("progress",src,10000,"Comendo Hamburger")
                            SetTimeout(10000,function()
                                NyoFw.setHunger(src, 20)
                                NyoFw.deleteObject(src)
                                TriggerClientEvent("nfw:blockAnim", src, false)
                            end)
                        end
                    end
                end
            },          

            ['agua'] = {
                index = 'agua', name = 'Agua',  img = '',  type = 'use',  weight = 0.5,  use = true,  drop = true,  send = true,  store = true,
                action = function(src, charId)
                    if NyoFw.tryGetInventoryItem(charId, 'agua', 1) then 
                        TriggerClientEvent("nfw:blockAnim", src, true)
                        if RPC.trigger("nfw:inventory:close_ui", src) then
                            NyoFw.carregarObjeto(src, "amb@world_human_drinking@beer@male@idle_a","idle_a","ba_prop_club_water_bottle", 49, 28422)
                            TriggerClientEvent("progress",src,10000,"Bebendo Agua")
                            SetTimeout(10000,function()
                                NyoFw.setThirst(src, 20)
                                NyoFw.deleteObject(src)
                                TriggerClientEvent("nfw:blockAnim", src, false)
                            end)
                        end
                    end
                end
            },          
            
        },

        ['inventoryWeaponConfig'] = {
            
            ['weapon_assaultrifle'] = {
                weaponType = 'primary',
                ammoType = 'mun762',
                attachs = {
                    ['component_at_ar_supp_02'] = { active = true, type = 'suppresor' },
                    ['component_at_scope_macro'] = { active = true, type = 'scope' },
                    ['component_assaultrifle_clip_02'] = { active = true, type = 'extenderammo' },
                    ['component_assaultrifle_clip_03'] = { active = true, type = 'extenderammo' },
                    ['component_at_ar_flsh'] = { active = true, type = 'light' },
                    ['component_at_ar_afgrip'] = { active = true, type = 'grip' },
                    ['component_assaultrifle_varmod_luxe'] = { active = true, type = 'akluxure' },
                }
            },
            ['weapon_carbinerifle'] = {
                weaponType = 'primary',
                ammoType = 'mun556',
                attachs = {
                    ['component_carbinerifle_clip_02'] = { active = true, type = 'extenderammo' },
                    ['component_carbinerifle_clip_03'] = { active = true, type = 'extenderammo' },
                    ['component_at_ar_flsh'] = { active = true, type = 'light' },
                    ['component_at_scope_medium'] = { active = true, type = 'scope' },
                    ['component_at_ar_supp'] = { active = true, type = 'suppresor' },
                    ['component_at_ar_afgrip'] = { active = true, type = 'grip' },
                    ['component_carbinerifle_varmod_luxe'] = { active = true, type = 'm4luxure' },
                }
            },
            ['weapon_advancedrifle'] = {
                weaponType = 'primary',
                ammoType = 'mun556',
                attachs = {
                    ['component_advancedrifle_clip_02'] = { active = true, type = 'extenderammo' },
                    ['component_at_ar_flsh'] = { active = true, type = 'light' },
                    ['component_at_scope_small'] = { active = true, type = 'scope' },
                    ['component_at_ar_supp'] = { active = true, type = 'suppresor' },
                    ['component_advancedrifle_varmod_luxe'] = { active = true, type = 'adluxuremetal' },
                }
            },
            ['weapon_specialcarbine'] = {
                weaponType = 'primary',
                ammoType = 'mun556',
                attachs = {
                    ['component_specialcarbine_clip_02'] = { active = true, type = 'extenderammo' },
                    ['component_specialcarbine_clip_03'] = { active = true, type = 'extenderammo' },
                    ['component_at_ar_flsh'] = { active = true, type = 'light' },
                    ['component_at_scope_medium'] = { active = true, type = 'scope' },
                    ['component_at_ar_supp_02'] = { active = true, type = 'suppresor' },
                    ['component_at_ar_afgrip'] = { active = true, type = 'grip' },
                    ['component_specialcarbine_varmod_lowrider'] = { active = true, type = 'sm4luxure' },
                }
            },
            ['weapon_bullpuprifle'] = {
                weaponType = 'primary',
                ammoType = 'mun762',
                attachs = {
                    ['component_bullpuprifle_clip_02'] = { active = true, type = 'extenderammo' },
                    ['component_at_ar_flsh'] = { active = true, type = 'light' },
                    ['component_at_scope_small'] = { active = true, type = 'scope' },
                    ['component_at_ar_supp'] = { active = true, type = 'suppresor' },
                    ['component_at_ar_afgrip'] = { active = true, type = 'grip' },
                    ['component_bullpuprifle_varmod_low'] = { active = true, type = 'bullluxure' },
                }
            },
            ['weapon_assaultrifle_mk2'] = {
                weaponType = 'primary',
                ammoType = 'mun762',
                attachs = {
                    ['component_assaultrifle_mk2_clip_02'] = { active = true, type = 'extenderammo' },
                    ['component_at_ar_flsh'] = { active = true, type = 'light' },
                    ['component_at_ar_afgrip_02'] = { active = true, type = 'grip' },
                    ['component_at_ar_supp_02'] = { active = true, type = 'suppresor' },
                    
                    -- MIRAS
                    ['component_at_sights'] = { active = true, type = 'holographicsight' },
                    ['component_at_scope_macro_mk2'] = { active = true, type = 'smallscope' },
                    ['component_at_scope_medium_mk2'] = { active = true, type = 'Mediumscope' },

                    -- FREIO DE BOCA
                    ['component_at_muzzle_01'] = { active = true, type = 'FlatMuzzleBrake' },
                    ['component_at_muzzle_02'] = { active = true, type = 'TacticalMuzzleBrake' },
                    ['component_at_muzzle_03'] = { active = true, type = 'FatEndMuzzleBrake' },
                    ['component_at_muzzle_04'] = { active = true, type = 'PrecisionMuzzleBrake' },
                    ['component_at_muzzle_05'] = { active = true, type = 'HeavyDutyMuzzleBrake' },
                    ['component_at_muzzle_06'] = { active = true, type = 'SlantedMuzzleBrake' },
                    ['component_at_muzzle_07'] = { active = true, type = 'SplitEndMuzzleBrake' },

                    --- CANO
                    ['component_at_ar_barrel_02'] = { active = true, type = 'HeavyBarrel' },

                    --skins
                    ['component_assaultrifle_mk2_camo'] = { active = true, type = 'DigitalCamo' },
                    ['component_assaultrifle_mk2_camo_02'] = { active = true, type = 'BrushstrokeCamo' },
                    ['component_assaultrifle_mk2_camo_03'] = { active = true, type = 'WoodlandCamo' },
                    ['component_assaultrifle_mk2_camo_04'] = { active = true, type = 'Skull' },
                    ['component_assaultrifle_mk2_camo_05'] = { active = true, type = 'SessantaNove' },
                    ['component_assaultrifle_mk2_camo_06'] = { active = true, type = 'Perseus' },
                    ['component_assaultrifle_mk2_camo_07'] = { active = true, type = 'Leopard' },
                    ['component_assaultrifle_mk2_camo_08'] = { active = true, type = 'Zebra' },
                    ['component_assaultrifle_mk2_camo_09'] = { active = true, type = 'Geometric' },
                    ['component_assaultrifle_mk2_camo_10'] = { active = true, type = 'Boom' },
                    ['component_assaultrifle_mk2_camo_ind_01'] = { active = true, type = 'Patriotic' },
                }
            },
            ['weapon_bullpuprifle_mk2'] = {
                weaponType = 'primary',
                ammoType = 'mun762',
                attachs = {
                    ['component_bullpuprifle_mk2_clip_02'] = { active = true, type = 'extenderammo' },
                    ['component_at_ar_flsh'] = { active = true, type = 'light' },
                    ['component_at_ar_supp'] = { active = true, type = 'suppressor' },
                    ['component_at_ar_afgrip_02'] = { active = true, type = 'grip' },
                    -- MUNINÇÕES
                    ['component_bullpuprifle_mk2_clip_tracer'] = { active = true, type = 'muntracer' },
                    ['component_bullpuprifle_mk2_clip_incendiary'] = { active = true, type = 'munindendiary' },
                    ['component_bullpuprifle_mk2_clip_armorpiercing'] = { active = true, type = 'munarmorpicercing' },
                    ['component_bullpuprifle_mk2_clip_fmj'] = { active = true, type = 'munarmorpicercing' },
                    -- MIRAS
                    
                    ['component_at_sights'] = { active = true, type = 'holographicsight' },
                    ['component_at_scope_macro_02_mk2'] = { active = true, type = 'smallscope' },
                    ['component_at_scope_small_mk2'] = { active = true, type = 'Mediumscope' },

                    --- CANO
                    ['component_at_bp_barrel_02'] = { active = true, type = 'HeavyBarrel' },
                    
                    -- FREIO DE BOCA
                    ['component_at_muzzle_01'] = { active = true, type = 'FlatMuzzleBrake' },
                    ['component_at_muzzle_02'] = { active = true, type = 'TacticalMuzzleBrake' },
                    ['component_at_muzzle_03'] = { active = true, type = 'FatEndMuzzleBrake' },
                    ['component_at_muzzle_04'] = { active = true, type = 'PrecisionMuzzleBrake' },
                    ['component_at_muzzle_05'] = { active = true, type = 'HeavyDutyMuzzleBrake' },
                    ['component_at_muzzle_06'] = { active = true, type = 'SlantedMuzzleBrake' },
                    ['component_at_muzzle_07'] = { active = true, type = 'SplitEndMuzzleBrake' },

                    --skins
                    ['component_bullpuprifle_mk2_camo'] = { active = true, type = 'DigitalCamo' },
                    ['component_bullpuprifle_mk2_camo_02'] = { active = true, type = 'BrushstrokeCamo' },
                    ['component_bullpuprifle_mk2_camo_03'] = { active = true, type = 'WoodlandCamo' },
                    ['component_bullpuprifle_mk2_camo_04'] = { active = true, type = 'Skull' },
                    ['component_bullpuprifle_mk2_camo_05'] = { active = true, type = 'SessantaNove' },
                    ['component_bullpuprifle_mk2_camo_06'] = { active = true, type = 'Perseus' },
                    ['component_bullpuprifle_mk2_camo_07'] = { active = true, type = 'Leopard' },
                    ['component_bullpuprifle_mk2_camo_08'] = { active = true, type = 'Zebra' },
                    ['component_bullpuprifle_mk2_camo_09'] = { active = true, type = 'Geometric' },
                    ['component_bullpuprifle_mk2_camo_10'] = { active = true, type = 'Boom' },
                    ['component_bullpuprifle_mk2_camo_ind_01'] = { active = true, type = 'Patriotic' },
                }
            },
            ['weapon_specialcarbine_mk2'] = {
                weaponType = 'primary',
                ammoType = 'mun762',
                attachs = {
                    ['component_specialcarbine_mk2_clip_02'] = { active = true, type = 'extenderammo' },
                    ['component_at_ar_flsh'] = { active = true, type = 'light' },
                    ['component_at_ar_supp_02'] = { active = true, type = 'suppressor' },
                    ['component_at_ar_afgrip_02'] = { active = true, type = 'grip' },


                    --MIRAS
                    ['component_at_sights'] = { active = true, type = 'holographicsight' },
                    ['component_at_scope_macro_mk2'] = { active = true, type = 'smallscope' },
                    ['component_at_scope_medium_mk2'] = { active = true, type = 'Mediumscope' },
                    --- CANO
                    ['component_at_sc_barrel_02'] = { active = true, type = 'HeavyBarrel' },

                    -- FREIO DE BOCA
                    ['component_at_muzzle_01'] = { active = true, type = 'FlatMuzzleBrake' },
                    ['component_at_muzzle_02'] = { active = true, type = 'TacticalMuzzleBrake' },
                    ['component_at_muzzle_03'] = { active = true, type = 'FatEndMuzzleBrake' },
                    ['component_at_muzzle_04'] = { active = true, type = 'PrecisionMuzzleBrake' },
                    ['component_at_muzzle_05'] = { active = true, type = 'HeavyDutyMuzzleBrake' },
                    ['component_at_muzzle_06'] = { active = true, type = 'SlantedMuzzleBrake' },
                    ['component_at_muzzle_07'] = { active = true, type = 'SplitEndMuzzleBrake' },

                    --skins
                    ['component_specialcarbine_mk2_camo'] = { active = true, type = 'DigitalCamo' },
                    ['component_specialcarbine_mk2_camo_02'] = { active = true, type = 'BrushstrokeCamo' },
                    ['component_specialcarbine_mk2_camo_03'] = { active = true, type = 'WoodlandCamo' },
                    ['component_specialcarbine_mk2_camo_04'] = { active = true, type = 'Skull' },
                    ['component_specialcarbine_mk2_camo_05'] = { active = true, type = 'SessantaNove' },
                    ['component_specialcarbine_mk2_camo_06'] = { active = true, type = 'Perseus' },
                    ['component_specialcarbine_mk2_camo_07'] = { active = true, type = 'Leopard' },
                    ['component_specialcarbine_mk2_camo_08'] = { active = true, type = 'Zebra' },
                    ['component_specialcarbine_mk2_camo_09'] = { active = true, type = 'Geometric' },
                    ['component_specialcarbine_mk2_camo_10'] = { active = true, type = 'Boom' },
                    ['component_specialcarbine_mk2_camo_ind_01'] = { active = true, type = 'Patriotic' },
                }                
            },
            ['weapon_carbinerifle_mk2'] = {
                weaponType = 'primary',
                ammoType = 'mun556',
                attachs = {
                    ['component_carbinerifle_mk2_clip_02'] = { active = true, type = 'extenderammo' },
                    ['component_at_ar_flsh'] = { active = true, type = 'light' },
                    ['component_at_ar_supp'] = { active = true, type = 'suppressor' },
                    ['component_at_ar_afgrip_02'] = { active = true, type = 'grip' },


                    --MIRAS
                    ['component_at_sights'] = { active = true, type = 'holographicsight' },
                    ['component_at_scope_macro_mk2'] = { active = true, type = 'smallscope' },
                    ['component_at_scope_medium_mk2'] = { active = true, type = 'Mediumscope' },
                    --- CANO
                    ['component_at_cr_barrel_02'] = { active = true, type = 'HeavyBarrel' },

                    -- FREIO DE BOCA
                    ['component_at_muzzle_01'] = { active = true, type = 'FlatMuzzleBrake' },
                    ['component_at_muzzle_02'] = { active = true, type = 'TacticalMuzzleBrake' },
                    ['component_at_muzzle_03'] = { active = true, type = 'FatEndMuzzleBrake' },
                    ['component_at_muzzle_04'] = { active = true, type = 'PrecisionMuzzleBrake' },
                    ['component_at_muzzle_05'] = { active = true, type = 'HeavyDutyMuzzleBrake' },
                    ['component_at_muzzle_06'] = { active = true, type = 'SlantedMuzzleBrake' },
                    ['component_at_muzzle_07'] = { active = true, type = 'SplitEndMuzzleBrake' },

                    --skins
                    ['component_carbinerifle_mk2_camo'] = { active = true, type = 'DigitalCamo' },
                    ['component_carbinerifle_mk2_camo_02'] = { active = true, type = 'BrushstrokeCamo' },
                    ['component_carbinerifle_mk2_camo_03'] = { active = true, type = 'WoodlandCamo' },
                    ['component_carbinerifle_mk2_camo_04'] = { active = true, type = 'Skull' },
                    ['component_carbinerifle_mk2_camo_05'] = { active = true, type = 'SessantaNove' },
                    ['component_carbinerifle_mk2_camo_06'] = { active = true, type = 'Perseus' },
                    ['component_carbinerifle_mk2_camo_07'] = { active = true, type = 'Leopard' },
                    ['component_carbinerifle_mk2_camo_08'] = { active = true, type = 'Zebra' },
                    ['component_carbinerifle_mk2_camo_09'] = { active = true, type = 'Geometric' },
                    ['component_carbinerifle_mk2_camo_10'] = { active = true, type = 'Boom' },
                    ['component_carbinerifle_mk2_camo_ind_01'] = { active = true, type = 'Patriotic' },
                }                
            },
            ['weapon_combatmg_mk2'] = {
                weaponType = 'primary',
                ammoType = 'mun556',
                attachs = {
                    ['component_combatmg_mk2_clip_02'] = { active = true, type = 'extenderammo' },
                    ['component_at_ar_afgrip_02'] = { active = true, type = 'grip' },
                    --MIRAS
                    ['component_at_sights'] = { active = true, type = 'holographicsight' },
                    ['component_at_scope_small_mk2'] = { active = true, type = 'smallscope' },
                    ['component_at_scope_medium_mk2'] = { active = true, type = 'Mediumscope' },
                    --- CANO
                    ['component_at_mg_barrel_02'] = { active = true, type = 'HeavyBarrel' },
                    -- FREIO DE BOCA
                    ['component_at_muzzle_01'] = { active = true, type = 'FlatMuzzleBrake' },
                    ['component_at_muzzle_02'] = { active = true, type = 'TacticalMuzzleBrake' },
                    ['component_at_muzzle_03'] = { active = true, type = 'FatEndMuzzleBrake' },
                    ['component_at_muzzle_04'] = { active = true, type = 'PrecisionMuzzleBrake' },
                    ['component_at_muzzle_05'] = { active = true, type = 'HeavyDutyMuzzleBrake' },
                    ['component_at_muzzle_06'] = { active = true, type = 'SlantedMuzzleBrake' },
                    ['component_at_muzzle_07'] = { active = true, type = 'SplitEndMuzzleBrake' },
                    --skins
                    ['component_combatmg_mk2_camo'] = { active = true, type = 'DigitalCamo' },
                    ['component_combatmg_mk2_camo_02'] = { active = true, type = 'BrushstrokeCamo' },
                    ['component_combatmg_mk2_camo_03'] = { active = true, type = 'WoodlandCamo' },
                    ['component_combatmg_mk2_camo_04'] = { active = true, type = 'Skull' },
                    ['component_combatmg_mk2_camo_05'] = { active = true, type = 'SessantaNove' },
                    ['component_combatmg_mk2_camo_06'] = { active = true, type = 'Perseus' },
                    ['component_combatmg_mk2_camo_07'] = { active = true, type = 'Leopard' },
                    ['component_combatmg_mk2_camo_08'] = { active = true, type = 'Zebra' },
                    ['component_combatmg_mk2_camo_09'] = { active = true, type = 'Geometric' },
                    ['component_combatmg_mk2_camo_10'] = { active = true, type = 'Boom' },
                    ['component_combatmg_mk2_camo_ind_01'] = { active = true, type = 'Patriotic' },
                }                
            },
            ['weapon_marksmanrifle'] = {
                weaponType = 'primary',
                ammoType = 'mun762',
                attachs = {
                    ['component_marksmanrifle_mk2_clip_02'] = { active = true, type = 'extenderammo' },
                    ['component_at_ar_afgrip_02'] = { active = true, type = 'grip' },
                    ['component_at_ar_flsh'] = { active = true, type = 'light' },
                    ['component_at_ar_supp'] = { active = true, type = 'suppressor' },
                    
                    --MIRAS
                    ['component_at_sights'] = { active = true, type = 'holographicsight' },
                    ['component_at_scope_medium_mk2'] = { active = true, type = 'smallscope' },
                    ['component_at_scope_large_fixed_zoom_mk2'] = { active = true, type = 'Mediumscope' },
                    --- CANO
                    ['component_at_mrfl_barrel_02'] = { active = true, type = 'HeavyBarrel' },
                    -- FREIO DE BOCA
                    ['component_at_muzzle_01'] = { active = true, type = 'FlatMuzzleBrake' },
                    ['component_at_muzzle_02'] = { active = true, type = 'TacticalMuzzleBrake' },
                    ['component_at_muzzle_03'] = { active = true, type = 'FatEndMuzzleBrake' },
                    ['component_at_muzzle_04'] = { active = true, type = 'PrecisionMuzzleBrake' },
                    ['component_at_muzzle_05'] = { active = true, type = 'HeavyDutyMuzzleBrake' },
                    ['component_at_muzzle_06'] = { active = true, type = 'SlantedMuzzleBrake' },
                    ['component_at_muzzle_07'] = { active = true, type = 'SplitEndMuzzleBrake' },
                    --skins
                    ['component_marksmanrifle_mk2_camo'] = { active = true, type = 'DigitalCamo' },
                    ['component_marksmanrifle_mk2_camo_02'] = { active = true, type = 'BrushstrokeCamo' },
                    ['component_marksmanrifle_mk2_camo_03'] = { active = true, type = 'WoodlandCamo' },
                    ['component_marksmanrifle_mk2_camo_04'] = { active = true, type = 'Skull' },
                    ['component_marksmanrifle_mk2_camo_05'] = { active = true, type = 'SessantaNove' },
                    ['component_marksmanrifle_mk2_camo_06'] = { active = true, type = 'Perseus' },
                    ['component_marksmanrifle_mk2_camo_07'] = { active = true, type = 'Leopard' },
                    ['component_marksmanrifle_mk2_camo_08'] = { active = true, type = 'Zebra' },
                    ['component_marksmanrifle_mk2_camo_00'] = { active = true, type = 'Geometric' },
                    ['component_marksmanrifle_mk2_camo_10'] = { active = true, type = 'Boom' },
                    ['component_marksmanrifle_mk2_camo_ind_01'] = { active = true, type = 'Patriotic' },
                }                
            },
            ['weapon_heavysniper_mk2'] = {
                weaponType = 'primary',
                ammoType = 'mun762',
                attachs = {
                    ['component_heavysniper_mk2_clip_02'] = { active = true, type = 'extenderammo' },
                    ['component_at_scope_nv'] = { active = true, type = 'nitvision' },
                    ['component_at_scope_thermal'] = { active = true, type = 'termal' },
                    ['component_at_sr_supp_03'] = { active = true, type = 'suppressor' },
                                                                              
                    --skins
                    ['component_heavysniper_mk2_camo'] = { active = true, type = 'DigitalCamo' },
                    ['component_heavysniper_mk2_camo_02'] = { active = true, type = 'BrushstrokeCamo' },
                    ['component_heavysniper_mk2_camo_03'] = { active = true, type = 'WoodlandCamo' },
                    ['component_heavysniper_mk2_camo_04'] = { active = true, type = 'Skull' },
                    ['component_heavysniper_mk2_camo_05'] = { active = true, type = 'SessantaNove' },
                    ['component_heavysniper_mk2_camo_06'] = { active = true, type = 'Perseus' },
                    ['component_heavysniper_mk2_camo_07'] = { active = true, type = 'Leopard' },
                    ['component_heavysniper_mk2_camo_08'] = { active = true, type = 'Zebra' },
                    ['component_heavysniper_mk2_camo_09'] = { active = true, type = 'Geometric' },
                    ['component_heavysniper_mk2_camo_10'] = { active = true, type = 'Boom' },
                    ['component_heavysniper_mk2_camo_ind_01'] = { active = true, type = 'Patriotic' },
                }                
            },
            
            ['weapon_gusenberg'] = {
                weaponType = 'primary',
                ammoType = 'mun762',
                attachs = {
                    ['component_gusenberg_clip_02'] = { active = true, type = 'extenderammo' },                   
                }                
            },
            
            ['weapon_gusenberg'] = {
                weaponType = 'primary',
                ammoType = 'mun762',
                attachs = {
                    ['component_gusenberg_clip_02'] = { active = true, type = 'extenderammo' },                   
                }                
            },
            ['weapon_sniperrifle'] = {
                weaponType = 'primary',
                ammoType = 'mun308',
                attachs = {
                    ['component_at_ar_supp_02'] = { active = true, type = 'suppresor' },
                    ['component_at_scope_max'] = { active = true, type = 'scope2' },
                    ['component_sniperrifle_varmod_luxe'] = { active = true, type = 'luxuresniperrifle' },                 
                }                
            },
            ['weapon_militaryrifle'] = {
                weaponType = 'primary',
                ammoType = 'mun762',
                attachs = {
                    ['component_militaryrifle_clip_02'] = { active = true, type = 'extenderammo' },
                   -- ['component_militaryrifle_sight_01'] = { active = true, type = 'miradeferro' }, não tem mudança
                    ['component_at_scope_small'] = { active = true, type = 'smallscope' },
                    --['component_at_pi_flsh'] = { active = true, type = 'light' }, não tem mudança
                    ['component_at_ar_supp'] = { active = true, type = 'suppresor' },
                }                
            },
            
            ['weapon_mg'] = {
                weaponType = 'primary',
                ammoType = 'mun762',
                attachs = {
                    ['component_mg_clip_02'] = { active = true, type = 'extenderammo' },
                    ['component_at_scope_small_02'] = { active = true, type = 'smallscope' },
                    ['component_mg_varmod_lowrider'] = { active = true, type = 'luxuremg' },
                }                
            },
            ['weapon_combatmg'] = {
                weaponType = 'primary',
                ammoType = 'mun556',
                attachs = {
                    ['component_combatmg_clip_02'] = { active = true, type = 'extenderammo' },
                    ['component_at_scope_medium'] = { active = true, type = 'smallscope' },
                    ['component_at_ar_afgrip'] = { active = true, type = 'grip' },
                    ['component_combatmg_varmod_lowrider'] = { active = true, type = 'luxurecombatmg' },

                }                
            },
            ['weapon_snspistol'] = {
                weaponType = 'secundary',
                ammoType = 'mun9mm',
                attachs = {
                    ['component_snspistol_clip_02'] = { active = true, type = 'clip' },      
                    ['component_snspistol_varmod_lowrider'] = { active = true, type = 'skin' },
                }                
            },

            ['weapon_pistol'] = {
                weaponType = 'secundary',
                ammoType = 'mun9mm',
                attachs = {
                    ['component_at_pi_supp_02'] = { active = true, type = 'suppresor' },      
                    ['component_pistol_clip_02'] = { active = true, type = 'clip' },
                    ['component_at_pi_flsh'] = { active = true, type = 'light' },      
                    ['component_pistol_varmod_luxe'] = { active = true, type = 'skin' },
                }               
            },

            ['weapon_combatpistol'] = {
                weaponType = 'secundary',
                ammoType = 'mun9mm',
                attachs = {
                    ['component_combatpistol_clip_02'] = { active = true, type = 'clip' },      
                    ['component_at_pi_flsh'] = { active = true, type = 'light' },
                    ['component_at_pi_supp'] = { active = true, type = 'suppresor' },      
                    ['component_combatpistol_varmod_lowrider'] = { active = true, type = 'skin' },
                }                               
            },

            ['weapon_appistol'] = {
                weaponType = 'secundary',
                ammoType = 'mun9mm',
                attachs = {
                    ['component_appistol_clip_02'] = { active = true, type = 'clip' },      
                    ['component_at_pi_flsh'] = { active = true, type = 'light' },
                    ['component_at_pi_supp'] = { active = true, type = 'suppresor' },      
                    ['component_appistol_varmod_luxe'] = { active = true, type = 'skin' },
                }          
            },

            ['weapon_pistol50'] = {
                weaponType = 'secundary',
                ammoType = 'mun50mm',
                attachs = {
                    ['component_pistol50_clip_02'] = { active = true, type = 'clip' },      
                    ['component_at_pi_flsh'] = { active = true, type = 'light' },
                    ['component_at_ar_supp_02'] = { active = true, type = 'suppresor' },      
                    ['component_pistol50_varmod_luxe'] = { active = true, type = 'skin' },
                }                
            },

            ['weapon_revolver'] = {
                weaponType = 'secundary',
                ammoType = 'mun38mm',
                attachs = {                    
                    ['component_revolver_varmod_boss'] = { active = true, type = 'skin' },      
                    ['component_revolver_varmod_goon'] = { active = true, type = 'skin' },
                }
            },
         
        },

        
    },

})