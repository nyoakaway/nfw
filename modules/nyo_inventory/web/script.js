const nyo_inventory_img = 'http://127.0.0.1/nfw/itens/'

const nyo_inventory = new Module('nyo_inventory');
var invType;
var invItens = [];

nyo_inventory.registerOpenUiFunction((data) => {
  invType = data.type;

  var inventory = data.inventory;
  var weight = data.weight;
  var maxWeight = data.maxWeight;
  var inventory2 = data.inventory2;
  var weight2 = data.weight2;
  var maxWeight2 = data.maxWeight2;

  $("#weapons").css("display", "none");
  $("#secundary").css("display", "none");
  $("#trading").css("display", "none");  

  if (data.type == 'inventory'){
    $("#weapons").css("display", "flex");
  }else if(data.type == 'carchest' || data.type == 'midcarchest' || data.type == 'chest' || data.type == 'inspect' || data.type == 'homes'){
    $("#secundary").css("display", "flex");
  }

  if(inventory !== 'undefined'){
    setInventoryLeft(inventory, weight, maxWeight);
  }
  
  if(inventory2 !== 'undefined'){
    setInventoryRight(inventory2, weight2, maxWeight2);
  }  
})

nyo_inventory.registerCloseUiFunction(() => {
  FetchData('close', {})
})

nyo_inventory.addMessageHandler('inventoryUpdate', (data) => {
  var inventory = data.inventory;
  var weight = data.weight;
  var maxWeight = data.maxWeight;
  var inventory2 = data.inventory2;
  var weight2 = data.weight2;
  var maxWeight2 = data.maxWeight2;

  if(inventory !== 'undefined'){
    setInventoryLeft(inventory, weight, maxWeight);
  }

  if(inventory2 !== 'undefined'){
    setInventoryRight(inventory2, weight2, maxWeight2);
  }
})

/*      <!--small class="iNumberRight">${dItem['a']}</small--> */
function setInventoryLeft(inventory, weight, maxWeight){
  var html = "";
  invItens = [];
  $("#invLeft").html('');  
  $(".invLeftWeight").html(parseInt(weight)+'kg');
  $(".invLeftMaxWeight").html(parseInt(maxWeight)+'kg');

  for(var x=0; x<inventory['i'].length; x++){
    var dItem = inventory['i'][x];
    invItens[dItem['i']] = true;
    html += `
    <div class="item itemDrag" title="" data-item-type="left" data-item-index="${dItem['i']}" data-item-hash="${dItem['h']}" data-item-itype="${dItem['t']}" data-item-use="${dItem['use']}" data-item-send="${dItem['send']}" data-item-drop="${dItem['drop']}">
      <p>${dItem['n']}</p>
      <small class="iNumberLeft">${parseInt(dItem['a'])}</small>
      <img src="${nyo_inventory_img}${dItem['img']}.png" onerror="this.src='${nyo_inventory_img}item_error.png';">
    </div>
    `;
  }

  if(inventory['i'].length < 16){
    difInv = 16 - inventory['i'].length;
    for(var x=0; x<difInv; x++){
      html += `<div class="item" title=""></div>`;
    }
  }

  $("#invLeft").html(html);

  $('#invLeft .itemDrag').draggable({
    helper: 'clone',
    appendTo: 'body',
    start: function(event, ui){
      if(invType == 'inventory'){ 
        itemData = { use: $(this).data('item-use'),send: $(this).data('item-send'), drop: $(this).data('item-drop')}

        if(itemData.use == 1){
          $("#inventoryItemUse").css("display", "block");
        }

        if(itemData.send == 1){
          $("#inventoryItemSend").css("display", "block");
        }

        if(itemData.drop == 1){
          $("#inventoryItemDrop").css("display", "block");
        }
      }
      
    },
    stop: function(){
      $("#inventoryItemUse").css("display", "none");
      $("#inventoryItemDrop").css("display", "none");
      $("#inventoryItemSend").css("display", "none");
    }
  });

  var htmlHotKey = '';
  var enableFlex = true;
  $("#hotkeys").html('');

  for(var w = 0; w < 6; w++){    
    var wi = w + 1;
    
    if(w < 3){
      if(inventory['w'][w]){
        var iData = inventory['w'][w];
        var mun = 0;
        if(iData['d']['m']){ mun = iData['d']['m']; }

        htmlHotKey = htmlHotKey + `
          <div class="item-weapon" id="hotkey${wi}" data-item-type="hotkey" data-item-index="${iData['i']}" data-item-hotkey="${wi}" data-item-hash="${iData['h']}" data-item-item="${iData['i']}">
            <div class="number">${wi}</div>
            <img src="${nyo_inventory_img}${iData['i']}_h.png" onerror="this.src='${nyo_inventory_img}weapon_error_h.png';">
            <div class="name-weapon">
              <b>${iData['n']}</b>
              <small>${mun} munições</small>
              <small onclick="retirarMunicao(${wi})">Retirar munição</small>
            </div>
            <footer>
              <p>
                <span>attachs</span>
              </p>
              <div class="attachs"> `;

        if(iData['d']['a'] != undefined){
          var dataAttach = iData['d']['a'];
          var dataAttachs = Object.keys(dataAttach); 
          dataAttachs.forEach(function callback(value, index){
            htmlHotKey = htmlHotKey + ` 
              <div class="attach attachbox" data-item-type="hotKeyAttach" data-item-item="${value}" data-item-hotkey="${wi}">
                <img src="${nyo_inventory_img}${dataAttach[value].img}.png" onerror="this.src='${nyo_inventory_img}item_error.png';">
              </div>            
            `;
          });
        }
        htmlHotKey = htmlHotKey + `      
               
              </div>
            </footer>
          </div>      
        `;
      }else{
        htmlHotKey = htmlHotKey + `
          <div class="item-weapon" id="hotkey${wi}">
            <div class="number">${wi}</div>
            <div class="empty">
              <span>slot vazio</span>
              <small>nenhuma arma equipada</small>
            </div>
          </div>      
        `;
      }  

    }else{
      if(enableFlex){ htmlHotKey = htmlHotKey + `<div class="flex">`; enableFlex = false; }
      if(inventory['w'][w] && invItens[inventory['w'][w]['i']]){
        var iData = inventory['w'][w];
        var mun = 0;
        var tMun = 0;
     
        htmlHotKey = htmlHotKey + `  
          <div class="item-hotbar" id="hotkey${wi}">        
            <div class="number">${wi}</div>
            <p>${iData['n']}</p>
            <img src="${nyo_inventory_img}${iData['img']}.png" onerror="this.src='${nyo_inventory_img}item_error.png';">
          </div>
        `;
      }else{
        htmlHotKey = htmlHotKey + `
          <div class="item-hotbar" id="hotkey${wi}">
            <div class="number">${wi}</div>
          </div>
        `;
      }
    }
  }

  
  
  $("#hotkeys").html(htmlHotKey+ `</div>`);  

    $("#hotkey1").droppable({
      hoverClass: "hoverControl",
      drop: function(event,ui, index){
        if(ui.draggable.data('item-type') == 'left'){
          var item = ui.draggable.data('item-index')
          var itemType = ui.draggable.data('item-itype')
          
          if(itemType == 'attachs' || itemType == 'ammo' || itemType == 'wColor'){
            if(itemType == 'ammo'){
              var hash = null; 
              swetCall('hotkey', item, hash, 1);
            }else{
              var hash = null; 
              if(ui.draggable.data('item-hash') !== 'undefined'){ hash = ui.draggable.data('item-hash'); }
              var arr = {type:'hotkey', hot: 1, item:item, hash:hash, qtd:1}
              FetchData('inventory:taskAction', arr);
            }           
          }else{
            var hash = null; 
              if(ui.draggable.data('item-hash') !== 'undefined'){ hash = ui.draggable.data('item-hash'); }
              var arr = {type:'hotkey', hot: 1, item:item, hash:hash, qtd:1}
              FetchData('inventory:taskAction', arr);
          }          
        }    
      }
    });

    $('.attachbox').draggable({
      helper: 'clone',
      appendTo: 'body',
      start: function(event, ui){

      }  
    });

    $('#hotkey1').draggable({
      helper: 'clone',
      appendTo: 'body',
      start: function(event, ui){
        var hData = $(this).data('item-index');
        if(hData === 'undefined'){
          ui.draggable.draggable("destroy");
        }        
      }  
    });    

    $("#hotkey2").droppable({
      hoverClass: "hoverControl",
      drop: function(event,ui, index){
        if(ui.draggable.data('item-type') == 'left'){
          var item = ui.draggable.data('item-index')
          var itemType = ui.draggable.data('item-itype')
          
          if(itemType == 'attachs' || itemType == 'ammo' || itemType == 'wColor'){
            if(itemType == 'ammo'){
              var hash = null; 
              swetCall('hotkey', item, hash, 2);
            }else{
              var hash = null; 
              if(ui.draggable.data('item-hash') !== 'undefined'){ hash = ui.draggable.data('item-hash'); }
              var arr = {type:'hotkey', hot: 2, item:item, hash:hash, qtd:1}
              FetchData('inventory:taskAction', arr);
            }           
          }else{
            var hash = null; 
            if(ui.draggable.data('item-hash') !== 'undefined'){ hash = ui.draggable.data('item-hash'); }
            var arr = {type:'hotkey', hot: 2, item:item, hash:hash, qtd:1}
            FetchData('inventory:taskAction', arr);
          }          
        }    
      }
    });

    $('#hotkey2').draggable({
      helper: 'clone',
      appendTo: 'body',
      start: function(event, ui){
        var hData = $(this).data('item-index');
        if(hData === 'undefined'){
          ui.draggable.draggable("destroy");
        }        
      }  
    });

    $("#hotkey3").droppable({
      hoverClass: "hoverControl",
      drop: function(event,ui, index){
        if(ui.draggable.data('item-type') == 'left'){
          var item = ui.draggable.data('item-index')
          var itemType = ui.draggable.data('item-itype')
          if(itemType == 'attachs' || itemType == 'ammo' || itemType == 'wColor'){
            if(itemType == 'ammo'){
              var hash = null; 
              swetCall('hotkey', item, hash, 3);
            }else{
              var hash = null; 
              if(ui.draggable.data('item-hash') !== 'undefined'){ hash = ui.draggable.data('item-hash'); }
              var arr = {type:'hotkey', hot: 3, item:item, hash:hash, qtd:1}
              FetchData('inventory:taskAction', arr);
            }           
          }else{
            var hash = null; 
              if(ui.draggable.data('item-hash') !== 'undefined'){ hash = ui.draggable.data('item-hash'); }
              var arr = {type:'hotkey', hot: 3, item:item, hash:hash, qtd:1}
              FetchData('inventory:taskAction', arr);
          }          
        }    
      }
    });

    $('#hotkey3').draggable({
      helper: 'clone',
      appendTo: 'body',
      start: function(event, ui){
        var hData = $(this).data('item-index');
        if(hData === 'undefined'){
          ui.draggable.draggable("destroy");
        }        
      }  
    });

    $("#hotkey4").droppable({
      hoverClass: "hoverControl",
      drop: function(event,ui, index){
        if(ui.draggable.data('item-type') == 'left'){
          var item = ui.draggable.data('item-index');
          var itemType = ui.draggable.data('item-itype');
          if(itemType == 'use'){
            var hash = null; 
            if(ui.draggable.data('item-hash') !== 'undefined'){ hash = ui.draggable.data('item-hash'); }
            var arr = {type:'hotkey', hot: 4, item:item, hash:hash, qtd:1}
            FetchData('inventory:taskAction', arr);
          }      
        }    
      }
    });

    $("#hotkey5").droppable({
      hoverClass: "hoverControl",
      drop: function(event,ui, index){
        if(ui.draggable.data('item-type') == 'left'){
          var item = ui.draggable.data('item-index');
          var itemType = ui.draggable.data('item-itype');
            if(itemType == 'use'){
            var hash = null; 
            if(ui.draggable.data('item-hash') !== 'undefined'){ hash = ui.draggable.data('item-hash'); }
            var arr = {type:'hotkey', hot: 5, item:item, hash:hash, qtd:1}
            FetchData('inventory:taskAction', arr);
          }
        }    
      }
    });

    $("#hotkey6").droppable({
      hoverClass: "hoverControl",
      drop: function(event,ui, index){
        if(ui.draggable.data('item-type') == 'left'){
          var item = ui.draggable.data('item-index');
          var itemType = ui.draggable.data('item-itype');
          if(itemType == 'use'){
            var hash = null; 
            if(ui.draggable.data('item-hash') !== 'undefined'){ hash = ui.draggable.data('item-hash'); }
            var arr = {type:'hotkey', hot: 6, item:item, hash:hash, qtd:1}
            FetchData('inventory:taskAction', arr);
          }
        }    
      }
    });
  
}

function retirarMunicao(hotKey){
  swetCall('removeAmmo', 'removeAmmo', null, hotKey);
}

function setInventoryRight(inventory, weight, maxWeight){
  var html = "";

  if(inventory != undefined){
    $("#invRight").html('');
    $(".invRightWeight").html(parseInt(weight)+'kg');
    $(".invRightMaxWeight").html(parseInt(maxWeight)+'kg');
  
    for(var x=0; x<inventory['i'].length; x++){
      var dItem = inventory['i'][x];
      html += `
      <div class="item itemDrag" title="" data-item-type="right" data-item-index="${dItem['i']}" data-item-hash="${dItem['h']}" data-item-use="${dItem['use']}" data-item-send="${dItem['send']}" data-item-drop="${dItem['drop']}">
        <p>${dItem['n']} </p>
        <small class="iNumberLeft">${parseInt(dItem['a'])} </small>
        <img src="${nyo_inventory_img}${dItem['img']}.png" onerror="this.src='${nyo_inventory_img}item_error.png';">
      </div>
      `;
    }
  
    if(inventory['i'].length < 16){
      difInv = 16 - inventory['i'].length;
      for(var x=0; x<difInv; x++){
        html += `<div class="item" title=""></div>`;
      }
    }
  
    $("#invRight").html(html); 
  
    $('#invRight .itemDrag').draggable({
      helper: 'clone',
      appendTo: 'body',
      start: function(event, ui){
        itemData = { use: $(this).data('item-use'),send: $(this).data('item-send'), drop: $(this).data('item-drop')} 
      },
      stop: function(){
      }
  
    });  
  }
 
}


$("#inventoryItemUse").droppable({
  hoverClass: "hoverControl",
  drop: function(event,ui){
    var item = ui.draggable.data('item-index')
    var hash = null;
    var arr = {type:'use', item:item, hash:hash, qtd:1}
    FetchData('inventory:taskAction', arr);
  }
});

$("#inventoryItemSend").droppable({
  hoverClass: "hoverControl",
  drop: function(event,ui){
    var item = ui.draggable.data('item-index')
    var hash = null; 
    if(ui.draggable.data('item-hash') !== 'undefined'){ hash = ui.draggable.data('item-hash'); }
    swetCall('send', ui.draggable.data('item-index'), hash)
  }
});

$("#inventoryItemDrop").droppable({
  hoverClass: "hoverControl",
  drop: function(event,ui){
    var item = ui.draggable.data('item-index')
    var hash = null; 
    if(ui.draggable.data('item-hash') !== 'undefined'){ hash = ui.draggable.data('item-hash'); }
    swetCall('drop', ui.draggable.data('item-index'), hash)
  }
});

$("#invRight").droppable({
  hoverClass: "hoverControl",
  drop: function(event,ui){
    if(ui.draggable.data('item-type') == 'left'){
      var hash = null; 
      if(ui.draggable.data('item-hash') !== 'undefined'){ hash = ui.draggable.data('item-hash'); }
      swetCall('storage', ui.draggable.data('item-index'), hash)
    }    
  }
});

$("#invLeft").droppable({
  hoverClass: "hoverControl",
  drop: function(event,ui){
    var itemType = ui.draggable.data('item-type');
    if(itemType == 'right'){
      var hash = null; 
      if(ui.draggable.data('item-hash') !== 'undefined'){ hash = ui.draggable.data('item-hash'); }
      swetCall('take', ui.draggable.data('item-index'), hash)
    }else if(itemType == 'hotkey'){
      var hash = null; 
      if(ui.draggable.data('item-hash') !== 'undefined'){ hash = ui.draggable.data('item-hash'); }
      var hotKey = ui.draggable.data('item-hotkey');
      var item = ui.draggable.data('item-item');
      var arr = {type:'takeHotKey', item:item, hash:hash, hot:hotKey}
      FetchData('inventory:taskAction', arr);
    }else if(itemType == 'hotKeyAttach'){
      var hash = null;
      var hotKey = ui.draggable.data('item-hotkey');
      var item = ui.draggable.data('item-item');
      var arr = {type:'removeHotKeyAttach', item:item, hash:hash, hot:hotKey}
      FetchData('inventory:taskAction', arr);
    }
  }
});

$('#invLeft .itemDrag').draggable({
  helper: 'clone',
  appendTo: 'body'
});

function swetCall(type, item, hash, hotkey) {
  Swal.fire({
      title: 'Quantidade',
      input: 'number',
      confirmButtonText: 'Confirmar',
      cancelButtonText: 'Cancelar',
      showCancelButton: true,
      inputAttributes: {min: 1},
  }).then((value) => {
      if (value.value !== undefined) {
        var arr = {type:type, item:item, hash:hash, qtd:value.value, hot:hotkey}
        FetchData('inventory:taskAction', arr);
      }
  });
}



