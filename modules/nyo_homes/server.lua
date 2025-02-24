local module = 'nyo_homes'
local traceback = debug.traceback()
local valid_traceback = string.format('@nfw/modules/%s/server.lua', module)

if traceback:find(valid_traceback) then
    Nfw.registerNyoModule(module, "1.0.0", {"nyo_core"}, false, function()

        NyoFw.prepare('homes/getHomeData', 'SELECT * FROM nyo_homes WHERE id = @id')
        NyoFw.prepare('homes/getHomeOwner', 'SELECT * FROM nyo_homes_permission WHERE homes_id = @id AND owner = 1')
        NyoFw.prepare('homes/getHomePerm', 'SELECT * FROM nyo_homes_permission WHERE homes_id = @id AND charId = @charId')
        NyoFw.prepare("homes/addHome", 'INSERT INTO nyo_homes (id, interior, tax, maxMember, vault) VALUES (@id, @interior, @tax, @maxMember, @vault)')
        NyoFw.prepare("homes/addHomePerm", 'INSERT INTO nyo_homes_permission (homes_id, charId, owner, vault) VALUES (@homesId, @charId, @owner, @vault)')
        
        RPC.addHandler("nfw:homes:getHomeData", function(src, id)
            local charId = NyoFw.getCharId(src)
            local data = NyoFw.querySync("homes/getHomeData", {id = id})
            if data[1] then 
                local data2 = NyoFw.querySync("homes/getHomePerm", {id = id, charId = charId})
                local data3 = NyoFw.querySync("homes/getHomeOwner", {id = id})
                local acessPerm = false
                if data2[1] then 
                    acessPerm = true
                end
                local dataHome = {
                    interior = data[1].interior,
                    tax = data[1].tax,
                    maxHab = data[1].maxMember,
                    vault = data[1].vault,
                    perm = acessPerm,
                    owner = data3[1].charId
                }
                return true, dataHome
            else 
                return false
            end
        end)

        RPC.addHandler("nfw:homes:enterHome", function(src, id)
            local charId = NyoFw.getCharId(src)
            if charId then         
                local data = NyoFw.querySync("homes/getHomePerm", {id = id, charId = charId})
                if data[1] then 
                    local bucketId = 10000+id
                    SetPlayerRoutingBucket(src, bucketId)

                    local dataHome = {
                        vault = data[1].vault
                    }

                    return true, dataHome   
                end
               
            end 
            return false 
        end)

        RPC.addHandler("nfw:homes:exitHome", function(src, id)
            local charId = NyoFw.getCharId(src)
            if charId then  
                SetPlayerRoutingBucket(src, 0)   
                return true
            end
            return false
        end)

        SafeEvents.register("nfw:homes:buyHome", function(src, id, cfg)
            local charId = NyoFw.getCharId(src)
            local data = NyoFw.querySync("homes/getHomeData", {id = id})
            if data[1] then 
                TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'homes-error', 'homes-buy-error-owner', '#FF0000', 5000)
            else 
                hConfig = NfwConfigs[cfg]
                if NyoFw.request(src, 'Deseja comprar a residencia ['..id..'] pelo valor de R$'..hConfig.homeConfig.price, 10000) then 
                    if NyoFw.tryFullPayment(charId, tonumber(hConfig.homeConfig.price)) then 
                        NyoFw.querySync("homes/addHome", {id = id, interior = hConfig.homeConfig.interior, tax = os.time(), maxMember = hConfig.homeConfig.initMaxHab, vault = hConfig.homeConfig.initVault})
                        NyoFw.querySync("homes/addHomePerm", {homesId = id, charId = charId, owner = 1, vault = 1})
                        TriggerClientEvent("nyo_notify:lang", src, 'nyo_inventory', 'homes-success', 'homes-buy-success', '#00FF00', 5000)
                    end                  
                end
            end
        end)

    end)
else
    error 'Module name has been modified'
    Nfw.preventCheat()
end


