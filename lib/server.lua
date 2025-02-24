function LoadFile(resourceName, resourceFilePath)
    local FileData = LoadResourceFile(resourceName, resourceFilePath:find('.lua') and resourceFilePath or resourceFilePath .. '.lua')
    if FileData then
        local load_func = Load(FileData)
        if load_func then
            return load_func()
        end
    else
        error "File doesn't exist"
    end
end

local char_to_hex = function(c)
    return string.format("%%%02X", string.byte(c))
end

local function urlencode(url)
    local t = url:split(':')
    for i = 3, #t do
        t[2] = t[2]..':'..t[i]
    end
    t[2] = t[2]:gsub("\n", "\r\n")
    t[2] = t[2]:gsub("([^%w _%%%-%.~/:])", char_to_hex)
    t[2] = t[2]:gsub(" ", "+")
    return t[1]..':'..t[2]
end

local hex_to_char = function(x)
    return string.char(tonumber(x, 16))
end

local urldecode = function(url)
    if url == nil then
        return
    end
    url = url:gsub("+", " ")
    url = url:gsub("%%(%x%x)", hex_to_char)
    return url
end

HTTP = {}
local http = { requests = {} }

AddEventHandler('__cfx_internal:httpResponse', function(token, status, body, headers, errorData)
    if http.requests[token] then
        local userCallback = http.requests[token]
        http.requests[token] = nil
        userCallback(status, body, headers, errorData)
    end
end)

http.fetch = function(url, cb, method, data, headers, followLocation)

    if followLocation == nil then
        followLocation = true
    end

    local t = {
        url = urlencode(url),
        method = method or 'GET',
        data = data or '',
        headers = headers or {},
        followLocation = followLocation
    }

    local id = PerformHttpRequestInternalEx(t)

    if id ~= -1 then
        http.requests[id] = cb
    else
        cb(0, nil, {}, 'Failure handling HTTP request')
    end
end

http.fetchSync = function(url, method, data, headers, followLocation)
    local p = promise.new()
    http.fetch(url, function(status, body, headers, errorData)
        p:resolve({status, body, headers, errorData})
    end, method, data, headers, followLocation)
    return table.unpack(Citizen.Await(p))
end

setmetatable(HTTP, {
    __index = function(t, k)
        return http[k]
    end,

    __newindex = function(t, k, v)
        return false
    end,

    __call = function(t,...)

    end
})

Router = {}

local allowed_methods = {
    GET = true,
    HEAD = true,
    POST = true,
    PUT = true,
    DELETE = true,
    CONNECT = true,
    OPTIONS = true,
    TRACE = true,
    PATCH = true,
}

local route_middlewares = {}
local route_callbacks = {}
local router = {}
for method, _ in pairs(allowed_methods) do
    route_callbacks[method] = {}
end

local function router_add_route(method, path, cb)
    if not route_callbacks[method][path] then route_callbacks[method][path] = {} end
    table.insert(route_callbacks[method][path], cb)
end

local function safe_path(path)
    if path:sub(#path, #path) == '/' then path = path:sub(1, #path - 1) end
    return path
end

local function get_start_path(path)
    local a = path:gsub(":(.*)", "")
    return a
end

local function check_paths_matches(path1, path2)
    local bars1 = path1:split('/')
    local bars2 = path2:split('/')
    if #bars1 ~= #bars2 then
        return false
    end
    local params = {}
    for k,bar1 in pairs(bars1) do
        local bar2 = bars2[k]
        if bar1:sub(1,1) == ':' then
            params[bar1:gsub(':','')] = bar2
        else
            if bar2 ~= bar1 then
                return false
            end
        end
    end
    return true, params
end

local function parse_path_query(path)
    local query = {}
    local _ = path:split("?")
    path = _[1]
    if path:sub(#path, #path) == '/' then path = path:sub(1, #path - 1) end
    if _[2] then
        local params = _[2]:split("&")
        for k,v in pairs(params) do
            local t = v:split("=")
            local a = 0
            query[t[1]] = t[2]
        end
    end
    return path, query
end

router.use = function(middleware)
    table.insert(route_middlewares, middleware)
end

SetHttpHandler(function(req,res)
    local headers = { ["X-POWERED-BY"] = "Nyo-Modules" }
    local code = 200
    local method = req.method
    local path = urldecode(req.path)
    local cbid = 1
    local mwid = 1
    local callbacks
    req.path, req.query = parse_path_query(path)
    path = req.path

    req.params = {}

    res.setHeaders = function(_headers)
        headers = _headers
        return res
    end

    res.setHeader = function(key, value)
        headers[key] = value
    end
    
    res.status = function(_code)
        code = _code
        return res
    end

    res.json = function(table)
        return res.send(json.encode(table))
    end

    local res_send = res.send

    res.send = function(data)
        res.writeHead(code, headers)
        res_send(data or '')
    end
    
    if route_callbacks[method][path] then
        callbacks = route_callbacks[method][path]
    else
        for k,v in pairs(route_callbacks[method]) do
            local safe_url = get_start_path(k)
            if path:find(safe_url) then
                local match, params = check_paths_matches(k, path)
                if match then
                    req.params = params
                    callbacks = v
                    break
                end
            end
        end
    end

    if not callbacks then
        return res.status(404).send('Route '..req.path..' with method '..req.method..' not found.')
    end

    local function next()
        cbid += 1
        if callbacks[cbid] then
            callbacks[cbid](req,res,next)
        end
    end

    local function nextmw()
        mwid += 1
        if not route_middlewares[mwid] then
            callbacks[cbid](req,res,next)
        else
            route_middlewares[mwid](req,res,nextmw)
        end
    end
    if not route_middlewares[mwid] then
        callbacks[cbid](req,res,next)
    else
        route_middlewares[mwid](req,res,nextmw)
    end

end)

setmetatable(Router, {
    __index = function(t, k)
        local method = k:upper()
        if allowed_methods[method] then
            return function (path, cb)
                router_add_route(method, path, cb)
            end
        elseif router[k] then
            return router[k]
        else
            error 'Invalid route method'
        end
    end,

    __newindex = function(t, k, v)
        return false
    end,

    __call = function(t,...)

    end
})

function bodyParser()

    return function(req,res,next)
        if req.method == "POST" then
            req.setDataHandler(function(data)
                req.body = json.decode(data or "[]") or {}
            end)
        end
        next()
    end

end

function cors()

    return function(req, res, next)
        res.setHeader("Access-Control-Allow-Origin", '*')
        next()
    end

end

Router.use(bodyParser())
Router.use(cors())
