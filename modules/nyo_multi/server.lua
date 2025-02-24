local module = 'nyo_multi'
local traceback = debug.traceback()
local valid_traceback = string.format('@nfw/modules/%s/server.lua', module)

if traceback:find(valid_traceback) then
    Nfw.registerNyoModule(module, "1.0.0", {"nyo_core"}, false, function()

        local module_funcs = Nfw.getModuleFunctions()

        NyoFw.prepare('nfw/nyo_multi/getAccountData', 'SELECT * FROM nyo_account WHERE id = @account_id')
        NyoFw.prepare('nfw/nyo_multi/getCharacter', 'SELECT * FROM nyo_character WHERE account_id = @account_id')

        local multiGetData = function(src)
            local account_id = module_funcs.getAccountId(src)
            local qtdCharacter = module_funcs.multiMaxCharacter(account_id)
            local getCharacter = module_funcs.multiGetCharacters(account_id)
            return getCharacter, qtdCharacter
        end

        RegisterServerEvent("nfw:openMultiCharacter", function(src, account_id)
            if src == nil then src = source end
            local characters, maxCharacters = multiGetData(src)
            SetPlayerRoutingBucket(src, 1000+src)
            SafeEvents.triggerClient("nfw:OpenUiMultiChar", src, characters, maxCharacters)            
        end)

        RegisterCommand("loadMulti", function(source, args)
            local source = source 
            local characters, maxCharacters = multiGetData(source)
            SetPlayerRoutingBucket(source, 1000+source)
            SafeEvents.triggerClient("nfw:OpenUiMultiChar", source, characters, maxCharacters)
        end)

    end)
else
    error 'Module name has been modified'
    Nfw.preventCheat()
end