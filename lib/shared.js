const IsServer = IsDuplicityVersion()
let nfw_functions = {}
let nfw_global_functions = {}
let nyo_fw_functions = {}

let NfwClient, Router, HTTP;

const exp = global.exports

const Nfw = new Proxy({}, {
    get: (target, key, receiver) => {
        if (!nfw_functions[key]) nfw_functions[key] = exp.nfw.getFunction('Nfw', key)
        const err = new Error()
        const module = err.stack.replaceAll(/(.*)at @nfw\/modules\//gs, '').replace(/\/(.*)/g, '')
        exp.nfw.setLastCaller(module)
        return nfw_functions[key]
    },

    set: (target, key, value, receiver) => {
        return false
    }
})

const NfwGlobalFunctions = new Proxy({}, {
    get: (target, key, receiver) => {
        if (!nfw_global_functions[key]) nfw_global_functions[key] = exp.nfw.getFunction('NfwGlobalFunctions', key)
        const err = new Error()
        const module = err.stack.replaceAll(/(.*)at @nfw\/modules\//gs, '').replace(/\/(.*)/g, '')
        exp.nfw.setLastCaller(module)
        return nfw_global_functions[key]
    },

    set: (target, key, value, receiver) => {
        return false
    }
})

const NyoFw = new Proxy({}, {
    get: (target, key, receiver) => {
        if (!nyo_fw_functions[key]) nyo_fw_functions[key] = exp.nfw.getFunction('NyoFw', key)
        const err = new Error()
        const module = err.stack.replaceAll(/(.*)at @nfw\/modules\//gs, '').replace(/\/(.*)/g, '')
        exp.nfw.setLastCaller(module)
        return nyo_fw_functions[key]
    },

    set: (target, key, value, receiver) => {
        return false
    }
})

const NfwConfigs = new Proxy({}, {
    get: (target, key, receiver) => { 
        return exp.nfw.getFunction('NfwConfigs', key)
    },

    set: (target, key, value, receiver) => {
        return false
    }
})

if (!IsServer) {
    let nfw_client_functions = {}
    NfwClient = new Proxy({}, {
        get: (target, key, receiver) => {
            if (!nfw_client_functions[key]) nfw_client_functions[key] = exp.nfw.getFunction('NfwClient',key)
            return nfw_client_functions[key]
        },
    
        set: (target, key, value, receiver) => {
            return false
        }
    })
} else {
    let router_functions = {}
    Router = new Proxy({}, {
        get: (target, key, receiver) => {
            if (!router_functions[key]) router_functions[key] = exp.nfw.getFunction('Router',key)
            return router_functions[key]
        },
    
        set: (target, key, value, receiver) => {
            return false    
        }
    })

    let http_functions = {}
    HTTP = new Proxy({}, {
        get: (target, key, receiver) => {
            if (!http_functions[key]) http_functions[key] = exp.nfw.getFunction('HTTP',key)
            return http_functions[key]
        },
    
        set: (target, key, value, receiver) => {
            return false    
        }
    })

}