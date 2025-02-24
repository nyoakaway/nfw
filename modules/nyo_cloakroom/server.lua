local module = 'nyo_cloakroom'
local traceback = debug.traceback()
local valid_traceback = string.format('@nfw/modules/%s/server.lua', module)

if traceback:find(valid_traceback) then
    Nfw.registerNyoModule(module, "1.0.1", {"nyo_core"}, false, function()  
        NyoFw.prepare("nyo_module/nyo_cloakroom/select","SELECT cloakroom FROM nyo_character WHERE id = @user_id")
        NyoFw.prepare("nyo_module/nyo_cloakroom/update","UPDATE nyo_character SET cloakroom = @data WHERE id = @user_id") 

        getCloakCloth = function(user_id)
            local dt = NyoFw.querySync('nyo_module/nyo_cloakroom/select', { user_id = user_id })
            local ret = {}
            local retBool = false
            if dt[1] and dt[1].cloakroom ~= "" then 
                retBool = true
                ret = json.decode(dt[1].cloakroom)
            end
            return retBool, ret
        end,
        
        RPC.addHandler('cloakroom-changeCloakClothe', function(source, id, configIndex, sexo, atualCustom)
            local config = NfwConfigs[configIndex].cloakConfig
            local user_id = NyoFw.getCharId(source)
            if id then 
                if id == -1 then 
                    local status, gCloakCloth = getCloakCloth(user_id)

                    if status then                                 
                        NyoFw.querySync("nyo_module/nyo_cloakroom/update", {data = '', user_id = user_id}) 
                        return gCloakCloth
                    end
                else 
                    local crConfig = config.pressets
                    if crConfig then 
                        local crConfig2 = crConfig[sexo][id+1]  
                        local changeCloth = Nfw.checkPermission(user_id, crConfig2.perm)
                        
                        if changeCloth then 
                            local status, gCloakCloth = getCloakCloth(user_id)
                            if status then 
                                return crConfig2.clothe
                            else 
                                atualCustom[2] = nil
                                NyoFw.querySync("nyo_module/nyo_cloakroom/update", {data = json.encode(atualCustom), user_id = user_id}) 
                                return crConfig2.clothe
                            end
                        else 
                            NfwGlobalFunctions.notify(source, 'Erro', 'Você não possui permissão de utilizar esta roupa.', "#FF0000", 5000)
                        end
                       
                    end
                end
            end
        end)

    end)
else
    error 'Module name has been modified'
    Nfw.preventCheat()
end