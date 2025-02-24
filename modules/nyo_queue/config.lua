Nfw.registerConfig({
    config = {
        ['configQueue'] = {
           requireSteam = false, -- Necessita de Steam para logar
           priorityOnly = false, -- Somente quem tem prioridade pode acessar
           maxPlayers = 500, -- limite de players na cidade
           displayQueue = false, -- exibe a quantidade de players na fila na lista do fivem (antes do nome da cidade)
           displayMessage = {
                joining = "Entrando...",
                connecting = "Conectando...",
                err = "Não foi possível identificar sua Steam ou Social Club.",
                _err = "Você foi desconectado por demorar demais na fila.",
                pos = "Você é o %d/%d da fila, aguarde sua conexão",
                connectingerr = "Não foi possível adiciona-lo na fila.",
                wlonly = "Você não está aprovado na whitelist.",
                banned = "Seu passaporte foi revogado na cidade.",
                steam = "Você precisa estar com a Steam aberta para conectar."
           }
        },    
    },
})