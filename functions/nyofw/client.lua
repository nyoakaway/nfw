Nfw.registerFunctions(function() 
    -- ------------------------------ --
    -- ITEM LIST
    -- ------------------------------ --
    local CFGItens = NfwConfigs['inventoryItensConfig']

    -- ------------------------------ --
    -- FUNCTIONS
    -- ------------------------------ --

    return {
        notify = function(titulo, mensagem, cor, tempo)

            nTitulo = titulo or ''
            nMensagem = mensagem or ''
            nCor = cor or ''
            nTempo = tempo or 5000

            if Nfw.isModuleActive('nyo_notify') then
                TriggerEvent("nyo_notify",nTitulo, nMensagem,nCor,nTempo)
            else
                local tipo = 'importante'
                if cor == '#00FF00' then
                    tipo = 'sucesso'
                elseif cor == '#FF0000' then
                    tipo = 'erro'
                elseif cor == '#FFD700' then
                    tipo = 'importante'
                end
                TriggerEvent("Notify", tipo, nMensagem, nTempo)
            end

        end,
        itemName = function(index)
            return CFGItens and CFGItens[index] and CFGItens[index].name or ''
        end
    }
end)