const imgCloakRoom = 'http://127.0.0.1/nfw/cloakroom/'
const nyo_cloakroom = new Module('nyo_cloakroom')

nyo_cloakroom.registerOpenUiFunction(loadCloakRoom)

nyo_cloakroom.registerCloseUiFunction(() => {
    $(".owl-carousel").trigger('destroy.owl.carousel');
    $('.owl-carousel').html('');
    FetchData('close', {})
})

var sexoCloak = "M";

function loadCloakRoom(data){    
    $(".owl-carousel").trigger('destroy.owl.carousel');
    $('.owl-carousel').html('');
    innerHtml = ''
    if(data.config.permRetirar){
        innerHtml += `
         <div class="itemCloak">
            <img src="${imgCloakRoom}/retirar.png">
            <div class="info">
            <small lang="ui-container-title"></small>
            <h3 lang="ui-remove-clothes-option"></h3>
            <button onClick="useClothes(-1)" lang="ui-remove-button"></button>
            </div>
        </div>`;
    }

    sexoCloak = data.sexo;
    var dataCloak = data.config.pressets[sexoCloak];
    dataCloak.map((v, k) => {
        innerHtml += `
        <div class="itemCloak">
            <img src="${imgCloakRoom}/${v.img}.png">
            <div class="info">
            <small lang="ui-container-title"></small>
            <h3>${v.name}</h3>
            <button onClick="useClothes(${k})" lang="ui-dress-button"></button>
            </div>
        </div>`;
    });

    $('.owl-carousel').html(innerHtml);
    $('.owl-carousel').owlCarousel({
        loop:true,
        margin:20,
        nav:true,
        navText : ["<div class='arrowItem left'><i class='fa fa-chevron-left'></i></div>","<div class='arrowItem right'><i class='fa fa-chevron-right'></i></div>"]
    });
    $('#actionMenuCloakRoom').fadeIn(1);   
}

function useClothes(id){
    FetchData('changeClothe', {id, sexo: sexoCloak});
}

