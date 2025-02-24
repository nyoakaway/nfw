Nfw.registerConfig({
    config = {
        ['configDeathSystem'] = {
           enableGiveUp = true, -- habilita o botão desistir
           giveUpTime = 5, -- tempo em segundos para poder desistir           
           giveUpCoord = vec3(-1038.68,-2738.62,13.82), -- coordenada que vai reviver caso desistir
           enableRevive = true, -- habilita o botão de reviver
           reviveTime = 5, -- tempo em segundos para poder reviver (sem paramedico)
           reviveCost = 100000, -- valor em dinheiro que sera cobrado para reviver
           paymentType = 1, -- Da onde vai tirar o dinheiro ( 1 == mão, 2 == banco + mão)
           deathGrayCam = true,
           deathZoomCam = true,
        },    
    },
})