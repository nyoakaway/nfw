const nyo_wardrobe = new Module('nyo_wardrobe')

// openGuardaRoupa(action.oldpart, action.config, action.categoryE,action.categoryD,action.type,action.sexo,action.drawaE,action.drawaD);
/* 
function openGuardaRoupa(dOldPart, dConfig, dCategoryE, dCategoryD, dType, dSexo, dDrawnaE, dDrawnaD){    
    oldPart = dOldPart;
    change = {};
    lojaDados = dConfig;
    dataPartE = dCategoryE;
    dataPartD = dCategoryD;
    lojaType = dType;
    sexo = dSexo;
    typeOpen = 'guardaRoupa';
    $('#precoTotalGuardaRoupa').html('R$0');
    $(".menuGuardaRoupaE").removeClass("selecionadoGuardaRoupa");
    $(".menuGuardaRoupaE[data-idpart='mascara']").addClass("selecionadoGuardaRoupa");
    $(".menuGuardaRoupaD").removeClass("selecionadoGuardaRoupa");
    $(".menuGuardaRoupaD[data-idpart='oculos']").addClass("selecionadoGuardaRoupa");
    $('#actionmenuGuardaRoupa').fadeIn(1);
    setGuardaRoupaE(dDrawnaE);
    setGuardaRoupaD(dDrawnaD);   
    setNuiColor('guardaRoupa');   
}
*/

var gCategory = 1;
var gSexo = 'Male';
var gPrefix = 'M';
var gDrawa;
var gOldPart;
var gConfig;

nyo_wardrobe.registerOpenUiFunction((data) => {
    gCategory = data.category;
    gDrawa = data.drawa;
    gPrefix = data.prefix;
    gSexo = data.sexo;
    gOldPart = data.oldpart;
    gConfig = data.config;

    setGuardaRoupa();
})

nyo_wardrobe.registerCloseUiFunction(() => {
    FetchData('close', {})
})

function setGuardaRoupa(){
    $('.listagemGuardaRoupa').html('');
    $('.listaCorGuardaRoupa').html('');
    if(gCategory == 'p2' || gCategory == 'p6'|| gCategory == 'p7'){             
        $(".listagemGuardaRoupa").append(`
        <div class="item itemPGuardaRoupa" data-id="" onclick="selectGuardaRoupaItem(-1, true, true, 0)" id=""
        style="background-image: url(${nyo_skinshop_images}${gCategory}/${gSexo}/0_0.jpg); background-size: 100%;">
            <active></active>
            <small>-1</small>
            <span>R$ 0</span>
        </div>
        `);
    }

    if(gCategory != 'outfit'){
        $('.flexGuardaRoupa section .shop-color').css("display","block");

        var lData = gConfig['clouth'][gCategory];
        for (var i = 0; i <= (gDrawa -1); i++) {   
            var exibeItem = false;
            if (lData){
                if(lData[i]){                    
                    exibeItem = true;
                }
            }
            if(exibeItem){
                $(".listagemGuardaRoupa").append(`
                    <div class="item itemPGuardaRoupa" data-id="${i}" onclick="selectGuardaRoupaItem(${i}, true, true, 0)" id="E${gCategory}${i}"
                    style="background-image: url(${nyo_skinshop_images}${gCategory}/${gSexo}/${i}_0.jpg); background-size: 100%;">
                        <active></active>
                        <small>${i}</small>
                        <span>R$ 0</span>
                    </div>
                `);

                if (gOldPart[gCategory][0] == i) {
                    selectGuardaRoupaItem(i, true, false, gOldPart[gCategory][1]);
                }  
            } 
        }
    }else{  

        $('.flexGuardaRoupa section .shop-color').css("display","none");
        var lData = gConfig['outfit'];       

        $(".listagemGuardaRoupa").append(`            
            <div class="addOutfit" onclick="createOutfit()">
                <i class="fal fa-plus-octagon"></i>
                <small>criar preset</small>
            </div>
        `);
        
        for (const [key, value] of Object.entries(lData)) {
            $(".listagemGuardaRoupa").append(`
            <div class="item-drobe itemPGuardaRoupa" data-id="${key}">
                <i class="fas fa-tshirt"></i>
                <div class="actions">
                    <button onClick="excluirOutfit('${key}')">remover</button>
                    <button onClick="usarOutfit('${key}')">usar</button>
                </div>
                <div class="text">
                    <small>outfit</small>
                    <span>${key}</span>
                </div>
            </div>
            `);
            /*
            <div class="outfitsGuardaRoupa GuardaRoupaMenuD" data-id="D${key}">
                    <div class="nomeOutfitGuardaRoupa">${key}</div>
                    <div class="botoesDivGuardaRoupa">
                        <div class="botaoOutGuardaRoupaUsar" id="usarOutfit" onClick="usarOutfit('${key}')">USAR</div>
                        <div class="botaoOutGuardaRoupaExcluir" id="excluirOutfit" onClick="excluirOutfit('${key}')">EXCLUIR</div>
                    </div>
                </div>
                */
        }
    }
}

function selectGuardaPart(element) {    
    let dataPart = element.dataset.idpart;
    let menu = element.dataset.idmenu;
    let titulo = element.dataset.titulo;

    $('.flexGuardaRoupa aside .categoryGuardaRoupa').removeClass('activeMGuardaRoupa');
    $(element).addClass('activeMGuardaRoupa');
    $('#searchGuardaRoupa').val('');

    var arr = {'part': dataPart, 'menu': menu};
    FetchData('changeGuardaRoupaPart', arr);
}

function selectGuardaRoupaItem(i, menuChange, change, color){
    // Aqui vai selecionar o item e setar as cores
    // if (menu == 'E'){
    //  $('.itemGuardaRoupaMenuEsquerda').removeClass('selecionadoGuardaRoupa');        
    //  $('.itemGuardaRoupaCorEsquerda').removeClass('selecionadoGuardaRoupa'); 
    //  $('#E'+dataPartE+i).find('.valorGuardaRoupa').addClass('selecionadoGuardaRoupa');
    //  $('#E'+dataPartE+i).find('.idGuardaRoupa').addClass('selecionadoGuardaRoupa');   
    //  $('#EC'+dataPartE+i+color).find('.itemGuardaRoupaCorEsquerda').addClass('selecionadoGuardaRoupa');
    //  ndPart = dataPartE;
    // }else if(menu == 'D'){
    //  $('.itemGuardaRoupaMenuDireita').removeClass('selecionadoGuardaRoupa');
    //  $('.itemGuardaRoupaCorDireita').removeClass('selecionadoGuardaRoupa');
    //  $('#D'+dataPartD+i).find('.valorGuardaRoupa').addClass('selecionadoGuardaRoupa');
    //  $('#D'+dataPartD+i).find('.idGuardaRoupa').addClass('selecionadoGuardaRoupa');
    //  $('#DC'+dataPartD+i+color).find('.itemGuardaRoupaCorDireita').addClass('selecionadoGuardaRoupa');
    //  ndPart = dataPartD;
    // }
 
    gOldPart[gCategory][0] = i;
    gOldPart[gCategory][1] = color;
 
    var arr = {'part': gCategory, 'itemId': i, 'menuChange': menuChange, 'change': change, 'color': color};
    FetchData('changeGuardaRoupaMenuColor', arr);
 }

function setGuardaRoupaColor(roupaId){
    $('.listaCorGuardaRoupa').html('');
    let itemMax = gDrawa - 1; 
    for (var i = 0; i <= itemMax; i++) {             
        $(".listaCorGuardaRoupa").append(`
            <div class="item flex-centerSkinShop corItemSkinShop" data-id="EC${roupaId}${i}" onclick="selectGuardaRoupaItem(${roupaId}, false, true, ${i})" id="EC${gCategory}${roupaId}${i}"
            style="background-image: url(${nyo_skinshop_images}${gCategory}/${gSexo}/${roupaId}_${i}.jpg); background-size: 100%;">
                <small><b>${i}</b></small>
            </div>  
        `);

        if (gOldPart[gCategory][1] == i) {
           selectGuardaRoupaColorItem(roupaId, i);
        }
    };     
}

function selectGuardaRoupaColorItem(i, color){
    // if(menu == 'E'){
    //     $('.itemGuardaRoupaCorEsquerda').removeClass('selecionadoGuardaRoupa');
    //     $('#EC'+dataPartE+i+color).find('.itemGuardaRoupaCorEsquerda').addClass('selecionadoGuardaRoupa');
    // }else if(menu == 'D'){
    //     $('.itemGuardaRoupaCorDireita').removeClass('selecionadoGuardaRoupa');
    //     $('#DC'+dataPartD+i+color).find('.itemGuardaRoupaCorDireita').addClass('selecionadoGuardaRoupa');
    // }

    gOldPart[gCategory][1] = color;
}

function searchGuardaRoupa(){
    var value = $('#searchGuardaRoupa').val();
    var el = $('.itemPGuardaRoupa');


   $.each(el, function(e, e2) {
       let dataId = e2.dataset.id;
       if (dataId.indexOf(value) > -1) {
           $(e2).css("display","inline-flex");
       }else{
           $(e2).css("display","none");
       }
    });
}

function createOutfit() {
    Swal.fire({
        title: 'Nome',
        input: 'text',
        confirmButtonText: 'Confirmar',
        cancelButtonText: 'Cancelar',
        showCancelButton: true,
        inputAttributes: {min: 1},
    }).then((value) => {
        if (value.value !== undefined) {
           FetchData('salvarOutfit', {'name': value.value});
        }
    });
}

function usarOutfit(k){
    FetchData('guardaRoupaUsarOutfit', {'name': k});
}

function excluirOutfit(k){
    FetchData('guardaRoupaExcluirOutfit', {'name': k});
}

function paymentGuardaRoupa(){
    FetchData('payment',{});
}

const guardaRangeChange = (type, rotation) => {
    FetchData('guardaRotation', {rotation});
}

const guardaChangeCam = (type) => {
    FetchData('guardaCam', {type});
}

nyo_wardrobe.addMessageHandler('updateGuardaRoupa', (data) => {
    gCategory = data.newPart;
    gDrawa = data.drawa;
    setGuardaRoupa();
})

nyo_wardrobe.addMessageHandler('updateGuardaRoupaColor', (data) => {
    gDrawa = data.drawa;
    setGuardaRoupaColor(data.roupaId);
})

nyo_wardrobe.addMessageHandler('updateGuardaRoupaOutFit', (data) => {
    gCategory = data.newPart;
    gDrawa = data.drawa;
    gConfig = data.config;
    setGuardaRoupa();
})






////////////////////////// REFAZER

function setGuardaRoupaE(drawna) {
    $('.listagemGuardaRoupaEsquerda').html('');
    $('.listaCorGuardaRoupaE').html('');

    if(dataPartE == 'p2' || dataPartE == 'p6'|| dataPartE == 'p7'){                    
        $(".listagemGuardaRoupaEsquerda").append(`
            <div class="fundoItemGuardaRoupa comTresGuardaRoupa GuardaRoupaMenuE" data-id="E${i}" onclick="selectGuardaRoupaItem('E', -1, true, true, 0)" id="">
                <div class="itemGuardaRoupa" style="background: url('http://26.104.3.179/roupas/${dataPartE}/${sexo}/0_0.png'); background-size: 100% 100%; background-position: center;">
                </div>
                <div class="valorGuardaRoupa itemGuardaRoupaMenuEsquerda">0</div>
                <div class="idGuardaRoupa itemGuardaRoupaMenuEsquerda">-1</div>
            </div>
        `);
    }

   
 
}


