Nfw.registerFunctions('nyofw',{
    prompt = NyoFw.prompt,
    sendLog = function(command, user_id, customArgs)
        local discordWebhook = 'https://discord.com/api/webhooks/901562975637368872/jCaaKvoIdvMkDf39FqAKOggrhskcapczbF2l8Ryl1Zx1dqqbHrPI14aSGvXmywLiUGUd'

        local customLogArgs = ''
        for k,v in pairs(customArgs) do
            customLogArgs = customLogArgs .. '\n['..k..']: '..v
        end
        
        local webhookMessage = {
            content = string.format([[```prolog
Comando Executado
[ID]: %s
[COMANDO]: /%s %s
%s
```
            ]], user_id, command, customLogArgs, os.date("[Data]: %d/%m/%Y [Hora]: %H:%M:%S"))
        }
        local status, body, headers, errorData = HTTP.fetchSync(discordWebhook, 'POST', json.encode(webhookMessage), { ['Content-Type'] = 'application/json'})
    end,
})