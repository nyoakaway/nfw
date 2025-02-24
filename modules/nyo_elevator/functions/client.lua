Nfw.registerFunctions('nyofw',{
    onElevatorUse = function(coords, heading)
        TriggerEvent("nfw:sounds:playSound",'elevatorbell',0.5)
    end
})