local module = 'nyo_wardrobe'
local traceback = debug.traceback()
local valid_traceback = string.format('@nfw/modules/%s/server.lua', module)

if traceback:find(valid_traceback) then
    Nfw.registerNyoModule(module, "1.0.2", {"nyo_core"}, false, function()
        NyoFw.prepare("wardrobe/get", "SELECT wardrobe FROM nyo_character WHERE id = @user_id")
        NyoFw.prepare("wardrobe/set", "UPDATE nyo_character SET wardrobe = @value WHERE id = @user_id")

        RPC.addHandler("wardrobe-getData", function(src)
            local src = src
            local user_id = NyoFw.getCharId(src)
            local roupas = NyoFw.querySync("wardrobe/get", {user_id = user_id})[1]
            return roupas and json.decode(roupas['wardrobe']) or {}
        end)

        RPC.addHandler("wardrobe-saveOutfit", function(src, name, roupa)
            local src = src
            local user_id = NyoFw.getCharId(src)
            local dataParts = NyoFw.querySync("wardrobe/get", {user_id = user_id})
            local playerParts = {}
            local playerOutfit = {}
            if dataParts[1]['wardrobe'] then 
                playerData = json.decode(dataParts[1]['wardrobe'])
                playerOutfit = playerData['outfit']
                playerParts = playerData['clouth']
            end
            playerOutfit[name] = roupa
            local guardaRoupaData = {
                outfit = playerOutfit,
                clouth = playerParts
            }
            local setGuardaRoupa = NyoFw.query("wardrobe/set", { user_id = user_id, value = json.encode(guardaRoupaData)})
            return guardaRoupaData
        end)

        RPC.addHandler("wardrobe-useOutfit", function(src, name)
            local src = src
            local user_id = NyoFw.getCharId(src)
            local dataParts = NyoFw.querySync("wardrobe/get", {user_id = user_id})
            local playerParts = {}
            local playerOutfit = {}
            if dataParts[1]['wardrobe'] then 
                playerData = json.decode(dataParts[1]['wardrobe'])
                playerOutfit = playerData['outfit']
                playerParts = playerData['clouth']
            end
            return playerOutfit[name]
        end)

        RPC.addHandler("wardrobe-deleteOutfit", function(src,name)
            local src = src
            local user_id = NyoFw.getCharId(src)
            local dataParts = NyoFw.querySync("wardrobe/get", {user_id = user_id})
            local playerParts = {}
            local playerOutfit = {}
            if dataParts[1]['wardrobe'] then 
                local playerData = json.decode(dataParts[1]['wardrobe'])
                playerOutfit = playerData['outfit']
                playerParts = playerData['clouth']
            end
            playerOutfit[name] = nil
            local guardaRoupaData = {
                outfit = playerOutfit,
                clouth = playerParts
            }
            local setGuardaRoupa = NyoFw.querySync("wardrobe/set", { user_id = user_id, value = json.encode(guardaRoupaData)})
            return guardaRoupaData
        end)

        RegisterServerEvent("nyoModule:SaveWardrobe")
        AddEventHandler("nyoModule:SaveWardrobe", function(user_id, data)
            local dataParts = NyoFw.querySync("wardrobe/get", {user_id = user_id})
            local playerParts = {}
            local playerOutfit = {}

            if dataParts[1]['wardrobe'] then 
                playerData = json.decode(dataParts[1]['wardrobe'])
                playerOutfit = playerData['outfit']
                playerParts = playerData['clouth']
            end

            for i = 1, 11 do 
                if(playerParts[tostring(math.floor(i))]) then 
                    local partId = data[math.floor(i)][1]
                    if not playerParts[tostring(math.floor(i))][tostring(partId)] then 
                        if tonumber(partId) >= 0 then
                            playerParts[tostring(math.floor(i))][tostring(partId)] = true
                        end
                    end
                else
                    local partId = data[math.floor(i)][1]
                    if tonumber(partId) >= 0 then                     
                        playerParts[tostring(math.floor(i))] = {}
                        playerParts[tostring(math.floor(i))][tostring(partId)] = true
                    end
                end
            end 

            for i = 0,10 do
                if(playerParts[tostring('p'..math.floor(i))]) then 
                    local partId = data[tostring('p'..math.floor(i))][1]
                    if not playerParts[tostring('p'..math.floor(i))][tostring(partId)] then 
                        if tonumber(partId) >= 0 then
                            playerParts[tostring('p'..math.floor(i))][tostring(partId)] = true
                        end
                    end
                else
                    local partId = data[tostring('p'..math.floor(i))][1]
                    if tonumber(partId) >= 0 then                     
                        playerParts[tostring('p'..math.floor(i))] = {}
                        playerParts[tostring('p'..math.floor(i))][tostring(partId)] = true
                    end
                end
            end

            local guardaRoupaData = {
                outfit = playerOutfit,
                clouth = playerParts
            }

            local setGuardaRoupa = NyoFw.querySync("wardrobe/set", { user_id = user_id, value = json.encode(guardaRoupaData)})
        end)

    end)
else
    error 'Module name has been modified'
    Nfw.preventCheat()
end