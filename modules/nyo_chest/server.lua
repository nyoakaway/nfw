local module = 'nyo_chest'
local traceback = debug.traceback()
local valid_traceback = string.format('@nfw/modules/%s/server.lua', module)

if traceback:find(valid_traceback) then
    Nfw.registerNyoModule(module, "1.0.0", {"nyo_core"}, false, function()

        if not GetResourceKvpString('nfw_install_chest') then 
            NyoFw.querySync([[
                CREATE TABLE IF NOT EXISTS `nyo_chest` (
                    `id` varchar(20) NOT NULL,
                    `data` longtext NOT NULL DEFAULT '{"i":[],"w":[]}',
                    `weight` int(4) NOT NULL,
                UNIQUE KEY `chestId` (`id`)
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
            ]])

            SetResourceKvp('nfw_install_chest', true)
        end

       
    end)
else
    error 'Module name has been modified'
    Nfw.preventCheat()
end