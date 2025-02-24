const nyo_hud = new Module('nyo_hud');

nyo_hud.registerOpenUiFunction((data) => {

})

nyo_hud.addMessageHandler('showHud', ({toogle, htActive}) => {
    if(htActive){
        $(".Infos .hunger").show();
        $(".Infos .thirst").show();
    }else{
        $(".Infos .hunger").hide();
        $(".Infos .thirst").hide();
    }
    
    if(toogle){
        $("moduleHud").css("display", "block");
    }else{
        $("moduleHud").css("display", "none");
    }    
})

nyo_hud.addMessageHandler('hudUpdate', ({health, armour, hunger, thirst, stamina, street, time, inVehicle, vSpeed, vFuel, vEngine, vGear, vBelt}) => {
    var health = ((health - 100) * 100)/300;
    var nHealth = 100 - health;
    var nArmour = 100 - armour;
    var nHunger = 100 - hunger;
    var nThirst = 100 - thirst;
    var nStamina = stamina;

    if(armour == 0){        
        $(".Infos .armor").hide();
    }else{
        $(".Infos .armor").show();
    }

    $(".health > .offsets > #fill-fill").css("stroke-dashoffset", `calc((120 * ${nHealth}) / 100)`); 
    $(".armor > .offsets > #fill-fill").css("stroke-dashoffset", `calc((120 * ${nArmour}) / 100)`); 
    $(".hunger > .offsets > #fill-fill").css("stroke-dashoffset", `calc((120 * ${nHunger}) / 100)`); 
    $(".thirst > .offsets > #fill-fill").css("stroke-dashoffset", `calc((120 * ${nThirst}) / 100)`); 
    $(".stamine > .offsets > #fill-fill").css("stroke-dashoffset", `calc((120 * ${nStamina}) / 100)`); 

    $(".LocationText").html(`<span>${street}</span>`);
    $(".RadioText").html(`<span>52</span>Mhz`);
    $(".TimeText").html(`${time}`);
    
    if(inVehicle){
        var vEngine = (vEngine * 100) / 1000;
        $(".Velocimeter").show();
        $(".SpeedText").html(`${vSpeed}<span>/KMH</span>`);
        $(".gearText").html(`${vGear}`)
        $(".Velocimeter > .CarState > .Fuel > .Fuel-back > div").css("height", `${vFuel}%`);
        $(".Velocimeter > .CarState > .CarLife > .CarLife-back > div").css("height", `${vEngine}%`);
    }else{
        $(".Velocimeter").hide();
    }
})


/* 


Trocar a forma dos itens da hud

Para isso você precisa trocar o nome das classes 
elas são [prog-circular,prog-circular-fill,prog-square,prog-square-fill,prog-diamond,prog-diamond-fill]




Para trocar as cores so trocar a variavel do css

para isso deve usar 
var root = document.querySelector(':root')

root.style.setProperty('--Variavel', 'cor');




Ativar o toggle

$('.Toggle').on('click', function() {
    $(this).toggleClass('active');
})




Pegar o valor do color picker

$('.ColorInput').on('change', function(e) {
    console.log(this.value)
})

*/

// $('#HelpIcon').on('mouseenter', function() {
//     $('.Help').fadeIn(200)
// })

// $('#HelpIcon').on('mouseleave', function() {
//     $('.Help').fadeOut(200)
// })

// $('.Toggle').on('click', function() {
//     $(this).toggleClass('active');
// })