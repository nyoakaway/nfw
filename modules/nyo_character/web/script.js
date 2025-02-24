const nyo_character = new Module('nyo_character');

var bImg = 'http://191.96.224.178/barbeer/'; // Url das imagens para os Cabelos, barba, etc 
var cImg = 'http://191.96.224.178/nfw/character/'; // Url das imagens do pai/mae

var characterGender = 'M';

var colorList = ["#1C1F21", "#272A2C", "#312E2C", "#35261C", "#4B321F", "#5C3B24", "#6D4C35", "#6B503B", "#765C45", "#7F684E",
    "#99815D", "#A79369", "#AF9C70", "#BBA063", "#D6B97B", "#DAC38E", "#9F7F59", "#845039", "#682B1F", "#61120C", "#640F0A",
    "#7C140F", "#A02E19", "#B64B28", "#A2502F", "#AA4E2B", "#626262", "#808080", "#AAAAAA", "#C5C5C5", "#463955", "#5A3F6B",
    "#763C76", "#ED74E3", "#EB4B93", "#F299BC", "#04959E", "#025F86", "#023974", "#3FA16A", "#217C61", "#185C55", "#B6C034",
    "#70A90B", "#439D13", "#DCB857", "#E5B103", "#E69102", "#F28831", "#FB8057", "#E28B58", "#D1593C", "#CE3120", "#AD0903",
    "#880302", "#1F1814", "#291F19", "#2E221B", "#37291E", "#2E2218", "#231B15", "#020202", "#706C66", "#9D7A50"];


var characterParentListFather = {
    '0' : {'name': 'Benjamin'},
    '1' : {'name': 'Daniel'},
    '2' : {'name': 'Joshua'},
    '3' : {'name': 'Noah'},
    '4' : {'name': 'Andrew'},
    '5' : {'name': 'Juan'},
    '6' : {'name': 'Alex'},
    '7' : {'name': 'Isaac'},
    '8' : {'name': 'Evan'},
    '9' : {'name': 'Ethan'},
    '10' : {'name': 'Vincent'},
    '11' : {'name': 'Angel'},
    '12' : {'name': 'Diego'},
    '13' : {'name': 'Adrian'},
    '14' : {'name': 'Gabriel'},
    '15' : {'name': 'Michael'},
    '16' : {'name': 'Santiago'},
    '17' : {'name': 'Kevin'},
    '18' : {'name': 'Louis'},
    '19' : {'name': 'Samuel'},
    '20' : {'name': 'Anthony'},   
    '42' : {'name': 'John'}, 
    '43' : {'name': 'Niko'}, 
    '44' : {'name': 'Claude'},  
}

var characterParentListMother = {
  '21' : {'name': 'Hannah'},
  '22' : {'name': 'Audrey'},
  '23' : {'name': 'Jasmine'},
  '24' : {'name': 'Giselle'},
  '25' : {'name': 'Amelia'},
  '26' : {'name': 'Isabella'},
  '27' : {'name': 'Zoe'},
  '28' : {'name': 'Ava'},
  '29' : {'name': 'Camila'},
  '30' : {'name': 'Violet'},
  '31' : {'name': 'Sophia'},
  '32' : {'name': 'Evelyn'},
  '33' : {'name': 'Nicole'},
  '34' : {'name': 'Ashley'},
  '35' : {'name': 'Grace'},
  '36' : {'name': 'Brianna'},
  '37' : {'name': 'Natalie'},
  '38' : {'name': 'Olivia'},
  '39' : {'name': 'Elizabeth'},
  '40' : {'name': 'Charlotte'},
  '41' : {'name': 'Emma'},
  '45' : {'name': 'Misty'},
}

nyo_character.registerOpenUiFunction((data) => {
  nyo_character.disableKeyPress("Escape");
  changeCharacterCategory('character');
  changeCharacterParent();
  FetchData('character:getGenderData', {gender: characterGender}, (data) => {
    characterUpdateDiv(data.maxHair, data.atualHair, 'hair', true, true, false);
    characterUpdateDiv(data.maxEyesBrows, data.atualEyesBrows, 'eyebrows', true, false, true);
    characterUpdateDiv(data.maxBeard, data.atualBeard, 'beard', true, false, true);
   // characterUpdateDiv(data.maxChest, data.atualChest, 'chest', true, false, false);
    characterUpdateDiv(data.maxBlush, data.atualBlush, 'blush', true, false, true);
    characterUpdateDiv(data.maxLipstick, data.atualLipstick, 'lipstick', true, false, true);
    characterUpdateDiv(data.maxBlemishes, data.atualBlemishes, 'blemishes', false, false, true);
    characterUpdateDiv(data.maxAgeing, data.atualAgeing, 'ageing', false, false, true);
    characterUpdateDiv(data.maxComplexion, data.atualComplexion, 'complexion', false, false, true);
    characterUpdateDiv(data.maxSundamage, data.atualSundamage, 'sundamage', false, false, true);
    characterUpdateDiv(data.maxFreckles, data.atualFreckles, 'freckles', false, false, true);
    characterUpdateDiv(data.maxMakeup, data.atualMakeup, 'makeup', false, false, true);
  });
})

nyo_character.registerCloseUiFunction(() => {
    FetchData('close', {})
})

function changeCharacterCategory(category){  
  $("mainCharacter .category").removeClass("char-active");
  if(category == 'character'){
    $("mainCharacter .charCharacter").addClass("char-active");
    $("#menuAppearence").css("display", 'none');
    $("#menuCharacter").css("display", 'block');
  }else if(category == 'appearence'){
    $("mainCharacter .charAppearence").addClass("char-active");
    $("#menuCharacter").css("display", 'none');
    $("#menuAppearence").css("display", 'block');
  } 
}

function characterUpdateDiv(max, atual, type, c1, c2, op){
  var gClass, gActive, gItem, gId, gType; 
  var innerHtml = "";

  if(type == 'hair'){ gClass = '.content-hair'; gActive = 'hair-itemActive'; gItem = 'hair-item'; gId = 12; gType = 'hh'; }
  if(type == 'eyebrows'){ gClass = '.content-eyebrows'; gActive = 'eyesBrow-itemActive'; gItem = 'eyesBrow-item'; gId = 2; gType = 'heb'; }
  if(type == 'beard'){ gClass = '.content-beard'; gActive = 'beard-itemActive'; gItem = 'beard-item'; gId = 1; gType = 'hbr'; }
  if(type == 'chest'){ gClass = '.content-chest'; gActive = 'chest-itemActive'; gItem = 'chest-item'; gId = 10; gType = 'hch'; }
  if(type == 'blush'){ gClass = '.content-blush'; gActive = 'blush-itemActive'; gItem = 'blush-item'; gId = 5; gType = 'hbl'; }
  if(type == 'lipstick'){ gClass = '.content-lipstick'; gActive = 'lipstick-itemActive'; gItem = 'lipstick-item'; gId = 8; gType = 'hl'; }
  if(type == 'blemishes'){ gClass = '.content-blemishes'; gActive = 'blemishes-itemActive'; gItem = 'blemishes-item'; gId = 0; gType = 'hb'; }
  if(type == 'ageing'){ gClass = '.content-ageing'; gActive = 'ageing-itemActive'; gItem = 'ageing-item'; gId = 3; gType = 'ha'; }
  if(type == 'complexion'){ gClass = '.content-complexion'; gActive = 'complexion-itemActive'; gItem = 'complexion-item'; gId = 6; gType = 'hc'; }
  if(type == 'sundamage'){ gClass = '.content-sundamage'; gActive = 'sundamage-itemActive'; gItem = 'sundamage-item'; gId = 7; gType = 'hs'; }
  if(type == 'freckles'){ gClass = '.content-freckles'; gActive = 'freckles-itemActive'; gItem = 'freckles-item'; gId = 9; gType = 'hf'; }
  if(type == 'makeup'){ gClass = '.content-makeup'; gActive = 'makeup-itemActive'; gItem = 'makeup-item'; gId = 4; gType = 'hm'; }

  let listagemDataSelector = document.querySelector(gClass);

  var activeRemove = false 

  if (atual == -1){ activeRemove = gActive; }
  innerHtml += `
      <div class="item ${gItem} ${activeRemove}" style="background-image: url('${bImg}remove.jpg');" data-id="-1" data-class="${gItem}" data-classactive="${gActive}" data-type="${gId}" onClick="characterChangeGeneral(this)"></div> 
  `

  for (var i = 0; i <= (max -1); i++) { 
    var active = "";
    if(i==atual){
      active = gActive;
    }
    innerHtml += `
      <div class="item ${gItem} ${active}" style="background-image: url('${bImg}${gId}/${characterGender}/${i}.jpg');" data-id="${i}" data-class="${gItem}" data-classactive="${gActive}" data-type="${gId}" onClick="characterChangeGeneral(this)"></div> 
    `
  }

  if(c1){
    innerHtml += `<small style="width: 100%; margin-bottom: 5px;">Cor Primaria:</small>`;
    for (var i in colorList) {
      innerHtml += `<div class="item-color" style="background: ${colorList[i]};" onClick="characterChangeGeneralColor(${i}, '${gId}', 'c1')"></div>`;         
    }  
  }

  if(c2){
    innerHtml += `<small style="width: 100%; margin-bottom: 5px;">Cor Secundaria:</small>`;
    for (var i in colorList) {
      innerHtml += `<div class="item-color" style="background: ${colorList[i]};" onClick="characterChangeGeneralColor(${i}, '${gId}', 'c2')"></div>`;         
    }  
  }

  if(op){
    innerHtml += `<small style="width: 100%; margin-bottom: 5px;">Opacidade:</small>
    <input type="range" min="0.00" max="0.99" step="0.01" oninput="characterChangeGeneralOpacity(this.value, '${gId}')" value="0.99" style="width: 100%;"> `;    
  }


  listagemDataSelector.innerHTML = innerHtml
}

function changeCharacterParent(){
  var innerHtmlParent = "";
  let listagemCharacterHairColor = document.querySelector('.content-characterParent');
  innerHtmlParent += `<small style="width: 100%; margin-bottom: 5px;">Pai:</small>`;

  Object.keys(characterParentListFather).forEach(key =>{
    var parentName = characterParentListFather[key]['name'];
    innerHtmlParent += ` <div class="item parent-item" style="background-image: url('${cImg}${parentName}.webp');" onClick="characterChangeSkin(${key}, 'fi')"><span>${parentName}</span></div>`
  });

  innerHtmlParent += `<small style="width: 100%; margin-bottom: 5px; margin-top: 20px;">Mãe: </small>`;

  Object.keys(characterParentListMother).forEach(key =>{
    var parentName = characterParentListMother[key]['name'];
    innerHtmlParent += ` <div class="item parent-item" style="background-image: url('${cImg}${parentName}.webp');" onClick="characterChangeSkin(${key}, 'mi')"><span>${parentName}</span></div>`
  });

  innerHtmlParent += `<small style="width: 100%; margin-bottom: 5px; margin-top: 20px;">Semelhança:</small>
  <div style="display: flex; width: 100%;">
    <small>PAI</small>
    <input type="range" min="0" max="1" step="0.1" oninput="characterChangeSkin(this.value, 'sm')" value="0" id="characterShapeMix" style="width: 100%;"> 
    <small>MÃE</small>
  </div>
  `;

  innerHtmlParent += `<small style="width: 100%; margin-bottom: 5px; margin-top: 20px;">Cor da Pele:</small>
    <div style="width: 100%;"></div>
    <input type="range" min="0" max="44" oninput="characterChangeSkin(this.value, 'sc')" value="0" id="characterSkinColor" style="width: 100%;">
  `;

  listagemCharacterHairColor.innerHTML = innerHtmlParent;
}

function characterChangeGender(element){
  if (!element) return
  let gender = element.dataset.gender;
  characterGender = gender;
  $('.characterGender').removeClass('char-active');
  $(element).addClass('char-active');
  FetchData('character:updateCharacter', {gender: gender});
}

function characterChangeGeneral(element){
  if (!element) return
  let type = element.dataset.type;
  let id = element.dataset.id;
  let el = "."+element.dataset.class;
  let el2 = element.dataset.classactive;

  var arr = {headModel:true,id:type,value:id}

  $(el).removeClass(el2);
  $(element).addClass(el2);

  FetchData('character:updateCharacter', arr);
}

function characterChangeGeneralColor(color, type, pos){
  var arr = {headColor:true, id: type, value: color, pos: pos};

  FetchData('character:updateCharacter', arr);
}

function characterChangeGeneralOpacity(value, type){
  var arr = {headOpacity:true, id: type, value: value};

  FetchData('character:updateCharacter', arr);
}

function characterChangeSkin(value, type){
  var arr = {skinFeature:true, type: type, value:value}
  FetchData('character:updateCharacter', arr);
}

function characterChangeFaceFeature(value, type){
  var arr = {faceFeature:true, id:type, value:value}
  FetchData('character:updateCharacter', arr);
}

function changeParent(id, type){
  var arr = {}
  if(type == 'father'){ arr = {father:id} }
  if(type == 'mother'){ arr = {mother:id} }
  FetchData('character:updateCharacter', arr);
}

function characterBackMulti(){
  FetchData('character:backMulti', {});
}

function characterSave(){
  var name = $("#creatorCharacterName").val();
  var midName = $("#creatorCharacterMidName").val();
  var lastName = $("#creatorCharacterLastName").val();
  var age = $("#creatorCharacterAge").val();

  var arr = {name:name, midName:midName, lastName:lastName, age:age}
  FetchData('character:saveCharacter', arr);
}

$('.drop').on('click', function() {
  $(this).parent().find('.close').removeClass('char-active');
  $(this).addClass('char-active');
  $(this).parent().parent().parent().find('.content-show').fadeIn(0);
});

$('.close').on('click', function() {
  $(this).parent().find('.drop').removeClass('char-active');
  $(this).addClass('char-active');
  $(this).parent().parent().parent().find('.content-show').fadeOut(0);
});


function characterRotate(value) {
    nyo_character.fetch('rotatePed',{value})
}