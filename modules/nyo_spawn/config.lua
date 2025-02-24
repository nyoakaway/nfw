Nfw.registerConfig({
    config = {
        ['spawnConfig'] = {
            enableHouse = true, -- habilitar spawn nas casas
            enableLastPos = true, -- habilita spawnar na ultima posição
            startPos = vector3(255.73364257812,-1502.1202392578,29.141592025757), -- Primeiro spawn do personagem
            spawnLocs = {
                ['nomequalquer'] = {loc = vec3(0,0,0), name = 'Spawn 1', desc = 'Descrição bonitinha', imgBack = 'busao', imgMarker = 'marker2', perm = ""},
                ['nomequalquer2'] = {loc = vec3(87.479026794434,-1391.3387451172,29.187791824341), name = 'Spawn 2', desc = 'descrição bonitinha 2.0', imgBack = 'busao', imgMarker = 'marker2', perm = {"blablabla.permissao"}}
            },
            spawnCamType = 2, -- 1 (CIMA / BAIXO), -- 2 (AVIADOR)
            spawnCamCoord = vector3(674.29,931.39,316.59) -- Coordenada da camera do aviador (caso CamType == 2)
        }
    }
})