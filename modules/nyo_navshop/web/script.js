const navshop_image_url = 'http://127.0.0.1/nfw/itens/'

var shopType = 'sell';
var navConfig;

const nyo_navshop = new Module('nyo_navshop');

function setNavShopNui({config}) {
    navConfig = config;
    $(".listagemNavShop").html('');
    var shopIndex = 1;

    let buyAmount = 0;
    let sellAmount = 0;

    for (const [key, value] of Object.entries(config)) {
        if(value.type == shopType){
            shopButton = ''
            if (shopType == 'buy') {
                buyAmount ++
                shopButton = 'Comprar';
            } else {
                sellAmount ++
                shopButton = 'Vender';
            }

            valueType = '';
            if(value.typeMoney == 'ilegal'){
                valueType = '(SUJO)';
            }
            $(".listagemNavShop").append(`
            <div class="itemNav">
                <div class="overlay" onClick="navShopAction(${shopIndex}, '${value.index}')" lang="ui-${shopType}-button"></div>
                <img src="${navshop_image_url}${ParseItemImage(value.index)}.png" width="120" height="120">
                <div class="item-info">
                    <span>${value.name}</span><br>
                    <small><span lang="ui-currency-symbol"></span>${new Intl.NumberFormat(nyo_skinshop.currentLanguage, { minimumFractionDigits: 2 }).format(value.price)}${value.typeMoney == 'ilegal' ? '<span lang="ui-dirty-money"></span>' : ''}</small>
                </div>
            </div>
            `);
        }
        shopIndex++;
    }



    $('.itemNav').mouseenter(function(){
        $(this).addClass("active");
    });

    $('.itemNav').mouseleave(function(){
        $(this).removeClass("active");
    });
}

nyo_navshop.registerOpenUiFunction((data) => {
    let buyAmount = 0;
    let sellAmount = 0;

    for (const [key, value] of Object.entries(data.config)) {
        if (value.type == 'buy') {
            buyAmount ++
        } else {
            sellAmount ++
        }
    }

    if (buyAmount > 0) {
        document.getElementById("menuBuy").style.display = 'flex'
        shopType = 'buy'
    }
    else document.getElementById("menuBuy").style.display = 'none'
    
    if (sellAmount > 0) {
        document.getElementById("menuSell").style.display = 'flex'
        shopType = 'sell'
    }
    else document.getElementById("menuSell").style.display = 'none'

    setNavShopNui(data)
})

function navShopMenu(t){
    shopType = t;
    $(".tituloNavShop").html(`<b lang="ui-title-${shopType}"></b>`);
    $(".itemMenu").removeClass("active");
    if(shopType == 'buy'){
        $("#menuBuy").addClass("active");
    }else{
        $("#menuSell").addClass("active");
    }
    setNavShopNui({config: navConfig});
}


function navShopAction(index, item){
    var arr = {index, item};
    FetchData('navShopNuiAction', arr);
}

nyo_navshop.registerCloseUiFunction(() => {
    FetchData('close', {})
})