Nfw.registerModule({}, false, function()

    Router.get("/console", function(req, res)
        res.status(200).send(GetConsoleBuffer())
    end)

    Router.get('/console/highlight', function(req, res)
        if req.query.script then
            local resText = ''
            local buffer = GetConsoleBuffer():split('\n')
            for k,v in pairs(buffer) do
                if v:find(req.query.script) then
                    resText = resText .. '<div style="background:#c4d904;color:#121212;font-weight:900;">' .. v .. '</div>'
                else
                    resText = resText .. '<div style="background:#121212;color:white;">' ..v .. '</div>'
                end
            end
            res.status(200).send(string.format([[
                <style>
                body {
                    overflow-x: hidden;
                    overflow-y: scroll;
                }
                    * {
                        padding: 0;
                        margin: 0;
                        font-size: 18px;
                        font-family: sans-serif;
                    }
                    div > div {
                        width: 99vw;
                        padding-left: 10px;
                    }
                </style>
                <div style="display:flex; align-items:flex-start; justify-content:flex-start;flex-direction:column;">
                %s
                </div>
            ]], resText))
        end
    end)

    Router.get("/console/:script", function(req, res)
        if req.params.script then
            local resText = ''
            local buffer = GetConsoleBuffer():split('\n')
            for k,v in pairs(buffer) do
                if v:find(req.params.script) then
                    resText = resText .. '\n' .. v
                end
            end
            res.status(200).send(resText)
        end
    end)
    
end)