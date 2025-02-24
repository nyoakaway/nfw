Nfw.registerFunctions('nyofw',function()
    return {
        getHomes = function(source, user_id) -- Função para pegar as casas dos players
            -- Retorno deve ser no formato ['nomequalquer'] = {loc = vec3(0,0,0), name = '', desc = '', img = '', perm = ''}
            --local homes = vRP.query("nyo_spawn/get_homes", { user_id = user_id })
            local homesLocs = {}

            -- for k,v in pairs(homes) do
            --     if homesConfig[v.home] then
            --         homesLocs[v.home] = { loc = vec3(homesConfig[v.home].enter[1],homesConfig[v.home].enter[2], homesConfig[v.home].enter[3]), name = 'Casa '..v.home, desc = "", img = "marker", perm = "" }
            --     end
            -- end

            return homesLocs
        end,
    }
end)