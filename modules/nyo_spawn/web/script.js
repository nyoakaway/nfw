const nyo_spawn_images = 'http://127.0.0.1/nfw/spawn/'

const nyo_spawn = new Module('nyo_spawn');

var spawnIndex = '';

nyo_spawn.registerOpenUiFunction((data) => {  
  nyo_spawn.disableKeyPress("Escape");
  window.dispatchEvent(new Event('resize'));
  
  map.eachLayer(function (layer) { 
    if(layer.lType == 'marker'){
      map.removeLayer(layer);
    }
  });

  $.each(data.spawn, function( k,v ) {
    var customIcon = L.icon({
      iconUrl: nyo_spawn_images+'/marker/'+v.imgMarker+'.png',  
      iconSize: [30, 30],
    });
    var X = v.loc.x;
    var Y = v.loc.y;
    var marker = L.marker([Y, X],{icon: customIcon});
    marker.myCustomID = k;
    marker.lType = 'marker';
    marker.spawnName = v.name;
    marker.spawnDesc = v.desc;
    marker.imgBack = v.imgBack;
    marker.on('click', onMarkerClick);
    map.addLayer(marker);
  });
})

nyo_spawn.registerCloseUiFunction(() => {
  FetchData('close', {})
})


const centerx = 117.3;
const centery = 172.8;
const scalex = 0.020712451;
const scaley = 0.0205176402;

CUSTOM_CRS = L.extend({}, L.CRS.Simple, {
  projection: L.Projection.LonLat,
  scale: function (zoom) {
    return Math.pow(2, zoom);
  },
  zoom: function (sc) {
    return Math.log(sc) / Math.LN2;
  },
  distance: function (pos1, pos2) {
    var x_difference = pos2.lng - pos1.lng;
    var y_difference = pos2.lat - pos1.lat;
    return Math.sqrt(x_difference * x_difference + y_difference * y_difference);
  },
  transformation: new L.Transformation(scalex, centerx, -scaley, centery),
  infinite: true,
});

var map = L.map("map-spawnmap", {
  crs: CUSTOM_CRS,
  minZoom: 2,
  maxZoom: 4,
  Zoom: 5,
  maxNativeZoom: 5,
  preferCanvas: true,
  center: [0, 0],
  zoom: 3,
});

var layer = L.tileLayer(nyo_spawn_images+"/map/{z}/{x}/{y}.jpg", {
  minZoom: 0,
  maxZoom: 5,
  noWrap: true,
  continuousWorld: false,
}).addTo(map);


function onMarkerClick(e){
  spawnIndex = e.target.myCustomID;
  $(".modalTextSpawn").html(e.target.spawnName);
  $(".modalTextDesc").html(e.target.spawnDesc);
  $(".spawnImg").attr('src', `${nyo_spawn_images}/background/${e.target.imgBack}.jpg`);
  document.querySelector('.modal-spawnmap').style.display = 'flex'
}

document.getElementById('cancel-spawnmap').addEventListener('click',() => {
  document.querySelector('.modal-spawnmap').style.display = 'none'
})

document.getElementById('confirm-spawnmap').addEventListener('click',() => {
  FetchData('selectSpawn', {
    locate: spawnIndex,
  });  
})

