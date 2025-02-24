const nyo_multi = new Module('nyo_multi');
let dataCharacter;
let selectedCharacter;
nyo_multi.registerOpenUiFunction((data) => {
    nyo_multi.disableKeyPress("Escape");
    $("multichar menu section").html("");
    dataCharacter = data.characters
    for(var x = 0;x<dataCharacter.length;x++){
        var genereIcon = '<i class="fa-solid fa-transgender fa-2xl" style="color: #FFFFFF"></i>';
        var modelHash = dataCharacter[x].customization.modelhash;        
        if(modelHash == '1885233650'){
            genereIcon = '<i class="fa-solid fa-mars fa-2xl" style="color: #FFFFFF"></i>';
        }else if(modelHash == '-1667301416'){
            genereIcon = '<i class="fa-solid fa-neuter fa-2xl" style="color: #FFFFFF"></i>';
        }

        $("multichar menu section").append(`
            <div class="item" onClick="multiOpenCharacterInfo(${x})">
                ${genereIcon}
                <div class="item-info">
                    <span>${dataCharacter[x].name}</span><br />
                    <small>passaporte: ${dataCharacter[x].id}</small>
                </div>
            </div>
        `);
    }

    var qtdMax = data.maxCharacter - dataCharacter.length;

    if(qtdMax >= 1){
        $("multichar menu section").append(`
            <div class="item" onClick="multiCreateNewCharacter()">
                <span id="plus">+</span>
            </div>
        `);
    }
})

nyo_multi.registerCloseUiFunction(() => {
    FetchData('close', {})
})

var lockChar = true;
function multiOpenCharacterInfo(id){
    if(lockChar){
        lockChar = false;
        var character = dataCharacter[id];
        selectedCharacter = character.id;
        FetchData('multi:changeCharacter', {selectedCharacter});   
        $("#characterName").html(character.name+' '+character.midname+' '+character.lastname);
        $("#characterRegistration").html(character.registration);
        $("#characterAge").html(character.age);
        $("#characterPhone").html(character.phone);
        $("#characterMoney").html(character.money);
        $("#characterBankMoney").html(character.bankmoney);
        $("infoperson").css("display", "block");
        setTimeout(function(){
            lockChar = true;
        }, 2000);
    }    
}

function multiSelectedCharacter(){
    $("infoperson").css("display", "none");
    FetchData('multi:selectCharacter', {selectedCharacter});
}

function multiCreateNewCharacter(){
    $("infoperson").css("display", "none");
    FetchData('multi:createCharacter', {});
}