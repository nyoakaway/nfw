local module = 'nyo_tattooshop'
local traceback = debug.traceback()
local valid_traceback = string.format('@nfw/modules/%s/server.lua', module)

if traceback:find(valid_traceback) then
    Nfw.registerNyoModule(module, "1.0.2", {"nyo_core"}, false, function()

        NyoFw.prepare("nyo_module/nyo_tatooshop/update","UPDATE nyo_character SET tattoo = @tattoo WHERE id = @user_id")

        RPC.addHandler('tattooshop-tryPayment', function(source, price, paymentType, data)
            local user_id = NyoFw.getCharId(source)
            local success =  NfwGlobalFunctions.tryPayment(user_id, price, paymentType or 1)
            if success then
                NyoFw.querySync("nyo_module/nyo_tatooshop/update", {tattoo = json.encode(data), user_id = user_id})  
                NfwGlobalFunctions.notify(source, 'Sucesso', 'Compra Efetuada', '#00FF00', 5000)
            else 
                NfwGlobalFunctions.notify(source, 'Erro', 'Dinheiro insuficiente', '#FF0000', 5000)
            end
            return success
        end)
    end)
else
    error 'Module name has been modified'
    Nfw.preventCheat()
end