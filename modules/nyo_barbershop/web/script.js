const barberShop = new Module('nyo_barbershop')

var barberlojaType = null;
var barberlojaDados = null;
var barberdataPartE = null;
var barberdrawna = null;
var barbertexture = null;
var barbersexo = null;
var barbersexoB = '';
var barbercorPrim = false;
var barbercorSec = false;
var barberopacity = false;
var barberoldPart = {}
var barberchange = null

var mostrandoColorBarberShopE = 0;
var mostrandoColorBarberShopD = 0;
var colorListBarberShop = ["#1C1F21", "#272A2C", "#312E2C", "#35261C", "#4B321F", "#5C3B24", "#6D4C35", "#6B503B", "#765C45", "#7F684E",
    "#99815D", "#A79369", "#AF9C70", "#BBA063", "#D6B97B", "#DAC38E", "#9F7F59", "#845039", "#682B1F", "#61120C", "#640F0A",
    "#7C140F", "#A02E19", "#B64B28", "#A2502F", "#AA4E2B", "#626262", "#808080", "#AAAAAA", "#C5C5C5", "#463955", "#5A3F6B",
    "#763C76", "#ED74E3", "#EB4B93", "#F299BC", "#04959E", "#025F86", "#023974", "#3FA16A", "#217C61", "#185C55", "#B6C034",
    "#70A90B", "#439D13", "#DCB857", "#E5B103", "#E69102", "#F28831", "#FB8057", "#E28B58", "#D1593C", "#CE3120", "#AD0903",
    "#880302", "#1F1814", "#291F19", "#2E221B", "#37291E", "#2E2218", "#231B15", "#020202", "#706C66", "#9D7A50"];

var imgBarberShop = 'http://127.0.0.1/nfw/barber/';

barberShop.registerOpenUiFunction((data) => {
    $('#precoTotalBarberShop').html('<span lang="ui-currency-symbol"></span>'+ (new Intl.NumberFormat(barberShop.currentLanguage, { minimumFractionDigits: 2 }).format(0)));
    setBarberShop(data)
})
barberShop.addMessageHandler('updateBarberShop', setBarberShop)
barberShop.addMessageHandler('updateBarberShopPrice', (data) => {
    $('#precoTotalBarberShop').html('<span lang="ui-currency-symbol"></span>'+ (new Intl.NumberFormat(barberShop.currentLanguage, { minimumFractionDigits: 2 }).format(data.value)));
})

barberShop.registerCloseUiFunction(async () => {
    FetchData('closeBarber')
})


function setBarberShop(data){
    $('.listagemBarberShop').html('');
    $('#searchBarberShop').val('');

    if (data.type) {
        barberoldPart = data.oldpart;
        barberchange = {};
        barberlojaType = data.type;
        barberlojaDados = data.config.shopConfig;
        barbersexo = data.prefix;
        barbersexoB = '';
        
        if(barbersexo == 'M'){
            barbersexoB = 'Male';
        }else if(barbersexo == 'F'){
            barbersexoB = 'Female';
        }
    }

    barberdataPartE = data.category || data.newPart;
    barberdrawna = data.drawa;
    barbertexture = data.barbertexture;
    
    barbercorPrim = false;
    barbercorSec = false;
    barberopacity = false;
    
    $("#corBarberShop").html('');

    if(barberdataPartE == 0 || barberdataPartE == 1 || barberdataPartE == 2 ||barberdataPartE == 3 || barberdataPartE == 4 || barberdataPartE == 5 || barberdataPartE == 6 || barberdataPartE == 7 || barberdataPartE == 8 || barberdataPartE == 9 || barberdataPartE == 10 ){
        barberopacity = true;
        barberopacityOld = data.opacity
    }

    if(barberdataPartE == 1 || barberdataPartE == 2 || barberdataPartE == 5 || barberdataPartE == 8){
        barbercorPrim = true;
    }else if(barberdataPartE == 12){
        barbercorPrim = true; 
        barbercorSec = true;               
    }else{

        // if(!barberopacity){            
        //     $('#corEsquerdoBarberShop').slideUp(200);
        //     mostrandoColorBarberShopE = 0;
        // }
    }

    if(barbercorPrim || barbercorSec || barberopacity){
        if(barbercorPrim){
            $("#corBarberShop").append(`<div class="colunaBarberShop">
                                            <span>Cores 1</span>
                                            <div class="coluna-contentBarberShop colorList1">`);
            for (var i in colorListBarberShop) {
                $(".colorList1").append(`<div class="color" style="background: ${colorListBarberShop[i]};" onClick="changeBarberShopColor(${i},'1')"></div>`);            
            }                                            
            $("#corBarberShop").append(`</div></div>`);
        }

        if(barbercorSec){
            $("#corBarberShop").append(`<div class="colunaBarberShop">
                                            <span>Cores 2</span>
                                            <div class="coluna-contentBarberShop colorList2">`);
            for (var i in colorListBarberShop) {
                $(".colorList2").append(`<div class="color" style="background: ${colorListBarberShop[i]};" onClick="changeBarberShopColor(${i},'2')"></div>`);            
            }                                            
            $("#corBarberShop").append(`</div></div>`);
        }

        if(barberopacity){
            $("#corBarberShop").append(`
            <div class="colunaBarberShop">
                <div class="coluna-barberopacityBarberShop">
                    <span>opacidade</span>
                    <input class="barberopacityBShop" type="range" style="margin: 0;"  oninput="barberShopbarberOpacityChange(this)" value="${barberopacityOld}" step="0.01" min="0.01" max="0.99">
                </div>
            </div>`);

            var min = 0.01,
            max = 0.99,
            val = barberopacityOld;
        
            $(".barberopacityBShop").css({
                'backgroundSize': (val - min) * 100 / (max - min) + '% 100%'
            });
        }
    }

    for (var i = 0; i <= (barberdrawna -1); i++) {   
        var exibeItem = false;
        if(barberlojaType == 'all'){
            exibeItem = true;
        }else if(barberlojaType == 'exclusive'){
            if(inArray(i, barberlojaDados[barberdataPartE]['item'][barbersexoB])){
                exibeItem = true;
            }
        }else if(barberlojaType == 'exclude'){
            if(!inArray(i, barberlojaDados[barberdataPartE]['item'][barbersexoB])){
                exibeItem = true;
            }
        }

        if (exibeItem) {
            $(".listagemBarberShop").append(`
            <div class="item itemPBarberShop" data-id="E${i}" onclick="selectBarberShopItem('E', ${i})" id="E${barberdataPartE}${i}"
                 style="background-image: url(${imgBarberShop}${barberdataPartE}/${barbersexo}/${i}.jpg); background-size: 100%;">
                <active></active>
                <small><b>${i}</b></small>
                <span>R$ ${barberlojaDados[barberdataPartE]['price']}</span>
            </div>            
            `);
           /*if (barberoldPart[barberdataPartE][0] == i) {
                selectBarberShopItem('E', i);
            }  */
        } 
    }
}



// function setBarberShop(barberdrawna, barbertexture, barberopacityOld) {
//     $('.listagemBarberShop').html('');
//     $('#searchBarberShop').val('');
    
//     var barbersexoB = '';

//     if(barbersexo == 'M'){
//         barbersexoB = 'Male';
//     }else if(barbersexo == 'F'){
//         barbersexoB = 'Female';
//     }
    
//     var barbercorPrim = false;
//     var barbercorSec = false;
//     var barberopacity = false;
//     $("#corBarberShop").html('');

//     if(barberdataPartE == 0 || barberdataPartE == 1 || barberdataPartE == 2 ||barberdataPartE == 3 || barberdataPartE == 4 || barberdataPartE == 5 || barberdataPartE == 6 || barberdataPartE == 7 || barberdataPartE == 8 || barberdataPartE == 9 || barberdataPartE == 10 ){
//         barberopacity = true;
//     }

//     if(barberdataPartE == 1 || barberdataPartE == 2 || barberdataPartE == 5 || barberdataPartE == 8){
//         barbercorPrim = true;
//     }else if(barberdataPartE == 12){
//         barbercorPrim = true; 
//         barbercorSec = true;               
//     }else{

//         // if(!barberopacity){            
//         //     $('#corEsquerdoBarberShop').slideUp(200);
//         //     mostrandoColorBarberShopE = 0;
//         // }
//     }

//     if(barbercorPrim || barbercorSec || barberopacity){
//         if(barbercorPrim){
//             $("#corBarberShop").append(`<div class="colunaBarberShop">
//                                             <span>Cores 1</span>
//                                             <div class="coluna-contentBarberShop colorList1">`);
//             for (var i in colorListBarberShop) {
//                 $(".colorList1").append(`<div class="color" style="background: ${colorListBarberShop[i]};" onClick="changeBarberShopColor(${i},'1')"></div>`);            
//             }                                            
//             $("#corBarberShop").append(`</div></div>`);
//         }

//         if(barbercorSec){
//             $("#corBarberShop").append(`<div class="colunaBarberShop">
//                                             <span>Cores 2</span>
//                                             <div class="coluna-contentBarberShop colorList2">`);
//             for (var i in colorListBarberShop) {
//                 $(".colorList2").append(`<div class="color" style="background: ${colorListBarberShop[i]};" onClick="changeBarberShopColor(${i},'2')"></div>`);            
//             }                                            
//             $("#corBarberShop").append(`</div></div>`);
//         }

//         if(barberopacity){
//             $("#corBarberShop").append(`
//             <div class="colunaBarberShop">
//                 <div class="coluna-barberopacityBarberShop">
//                     <span>opacidade</span>
//                     <input class="barberopacityBShop" type="range" style="margin: 0;"  oninput="barberShopbarberOpacityChange(this)" value="${barberopacityOld}" step="0.01" min="0.01" max="0.99">
//                 </div>
//             </div>`);

//             var min = 0.01,
//             max = 0.99,
//             val = barberopacityOld;
        
//             $(".barberopacityBShop").css({
//                 'backgroundSize': (val - min) * 100 / (max - min) + '% 100%'
//             });
//         }
//     }

//     for (var i = 0; i <= (barberdrawna -1); i++) {   
//         var exibeItem = false;
//         if(barberlojaType == 'all'){
//             exibeItem = true;
//         }else if(barberlojaType == 'exclusive'){
//             if(inArray(i, barberlojaDados[barberdataPartE]['item'][barbersexoB])){
//                 exibeItem = true;
//             }
//         }else if(barberlojaType == 'exclude'){
//             if(!inArray(i, barberlojaDados[barberdataPartE]['item'][barbersexoB])){
//                 exibeItem = true;
//             }
//         }



//         if(exibeItem){
//             $(".listagemBarberShop").append(`
//             <div class="item itemPBarberShop" data-id="E${i}" onclick="selectBarberShopItem('E', ${i})" id="E${barberdataPartE}${i}"
//                  style="background-image: url(${imgBarberShop}${barberdataPartE}/${barbersexo}/${i}.jpg); background-size: 100%;">
//                 <active></active>
//                 <small><b>1${i}</b></small>
//                 <span>R$ ${barberlojaDados[barberdataPartE]['price']}</span>
//             </div>            
//             `);
//             if (barberoldPart[barberdataPartE][0] == i) {
//                 selectBarberShopItem('E', i);
//             }  
//         } 
//     }
// }

function selectBarberPart(element) {    
    let dataPart = element.dataset.idpart;
    let menu = element.dataset.idmenu;
    let titulo = element.dataset.titulo;
    $('.flexBarberShop aside .categoryBarberShop').removeClass('activeMBarberShop');
    $(element).addClass('activeMBarberShop');
    $('#searchBarberShop').val('');

    var arr = {'part': dataPart, 'menu': menu};
    FetchData('changeBarberShopPart', arr);
}

function searchBarberShop(){
    var value = $('#searchBarberShop').val();
    var el = $('.itemPBarberShop');

    $.each(el, function(e, e2) {
        let dataId = e2.dataset.id
        if (dataId.indexOf(value) > -1) {
            $(e2).css("display","inline-flex");
        }else{
            $(e2).css("display","none");
        }
   });
}

function changeBarberShopColor(i, type){
    FetchData('changeBarberShopColor', {'part': barberdataPartE, 'color': i, 'type': type});
}

function selectBarberShopItem(menu, i){
   // Aqui vai selecionar o item e setar as cores
    // $('.itemPBarberShop').removeClass('activeBarberShop');
    // $('#E'+barberdataPartE+i).addClass('activeBarberShop');
    $('active').html('');
    $('#E'+barberdataPartE+i+' active').html('<i class="far fa-check-circle"></i>');
    
    ndPart = barberdataPartE;

   barberoldPart[ndPart][0] = i;

   var arr = {'part': ndPart, 'itemId': i, 'menu': menu};
   FetchData('changeBarberShopItem', arr);
}

function barberShopbarberOpacityChange (e) {
    let barberopacity = e.value;
    
    var min = e.min,
    max = e.max,
    val = e.value;

    $(e).css({
        'backgroundSize': (val - min) * 100 / (max - min) + '% 100%'
    });

    FetchData('changeBarberShopbarberOpacity', {'part': barberdataPartE, 'opacity': barberopacity});
}

// function paymentBarberShop(){
//     FetchData('ButtonClick','payment');
// }

// function closeBarberShopUI(){
//     $('#actionmenuBarberShop').fadeOut(1);
//     FetchData('ButtonClick','exit');
// }

function inArray(needle, haystack) {
    var length = haystack.length;
    for(var i = 0; i < length; i++) {
        if(haystack[i] == needle) return true;
    }
    return false;
}

function barberRotate(value) {
    FetchData('changeRotation', { value })
}

const barbershopChangeCam = (type) => {
    FetchData('shopCam', {type});
}

function paymentBarberShop() {
    FetchData('payment', {})
}