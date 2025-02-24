Nfw.registerNyoModule('nyo_hud', {}, false, function()
    local hudConfig = NfwConfigs['hudGeneralConfig']

    NfwClient.registerInterface(3)

    Nfw.onReady(function()
        CreateThread(function()
            Wait(2000)
            if LocalPlayer.state.spawned then
                NyoFw.toogleHud(true)

                local ped = PlayerPedId()
                if IsPedInAnyVehicle(ped, false) then 
                    inVehicle = true
                    vehicleId = GetVehiclePedIsIn(ped, false)
                    vehicleThread = true
                    startVehicleThread()
                end

            end
        end)
    end)

    CreateThread(function()
        while true do 
            Wait(50)
            if LocalPlayer.state.spawned then 
                NyoFw.toogleHud(true)
                break
            end
        end
    end)

    NyoFw.toogleHud = function(toogle)
        hunger = LocalPlayer.state.hunger
        thirst = LocalPlayer.state.thirst
        NfwClient.sendNUIMessage('showHud',{toogle = toogle, htActive = hudConfig.hungerAndThirstActive})
    end    

    local seatbelt = false  
    local showRadar = false
    local ExNoCarro = false
    local hunger = LocalPlayer.state.hunger or 100
    local thirst = LocalPlayer.state.thirst or 100  
    local damageHunger = 0 
    local damageThirst = 0
    local inVehicle = false
    local vehicleId = nil
    local vehicleThread = false
    local sBuffer = {}

    CreateThread(function()
        while true do 
            if LocalPlayer.state.spawned then 
                local ped = PlayerPedId()
                local pCoord = GetEntityCoords(ped)
                health = GetEntityHealth(ped)
                local armour = GetPedArmour(ped)
                local street = GetStreetNameFromHashKey(GetStreetNameAtCoord(pCoord.x, pCoord.y, pCoord.z))
                local stamina = GetPlayerSprintStaminaRemaining(PlayerId())
 
                hour = GetClockHours()
                month = GetClockMonth()
                minute = GetClockMinutes()
    
                if hour <= 9 then
                    hour = "0"..hour
                end
    
                if month <= 9 then
                    month = "0"..month
                end
            
                if minute <= 9 then
                    minute = "0"..minute
                end
    
                local vehicleFuel = 0 
                local vehicleEngine = 0 
                local vehicleSpeed = 0
                local vehicleGear = 1
                
                if inVehicle then 
                    vehicleFuel = GetVehicleFuelLevel(vehicleId)
                    vehicleEngine = GetVehicleEngineHealth(vehicleId)
                    vehicleSpeed = GetEntitySpeed(vehicleId) * 3.6
                    vehicleGear = GetVehicleCurrentGear(vehicleId)
                end
                
                DisplayRadar(showRadar)  

                if hudConfig.hungerAndThirstActive then 
                    hunger = LocalPlayer.state.hunger
                    hunger = hunger - hudConfig.hungerRemove
                    if hunger < 0 then 
                        hunger = 0
                        damageHunger = damageHunger + hudConfig.hungerDamage
                        if damageHunger > 1 then 
                            local nDamage = math.floor(tonumber(damageHunger))
                            damageHunger = damageHunger - nDamage
                            health = health - nDamage
                            SetEntityHealth(ped, health)
                        end
                    end

                    if LocalPlayer.state.hunger < (hunger + 1) then
                        LocalPlayer.state:set("hunger", hunger, true)
                    end
                    

                    thirst = LocalPlayer.state.thirst
                    thirst = thirst - hudConfig.hungerRemove
                    if thirst < 0 then 
                        thirst = 0
                        damageThirst = damageThirst + hudConfig.thirstDamage
                        if damageThirst > 1 then 
                            local nDamage = math.floor(tonumber(damageThirst))
                            damageThirst = damageThirst - nDamage
                            health = health - nDamage
                            SetEntityHealth(ped, health)
                        end
                    end
                    if LocalPlayer.state.thirst < (thirst + 1) then
                        LocalPlayer.state:set("thirst", thirst, true)
                    end
                    
                end
    
                NfwClient.sendNUIMessage('hudUpdate',{
                    health = health,
                    armour = armour,
                    hunger = hunger,
                    thirst = thirst, 
                    stamina = stamina,
                    street = street,
                    time = hour..":"..month..":"..minute,
                    inVehicle = inVehicle,
                    vSpeed = math.floor(tonumber(vehicleSpeed)),
                    vFuel = math.floor(tonumber(vehicleFuel)), 
                    vEngine = vehicleEngine,
                    vGear = vehicleGear,
                    vBelt = seatbelt
                })
            end           
            Wait(400)
        end    
    end)

    IsCar = function(veh)
        local vc = GetVehicleClass(veh)
        return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 15 and vc <= 20)
    end

    startVehicleThread = function()
        CreateThread(function()
            while vehicleThread do 
                Wait(4)
                local ped = PlayerPedId()

                if ExNoCarro or IsCar(vehicleId) then 
                    ExNoCarro = true 
                    if seatbelt then
                        DisableControlAction(0,75)
                    end
    
                    sBuffer[2] = sBuffer[1]
                    sBuffer[1] = GetEntitySpeed(vehicleId)
                    if sBuffer[2] ~= nil and not seatbelt and GetEntitySpeedVector(vehicleId,true).y > 1.0 and sBuffer[1] > 10.25 and (sBuffer[2] - sBuffer[1]) > (sBuffer[1] * 0.255) then
                        SetEntityHealth(ped,GetEntityHealth(ped)-10)
                        TaskLeaveVehicle(ped,GetVehiclePedIsIn(ped),4160)
                        vehicleThread = false 
                        vehicleId = nil
                        inVehicle = false
                    end
                end
                
            end
        end)
    end

    RegisterCommand("nfw:hud:seatbelt", function()   
        if vehicleId and IsCar(vehicleId) then 
            seatbelt = not seatbelt
            if seatbelt then 
                TriggerEvent("nfw:sounds:playSound","belt",0.5) 
                showRadar = true   
            else 
                TriggerEvent("nfw:sounds:playSound","unbelt",0.5)
                showRadar = false
            end
        end       
    end) 
    RegisterKeyMapping("nfw:hud:seatbelt", 'Cinto', 'KEYBOARD', "g")

    AddEventHandler("nyoModule:CarSystem", function(vehicle)
        inVehicle = true
        vehicleId = vehicle
        vehicleThread = true
        startVehicleThread()
        if not IsCar(vehicleId) then showRadar = true end
    end)

    AddEventHandler("nyoModule:CarSystem:LeftCar", function(vehicle)
        inVehicle = false
        vehicleId = nil
        ExNoCarro = false
        vehicleThread = false
        showRadar = false
    end)
end)