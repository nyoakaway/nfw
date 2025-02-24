const fuel_img_url = 'http://26.104.3.179/posto/'

const nyo_fuel = new Module('nyo_fuel')
var fuelStatus = 0;
var bGalao = false;
var bBateria = false;

nyo_fuel.registerOpenUiFunction(({brand, price, vfuel, type, sGalao, pGalao, sBateria, pBateria}) => {
    fuelStatus = 0;
    // $('.logoFuel').css("background-image", "url('"+ fuel_img_url + brand + ".png')")
    if(type == 'eletrical'){
        $(".litrosText").html('WHATS');
        $('.litrosText2').html('VALOR POR AMPER');
        $('.fuelTextBtnIniciar').html('Iniciar o carregamento');
        $('.fuelTextBtnParar').html('Parar o carregamento');        
    }else{
        $(".litrosText").html('LITROS');
        $('.litrosText2').html('VALOR POR LITRO');
        $('.fuelTextBtnIniciar').html('Iniciar o abastecimento');
        $('.fuelTextBtnParar').html('Parar o abastecimento');   
    }
     $('.inputValorFuel').html('R$'+price.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,'));
     $('.inputTotalFuel').html('R$0.00');
     $('.inputLitrosFuel').html(`0 (${parseFloat(vfuel.toFixed(0))}%)`);
    
     $('#Start').prop("disabled",false).removeClass("active");
     $('#Stop').prop("disabled",true).addClass("active");   

     if(sGalao){
        $(".fuelGalaoContainer").css("display", "flex");
        $(".fuelGalaoValor").html("R$ "+pGalao);
        bGalao = true;
     }else{
        $(".fuelGalaoContainer").css("display", "none");
        bGalao = false;
     }

     if(sBateria){
        $(".fuelBateriaContainer").css("display", "flex");
        $(".fuelBaterialValor").html("R$ "+pBateria);
        bBateria = true;
     }else{
        $(".fuelBateriaContainer").css("display", "none");
        bBateria = false;
     }
});

nyo_fuel.registerCloseUiFunction(() => {
    FetchData('close', {})
})

nyo_fuel.addMessageHandler('fuelUpdate', ({vfuel, totalprice, totalfuel}) => {
    $('.inputTotalFuel').html('R$'+parseFloat(totalprice.toFixed(0)));
    $('.inputLitrosFuel').html(`${parseFloat(totalfuel.toFixed(0))} (${parseFloat(vfuel.toFixed(0))}%)`);   
})

function iniciarAbastecimento(){
    $('#Start').prop("disabled",true).addClass("active");
    $('#Stop').prop("disabled",false).removeClass("active");
    FetchData('fuelSet', ['start']);
}

function pararAbastecimento(){
    $('#Start').prop("disabled",false).removeClass("active");
    $('#Stop').prop("disabled",true).addClass("active");
    FetchData('fuelSet', ['stop']);
}

function fuelBuyGalao(){
    if(bGalao){
        FetchData('fuelBuy', ['galao']);
    }
}

function fuelBuyBateria(){
    if(bBateria){
        console.log('fetch?')
        FetchData('fuelBuy', ['bateria']);
    }
}


items = document.getElementsByClassName('Item')
for (var i = 0; i < items.length; i++) {
    items[i].addEventListener('mouseenter', function() {
        this.classList.toggle('active')
    })
    items[i].addEventListener('mouseleave', function() {
        this.classList.toggle('active')
    })
}
