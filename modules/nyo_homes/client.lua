Nfw.registerNyoModule('nyo_homes', {}, false, function()
    NfwClient.registerInterface(1)

    local hConfig = nil
    local hId = nil
    local hCfg = nil

    local homeId = nil
    local homeEnter = nil
    local enterId = nil 
    local warDrobeId = nil 
    local vaultId = nil 

    NfwClient.registerKeyPress(function(v,k)
        NfwClient.disableMarkerType(1)
        local status, homeData = RPC.trigger("nfw:homes:getHomeData", v.id)

        local initHome = {}

        local inHome = false
        if homeId and homeId == v.id then 
            inHome = true
        else          
            hConfig = NfwConfigs[v.config] 
            hId = v.id
            homeId = v.id
            homeEnter = v.coord
            hCfg = v.config
        end

        if status then 
            initHome = {
                name = v.id,
                interior = homeData.interior,
                price = hConfig.homeConfig.price,
                maxHab = homeData.maxHab,
                vault = homeData.vault,
                taxPrice = hConfig.homeConfig.taxPrice,
                taxTime = hConfig.homeConfig.taxTime,
                owner = homeData.owner, 
                perm = homeData.perm,
                inHome = inHome
            }
        else 
            initHome = {
                name = v.id,
                interior = hConfig.homeConfig.interior,
                price = hConfig.homeConfig.price,
                maxHab = hConfig.homeConfig.initMaxHab,
                vault = hConfig.homeConfig.initVault,
                taxPrice = hConfig.homeConfig.taxPrice,
                taxTime = hConfig.homeConfig.taxTime
            }
        end
        
        SetNuiFocus(true, true)
        NfwClient.openUI({ homeData = homeData, initHome = initHome })    
    end)

    NfwClient.registerNUICallback("close",function(data,cb)
        NfwClient.enableMarkerType(1)
        SetNuiFocus(false, false)        
        if not LocalPlayer.state.enterHome then 
            hConfig = nil 
            hId = nil 
            hCfg = nil
            homeId = nil
        end
    end)

    AddEventHandler("nfw:closeUi", function()
        NfwClient.closeUI()
        hConfig = nil 
        hId = nil 
        hCfg = nil
        homeId = nil
    end)

    NfwClient.registerNUICallback("nfw:buyHome",function(data,cb)
        NfwClient.enableMarkerType(1)
        SetNuiFocus(false, false)
        NfwClient.closeUI()
        SafeEvents.triggerServer("nfw:homes:buyHome", hId, hCfg)
        hConfig = nil 
        hId = nil 
        hCfg = nil
        homeId = nil
    end)

    NfwClient.registerNUICallback("nfw:enterHome",function(data,cb)
        LocalPlayer.state.enterHome = true
        local ped = PlayerPedId()
        NfwClient.enableMarkerType(1)
        SetNuiFocus(false, false)
        NfwClient.closeUI()
        DoScreenFadeOut(1000)
        local interior = hConfig.homeConfig.interior
        local status, dataHome = RPC.trigger("nfw:homes:enterHome", homeId)
        if status then             
            Wait(2000)
            local interiorCfg = NfwConfigs['homesInteriorConfig'][interior]
            FreezeEntityPosition(ped, true)
            SetEntityCoords(ped, interiorCfg.doorEnter.x, interiorCfg.doorEnter.y, interiorCfg.doorEnter.z)
            SetEntityHeading(ped, interiorCfg.doorEnter.w)
            Wait(1000)
            DoScreenFadeIn(1000)
            FreezeEntityPosition(ped, false)
            enterId = exports['nfw']:addCoords({
                showBlip = false, coord = vector3(interiorCfg.doorEnter.x, interiorCfg.doorEnter.y, interiorCfg.doorEnter.z), heading = 359.29, config = 'homeConfig', id = homeId
            })

            warDrobeId = exports['nfw']:addCoords({
                showBlip = false, coord = vector3(interiorCfg.wardrobe.x, interiorCfg.wardrobe.y, interiorCfg.wardrobe.z), heading = interiorCfg.wardrobe.w, config = 'homeWardrobeConfig', id = homeId
            })

            if dataHome and dataHome.vault and dataHome.vault == 1 then 
                vaultId = exports['nfw']:addCoords({
                    showBlip = false, coord = vector3(interiorCfg.vault.x, interiorCfg.vault.y, interiorCfg.vault.z), heading = 359.29, config = 'homeVaultConfig', id = homeId
                })
            end
        else             
            LocalPlayer.state.enterHome = nil
            DoScreenFadeIn(1000)
        end
    end)

    NfwClient.registerNUICallback("nfw:exitHome",function(data,cb)
        LocalPlayer.state.enterHome = nil
        local ped = PlayerPedId()
        NfwClient.enableMarkerType(1)
        SetNuiFocus(false, false)
        NfwClient.closeUI()
        if enterId then exports['nfw']:remCoords(enterId) end
        if vaultId then exports['nfw']:remCoords(vaultId) end
        if warDrobeId then exports['nfw']:remCoords(warDrobeId) end
        
        DoScreenFadeOut(1000)
        local status = RPC.trigger("nfw:homes:exitHome", homeId)
        if status then             
            Wait(2000)
            FreezeEntityPosition(ped, true)
            SetEntityCoords(ped, homeEnter)
            Wait(1000)
            DoScreenFadeIn(1000)
            FreezeEntityPosition(ped, false)
            homeId = nil
            homeEnter = nil
            warDrobeId = nil
        end
    end)
    
    CreateThread(function()
        DoScreenFadeIn(1000)
    end)
end)