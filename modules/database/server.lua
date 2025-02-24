Nfw.registerModule({}, true, function()
        local oxmysql = exports['oxmysql']
        local prepared_queries = {  }
        
        function NyoFw.prepare(name,query)
            prepared_queries[name] = query
        end

        function NyoFw.query(name,params,callback,method)
            local query = prepared_queries[name] or name
            method = method or 'execute'
            oxmysql[method](oxmysql, query, params, callback)
        end

        function NyoFw.querySync(name,params,method)
            local query = prepared_queries[name] or name
            local p = promise.new()
            method = method or 'execute'
            oxmysql[method](oxmysql, query, params, function(result)
                p:resolve(result)
            end)
            local res = Citizen.Await(p)
            return res
        end

        exports('prepare', NyoFw.prepare)
        exports('query', NyoFw.query)
        exports('querySync', NyoFw.querySync)

       
end, true)
