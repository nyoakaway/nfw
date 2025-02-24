const nyo_skinshop_images = 'http://127.0.0.1/nfw/roupas/'

const nyo_skinshop = new Module('nyo_skinshop');

let lojaDados = null
let dataPartE = null;
let dataPartD = null;
let change = {};
let oldPart = {};
let lojaType = '';
let sexo = 'M';

nyo_skinshop.registerOpenUiFunction((data) => {
    let {
        oldpart: dOldPart,
        config: dConfig,
        categoryE: dCategoryE,
        categoryD: dCategoryD,
        type: dType,
        sexo: dSexo,
        drawaE: dDrawnaE } = data
    
    oldPart = dOldPart;
    change = {};
    lojaDados = dConfig;
    dataPartE = dCategoryE;
    dataPartD = dCategoryD;
    lojaType = dType;
    sexo = dSexo;
    typeOpen = 'skinShop';
    $('#precoTotalSkinShop').html('<span lang="ui-currency-symbol"></span>' + (new Intl.NumberFormat(nyo_skinshop.currentLanguage, { minimumFractionDigits: 2 }).format(0)));
    setSkinShopE(dDrawnaE);
    try {
        document.querySelector(".activeMSkinShop").classList.remove('activeMSkinShop')
        document.querySelector(".flexSkinShop aside .categorySkinShop[data-idpart='mascara']").classList.add('activeMSkinShop')
    } catch (e) {
        
    }
    setTimeout(() => {
        selectShopPart()
    }, 1000)
})

nyo_skinshop.registerCloseUiFunction(() => {
    $('.color-contentSkinShop').css("opacity", 0);  
    $('.color-contentSkinShop').removeClass('animarColorSkinShop');
    $('.color-contentSkinShop').removeClass('animarColorCloseSkinShop');                         
    colorSkinShop = true;  
    FetchData('close', {})
})

nyo_skinshop.addMessageHandler('updateSkinShop', (data) => {
    dataPartE = data.newPart;
    setSkinShopE(data.drawa);
})

nyo_skinshop.addMessageHandler('updateSkinShopPrice', (data) => {
    $('#precoTotalSkinShop').html('<span lang="ui-currency-symbol"></span>'+(new Intl.NumberFormat(nyo_skinshop.currentLanguage,  { minimumFractionDigits: 2 }).format(data.value)));
})

nyo_skinshop.addMessageHandler('updateSkinShopColor', (data) => {
    setSkinShopColorE(data.drawa, data.roupaId);
})

function inArray(needle, haystack) {
    var length = haystack.length;
    for(var i = 0; i < length; i++) {
        if(haystack[i] == needle) return true;
    }
    return false;
}

const onRangeChange = (type, rotation) => {
    FetchData('shopRotation', {rotation});
}

const shopChangeCam = (type) => {
    FetchData('shopCam', {type});
}

async function setSkinShopE(drawna) {
    $('.listaCorSkinShop').html('');
    $('#searchSkinShop').val('');
    var priceG = lojaDados[dataPartE]['price']
    if(dataPartE == 'p2' || dataPartE == 'p6'|| dataPartE == 'p7'){                    
        $(".listagemSkinShop").append(`
            <div class="item itemPSkinShop" data-id="E${i}" onclick="selectSkinShopItem('E', -1, true, true, 0)" id="">
                <img src="${nyo_skinshop_images}${dataPartE}/${sexo}/0_0.png">
                <small><b>Remover</b></small>
                <span>R$ ${priceG}</span>
            </div>
        `);
    }
    
    let listagemSkinShop = document.querySelector('.listagemSkinShop')
    let innerHtml = ''
    let selected = 0

    for (var i = 0; i <= (drawna - 1); i++) {   
        var exibeItem = false;
        if(lojaType == 'all'){
            exibeItem = true;
        }else if(lojaType == 'exclusive'){
            if(inArray(i, lojaDados[dataPartE]['item'][sexo])){
                exibeItem = true;
            }
        }else if(lojaType == 'exclude'){
            if(!inArray(i, lojaDados[dataPartE]['item'][sexo])){
                exibeItem = true;
            }
        }

        // console.log(exibeItem)

        if (exibeItem) {

            innerHtml += `
                <div class="item itemPSkinShop" data-id="E${i}" onclick="selectSkinShopItem('E', ${i}, true, true, 0)" id="E${dataPartE}${i}"
                style="background-image: url(${nyo_skinshop_images}${dataPartE}/${sexo}/${i}_0.jpg); background-size: 100%;">
                    <active></active>
                    <small>${i}</small>
                    <span>R$ ${priceG}</span>
                </div>
            `
            if (oldPart[dataPartE][0] == i) {
                selected = i
            }  
        } 
    }

    listagemSkinShop.innerHTML = innerHtml
    selectSkinShopItem('E', selected, true, false, oldPart[dataPartE][1]);
}

function setSkinShopColorE(drawna, roupaId) {
    let listagemSkinShop = document.querySelector('.listaCorSkinShop')
    let innerHtml = ''
    let itemMax = drawna - 1; 
    let selected = 0
    for (var i = 0; i <= itemMax; i++) {             
        innerHtml += `
            <div class="item flex-centerSkinShop corItemSkinShop" data-id="EC${roupaId}${i}" onclick="selectSkinShopItem('E', ${roupaId}, false, true, ${i})" id="EC${dataPartE}${roupaId}${i}"
            style="background-image: url(${nyo_skinshop_images}${dataPartE}/${sexo}/${roupaId}_${i}.jpg); background-size: 100%;">
                <small><b>${i}</b></small>
            </div>   
        `

        if (oldPart[dataPartE][1] == i) {
            selected = i
        }
    };   
    
    listagemSkinShop.innerHTML = innerHtml
    selectSkinShopColorItem('E', roupaId, selected);
}

function selectShopPart(element) {    
    if (!element) return
    let dataPart = element.dataset.idpart;
    let menu = element.dataset.idmenu;
    let titulo = element.dataset.titulo;
    $('.flexSkinShop aside .categorySkinShop').removeClass('activeMSkinShop');
    $(element).addClass('activeMSkinShop');
    $('#searchSkinShop').val('');

    var arr = {'part': dataPart, 'menu': menu};
    FetchData('changeSkinShopPart', arr);
}

function searchSkinShop(){
    var value = $('#searchSkinShop').val();
    var el = $('.itemPSkinShop');

    $.each(el, function(e, e2) {
        let dataId = e2.dataset.id;
        if (dataId.indexOf(value) > -1) {
            $(e2).css("display","inline-flex");
        }else{
            $(e2).css("display","none");
        }
   });
}

function selectSkinShopColorItem(menu, i, color){
    $('#EC'+dataPartE+i+color).addClass('activeSkinShop');
    ndPart = dataPartE
    oldPart[ndPart][1] = color;
}

function selectSkinShopItem(menu, i, menuChange, change, color){
   // Aqui vai selecionar o item e setar as cores
   // $(".itemPSkinShop").removeClass("activeSkinShop");
   // $(".corItemSkinShop").removeClass("activeSkinShop");
   // $('#E'+dataPartE+i).addClass("activeSkinShop");
   // $('#EC'+dataPartE+i+color).addClass('activeSkinShop');
   $('active').html('');
   $('#E'+dataPartE+i+' active').html('<i class="far fa-check-circle"></i>'); 
   ndPart = dataPartE;

   oldPart[ndPart][0] = i;
   oldPart[ndPart][1] = color;

   var arr = {'part': ndPart, 'itemId': i, 'menu': menu, 'menuChange': menuChange, 'change': change, 'color': color};
   FetchData('changeSkinShopMenuColor', arr);
}

function paymentSkinShop(){
    FetchData('payment',{});
}
