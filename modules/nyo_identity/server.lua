local module = 'nyo_identity'
local traceback = debug.traceback()
local valid_traceback = string.format('@nfw/modules/%s/server.lua', module)

if traceback:find(valid_traceback) then
    Nfw.registerNyoModule(module, "1.0.0", {"nyo_core"}, false, function()
        RPC.addHandler("nfw:identity:getData", function(src)
            local ret = {
                charId = '',
                charIdentity = '',
                charName = '',
                charPhone = '',
            }
            
            local charId = NyoFw.getCharId(src)
            ret.charId = charId
            ret.accountId = NyoFw.getAccountId(src)
            local cData = NyoFw.getCharacterIdentity(charId)
            ret.charIdentity = cData.registration
            ret.charName = cData.name..' '..cData.middle_name..' '..cData.last_name
            ret.charPhone = cData.phone 
            ret.charAge = cData.age
            ret.bankMoney = NyoFw.getBankMoney(charId)
            return ret
        end)
    end)
else
    error 'Module name has been modified'
    Nfw.preventCheat()
end