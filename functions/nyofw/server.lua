Nfw.registerFunctions(function()
    -- ------------------------------ --
    -- FUNCTIONS
    -- ------------------------------ --

    return {

       -- DB = DB,
        notify = function(source, titulo, mensagem, cor, tempo)
            nTitulo = titulo or ''
            nMensagem = mensagem or ''
            nCor = cor or ''
            nTempo = tempo or 5000
            if source then 
                if Nfw.isModuleActive('nyo_notify') then
                    TriggerClientEvent("nyo_notify",source,nTitulo,nMensagem,nCor,nTempo)
                else
                    local tipo = 'importante'
                    if cor == '#00FF00' then
                        tipo = 'sucesso'
                    elseif cor == '#FF0000' then
                        tipo = 'erro'
                    elseif cor == '#FFD700' then
                        tipo = 'importante'
                    end
                    TriggerClientEvent("Notify", source, tipo, nMensagem, nTempo)
                end
            end
        end,

        tryPayment = function(user_id, amount, paymentType)
            if paymentType == 1 then
                return NyoFw.tryPayment(user_id, amount)
            elseif paymentType == 2 then
                return NyoFw.tryFullPayment(user_id, amount)
            end
        end,

        checkInventoryWeight = function(user_id, item, qtd)
            return NyoFw.getInventoryWeight(user_id)+NyoFw.getItemWeight(item)*tonumber(qtd) <= NyoFw.getInventoryMaxWeight(user_id) 
        end,
        checkInventoryWeight2 = function(user_id, itens, removeItens)
            local minusAmount = 0
            local addamount = 0
            for k,v in pairs(removeItens) do
                minusAmount += NyoFw.getItemWeight(v[1]) * v[2]
            end
            for k,v in pairs(itens) do
                addamount += NyoFw.getItemWeight(v[1]) * v[2]
            end
            return NyoFw.getInventoryWeight(user_id)-minusAmount+addamount <= NyoFw.getInventoryMaxWeight(user_id) 
        end,

        
        alertPolice = function(source,x,y,z,text)
            -- A FAZER
            -- vRPclient.playSound(source,"Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
            -- local blip = vRPclient.addBlip(source,x,y,z,1,59,"Roubo em andamento",0.5,true)
            -- TriggerClientEvent('chatMessage',source,"COPOM:",{5,144,242},text)
            -- SetTimeout(20000,function() vRPclient.removeBlip(source,blip) end)
        end
    }

end)