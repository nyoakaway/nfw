Nfw.registerFunctions('nyofw',function()

    return {
        getPlayerName = function(user_id)
            local identity = vRP.getUserIdentity(user_id)
            return identity.firstname .. ' ' .. identity.name
        end
    }

end)