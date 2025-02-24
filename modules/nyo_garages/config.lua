Nfw.registerConfig({
  config = {

    ['garagesGeneralConfig'] = {
        taxTime = 15,
        taxPrice = {
            type = 3, -- ( 1 multiplier for vehicle price | 2 static value | 3 function value )
            value = function(vehHash, char_id, work)
                if work then return 0 end
                return NyoFw.getVehiclePrice(vehHash) * 0.01
            end,
            paymentType = 1
        },
        scrappedVehicleInsuranceTax = {
            type = 1, -- ( 1 multiplier for vehicle price | 2 static value | 3 function value )
            value = 0.01,
            paymentType = 1
        },
        explodedVehicleInsuranceTax = {
            type = 1, -- ( 1 multiplier for vehicle price | 2 static value | 3 function value )
            value = 0.01,
            paymentType = 1
        },
        detentionTax = {
            type = 1, -- ( 1 multiplier for vehicle price | 2 static value | 3 function value )
            value = 0.01,
            paymentType = 1
        },
        paymentType = 2,
        sellVehicleCommand = 'vehs',
        plateGenerationPattern = 'LLLDLLDD',
        vehicleList = {
            ------------------------
            --  Boats ( BARCOS )  --
            ------------------------
            [GetHashKey('dinghy')] = {            modelname = 'dinghy',           name = 'Dinghy',           price = 180000,       trunk = 70,       gloveCompartment = 20,      type = 'barco',           banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('dinghy2')] = {           modelname = 'dinghy2',          name = 'Dinghy2',          price = 180000,       trunk = 70,       gloveCompartment = 20,      type = 'barco',           banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('dinghy3')] = {           modelname = 'dinghy3',          name = 'Dinghy3',          price = 180000,       trunk = 70,       gloveCompartment = 20,      type = 'barco',           banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('dinghy4')] = {           modelname = 'dinghy4',          name = 'Dinghy4',          price = 180000,       trunk = 70,       gloveCompartment = 20,      type = 'barco',           banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('jetmax')] = {            modelname = 'jetmax',           name = 'Jetmax',           price = 180000,       trunk = 80,       gloveCompartment = 30,      type = 'barco',           banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('marquis')] = {           modelname = 'marquis',          name = 'Marquis',          price = 300000,       trunk = 150,      gloveCompartment = 60,      type = 'barco',           banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('seashark')] = {          modelname = 'seashark',         name = 'Seashark',         price = 80000,        trunk = 30,       gloveCompartment = 10,      type = 'barco',           banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('seashark2')] = {         modelname = 'seashark2',        name = 'Seashark2',        price = 80000,        trunk = 30,       gloveCompartment = 10,      type = 'barco',           banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('seashark3')] = {         modelname = 'seashark3',        name = 'Seashark3',        price = 80000,        trunk = 30,       gloveCompartment = 10,      type = 'barco',           banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('speeder')] = {           modelname = 'speeder',          name = 'Speeder',          price = 100000,       trunk = 80,       gloveCompartment = 30,      type = 'barco',           banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('speeder2')] = {          modelname = 'speeder2',         name = 'Speeder2',         price = 100000,       trunk = 80,       gloveCompartment = 30,      type = 'barco',           banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('squalo')] = {            modelname = 'squalo',           name = 'Squalo',           price = 90000,        trunk = 70,       gloveCompartment = 20,      type = 'barco',           banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('submersible')] = {       modelname = 'submersible',      name = 'Submersible',      price = 600000,       trunk = 200,      gloveCompartment = 90,      type = 'barco',           banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('submersible2')] = {      modelname = 'submersible2',     name = 'Submersible2',     price = 300000,       trunk = 100,      gloveCompartment = 80,      type = 'barco',           banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('suntrap')] = {           modelname = 'suntrap',          name = 'Suntrap',          price = 60000,        trunk = 60,       gloveCompartment = 20,      type = 'barco',           banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('toro')] = {              modelname = 'toro',             name = 'Toro',             price = 110000,       trunk = 90,       gloveCompartment = 35,      type = 'barco',           banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('toro2')] = {             modelname = 'toro2',            name = 'Toro2',            price = 110000,       trunk = 90,       gloveCompartment = 35,      type = 'barco',           banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tropic')] = {            modelname = 'tropic',           name = 'Tropic',           price = 100000,       trunk = 80,       gloveCompartment = 30,      type = 'barco',           banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tropic2')] = {           modelname = 'tropic2',          name = 'Tropic2',          price = 100000,       trunk = 80,       gloveCompartment = 30,      type = 'barco',           banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tug')] = {               modelname = 'tug',              name = 'Tug',              price = 180000,       trunk = 120,      gloveCompartment = 40,      type = 'barco',           banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('avisa')] = {             modelname = 'avisa',            name = 'Avisa',            price = 350000,       trunk = 80,       gloveCompartment = 30,      type = 'barco',           banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('dinghy5')] = {           modelname = 'dinghy5',          name = 'Dinghy5',          price = 700000,       trunk = 90,       gloveCompartment = 30,      type = 'barco',           banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('kosatka')] = {           modelname = 'kosatka',          name = 'Kosatka',          price = 50000000,     trunk = 10000,    gloveCompartment = 1000,    type = 'barco',           banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('longfin')] = {           modelname = 'longfin',          name = 'Longfin',          price = 105000,       trunk = 80,       gloveCompartment = 25,      type = 'barco',           banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('patrolboat')] = {        modelname = 'patrolboat',       name = 'Patrolboat',       price = 800000,       trunk = 500,      gloveCompartment = 60,      type = 'barco',           banned = false, vip = false, fuelUsage = 5.0 },
            
            ---------------------------------- 
            --  Commercials ( COMERCIAIS )  -- 
            ---------------------------------- 
            [GetHashKey('benson')] = {            modelname = 'benson',           name = 'Benson',           price = 800000,       trunk = 780,      gloveCompartment = 50,      type = 'car',     banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('biff')] = {              modelname = 'biff',             name = 'Biff',             price = 600000,       trunk = 500,      gloveCompartment = 50,      type = 'car',     banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('cerberus')] = {          modelname = 'cerberus',         name = 'Cerberus',         price = 5000000,      trunk = 400,      gloveCompartment = 50,      type = 'car',     banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('cerberus2')] = {         modelname = 'cerberus2',        name = 'Cerberus2',        price = 500000,       trunk = 400,      gloveCompartment = 50,      type = 'car',     banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('cerberus3')] = {         modelname = 'cerberus3',        name = 'Cerberus3',        price = 5000000,      trunk = 400,      gloveCompartment = 50,      type = 'car',     banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('hauler')] = {            modelname = 'hauler',           name = 'Hauler',           price = 500000,       trunk = 100,      gloveCompartment = 50,      type = 'car',     banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('hauler2')] = {           modelname = 'hauler2',          name = 'Hauler2',          price = 500000,       trunk = 100,      gloveCompartment = 50,      type = 'car',     banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('mule')] = {              modelname = 'mule',             name = 'Mule',             price = 600000,       trunk = 550,      gloveCompartment = 50,      type = 'car',     banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('mule2')] = {             modelname = 'mule2',            name = 'Mule2',            price = 600000,       trunk = 550,      gloveCompartment = 50,      type = 'car',     banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('mule3')] = {             modelname = 'mule3',            name = 'Mule3',            price = 600000,       trunk = 550,      gloveCompartment = 50,      type = 'car',     banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('mule4')] = {             modelname = 'mule4',            name = 'Mule4',            price = 700000,       trunk = 600,      gloveCompartment = 50,      type = 'car',     banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('packer')] = {            modelname = 'packer',           name = 'Packer',           price = 400000,       trunk = 80,       gloveCompartment = 50,      type = 'car',     banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('phantom')] = {           modelname = 'phantom',          name = 'Phantom',          price = 400000,       trunk = 150,      gloveCompartment = 50,      type = 'car',     banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('phantom2')] = {          modelname = 'phantom2',         name = 'Phantom2',         price = 400000,       trunk = 50,       gloveCompartment = 50,      type = 'car',     banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('phantom3')] = {          modelname = 'phantom3',         name = 'Phantom3',         price = 400000,       trunk = 50,       gloveCompartment = 50,      type = 'car',     banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('pounder')] = {           modelname = 'pounder',          name = 'Pounder',          price = 1000000,      trunk = 1100,     gloveCompartment = 50,      type = 'car',     banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('pounder2')] = {          modelname = 'pounder2',         name = 'Pounder2',         price = 1000000,      trunk = 1100,     gloveCompartment = 50,      type = 'car',     banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('stockade')] = {          modelname = 'stockade',         name = 'Stockade',         price = 2500000,      trunk = 580,      gloveCompartment = 50,      type = 'car',     banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('stockade3')] = {         modelname = 'stockade3',        name = 'Stockade3',        price = 2500000,      trunk = 580,      gloveCompartment = 50,      type = 'car',     banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('terbyte')] = {           modelname = 'terbyte',          name = 'Terbyte',          price = 2800000,      trunk = 950,      gloveCompartment = 50,      type = 'car',     banned = false, vip = false , fuelUsage = 5.0 },
  
            ------------------------------ 
            --  Compacts ( COMPACTOS )  -- 
            ------------------------------   
            [GetHashKey('asbo')] = {              modelname = 'asbo',             name = 'Asbo',             price = 25000,        trunk = 50,       gloveCompartment = 20,      type = 'car',        banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('blista')] = {            modelname = 'blista',           name = 'Blista',           price = 25000,        trunk = 50,       gloveCompartment = 20,      type = 'car',        banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('brioso')] = {            modelname = 'brioso',           name = 'Brioso',           price = 35000,        trunk = 50,       gloveCompartment = 20,      type = 'car',        banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('club')] = {              modelname = 'club',             name = 'Club',             price = 25000,        trunk = 50,       gloveCompartment = 20,      type = 'car',        banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('dilettante')] = {        modelname = 'dilettante',       name = 'Dilettante',       price = 30000,        trunk = 50,       gloveCompartment = 20,      type = 'car',        banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('dilettante2')] = {       modelname = 'dilettante2',      name = 'Dilettante2',      price = 30000,        trunk = 50,       gloveCompartment = 20,      type = 'car',        banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('kanjo')] = {             modelname = 'kanjo',            name = 'Kanjo',            price = 40000,        trunk = 50,       gloveCompartment = 20,      type = 'car',        banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('issi2')] = {             modelname = 'issi2',            name = 'Issi2',            price = 55000,        trunk = 50,       gloveCompartment = 20,      type = 'car',        banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('issi3')] = {             modelname = 'issi3',            name = 'Issi3',            price = 100000,       trunk = 50,       gloveCompartment = 20,      type = 'car',        banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('issi4')] = {             modelname = 'issi4',            name = 'Issi4',            price = 100000,       trunk = 50,       gloveCompartment = 20,      type = 'car',        banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('issi5')] = {             modelname = 'issi5',            name = 'Issi5',            price = 100000,       trunk = 50,       gloveCompartment = 20,      type = 'car',        banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('issi6')] = {             modelname = 'issi6',            name = 'Issi6',            price = 100000,       trunk = 50,       gloveCompartment = 20,      type = 'car',        banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('panto')] = {             modelname = 'panto',            name = 'Panto',            price = 20000,        trunk = 50,       gloveCompartment = 20,      type = 'car',        banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('prairie')] = {           modelname = 'prairie',          name = 'Prairie',          price = 40000,        trunk = 50,       gloveCompartment = 20,      type = 'car',        banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('rhapsody')] = {          modelname = 'rhapsody',         name = 'Rhapsody',         price = 25000,        trunk = 50,       gloveCompartment = 20,      type = 'car',        banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('brioso2')] = {           modelname = 'brioso2',          name = 'Brioso2',          price = 40000,        trunk = 50,       gloveCompartment = 20,      type = 'car',        banned = false, vip = false , fuelUsage = 5.0 },
            [GetHashKey('weevil')] = {            modelname = 'weevil',           name = 'Weevil',           price = 28000,        trunk = 50,       gloveCompartment = 20,      type = 'car',        banned = false, vip = false , fuelUsage = 5.0 },
  
            ------------------------ 
            --  Coupes ( CUPÊS )  -- 
            ------------------------ 
            [GetHashKey('cogcabrio')] = {         modelname = 'cogcabrio',        name = 'Cogcabrio',        price = 120000,       trunk = 60,       gloveCompartment = 15,      type = 'car',          banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('exemplar')] = {          modelname = 'exemplar',         name = 'Exemplar',         price = 120000,       trunk = 60,       gloveCompartment = 15,      type = 'car',          banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('f620')] = {              modelname = 'f620',             name = 'F620',             price = 250000,       trunk = 60,       gloveCompartment = 15,      type = 'car',          banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('felon')] = {             modelname = 'felon',            name = 'Felon',            price = 180000,       trunk = 60,       gloveCompartment = 15,      type = 'car',          banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('felon2')] = {            modelname = 'felon2',           name = 'Felon2',           price = 180000,       trunk = 60,       gloveCompartment = 15,      type = 'car',          banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('jackal')] = {            modelname = 'jackal',           name = 'Jackal',           price = 210000,       trunk = 60,       gloveCompartment = 15,      type = 'car',          banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('oracle')] = {            modelname = 'oracle',           name = 'Oracle',           price = 80000,        trunk = 60,       gloveCompartment = 15,      type = 'car',          banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('oracle2')] = {           modelname = 'oracle2',          name = 'Oracle2',          price = 80000,        trunk = 60,       gloveCompartment = 15,      type = 'car',          banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('sentinel')] = {          modelname = 'sentinel',         name = 'Sentinel',         price = 9000,         trunk = 60,       gloveCompartment = 15,      type = 'car',          banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('sentinel2')] = {         modelname = 'sentinel2',        name = 'Sentinel2',        price = 100000,       trunk = 60,       gloveCompartment = 15,      type = 'car',          banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('windsor')] = {           modelname = 'windsor',          name = 'Windsor',          price = 220000,       trunk = 70,       gloveCompartment = 20,      type = 'car',          banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('windsor2')] = {          modelname = 'windsor2',         name = 'Windsor2',         price = 290000,       trunk = 70,       gloveCompartment = 20,      type = 'car',          banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('zion')] = {              modelname = 'zion',             name = 'Zion',             price = 72000,        trunk = 60,       gloveCompartment = 15,      type = 'car',          banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('zion2')] = {             modelname = 'zion2',            name = 'Zion2',            price = 85000,        trunk = 60,       gloveCompartment = 15,      type = 'car',          banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('previon')] = {           modelname = 'previon',          name = 'Previon',          price = 70000,        trunk = 60,       gloveCompartment = 15,      type = 'car',          banned = false, vip = false, fuelUsage = 5.0 },
  
            ----------------------------- 
            --  Cycles ( Bicicletas )  -- 
            ----------------------------- 
            [GetHashKey('bmx')] = {               modelname = 'bmx',              name = 'Bmx',              price = 3800,         trunk = 2,        gloveCompartment = 1,       type = 'car',          banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('cruiser')] = {           modelname = 'cruiser',          name = 'Cruiser',          price = 3000,         trunk = 2,        gloveCompartment = 1,       type = 'car',          banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('fixter')] = {            modelname = 'fixter',           name = 'Fixter',           price = 3000,         trunk = 2,        gloveCompartment = 1,       type = 'car',          banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('scorcher')] = {          modelname = 'scorcher',         name = 'Scorcher',         price = 4000,         trunk = 2,        gloveCompartment = 1,       type = 'car',          banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tribike')] = {           modelname = 'tribike',          name = 'Tribike',          price = 5000,         trunk = 2,        gloveCompartment = 1,       type = 'car',          banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tribike2')] = {          modelname = 'tribike2',         name = 'Tribike2',         price = 5000,         trunk = 2,        gloveCompartment = 1,       type = 'car',          banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tribike3')] = {          modelname = 'tribike3',         name = 'Tribike3',         price = 5000,         trunk = 2,        gloveCompartment = 1,       type = 'car',          banned = false, vip = false, fuelUsage = 5.0 },
  
            -------------------------------- 
            --  Emergency ( EMERGÊNCIA )  -- 
            -------------------------------- 
            [GetHashKey('ambulance')] = {         modelname = 'ambulance',        name = 'Ambulance',        price = 99999999,     trunk = 40,       gloveCompartment = 10,      type = 'car',       banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('fbi')] = {               modelname = 'fbi',              name = 'Fbi',              price = 99999999,     trunk = 40,       gloveCompartment = 10,      type = 'car',       banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('fbi2')] = {              modelname = 'fbi2',             name = 'Fbi2',             price = 99999999,     trunk = 40,       gloveCompartment = 10,      type = 'car',       banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('firetruk')] = {          modelname = 'firetruk',         name = 'Firetruk',         price = 99999999,     trunk = 40,       gloveCompartment = 10,      type = 'car',       banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('lguard')] = {            modelname = 'lguard',           name = 'Lguard',           price = 99999999,     trunk = 40,       gloveCompartment = 10,      type = 'car',       banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('pbus')] = {              modelname = 'pbus',             name = 'Pbus',             price = 99999999,     trunk = 40,       gloveCompartment = 10,      type = 'car',       banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('police')] = {            modelname = 'police',           name = 'Police',           price = 99999999,     trunk = 40,       gloveCompartment = 10,      type = 'car',       banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('police2')] = {           modelname = 'police2',          name = 'Police2',          price = 99999999,     trunk = 40,       gloveCompartment = 10,      type = 'car',       banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('police3')] = {           modelname = 'police3',          name = 'Police3',          price = 99999999,     trunk = 40,       gloveCompartment = 10,      type = 'car',       banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('police4')] = {           modelname = 'police4',          name = 'Police4',          price = 99999999,     trunk = 40,       gloveCompartment = 10,      type = 'car',       banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('policeb')] = {           modelname = 'policeb',          name = 'Policeb',          price = 99999999,     trunk = 40,       gloveCompartment = 10,      type = 'car',       banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('polmav')] = {            modelname = 'polmav',           name = 'Polmav',           price = 99999999,     trunk = 40,       gloveCompartment = 10,      type = 'car',       banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('policeold1')] = {        modelname = 'policeold1',       name = 'Policeold1',       price = 99999999,     trunk = 40,       gloveCompartment = 10,      type = 'car',       banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('policeold2')] = {        modelname = 'policeold2',       name = 'Policeold2',       price = 99999999,     trunk = 40,       gloveCompartment = 10,      type = 'car',       banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('policet')] = {           modelname = 'policet',          name = 'Policet',          price = 99999999,     trunk = 40,       gloveCompartment = 10,      type = 'car',       banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('pranger')] = {           modelname = 'pranger',          name = 'Pranger',          price = 99999999,     trunk = 40,       gloveCompartment = 10,      type = 'car',       banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('predator')] = {          modelname = 'predator',         name = 'Predator',         price = 99999999,     trunk = 40,       gloveCompartment = 10,      type = 'car',       banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('riot')] = {              modelname = 'riot',             name = 'Riot',             price = 99999999,     trunk = 40,       gloveCompartment = 10,      type = 'car',       banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('riot2')] = {             modelname = 'riot2',            name = 'Riot2',            price = 99999999,     trunk = 40,       gloveCompartment = 10,      type = 'car',       banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('sheriff')] = {           modelname = 'sheriff',          name = 'Sheriff',          price = 99999999,     trunk = 40,       gloveCompartment = 10,      type = 'car',       banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('sheriff2')] = {          modelname = 'sheriff2',         name = 'Sheriff2',         price = 99999999,     trunk = 40,       gloveCompartment = 10,      type = 'car',       banned = false, vip = false, fuelUsage = 5.0 },
  
            ------------------------------------ 
            --  Helicopters ( HELICOPTEROS )  -- 
            ------------------------------------ 
            [GetHashKey('akula')] = {             modelname = 'akula',            name = 'Akula',            price = 90000000,     trunk = 400,      gloveCompartment = 30,      type = 'helicoptero',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('annihilator')] = {       modelname = 'annihilator',      name = 'Annihilator',      price = 70000000,     trunk = 400 ,     gloveCompartment = 30,      type = 'helicoptero',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('buzzard')] = {           modelname = 'buzzard',          name = 'Buzzard',          price = 80000000,     trunk = 200,      gloveCompartment = 30,      type = 'helicoptero',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('buzzard2')] = {          modelname = 'buzzard2',         name = 'Buzzard2',         price = 80000000,     trunk = 200,      gloveCompartment = 30,      type = 'helicoptero',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('cargobob')] = {          modelname = 'cargobob',         name = 'Cargobob',         price = 70000000,     trunk = 800,      gloveCompartment = 30,      type = 'helicoptero',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('cargobob2')] = {         modelname = 'cargobob2',        name = 'Cargobob2',        price = 70000000,     trunk = 800,      gloveCompartment = 30,      type = 'helicoptero',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('cargobob3')] = {         modelname = 'cargobob3',        name = 'Cargobob3',        price = 70000000,     trunk = 800,      gloveCompartment = 30,      type = 'helicoptero',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('cargobob4')] = {         modelname = 'cargobob4',        name = 'Cargobob4',        price = 70000000,     trunk = 800,      gloveCompartment = 30,      type = 'helicoptero',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('frogger')] = {           modelname = 'frogger',          name = 'Frogger',          price = 50000000,     trunk = 400,      gloveCompartment = 30,      type = 'helicoptero',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('frogger2')] = {          modelname = 'frogger2',         name = 'Frogger2',         price = 50000000,     trunk = 400,      gloveCompartment = 30,      type = 'helicoptero',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('havok')] = {             modelname = 'havok',            name = 'Havok',            price = 15000000,     trunk = 40,       gloveCompartment = 30,      type = 'helicoptero',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('hunter')] = {            modelname = 'hunter',           name = 'Hunter',           price = 90000000,     trunk = 300,      gloveCompartment = 30,      type = 'helicoptero',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('maverick')] = {          modelname = 'maverick',         name = 'Maverick',         price = 40000000,     trunk = 280,      gloveCompartment = 30,      type = 'helicoptero',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('savage')] = {            modelname = 'savage',           name = 'Savage',           price = 90000000,     trunk = 400,      gloveCompartment = 30,      type = 'helicoptero',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('seasparrow')] = {        modelname = 'seasparrow',       name = 'Seasparrow',       price = 40000000,     trunk = 70,       gloveCompartment = 15,      type = 'helicoptero',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('skylift')] = {           modelname = 'skylift',          name = 'Skylift',          price = 100000000,    trunk = 800,      gloveCompartment = 30,      type = 'helicoptero',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('supervolito')] = {       modelname = 'supervolito',      name = 'Supervolito',      price = 65000000,     trunk = 400,      gloveCompartment = 30,      type = 'helicoptero',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('supervolito2')] = {      modelname = 'supervolito2',     name = 'Supervolito2',     price = 65000000,     trunk = 400,      gloveCompartment = 30,      type = 'helicoptero',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('swift')] = {             modelname = 'swift',            name = 'Swift',            price = 99000000,     trunk = 400,      gloveCompartment = 30,      type = 'helicoptero',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('swift2')] = {            modelname = 'swift2',           name = 'Swift2',           price = 99999999,     trunk = 400,      gloveCompartment = 30,      type = 'helicoptero',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('valkyrie')] = {          modelname = 'valkyrie',         name = 'Valkyrie',         price = 80000000,     trunk = 300,      gloveCompartment = 30,      type = 'helicoptero',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('valkyrie2')] = {         modelname = 'valkyrie2',        name = 'Valkyrie2',        price = 80000000,     trunk = 300,      gloveCompartment = 30,      type = 'helicoptero',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('volatus')] = {           modelname = 'volatus',          name = 'Volatus',          price = 70000000,     trunk = 400,      gloveCompartment = 30,      type = 'helicoptero',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('annihilator2')] = {      modelname = 'annihilator2',     name = 'Annihilator2',     price = 68000000,     trunk = 400,      gloveCompartment = 30,      type = 'helicoptero',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('seasparrow2')] = {       modelname = 'seasparrow2',      name = 'Seasparrow2',      price = 20000000,     trunk = 60,       gloveCompartment = 15,      type = 'helicoptero',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('seasparrow3')] = {       modelname = 'seasparrow3',      name = 'Seasparrow3',      price = 20000000,     trunk = 60,       gloveCompartment = 15,      type = 'helicoptero',     banned = false, vip = false, fuelUsage = 5.0 },
            
            ---------------------------------- 
            --  Industrial ( INDUSTRIAIS )  -- 
            ---------------------------------- 
            [GetHashKey('bulldozer')] = {         modelname = 'bulldozer',        name = 'Bulldozer',        price = 90000000,     trunk = 400,      gloveCompartment = 30,      type = 'car',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('cutter')] = {            modelname = 'cutter',           name = 'Cutter',           price = 70000000,     trunk = 400,      gloveCompartment = 30,      type = 'car',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('dump')] = {              modelname = 'dump',             name = 'Dump',             price = 80000000,     trunk = 200,      gloveCompartment = 30,      type = 'car',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('flatbed')] = {           modelname = 'flatbed',          name = 'Flatbed',          price = 80000000,     trunk = 200,      gloveCompartment = 30,      type = 'car',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('guardian')] = {          modelname = 'guardian',         name = 'Guardian',         price = 70000000,     trunk = 800,      gloveCompartment = 30,      type = 'car',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('handler')] = {           modelname = 'handler',          name = 'Handler',          price = 70000000,     trunk = 800,      gloveCompartment = 30,      type = 'car',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('mixer')] = {             modelname = 'mixer',            name = 'Mixer',            price = 70000000,     trunk = 800,      gloveCompartment = 30,      type = 'car',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('mixer2')] = {            modelname = 'mixer2',           name = 'Mixer2',           price = 70000000,     trunk = 800,      gloveCompartment = 30,      type = 'car',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('rubble')] = {            modelname = 'rubble',           name = 'Rubble',           price = 50000000,     trunk = 400,      gloveCompartment = 30,      type = 'car',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tiptruck')] = {          modelname = 'tiptruck',         name = 'Tiptruck',         price = 50000000,     trunk = 400,      gloveCompartment = 30,      type = 'car',     banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tiptruck2')] = {         modelname = 'tiptruck2',        name = 'Tiptruck2',        price = 15000000,     trunk = 40,       gloveCompartment = 30,      type = 'car',     banned = false, vip = false, fuelUsage = 5.0 },
            
            ------------------------------ 
            --  Military ( MILITARES )  -- 
            ------------------------------ 
            [GetHashKey('apc')] = {               modelname = 'apc',              name = 'Apc',              price = 999999999,    trunk = 500,      gloveCompartment = 20,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('barracks')] = {          modelname = 'barracks',         name = 'Barracks',         price = 999999999,    trunk = 500,      gloveCompartment = 20,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('barracks2')] = {         modelname = 'barracks2',        name = 'Barracks2',        price = 999999999,    trunk = 100,      gloveCompartment = 20,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('barracks3')] = {         modelname = 'barracks3',        name = 'Barracks3',        price = 999999999,    trunk = 500,      gloveCompartment = 15,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('barrage')] = {           modelname = 'barrage',          name = 'Barrage',          price = 999999999,    trunk = 100,      gloveCompartment = 20,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('chernobog')] = {         modelname = 'chernobog',        name = 'Chernobog',        price = 999999999,    trunk = 200,      gloveCompartment = 20,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('crusader')] = {          modelname = 'crusader',         name = 'Crusader',         price = 999999999,    trunk = 80,       gloveCompartment = 20,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('halftrack')] = {         modelname = 'halftrack',        name = 'Halftrack',        price = 999999999,    trunk = 80,       gloveCompartment = 20,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('khanjali')] = {          modelname = 'khanjali',         name = 'Khanjali',         price = 999999999,    trunk = 200,      gloveCompartment = 20,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('minitank')] = {          modelname = 'minitank',         name = 'Minitank',         price = 999999999,    trunk = 5,        gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('rhino')] = {             modelname = 'rhino',            name = 'Rhino',            price = 999999999,    trunk = 150,      gloveCompartment = 20,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('scarab')] = {            modelname = 'scarab',           name = 'Scarab',           price = 999999999,    trunk = 200,      gloveCompartment = 20,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('scarab2')] = {           modelname = 'scarab2',          name = 'Scarab2',          price = 999999999,    trunk = 200,      gloveCompartment = 20,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('scarab3')] = {           modelname = 'scarab3',          name = 'Scarab3',          price = 999999999,    trunk = 200,      gloveCompartment = 20,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('thruster')] = {          modelname = 'thruster',         name = 'Thruster',         price = 999999999,    trunk = 5,        gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('trailersmall2')] = {     modelname = 'trailersmall2',    name = 'Trailersmall2',    price = 999999999,    trunk = 10,       gloveCompartment = 1,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('vetir')] = {             modelname = 'vetir',            name = 'Vetir',            price = 999999999,    trunk = 200,      gloveCompartment = 15,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
  
            ----------------------------- 
            --  Motorcycles ( MOTOS )  -- 
            ----------------------------- 
            [GetHashKey('akuma')] = {             modelname = 'akuma',            name = 'Akuma',            price = 90000,        trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('avarus')] = {            modelname = 'avarus',           name = 'Avarus',           price = 120000,       trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('bagger')] = {            modelname = 'bagger',           name = 'Bagger',           price = 180000,       trunk = 60,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('bati')] = {              modelname = 'bati',             name = 'Bati',             price = 95000,        trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('bati2')] = {             modelname = 'bati2',            name = 'Bati2',            price = 95000,        trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('bf400')] = {             modelname = 'bf400',            name = 'Bf400',            price = 200000,       trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('carbonrs')] = {          modelname = 'carbonrs',         name = 'Carbonrs',         price = 120000,       trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('chimera')] = {           modelname = 'chimera',          name = 'Chimera',          price = 190000,       trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('cliffhanger')] = {       modelname = 'cliffhanger',      name = 'Cliffhanger',      price = 110000,       trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('daemon')] = {            modelname = 'daemon',           name = 'Daemon',           price = 170000,       trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('daemon2')] = {           modelname = 'daemon2',          name = 'Daemon2',          price = 170000,       trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('defiler')] = {           modelname = 'defiler',          name = 'Defiler',          price = 90000,        trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('deathbike')] = {         modelname = 'deathbike',        name = 'Deathbike',        price = 90000000,     trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('deathbike2')] = {        modelname = 'deathbike2',       name = 'Deathbike2',       price = 90000000,     trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('deathbike3')] = {        modelname = 'deathbike3',       name = 'Deathbike3',       price = 90000000,     trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('diablous')] = {          modelname = 'diablous',         name = 'Diablous',         price = 90000,        trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('diablous2')] = {         modelname = 'diablous2',        name = 'Diablous2',        price = 90000,        trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('double')] = {            modelname = 'double',           name = 'Double',           price = 190000,       trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('enduro')] = {            modelname = 'enduro',           name = 'Enduro',           price = 90000,        trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('esskey')] = {            modelname = 'esskey',           name = 'esskey',           price = 90000,        trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('faggio')] = {            modelname = 'faggio',           name = 'Faggio',           price = 6000,         trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('faggio2')] = {           modelname = 'faggio2',          name = 'Faggio2',          price = 6000,         trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('faggio3')] = {           modelname = 'faggio3',          name = 'Faggio3',          price = 6000,         trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('fcr')] = {               modelname = 'fcr',              name = 'Fcr',              price = 80000,        trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('fcr2')] = {              modelname = 'fcr2',             name = 'Fcr2',             price = 80000,        trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('gargoyle')] = {          modelname = 'gargoyle',         name = 'Gargoyle',         price = 65000,        trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('hakuchou')] = {          modelname = 'hakuchou',         name = 'Hakuchou',         price = 350000,       trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('hakuchou2')] = {         modelname = 'hakuchou2',        name = 'Hakuchou2',        price = 600000,       trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('hexer')] = {             modelname = 'hexer',            name = 'Hexer',            price = 100000,       trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('innovation')] = {        modelname = 'innovation',       name = 'Innovation',       price = 100000,       trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('lectro')] = {            modelname = 'lectro',           name = 'Lectro',           price = 100000,       trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('manchez')] = {           modelname = 'manchez',          name = 'Manchez',          price = 140000,       trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('nemesis')] = {           modelname = 'nemesis',          name = 'Nemesis',          price = 120000,       trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('nightblade')] = {        modelname = 'nightblade',       name = 'Nightblade',       price = 100000,       trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('oppressor')] = {         modelname = 'oppressor',        name = 'Oppressor',        price = 99999999,     trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('oppressor2')] = {        modelname = 'oppressor2',       name = 'Oppressor2',       price = 99999999,     trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('pcj')] = {               modelname = 'pcj',              name = 'Pcj',              price = 100000,       trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('ratbike')] = {           modelname = 'ratbike',          name = 'Ratbike',          price = 170000,       trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('ruffian')] = {           modelname = 'ruffian',          name = 'Ruffian',          price = 100000,       trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('rrocket')] = {           modelname = 'rrocket',          name = 'Rrocket',          price = 200000,       trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('sanchez')] = {           modelname = 'sanchez',          name = 'Sanchez',          price = 180000,       trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('sanchez2')] = {          modelname = 'sanchez2',         name = 'sanchez2',         price = 180000,       trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('sanctus')] = {           modelname = 'sanctus',          name = 'Sanctus',          price = 400000,       trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('shotaro')] = {           modelname = 'shotaro',          name = 'Shotaro',          price = 800000,       trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('sovereign')] = {         modelname = 'sovereign',        name = 'Sovereign',        price = 280000,       trunk = 60,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('stryder')] = {           modelname = 'stryder',          name = 'Stryder',          price = 180000,       trunk = 5,        gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('thrust')] = {            modelname = 'thrust',           name = 'thrust',           price = 350000,       trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('vader')] = {             modelname = 'vader',            name = 'Vader',            price = 90000,        trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('vindicator')] = {        modelname = 'vindicator',       name = 'Vindicator',       price = 200000,       trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('vortex')] = {            modelname = 'vortex',           name = 'Vortex',           price = 150000,       trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('wolfsbane')] = {         modelname = 'wolfsbane',        name = 'Wolfsbane',        price = 100000,       trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('zombiea')] = {           modelname = 'zombiea',          name = 'Zombiea',          price = 100000,       trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('zombieb')] = {           modelname = 'zombieb',          name = 'Zombieb',          price = 100000,       trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('manchez2')] = {          modelname = 'manchez2',         name = 'manchez2',         price = 160000,       trunk = 15,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
  
            ------------------------------- 
            --  Muscle ( "MUSCULOSOS" )  -- 
            ------------------------------- 
            [GetHashKey('blade')] = {             modelname = 'blade',            name = 'Blade',            price = 120000,       trunk = 60,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('buccaneer')] = {         modelname = 'buccaneer',        name = 'Buccaneer',        price = 120000,       trunk = 60,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('buccaneer2')] = {        modelname = 'buccaneer2',       name = 'Buccaneer2',       price = 120000,       trunk = 60,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('chino')] = {             modelname = 'chino',            name = 'Chino',            price = 120000,       trunk = 60,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('chino2')] = {            modelname = 'chino2',           name = 'Chino2',           price = 120000,       trunk = 60,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('clique')] = {            modelname = 'clique',           name = 'Clique',           price = 140000,       trunk = 45,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('coquette3')] = {         modelname = 'coquette3',        name = 'Coquette3',        price = 140000,       trunk = 45,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('deviant')] = {           modelname = 'deviant',          name = 'Deviant',          price = 130000,       trunk = 45,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('dominator')] = {         modelname = 'dominator',        name = 'Dominator',        price = 200000,       trunk = 45,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('dominator2')] = {        modelname = 'dominator2',       name = 'Dominator2',       price = 200000,       trunk = 45,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('dominator3')] = {        modelname = 'dominator3',       name = 'Dominator3',       price = 220000,       trunk = 45,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('dominator4')] = {        modelname = 'dominator4',       name = 'Dominator4',       price = 1900000,      trunk = 45,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('dominator5')] = {        modelname = 'dominator5',       name = 'Dominator5',       price = 1900000,      trunk = 45,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('dominator6')] = {        modelname = 'dominator6',       name = 'Dominator6',       price = 1900000,      trunk = 45,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('dukes')] = {             modelname = 'dukes',            name = 'Dukes',            price = 100000,       trunk = 55,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('dukes2')] = {            modelname = 'dukes2',           name = 'Dukes2',           price = 2000000,      trunk = 55,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('dukes3')] = {            modelname = 'dukes3',           name = 'Dukes3',           price = 120000,       trunk = 55,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('faction')] = {           modelname = 'faction',          name = 'Faction',          price = 160000,       trunk = 55,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('faction2')] = {          modelname = 'faction2',         name = 'Faction2',         price = 160000,       trunk = 55,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('faction3')] = {          modelname = 'faction3',         name = 'Faction3',         price = 560000,       trunk = 55,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('ellie')] = {             modelname = 'ellie',            name = 'Ellie',            price = 100000,       trunk = 50,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('gauntlet')] = {          modelname = 'gauntlet',         name = 'Gauntlet',         price = 100000,       trunk = 50,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('gauntlet2')] = {         modelname = 'gauntlet2',        name = 'Gauntlet2',        price = 100000,       trunk = 50,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('gauntlet3')] = {         modelname = 'gauntlet3',        name = 'Gauntlet3',        price = 90000,        trunk = 50,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('gauntlet4')] = {         modelname = 'gauntlet4',        name = 'Gauntlet4',        price = 90000,        trunk = 50,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('gauntlet5')] = {         modelname = 'gauntlet5',        name = 'Gauntlet5',        price = 100000,       trunk = 50,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('hermes')] = {            modelname = 'hermes',           name = 'Hermes',           price = 100000,       trunk = 40,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('hotknife')] = {          modelname = 'hotknife',         name = 'Hotknife',         price = 100000,       trunk = 40,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('hustler')] = {           modelname = 'hustler',          name = 'Hustler',          price = 100000,       trunk = 40,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('impaler')] = {           modelname = 'impaler',          name = 'Impaler',          price = 90000,        trunk = 50,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('impaler2')] = {          modelname = 'impaler2',         name = 'Impaler2',         price = 90000,        trunk = 50,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('impaler3')] = {          modelname = 'impaler3',         name = 'Impaler3',         price = 90000,        trunk = 50,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('impaler4')] = {          modelname = 'impaler4',         name = 'Impaler4',         price = 100000,       trunk = 50,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('imperator')] = {         modelname = 'imperator',        name = 'Imperator',        price = 110000,       trunk = 50,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('imperator2')] = {        modelname = 'imperator2',       name = 'Imperator2',       price = 110000,       trunk = 50,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('imperator3')] = {        modelname = 'imperator3',       name = 'Imperator3',       price = 110000,       trunk = 50,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('lurcher')] = {           modelname = 'lurcher',          name = 'Lurcher',          price = 140000,       trunk = 75,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('moonbeam')] = {          modelname = 'moonbeam',         name = 'Moonbeam',         price = 320000,       trunk = 85,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('moonbeam2')] = {         modelname = 'moonbeam2',        name = 'Moonbeam2',        price = 320000,       trunk = 85,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('nightshade')] = {        modelname = 'nightshade',       name = 'Nightshade',       price = 110000,       trunk = 40,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('peyote2')] = {           modelname = 'peyote2',          name = 'Peyote2',          price = 110000,       trunk = 40,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('phoenix')] = {           modelname = 'phoenix',          name = 'Phoenix',          price = 100000,       trunk = 50,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('picador')] = {           modelname = 'picador',          name = 'Picador',          price = 140000,       trunk = 70,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('ratloader')] = {         modelname = 'ratloader',        name = 'Ratloader',        price = 120000,       trunk = 15,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('ratloader2')] = {        modelname = 'ratloader2',       name = 'Ratloader2',       price = 120000,       trunk = 80,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('ruiner')] = {            modelname = 'ruiner',           name = 'Ruiner',           price = 160000,       trunk = 50,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('ruiner2')] = {           modelname = 'ruiner2',          name = 'Ruiner2',          price = 160000,       trunk = 40,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('ruiner3')] = {           modelname = 'ruiner3',          name = 'Ruiner3',          price = 160000,       trunk = 10,       gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('sabregt')] = {           modelname = 'sabregt',          name = 'Sabregt',          price = 100000,       trunk = 40,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('sabregt2')] = {          modelname = 'sabregt2',         name = 'Sabregt2',         price = 100000,       trunk = 40,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('slamvan')] = {           modelname = 'slamvan',          name = 'Slamvan',          price = 100000,       trunk = 75,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('slamvan2')] = {          modelname = 'slamvan2',         name = 'Slamvan2',         price = 110000,       trunk = 75,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('slamvan3')] = {          modelname = 'slamvan3',         name = 'Slamvan3',         price = 110000,       trunk = 75,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('slamvan4')] = {          modelname = 'slamvan4',         name = 'Slamvan4',         price = 300000,       trunk = 50,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('slamvan5')] = {          modelname = 'slamvan5',         name = 'Slamvan5',         price = 300000,       trunk = 50,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('slamvan6')] = {          modelname = 'slamvan6',         name = 'Slamvan6',         price = 400000,       trunk = 50,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('stalion')] = {           modelname = 'stalion',          name = 'Stalion',          price = 120000,       trunk = 50,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('stalion2')] = {          modelname = 'stalion2',         name = 'Stalion2',         price = 120000,       trunk = 50,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tampa')] = {             modelname = 'tampa',            name = 'Tampa',            price = 100000,       trunk = 50,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tampa3')] = {            modelname = 'tampa3',           name = 'Tampa3',           price = 100000,       trunk = 50,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tulip')] = {             modelname = 'tulip',            name = 'Tulip',            price = 100000,       trunk = 50,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('vamos')] = {             modelname = 'vamos',            name = 'Vamos',            price = 100000,       trunk = 50,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('vigero')] = {            modelname = 'vigero',           name = 'Vigero',           price = 110000,       trunk = 50,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('virgo')] = {             modelname = 'virgo',            name = 'Virgo',            price = 110000,       trunk = 50,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('virgo2')] = {            modelname = 'virgo2',           name = 'Virgo2',           price = 110000,       trunk = 50,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('virgo3')] = {            modelname = 'virgo3',           name = 'Virgo3',           price = 110000,       trunk = 50,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('voodoo')] = {            modelname = 'voodoo',           name = 'Voodoo',           price = 250000,       trunk = 60,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('voodoo2')] = {           modelname = 'voodoo2',          name = 'Voodoo2',          price = 250000,       trunk = 60,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('yosemite')] = {          modelname = 'yosemite',         name = 'Yosemite',         price = 140000,       trunk = 60,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('yosemite2')] = {         modelname = 'yosemite2',        name = 'Yosemite2',        price = 140000,       trunk = 60,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('yosemite3')] = {         modelname = 'yosemite3',        name = 'Yosemite3',        price = 140000,       trunk = 55,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('dominator7')] = {        modelname = 'dominator7',       name = 'Dominator7',       price = 250000,       trunk = 40,       gloveCompartment = 18,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
  
            -------------------------------------- 
            --  Off-Road ( "FORA DE ESTRADA" )  -- 
            -------------------------------------- 
            [GetHashKey('bfinjection')] = {       modelname = 'bfinjection',      name = 'Bfinjection',      price = 30000,        trunk = 40,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('bifta')] = {             modelname = 'bifta',            name = 'Bifta',            price = 70000,        trunk = 40,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('blazer')] = {            modelname = 'blazer',           name = 'Blazer',           price = 90000,        trunk = 2,        gloveCompartment = 1,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('blazer2')] = {           modelname = 'blazer2',          name = 'Blazer2',          price = 120000,       trunk = 10,       gloveCompartment = 2,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('blazer3')] = {           modelname = 'blazer3',          name = 'Blazer3',          price = 120000,       trunk = 10,       gloveCompartment = 2,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('blazer4')] = {           modelname = 'blazer4',          name = 'Blazer4',          price = 90000,        trunk = 2,        gloveCompartment = 1,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('blazer5')] = {           modelname = 'blazer5',          name = 'Blazer5',          price = 130000,       trunk = 2,        gloveCompartment = 1,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('bodhi2')] = {            modelname = 'bodhi2',           name = 'Bodhi2',           price = 100000,       trunk = 65,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('brawler')] = {           modelname = 'brawler',          name = 'Brawler',          price = 180000,       trunk = 40,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('bruiser')] = {           modelname = 'bruiser',          name = 'Bruiser',          price = 2000000,      trunk = 45,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('bruiser2')] = {          modelname = 'bruiser2',         name = 'Bruiser2',         price = 2000000,      trunk = 45,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('bruiser3')] = {          modelname = 'bruiser3',         name = 'Bruiser3',         price = 2000000,      trunk = 45,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('brutus')] = {            modelname = 'brutus',           name = 'Brutus',           price = 160000,       trunk = 55,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('brutus2')] = {           modelname = 'brutus2',          name = 'Brutus2',          price = 160000,       trunk = 55,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('brutus3')] = {           modelname = 'brutus3',          name = 'Brutus3',          price = 160000,       trunk = 55,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('caracara')] = {          modelname = 'caracara',         name = 'caracara',         price = 2000000,      trunk = 70,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('caracara2')] = {         modelname = 'caracara2',        name = 'caracara2',        price = 600000,       trunk = 70,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('dloader')] = {           modelname = 'dloader',          name = 'Dloader',          price = 150000,       trunk = 70,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('dubsta3')] = {           modelname = 'dubsta3',          name = 'Dubsta3',          price = 2600000,      trunk = 110,      gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('dune')] = {              modelname = 'dune',             name = 'Dune',             price = 500000,       trunk = 2,        gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('dune2')] = {             modelname = 'dune2',            name = 'Dune2',            price = 500000,       trunk = 2,        gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('dune3')] = {             modelname = 'dune3',            name = 'Dune3',            price = 500000,       trunk = 2,        gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('dune4')] = {             modelname = 'dune4',            name = 'Dune4',            price = 999999999,    trunk = 2,        gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('dune5')] = {             modelname = 'dune5',            name = 'Dune5',            price = 999999999,    trunk = 2,        gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('everon')] = {            modelname = 'everon',           name = 'Everon',           price = 320000,       trunk = 60,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('freecrawler')] = {       modelname = 'freecrawler',      name = 'Freecrawler',      price = 500000,       trunk = 40,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('hellion')] = {           modelname = 'hellion',          name = 'Hellion',          price = 120000,       trunk = 40,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('insurgent')] = {         modelname = 'insurgent',        name = 'Insurgent',        price = 999999999,    trunk = 85,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('insurgent2')] = {        modelname = 'insurgent2',       name = 'Insurgent2',       price = 999999999,    trunk = 85,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('insurgent3')] = {        modelname = 'insurgent3',       name = 'Insurgent3',       price = 999999999,    trunk = 85,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('kalahari')] = {          modelname = 'kalahari',         name = 'Kalahari',         price = 150000,       trunk = 40,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('kamacho')] = {           modelname = 'kamacho',          name = 'Kamacho',          price = 410000,       trunk = 80,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('marshall')] = {          modelname = 'marshall',         name = 'Marshall',         price = 800000,       trunk = 40,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('mesa3')] = {             modelname = 'mesa3',            name = 'Mesa3',            price = 710000,       trunk = 30,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('monster')] = {           modelname = 'monster',          name = 'Monster',          price = 4000000,      trunk = 40,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('monster3')] = {          modelname = 'monster3',         name = 'Monster3',         price = 4000000,      trunk = 40,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('monster4')] = {          modelname = 'monster4',         name = 'Monster4',         price = 9900000,      trunk = 40,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('monster5')] = {          modelname = 'monster5',         name = 'Monster5',         price = 9900000,      trunk = 40,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('menacer')] = {           modelname = 'menacer',          name = 'Menacer',          price = 6000000,      trunk = 40,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('outlaw')] = {            modelname = 'outlaw',           name = 'Outlaw',           price = 1200000,      trunk = 10,       gloveCompartment = 2,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('nightshark')] = {        modelname = 'nightshark',       name = 'Nightshark',       price = 2900000,      trunk = 80,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('rancherxl')] = {         modelname = 'rancherxl',        name = 'Rancherxl',        price = 90000,        trunk = 55,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('rancherxl2')] = {        modelname = 'rancherxl2',       name = 'Rancherxl2',       price = 90000,        trunk = 55,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('rebel')] = {             modelname = 'rebel',            name = 'Rebel',            price = 120000,       trunk = 65,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('rebel2')] = {            modelname = 'rebel2',           name = 'Rebel2',           price = 120000,       trunk = 65,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('rcbandito')] = {         modelname = 'rcbandito',        name = 'Rcbandito',        price = 9900000,      trunk = 1,        gloveCompartment = 1,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('riata')] = {             modelname = 'riata',            name = 'Riata',            price = 900000,       trunk = 60,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('sandking')] = {          modelname = 'sandking',         name = 'Sandking',         price = 1000000,      trunk = 75,       gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('sandking2')] = {         modelname = 'sandking2',        name = 'Sandking2',        price = 1000000,      trunk = 75,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('technical')] = {         modelname = 'technical',        name = 'Technical',        price = 9000000,      trunk = 40,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('technical2')] = {        modelname = 'technical2',       name = 'Technical2',       price = 9000000,      trunk = 40,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('technical3')] = {        modelname = 'technical3',       name = 'Technical3',       price = 9000000,      trunk = 40,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('trophytruck')] = {       modelname = 'trophytruck',      name = 'Trophytruck',      price = 7000000,      trunk = 45,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('trophytruck2')] = {      modelname = 'trophytruck2',     name = 'Trophytruck2',     price = 7000000,      trunk = 45,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('vagrant')] = {           modelname = 'vagrant',          name = 'Vagrant',          price = 1000000,      trunk = 5,        gloveCompartment = 2,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('zhaba')] = {             modelname = 'zhaba',            name = 'Zhaba',            price = 9900000,      trunk = 15,       gloveCompartment = 6,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('verus')] = {             modelname = 'verus',            name = 'Verus',            price = 400000,       trunk = 8,        gloveCompartment = 6,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('winky')] = {             modelname = 'winky',            name = 'Winky',            price = 2200000,      trunk = 10,       gloveCompartment = 2,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
  
            --------------------------- 
            --  Open Wheel ( "F1" )  -- 
            --------------------------- 
            [GetHashKey('formula')] = {           modelname = 'formula',          name = 'Formula',          price = 9900000,      trunk = 40,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('formula2')] = {          modelname = 'formula2',         name = 'Formula2',         price = 9900000,      trunk = 40,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('openwheel1')] = {        modelname = 'openwheel1',       name = 'Openwheel1',       price = 9900000,      trunk = 45,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('openwheel2')] = {        modelname = 'openwheel2',       name = 'Openwheel2',       price = 9900000,      trunk = 45,       gloveCompartment = 12,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
  
            ------------------------- 
            --  Planes ( AVIÕES )  -- 
            ------------------------- 
            [GetHashKey('alphaz1')] = {           modelname = 'alphaz1',          name = 'Alphaz1',          price = 3000000,      trunk = 10,       gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('avenger')] = {           modelname = 'avenger',          name = 'Avenger',          price = 999999999,    trunk = 90000,    gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('avenger2')] = {          modelname = 'avenger2',         name = 'Avenger2',         price = 999999999,    trunk = 90000,    gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('besra')] = {             modelname = 'besra',            name = 'Besra',            price = 4900000,      trunk = 10,       gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('blimp')] = {             modelname = 'blimp',            name = 'Blimp',            price = 9000000,      trunk = 10,       gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('blimp2')] = {            modelname = 'blimp2',           name = 'Blimp2',           price = 9000000,      trunk = 10,       gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('blimp3')] = {            modelname = 'blimp3',           name = 'Blimp3',           price = 9000000,      trunk = 10,       gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('bombushka')] = {         modelname = 'bombushka',        name = 'Bombushka',        price = 999999999,    trunk = 600,      gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('cargoplane')] = {        modelname = 'cargoplane',       name = 'Cargoplane',       price = 999999999,    trunk = 900000,   gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('cuban800')] = {          modelname = 'cuban800',         name = 'Cuban800',         price = 4000000,      trunk = 20,       gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('dodo')] = {              modelname = 'dodo',             name = 'Dodo',             price = 4000000,      trunk = 20,       gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('duster')] = {            modelname = 'duster',           name = 'Duster',           price = 4000000,      trunk = 20,       gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('howard')] = {            modelname = 'howard',           name = 'Howard',           price = 2500000,      trunk = 5,        gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('hydra')] = {             modelname = 'hydra',            name = 'Hydra',            price = 9990000,      trunk = 5,        gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('jet')] = {               modelname = 'jet',              name = 'Jet',              price = 999999999,    trunk = 900000,   gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('lazer')] = {             modelname = 'lazer',            name = 'Lazer',            price = 9990000,      trunk = 5,        gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('luxor')] = {             modelname = 'luxor',            name = 'Luxor',            price = 6000000,      trunk = 20,       gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('luxor2')] = {            modelname = 'luxor2',           name = 'Luxor2',           price = 12000000,     trunk = 20,       gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('mammatus')] = {          modelname = 'mammatus',         name = 'Mammatus',         price = 4000000,      trunk = 20,       gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('microlight')] = {        modelname = 'microlight',       name = 'Microlight',       price = 1800000,      trunk = 1,        gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('miljet')] = {            modelname = 'miljet',           name = 'Miljet',           price = 6000000,      trunk = 70,       gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('mogul')] = {             modelname = 'mogul',            name = 'Mogul',            price = 5000000,      trunk = 50,       gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('molotok')] = {           modelname = 'molotok',          name = 'Molotok',          price = 9000000,      trunk = 10,       gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('nimbus')] = {            modelname = 'nimbus',           name = 'Nimbus',           price = 6000000,      trunk = 50,       gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('nokota')] = {            modelname = 'nokota',           name = 'Nokota',           price = 3000000,      trunk = 10,       gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('pyro')] = {              modelname = 'pyro',             name = 'Pyro',             price = 99000000,     trunk = 10,       gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('rogue')] = {             modelname = 'rogue',            name = 'Rogue',            price = 4000000,      trunk = 5,        gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('seabreeze')] = {         modelname = 'seabreeze',        name = 'Seabreeze',        price = 2800000,      trunk = 10,       gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('shamal')] = {            modelname = 'shamal',           name = 'Shamal',           price = 6000000,      trunk = 50,       gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('starling')] = {          modelname = 'starling',         name = 'Starling',         price = 5000000,      trunk = 10,       gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('strikeforce')] = {       modelname = 'strikeforce',      name = 'Strikeforce',      price = 10000000,     trunk = 10,       gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('stunt')] = {             modelname = 'stunt',            name = 'Stunt',            price = 1900000,      trunk = 10,       gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('titan')] = {             modelname = 'titan',            name = 'Titan',            price = 88000000,     trunk = 400,      gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tula')] = {              modelname = 'tula',             name = 'Tula',             price = 800000,       trunk = 180,      gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('velum')] = {             modelname = 'velum',            name = 'Velum',            price = 1300000,      trunk = 60,       gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('velum2')] = {            modelname = 'velum2',           name = 'Velum2',           price = 1300000,      trunk = 60,       gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('vestra')] = {            modelname = 'vestra',           name = 'Vestra',           price = 2000000,      trunk = 45,       gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('volatol')] = {           modelname = 'volatol',          name = 'Volatol',          price = 99000000,     trunk = 9000,     gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('alkonost')] = {          modelname = 'alkonost',         name = 'Alkonost',         price = 99000000,     trunk = 9000,     gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
  
            --------------------------------------- 
            --  SUVs ( "UTILITÁRIO ESPORTIVO" )  -- 
            --------------------------------------- 
            [GetHashKey('baller')] = {            modelname = 'baller',           name = 'Baller',           price = 180000,       trunk = 70,       gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('baller2')] = {           modelname = 'baller2',          name = 'Baller2',          price = 200000,       trunk = 70,       gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('baller3')] = {           modelname = 'baller3',          name = 'Baller3',          price = 240000,       trunk = 78,       gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('baller4')] = {           modelname = 'baller4',          name = 'Baller4',          price = 270000,       trunk = 78,       gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('baller5')] = {           modelname = 'baller5',          name = 'Baller5',          price = 390000,       trunk = 80,       gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('baller6')] = {           modelname = 'baller6',          name = 'Baller6',          price = 430000,       trunk = 80,       gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('bjxl')] = {              modelname = 'bjxl',             name = 'Bjxl',             price = 150000,       trunk = 60,       gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('cavalcade')] = {         modelname = 'cavalcade',        name = 'Cavalcade',        price = 120000,       trunk = 60,       gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('cavalcade2')] = {        modelname = 'cavalcade2',       name = 'Cavalcade2',       price = 128000,       trunk = 65,       gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('contender')] = {         modelname = 'contender',        name = 'Contender',        price = 480000,       trunk = 105,      gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('dubsta')] = {            modelname = 'dubsta',           name = 'Dubsta',           price = 580000,       trunk = 72,       gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('dubsta2')] = {           modelname = 'dubsta2',          name = 'Dubsta2',          price = 580000,       trunk = 72,       gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('fq2')] = {               modelname = 'fq2',              name = 'Fq2',              price = 100000,       trunk = 40,       gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('granger')] = {           modelname = 'granger',          name = 'Granger',          price = 140000,       trunk = 65,       gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('gresley')] = {           modelname = 'gresley',          name = 'Gresley',          price = 110000,       trunk = 40,       gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('habanero')] = {          modelname = 'habanero',         name = 'Habanero',         price = 90000,        trunk = 40,       gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('huntley')] = {           modelname = 'huntley',          name = 'Huntley',          price = 100000,       trunk = 40,       gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('landstalker')] = {       modelname = 'landstalker',      name = 'Landstalker',      price = 100000,       trunk = 45,       gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('landstalker2')] = {      modelname = 'landstalker2',     name = 'Landstalker2',     price = 110000,       trunk = 45,       gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('mesa')] = {              modelname = 'mesa',             name = 'Mesa',             price = 120000,       trunk = 40,       gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('mesa2')] = {             modelname = 'mesa2',            name = 'Mesa2',            price = 120000,       trunk = 40,       gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('novak')] = {             modelname = 'novak',            name = 'Novak',            price = 100000,       trunk = 40,       gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('patriot')] = {           modelname = 'patriot',          name = 'Patriot',          price = 280000,       trunk = 70,       gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('patriot2')] = {          modelname = 'patriot2',         name = 'Patriot2',         price = 680000,       trunk = 88,       gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('radi')] = {              modelname = 'radi',             name = 'Radi',             price = 100000,       trunk = 40,       gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('rebla')] = {             modelname = 'rebla',            name = 'Rebla',            price = 320000,       trunk = 42,       gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('rocoto')] = {            modelname = 'rocoto',           name = 'Rocoto',           price = 100000,       trunk = 40,       gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('seminole')] = {          modelname = 'seminole',         name = 'Seminole',         price = 110000,       trunk = 40,       gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('seminole2')] = {         modelname = 'seminole2',        name = 'Seminole2',        price = 110000,       trunk = 40,       gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('serrano')] = {           modelname = 'serrano',          name = 'Serrano',          price = 100000,       trunk = 40,       gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('toros')] = {             modelname = 'toros',            name = 'Toros',            price = 550000,       trunk = 60,       gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('xls')] = {               modelname = 'xls',              name = 'Xls',              price = 200000,       trunk = 60,       gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('xls2')] = {              modelname = 'xls2',             name = 'Xls2',             price = 440000,       trunk = 68,       gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('squaddie')] = {          modelname = 'squaddie',         name = 'Squaddie',         price = 99000000,     trunk = 105,      gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
  
            ------------------------ 
            --  Sedans ( SEDÃS )  -- 
            ------------------------ 
            [GetHashKey('asea')] = {              modelname = 'asea',             name = 'Asea',             price = 70000,        trunk = 20,       gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('asea2')] = {             modelname = 'asea2',            name = 'Asea2',            price = 999999999,    trunk = 20,       gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('asterope')] = {          modelname = 'asterope',         name = 'Asterope',         price = 75000,        trunk = 20,       gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('cog55')] = {             modelname = 'cog55',            name = 'Cog55',            price = 270000,       trunk = 40,       gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('cog552')] = {            modelname = 'cog552',           name = 'Cog552',           price = 480000,       trunk = 40,       gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('cognoscenti')] = {       modelname = 'cognoscenti',      name = 'Cognoscenti',      price = 200000,       trunk = 40,       gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('cognoscenti2')] = {      modelname = 'cognoscenti2',     name = 'Cognoscenti2',     price = 400000,       trunk = 40,       gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('emperor')] = {           modelname = 'emperor',          name = 'Emperor',          price = 90000,        trunk = 30,       gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('emperor2')] = {          modelname = 'emperor2',         name = 'Emperor2',         price = 90000,        trunk = 30,       gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('emperor3')] = {          modelname = 'emperor3',         name = 'Emperor3',         price = 999999999,    trunk = 30,       gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('fugitive')] = {          modelname = 'fugitive',         name = 'Fugitive',         price = 110000,       trunk = 32,       gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('glendale')] = {          modelname = 'glendale',         name = 'Glendale',         price = 88000,        trunk = 30,       gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('glendale2')] = {         modelname = 'glendale2',        name = 'Glendale2',        price = 88000,        trunk = 30,       gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('ingot')] = {             modelname = 'ingot',            name = 'Ingot',            price = 100000,       trunk = 30,       gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('intruder')] = {          modelname = 'intruder',         name = 'Intruder',         price = 100000,       trunk = 30,       gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('limo2')] = {             modelname = 'limo2',            name = 'Limo2',            price = 100000000,    trunk = 40,       gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('premier')] = {           modelname = 'premier',          name = 'Premier',          price = 80000,        trunk = 30,       gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('primo')] = {             modelname = 'primo',            name = 'Primo',            price = 80000,        trunk = 30,       gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('primo2')] = {            modelname = 'primo2',           name = 'Primo2',           price = 80000,        trunk = 30,       gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('regina')] = {            modelname = 'regina',           name = 'Regina',           price = 80000,        trunk = 45,       gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('romero')] = {            modelname = 'romero',           name = 'Romero',           price = 280000,       trunk = 45,       gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('stafford')] = {          modelname = 'stafford',         name = 'Stafford',         price = 1008000,      trunk = 30,       gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('stanier')] = {           modelname = 'stanier',          name = 'Stanier',          price = 80000,        trunk = 30,       gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('stratum')] = {           modelname = 'stratum',          name = 'Stratum',          price = 80000,        trunk = 35,       gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('stretch')] = {           modelname = 'stretch',          name = 'Stretch',          price = 700000,       trunk = 40,       gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('superd')] = {            modelname = 'superd',           name = 'Superd',           price = 670000,       trunk = 20,       gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('surge')] = {             modelname = 'surge',            name = 'Surge',            price = 280000,       trunk = 30,       gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tailgater')] = {         modelname = 'tailgater',        name = 'Tailgater',        price = 80000,        trunk = 30,       gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('warrener')] = {          modelname = 'warrener',         name = 'Warrener',         price = 88000,        trunk = 30,       gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('washington')] = {        modelname = 'washington',       name = 'Washington',       price = 80000,        trunk = 30,       gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tailgater2')] = {        modelname = 'tailgater2',       name = 'Tailgater2',       price = 400000,       trunk = 40,       gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
  
            --------------------------- 
            --  Service ( SERVIÇO )  -- 
            --------------------------- 
            [GetHashKey('airbus')] = {            modelname = 'airbus',           name = 'Airbus',           price = 500000,        trunk = 20,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('brickade')] = {          modelname = 'brickade',         name = 'Brickade',         price = 2000000,       trunk = 1800,    gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('bus')] = {               modelname = 'bus',              name = 'Bus',              price = 500000,        trunk = 20,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('coach')] = {             modelname = 'coach',            name = 'Coach',            price = 500000,        trunk = 20,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('pbus2')] = {             modelname = 'pbus2',            name = 'Pbus2',            price = 800000,        trunk = 35,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('rallytruck')] = {        modelname = 'rallytruck',       name = 'Rallytruck',       price = 4000000,       trunk = 3000,    gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('rentalbus')] = {         modelname = 'rentalbus',        name = 'Rentalbus',        price = 450000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('taxi')] = {              modelname = 'taxi',             name = 'Taxi',             price = 180000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tourbus')] = {           modelname = 'tourbus',          name = 'Tourbus',          price = 390000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('trash')] = {             modelname = 'trash',            name = 'Trash',            price = 999999999,     trunk = 100,     gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('trash2')] = {            modelname = 'trash2',           name = 'Trash2',           price = 999999999,     trunk = 100,     gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('wastelander')] = {       modelname = 'wastelander',      name = 'Wastelander',      price = 8800000,       trunk = 100,     gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
  
            ----------------------------- 
            --  Sports ( ESPORTIVOS )  -- 
            ----------------------------- 
            [GetHashKey('alpha')] = {             modelname = 'alpha',             name = 'Alpha',           price = 160000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('banshee')] = {           modelname = 'banshee',           name = 'Banshee',         price = 230000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('bestiagts')] = {         modelname = 'bestiagts',         name = 'Bestiagts',       price = 400000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('blista2')] = {           modelname = 'blista2',           name = 'Blista2',         price = 100000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('blista3')] = {           modelname = 'blista3',           name = 'Blista3',         price = 280000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('buffalo')] = {           modelname = 'buffalo',           name = 'Buffalo',         price = 200000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('buffalo2')] = {          modelname = 'buffalo2',          name = 'Buffalo2',        price = 200000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('buffalo3')] = {          modelname = 'buffalo3',          name = 'Buffalo3',        price = 200000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('carbonizzare')] = {      modelname = 'carbonizzare',      name = 'carbonizzare',    price = 350000,        trunk = 20,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('comet2')] = {            modelname = 'comet2',            name = 'Comet2',          price = 480000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('comet3')] = {            modelname = 'comet3',            name = 'Comet3',          price = 500000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('comet4')] = {            modelname = 'comet4',            name = 'Comet4',          price = 500000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('comet5')] = {            modelname = 'comet5',            name = 'Comet5',          price = 660000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('coquette')] = {          modelname = 'coquette',          name = 'Coquette',        price = 580000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('coquette4')] = {         modelname = 'coquette4',         name = 'Coquette4',       price = 690000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('drafter')] = {           modelname = 'drafter',           name = 'Drafter',         price = 200000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('deveste')] = {           modelname = 'deveste',           name = 'Deveste',         price = 2600000,       trunk = 20,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('elegy')] = {             modelname = 'elegy',             name = 'Elegy',           price = 440000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('elegy2')] = {            modelname = 'elegy2',            name = 'Elegy2',          price = 640000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('feltzer2')] = {          modelname = 'feltzer2',          name = 'Feltzer2',        price = 250000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('flashgt')] = {           modelname = 'flashgt',           name = 'Flashgt',         price = 420000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('furoregt')] = {          modelname = 'furoregt',          name = 'Furoregt',        price = 220000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('fusilade')] = {          modelname = 'fusilade',          name = 'Fusilade',        price = 200000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('futo')] = {              modelname = 'futo',              name = 'Futo',            price = 200000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('gb200')] = {             modelname = 'gb200',             name = 'Gb200',           price = 260000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('hotring')] = {           modelname = 'hotring',           name = 'Hotring',         price = 200000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('komoda')] = {            modelname = 'komoda',            name = 'Komoda',          price = 340000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('imorgon')] = {           modelname = 'imorgon',           name = 'Imorgon',         price = 340000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('issi7')] = {             modelname = 'issi7',             name = 'Issi7',           price = 200000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('italigto')] = {          modelname = 'italigto',          name = 'Italigto',        price = 400000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('jugular')] = {           modelname = 'jugular',           name = 'Jugular',         price = 380000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('jester')] = {            modelname = 'jester',            name = 'Jester',          price = 300000,        trunk = 20,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('jester2')] = {           modelname = 'jester2',           name = 'Jester2',         price = 400000,        trunk = 20,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('jester3')] = {           modelname = 'jester3',           name = 'Jester3',         price = 380000,        trunk = 20,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('khamelion')] = {         modelname = 'khamelion',         name = 'Khamelion',       price = 480000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('kuruma')] = {            modelname = 'kuruma',            name = 'Kuruma',          price = 500000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('kuruma2')] = {           modelname = 'kuruma2',           name = 'Kuruma2',         price = 660000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('locust')] = {            modelname = 'locust',            name = 'Locust',          price = 300000,        trunk = 20,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('lynx')] = {              modelname = 'lynx',              name = 'Lynx',            price = 300000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('massacro')] = {          modelname = 'massacro',          name = 'Massacro',        price = 300000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('massacro2')] = {         modelname = 'massacro2',         name = 'Massacro2',       price = 300000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('neo')] = {               modelname = 'neo',               name = 'Neo',             price = 300000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('neon')] = {              modelname = 'neon',              name = 'Neon',            price = 590000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('ninef')] = {             modelname = 'ninef',             name = 'Ninef',           price = 400000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('ninef2')] = {            modelname = 'ninef2',            name = 'Ninef2',          price = 400000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('omnis')] = {             modelname = 'omnis',             name = 'Omnis',           price = 580000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('paragon')] = {           modelname = 'paragon',           name = 'Paragon',         price = 270000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('paragon2')] = {          modelname = 'paragon2',          name = 'Paragon2',        price = 270000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('pariah')] = {            modelname = 'pariah',            name = 'Pariah',          price = 380000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('penumbra')] = {          modelname = 'penumbra',          name = 'Penumbra',        price = 270000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('penumbra2')] = {         modelname = 'penumbra2',         name = 'Penumbra2',       price = 270000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('raiden')] = {            modelname = 'raiden',            name = 'Raiden',          price = 470000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('rapidgt')] = {           modelname = 'rapidgt',           name = 'Rapidgt',         price = 200000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('rapidgt2')] = {          modelname = 'rapidgt2',          name = 'Rapidgt2',        price = 200000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('raptor')] = {            modelname = 'raptor',            name = 'Raptor',          price = 200000,        trunk = 10,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('revolter')] = {          modelname = 'revolter',          name = 'Revolter',        price = 200000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('ruston')] = {            modelname = 'ruston',            name = 'Ruston',          price = 340000,        trunk = 10,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('schafter2')] = {         modelname = 'schafter2',         name = 'Schafter2',       price = 130000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('schafter3')] = {         modelname = 'schafter3',         name = 'Schafter3',       price = 190000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('schafter4')] = {         modelname = 'schafter4',         name = 'Schafter4',       price = 290000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('schafter5')] = {         modelname = 'schafter5',         name = 'Schafter5',       price = 420000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('schafter6')] = {         modelname = 'schafter6',         name = 'Schafter6',       price = 550000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('schlagen')] = {          modelname = 'schlagen',          name = 'Schlagen',        price = 500000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('schwarzer')] = {         modelname = 'schwarzer',         name = 'Schwarzer',       price = 200000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('sentinel3')] = {         modelname = 'sentinel3',         name = 'Sentinel3',       price = 200000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('seven70')] = {           modelname = 'seven70',           name = 'Seven70',         price = 420000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('specter')] = {           modelname = 'specter',           name = 'Specter',         price = 320000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('specter2')] = {          modelname = 'specter2',          name = 'Specter2',        price = 390000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('streiter')] = {          modelname = 'streiter',          name = 'Streiter',        price = 110000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('sugoi')] = {             modelname = 'sugoi',             name = 'Sugoi',           price = 170000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('sultan')] = {            modelname = 'sultan',            name = 'Sultan',          price = 140000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('sultan2')] = {           modelname = 'sultan2',           name = 'Sultan2',         price = 140000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('surano')] = {            modelname = 'surano',            name = 'Surano',          price = 190000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tampa2')] = {            modelname = 'tampa2',            name = 'Tampa2',          price = 240000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tropos')] = {            modelname = 'tropos',            name = 'Tropos',          price = 280000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('verlierer2')] = {        modelname = 'verlierer2',        name = 'Verlierer2',      price = 240000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('vstr')] = {              modelname = 'vstr',              name = 'Vstr',            price = 240000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('zr380')] = {             modelname = 'zr380',             name = 'Zr380',           price = 940000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('zr3802')] = {            modelname = 'zr3802',            name = 'Zr3802',          price = 999999999,     trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('zr3803')] = {            modelname = 'zr3803',            name = 'Zr3803',          price = 999999999,     trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('italirsx')] = {          modelname = 'italirsx',          name = 'Italirsx',        price = 400000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('veto')] = {              modelname = 'veto',              name = 'Veto',            price = 70000,         trunk = 2,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('veto2')] = {             modelname = 'veto2',             name = 'Veto2',           price = 90000,         trunk = 2,       gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('zr350')] = {             modelname = 'zr350',             name = 'Zr350',           price = 190000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('calico')] = {            modelname = 'calico',            name = 'Calico',          price = 190000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('futo2')] = {             modelname = 'futo2',             name = 'Futo2',           price = 100000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('euros')] = {             modelname = 'euros',             name = 'Euros',           price = 240000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('jester4')] = {           modelname = 'jester4',           name = 'Jester4',         price = 240000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('remus')] = {             modelname = 'remus',             name = 'Remus',           price = 100000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('comet6')] = {            modelname = 'comet6',            name = 'Comet6',          price = 240000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('growler')] = {           modelname = 'growler',           name = 'Growler',         price = 380000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('vectre')] = {            modelname = 'vectre',            name = 'Vectre',          price = 440000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('cypher')] = {            modelname = 'cypher',            name = 'Cypher',          price = 380000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('sultan3')] = {           modelname = 'sultan3',           name = 'Sultan3',         price = 310000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('rt3000')] = {            modelname = 'rt3000',            name = 'Rt3000',          price = 200000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            
            -----------------------------------------------
            --  Sports Classic ( CLÁSSICOS ESPORTIVOS )  -- 
            -----------------------------------------------
            [GetHashKey('ardent')] = {            modelname = 'ardent',            name = 'Ardent',          price = 180000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('btype')] = {             modelname = 'btype',             name = 'Btype',           price = 300000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('btype2')] = {            modelname = 'btype2',            name = 'Btype2',          price = 300000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('btype3')] = {            modelname = 'btype3',            name = 'Btype3',          price = 300000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('casco')] = {             modelname = 'casco',             name = 'Casco',           price = 250000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('cheetah2')] = {          modelname = 'cheetah2',          name = 'Cheetah2',        price = 240000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('coquette2')] = {         modelname = 'coquette2',         name = 'Coquette2',       price = 270000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('deluxo')] = {            modelname = 'deluxo',            name = 'Deluxo',          price = 99999999,      trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('dynasty')] = {           modelname = 'dynasty',           name = 'Dynasty',         price = 90000,         trunk = 20,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('fagaloa')] = {           modelname = 'fagaloa',           name = 'Fagaloa',         price = 92000,         trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('feltzer3')] = {          modelname = 'feltzer3',          name = 'Feltzer3',        price = 290000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('gt500')] = {             modelname = 'gt500',             name = 'Gt500',           price = 220000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('infernus2')] = {         modelname = 'infernus2',         name = 'Infernus2',       price = 250000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('jb700')] = {             modelname = 'jb700',             name = 'Jb700',           price = 490000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('jb7002')] = {            modelname = 'jb7002',            name = 'Jb7002',          price = 490000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('mamba')] = {             modelname = 'mamba',             name = 'Mamba',           price = 390000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('manana')] = {            modelname = 'manana',            name = 'Manana',          price = 100000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('manana2')] = {           modelname = 'manana2',           name = 'Manana2',         price = 100000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('michelli')] = {          modelname = 'michelli',          name = 'Michelli',        price = 90000,         trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('monroe')] = {            modelname = 'monroe',            name = 'Monroe',          price = 180000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('nebula')] = {            modelname = 'nebula',            name = 'Nebula',          price = 100000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('peyote')] = {            modelname = 'peyote',            name = 'Peyote',          price = 140000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('peyote3')] = {           modelname = 'peyote3',           name = 'Peyote3',         price = 100000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('pigalle')] = {           modelname = 'pigalle',           name = 'Pigalle',         price = 110000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('rapidgt3')] = {          modelname = 'rapidgt3',          name = 'Rapidgt3',        price = 100000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('retinue')] = {           modelname = 'retinue',           name = 'Retinue',         price = 100000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('retinue2')] = {          modelname = 'retinue2',          name = 'Retinue2',        price = 100000,        trunk = 20,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('savestra')] = {          modelname = 'savestra',          name = 'Savestra',        price = 100000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('stinger')] = {           modelname = 'stinger',           name = 'Stinger',         price = 140000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('stingergt')] = {         modelname = 'stingergt',         name = 'Stingergt',       price = 140000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('stromberg')] = {         modelname = 'stromberg',         name = 'Stromberg',       price = 250000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('swinger')] = {           modelname = 'swinger',           name = 'Swinger',         price = 360000,        trunk = 20,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('torero')] = {            modelname = 'torero',            name = 'Torero',          price = 250000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tornado')] = {           modelname = 'tornado',           name = 'Tornado',         price = 100000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tornado2')] = {          modelname = 'tornado2',          name = 'Tornado2',        price = 110000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tornado3')] = {          modelname = 'tornado3',          name = 'Tornado3',        price = 110000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tornado4')] = {          modelname = 'tornado4',          name = 'Tornado4',        price = 110000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tornado5')] = {          modelname = 'tornado5',          name = 'Tornado5',        price = 110000,        trunk = 20,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tornado6')] = {          modelname = 'tornado6',          name = 'Tornado6',        price = 990000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('turismo2')] = {          modelname = 'turismo2',          name = 'Turismo2',        price = 280000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('viseris')] = {           modelname = 'viseris',           name = 'Viseris',         price = 340000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('z190')] = {              modelname = 'z190',              name = 'Z190',            price = 300000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('ztype')] = {             modelname = 'ztype',             name = 'Ztype',           price = 300000,        trunk = 22,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('zion3')] = {             modelname = 'zion3',             name = 'Zion3',           price = 120000,        trunk = 30,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('cheburek')] = {          modelname = 'cheburek',          name = 'Cheburek',        price = 120000,        trunk = 20,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('toreador')] = {          modelname = 'toreador',          name = 'Toreador',        price = 9000000,       trunk = 20,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },

            -----------------------------------
            --  Supers ( SUPER ESPORTIVOS )  -- 
            -----------------------------------
            [GetHashKey('adder')] = {             modelname = 'adder',             name = 'Adder',           price = 480000,        trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('autarch')] = {           modelname = 'autarch',           name = 'Autarch',         price = 480000,        trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('banshee2')] = {          modelname = 'banshee2',          name = 'Banshee2',        price = 300000,        trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('bullet')] = {            modelname = 'bullet',            name = 'Bullet',          price = 200000,        trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('cheetah')] = {           modelname = 'cheetah',           name = 'Cheetah',         price = 200000,        trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('cyclone')] = {           modelname = 'cyclone',           name = 'Cyclone',         price = 280000,        trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('entity2')] = {           modelname = 'entity2',           name = 'Entity2',         price = 580000,        trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('entityxf')] = {          modelname = 'entityxf',          name = 'Entityxf',        price = 510000,        trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('emerus')] = {            modelname = 'emerus',            name = 'Emerus',          price = 510000,        trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('fmj')] = {               modelname = 'fmj',               name = 'Fmj',             price = 510000,        trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('furia')] = {             modelname = 'furia',             name = 'Furia',           price = 510000,        trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('gp1')] = {               modelname = 'gp1',               name = 'Gp1',             price = 400000,        trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('infernus')] = {          modelname = 'infernus',          name = 'Infernus',        price = 400000,        trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('italigtb')] = {          modelname = 'italigtb',          name = 'Italigtb',        price = 490000,        trunk = 20,      gloveCompartment = 5,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('italigtb2')] = {         modelname = 'italigtb2',         name = 'Italigtb2',       price = 490000,        trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('krieger')] = {           modelname = 'krieger',           name = 'Krieger',         price = 500000,        trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('le7b')] = {              modelname = 'le7b',              name = 'Le7b',            price = 600000,        trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('nero')] = {              modelname = 'nero',              name = 'Nero',            price = 500000,        trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('nero2')] = {             modelname = 'nero2',             name = 'Nero2',           price = 590000,        trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('osiris')] = {            modelname = 'osiris',            name = 'Osiris',          price = 500000,        trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('penetrator')] = {        modelname = 'penetrator',        name = 'Penetrator',      price = 300000,        trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('pfister811')] = {        modelname = 'pfister811',        name = 'Pfister811',      price = 380000,        trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('prototipo')] = {         modelname = 'prototipo',         name = 'Prototipo',       price = 3000000,       trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('reaper')] = {            modelname = 'reaper',            name = 'Reaper',          price = 1000000,       trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('s80')] = {               modelname = 's80',               name = 'S80',             price = 2000000,       trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('sc1')] = {               modelname = 'sc1',               name = 'Sc1',             price = 800000,        trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('scramjet')] = {          modelname = 'scramjet',          name = 'Scramjet',        price = 99000000,      trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('sheava')] = {            modelname = 'sheava',            name = 'Sheava',          price = 900000,        trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('sultanrs')] = {          modelname = 'sultanrs',          name = 'Sultanrs',        price = 700000,        trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('t20')] = {               modelname = 't20',               name = 'T20',             price = 2400000,       trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('taipan')] = {            modelname = 'taipan',            name = 'Taipan',          price = 1250000,       trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tempesta')] = {          modelname = 'tempesta',          name = 'Tempesta',        price = 680000,        trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tezeract')] = {          modelname = 'tezeract',          name = 'Tezeract',        price = 6500000,       trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('thrax')] = {             modelname = 'thrax',             name = 'Thrax',           price = 900000,        trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tigon')] = {             modelname = 'tigon',             name = 'Tigon',           price = 700000,        trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('turismor')] = {          modelname = 'turismor',          name = 'Turismor',        price = 800000,        trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tyrant')] = {            modelname = 'tyrant',            name = 'Tyrant',          price = 2000000,       trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tyrus')] = {             modelname = 'tyrus',             name = 'Tyrus',           price = 2000000,       trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('vacca')] = {             modelname = 'vacca',             name = 'Vacca',           price = 800000,        trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('vagner')] = {            modelname = 'vagner',            name = 'Vagner',          price = 1800000,       trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('vigilante')] = {         modelname = 'vigilante',         name = 'Vigilante',       price = 99000000,      trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('visione')] = {           modelname = 'visione',           name = 'Visione',         price = 3000000,       trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('voltic')] = {            modelname = 'voltic',            name = 'Voltic',          price = 800000,        trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('voltic2')] = {           modelname = 'voltic2',           name = 'Voltic2',         price = 99200000,      trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('xa21')] = {              modelname = 'xa21',              name = 'Xa21',            price = 8000000,       trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('zentorno')] = {          modelname = 'zentorno',          name = 'Zentorno',        price = 2100000,       trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('zorrusso')] = {          modelname = 'zorrusso',          name = 'Zorrusso',        price = 1200000,       trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },

            ----------------------------
            --  Trailer ( REBOQUES )  -- 
            ----------------------------
            [GetHashKey('armytanker')] = {        modelname = 'armytanker',        name = 'Armytanker',      price = 99999999,      trunk = 1500,    gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('armytrailer')] = {       modelname = 'armytrailer',       name = 'Armytrailer',     price = 99999999,      trunk = 1500,    gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('armytrailer2')] = {      modelname = 'armytrailer2',      name = 'Armytrailer2',    price = 99999999,      trunk = 50,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('baletrailer')] = {       modelname = 'baletrailer',       name = 'Baletrailer',     price = 99999999,      trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('boattrailer')] = {       modelname = 'boattrailer',       name = 'Boattrailer',     price = 99999999,      trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('cablecar')] = {          modelname = 'cablecar',          name = 'Cablecar',        price = 99999999,      trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('docktrailer')] = {       modelname = 'docktrailer',       name = 'Docktrailer',     price = 99999999,      trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('freighttrailer')] = {    modelname = 'freighttrailer',    name = 'Freighttrailer',  price = 99999999,      trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('graintrailer')] = {      modelname = 'graintrailer',      name = 'Graintrailer',    price = 99999999,      trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('proptrailer')] = {       modelname = 'proptrailer',       name = 'Proptrailer',     price = 99999999,      trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('raketrailer')] = {       modelname = 'raketrailer',       name = 'Raketrailer',     price = 99999999,      trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tr2')] = {               modelname = 'tr2',               name = 'Tr2',             price = 99999999,      trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tr3')] = {               modelname = 'tr3',               name = 'Tr3',             price = 99999999,      trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tr4')] = {               modelname = 'tr4',               name = 'Tr4',             price = 99999999,      trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('trflat')] = {            modelname = 'trflat',            name = 'Trflat',          price = 99999999,      trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tvtrailer')] = {         modelname = 'tvtrailer',         name = 'Tvtrailer',       price = 99999999,      trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tanker')] = {            modelname = 'tanker',            name = 'Tanker',          price = 99999999,      trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tanker2')] = {           modelname = 'tanker2',           name = 'Tanker2',         price = 99999999,      trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('trailerlarge')] = {      modelname = 'trailerlarge',      name = 'Trailerlarge',    price = 99999999,      trunk = 20,      gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('trailerlogs')] = {       modelname = 'trailerlogs',       name = 'Trailerlogs',     price = 99999999,      trunk = 1500,    gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('trailersmall')] = {      modelname = 'trailersmall',      name = 'Trailersmall',    price = 99999999,      trunk = 1500,    gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('trailers')] = {          modelname = 'trailers',          name = 'Trailers',        price = 99999999,      trunk = 1500,    gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('trailers2')] = {         modelname = 'trailers2',         name = 'Trailers2',       price = 99999999,      trunk = 1500,    gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('trailers3')] = {         modelname = 'trailers3',         name = 'Trailers3',       price = 99999999,      trunk = 1500,    gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('trailers4')] = {         modelname = 'trailers4',         name = 'Trailers4',       price = 99999999,      trunk = 1500,    gloveCompartment = 3,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },

            ------------------------
            --  Trains ( TRENS )  -- 
            ------------------------
            [GetHashKey('freight')] = {           modelname = 'freight',           name = 'Freight',         price = 99999999,      trunk = 1500,    gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('freightcar')] = {        modelname = 'freightcar',        name = 'Freightcar',      price = 99999999,      trunk = 1500,    gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('freightcont1')] = {      modelname = 'freightcont1',      name = 'Freightcont1',    price = 99999999,      trunk = 1500,    gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('freightcont2')] = {      modelname = 'freightcont2',      name = 'Freightcont2',    price = 99999999,      trunk = 1500,    gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('freightgrain')] = {      modelname = 'freightgrain',      name = 'Freightgrain',    price = 99999999,      trunk = 1500,    gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('metrotrain')] = {        modelname = 'metrotrain',        name = 'Metrotrain',      price = 99999999,      trunk = 1500,    gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tankercar')] = {         modelname = 'tankercar',         name = 'Tankercar',       price = 99999999,      trunk = 1500,    gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },

            -------------------------------
            --  Utility ( "APOIO" )  -- 
            -------------------------------
            [GetHashKey('airtug')] = {            modelname = 'airtug',            name = 'Airtug',          price = 99999999,      trunk = 100,     gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('caddy')] = {             modelname = 'caddy',             name = 'Caddy',           price = 99999999,      trunk = 100,     gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('caddy2')] = {            modelname = 'caddy2',            name = 'Caddy2',          price = 99999999,      trunk = 100,     gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('caddy3')] = {            modelname = 'Caddy3',            name = 'Caddy3',          price = 99999999,      trunk = 100,     gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('docktug')] = {           modelname = 'docktug',           name = 'Docktug',         price = 99999999,      trunk = 100,     gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('forklift')] = {          modelname = 'forklift',          name = 'Forklift',        price = 99999999,      trunk = 100,     gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('mower')] = {             modelname = 'mower',             name = 'Mower',           price = 99999999,      trunk = 100,     gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('ripley')] = {            modelname = 'ripley',            name = 'Ripley',          price = 99999999,      trunk = 100,     gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('sadler')] = {            modelname = 'sadler',            name = 'Sadler',          price = 99999999,      trunk = 100,     gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('sadler2')] = {           modelname = 'sadler2',           name = 'Sadler2',         price = 99999999,      trunk = 100,     gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('scrap')] = {             modelname = 'scrap',             name = 'Scrap',           price = 99999999,      trunk = 100,     gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('towtruck')] = {          modelname = 'towtruck',          name = 'Towtruck',        price = 99999999,      trunk = 100,     gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('towtruck2')] = {         modelname = 'towtruck2',         name = 'Towtruck2',       price = 99999999,      trunk = 100,     gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tractor')] = {           modelname = 'tractor',           name = 'Tractor',         price = 99999999,      trunk = 100,     gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tractor2')] = {          modelname = 'tractor2',          name = 'Tractor2',        price = 99999999,      trunk = 100,     gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('tractor3')] = {          modelname = 'tractor3',          name = 'Tractor3',        price = 99999999,      trunk = 100,     gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('utillitruck')] = {       modelname = 'utillitruck',       name = 'Utillitruck',     price = 99999999,      trunk = 100,     gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('utillitruck2')] = {      modelname = 'utillitruck2',      name = 'Utillitruck2',    price = 99999999,      trunk = 100,     gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('utillitruck3')] = {      modelname = 'utillitruck3',      name = 'Utillitruck3',    price = 99999999,      trunk = 100,     gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('slamtruck')] = {         modelname = 'slamtruck',         name = 'Slamtruck',       price = 99999999,      trunk = 100,     gloveCompartment = 0,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },

            -----------------------
            --  Vans ( "Vans" )  -- 
            -----------------------
            [GetHashKey('bison')] = {             modelname = 'bison',             name = 'Bison',           price = 300000,        trunk = 110,     gloveCompartment = 9,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('bison2')] = {            modelname = 'bison2',            name = 'Bison2',          price = 300000,        trunk = 110,     gloveCompartment = 9,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('bison3')] = {            modelname = 'bison3',            name = 'Bison3',          price = 300000,        trunk = 110,     gloveCompartment = 9,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('bobcatxl')] = {          modelname = 'bobcatxl',          name = 'Bobcatxl',        price = 300000,        trunk = 110,     gloveCompartment = 9,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('boxville')] = {          modelname = 'boxville',          name = 'Boxville',        price = 450000,        trunk = 120,     gloveCompartment = 10,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('boxville2')] = {         modelname = 'boxville2',         name = 'Boxville2',       price = 450000,        trunk = 120,     gloveCompartment = 10,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('boxville3')] = {         modelname = 'boxville3',         name = 'Boxville3',       price = 450000,        trunk = 120,     gloveCompartment = 10,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('boxville4')] = {         modelname = 'boxville4',         name = 'Boxville4',       price = 450000,        trunk = 120,     gloveCompartment = 10,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('boxville5')] = {         modelname = 'boxville5',         name = 'Boxville5',       price = 999999999,     trunk = 120,     gloveCompartment = 10,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('burrito')] = {           modelname = 'burrito',           name = 'Burrito',         price = 450000,        trunk = 120,     gloveCompartment = 10,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('burrito2')] = {          modelname = 'burrito2',          name = 'Burrito2',        price = 450000,        trunk = 120,     gloveCompartment = 10,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('burrito3')] = {          modelname = 'burrito3',          name = 'Burrito3',        price = 450000,        trunk = 120,     gloveCompartment = 10,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('burrito4')] = {          modelname = 'burrito4',          name = 'Burrito4',        price = 450000,        trunk = 120,     gloveCompartment = 10,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('burrito5')] = {          modelname = 'burrito5',          name = 'Burrito5',        price = 450000,        trunk = 120,     gloveCompartment = 10,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('camper')] = {            modelname = 'camper',            name = 'Camper',          price = 500000,        trunk = 150,     gloveCompartment = 10,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('gburrito')] = {          modelname = 'gburrito',          name = 'Gburrito',        price = 450000,        trunk = 120,     gloveCompartment = 10,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('gburrito2')] = {         modelname = 'gburrito2',         name = 'Gburrito2',       price = 450000,        trunk = 120,     gloveCompartment = 10,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('journey')] = {           modelname = 'journey',           name = 'Journey',         price = 500000,        trunk = 150,     gloveCompartment = 10,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('minivan')] = {           modelname = 'minivan',           name = 'Minivan',         price = 180000,        trunk = 55,      gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('minivan2')] = {          modelname = 'minivan2',          name = 'Minivan2',        price = 180000,        trunk = 55,      gloveCompartment = 7,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('paradise')] = {          modelname = 'paradise',          name = 'Paradise',        price = 450000,        trunk = 120,     gloveCompartment = 10,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('pony')] = {              modelname = 'pony',              name = 'Pony',            price = 450000,        trunk = 120,     gloveCompartment = 10,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('pony2')] = {             modelname = 'pony2',             name = 'Pony2',           price = 4000000,       trunk = 120,     gloveCompartment = 10,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('rumpo')] = {             modelname = 'rumpo',             name = 'Rumpo',           price = 450000,        trunk = 120,     gloveCompartment = 10,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('rumpo2')] = {            modelname = 'rumpo2',            name = 'Rumpo2',          price = 450000,        trunk = 120,     gloveCompartment = 10,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('rumpo3')] = {            modelname = 'rumpo3',            name = 'Rumpo3',          price = 550000,        trunk = 120,     gloveCompartment = 10,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('speedo')] = {            modelname = 'speedo',            name = 'Speedo',          price = 450000,        trunk = 120,     gloveCompartment = 10,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('speedo2')] = {           modelname = 'speedo2',           name = 'Speedo2',         price = 4000000,       trunk = 120,     gloveCompartment = 10,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('speedo4')] = {           modelname = 'speedo4',           name = 'Speedo4',         price = 450000,        trunk = 120,     gloveCompartment = 10,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('surfer')] = {            modelname = 'surfer',            name = 'Surfer',          price = 390000,        trunk = 100,     gloveCompartment = 8,       type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('surfer2')] = {           modelname = 'surfer2',           name = 'Surfer2',         price = 390000,        trunk = 100,     gloveCompartment = 10,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('taco')] = {              modelname = 'taco',              name = 'Taco',            price = 520000,        trunk = 120,     gloveCompartment = 10,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('youga')] = {             modelname = 'youga',             name = 'Youga',           price = 390000,        trunk = 120,     gloveCompartment = 10,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('youga2')] = {            modelname = 'youga2',            name = 'Youga2',          price = 390000,        trunk = 120,     gloveCompartment = 10,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
            [GetHashKey('youga3')] = {            modelname = 'youga3',            name = 'Youga3',          price = 600000,        trunk = 120,     gloveCompartment = 10,      type = 'car',             banned = false, vip = false, fuelUsage = 5.0 },
        }
    },

    -- ['taxTime'] = 15, -- Intervalo de dias que vai ser cobrado ipva do veículo
    -- ['taxPrice'] = 0.01, -- Porcentagem do preço total do veículo que é cobrado de ipva

    ['configGaragem'] = {
      type = 'garagem', -- não alterar
      input = 'garagem', -- não alterar
      -- Input configuration
      marker = { -- set custom marker if the type is marker
        id = 8, -- marker id = https://docs.fivem.net/docs/game-references/markers/
        color = {255, 255, 255, 255}, -- marker color (R,G,B,A)
        scale = vec3(0.6, 0.6, 0.6),
        rotacao = vec3(90.0, 0.0, 0.0), -- marker Rotation (x,y,z)
        bobUpAndDown = false, -- marker bopUpAndDown
        faceCamera = true, -- marker faceCamera
        rotation = false, -- marker rotation
        custom = { -- Custom Marker
          active = true,
          dict = 'nfw_marker',
          name = 'garagem'
        }
      },
      actionKey = 38,
      -- Map Configuration
      blip = {
        name = 'Garagem', -- Name to display on the map!
        blipId = 357, -- blip id = https://docs.fivem.net/docs/game-references/blips/
        blipColor = 0, -- color id
        blipScale = 0.5 -- scale for blip
      },

      -- General Settings
      perm = false, -- permissao para acessar o blip               
      garagemConfig = {
        payment = {
            type = 2, -- ( 1 multiplier for vehicle price | 2 static value | 3 function value )
            value = 100,
            paymentType = 1
        },
        deleteVehicleDistance = 30.0, -- Distância máxima para poder deletar o veículo
        garagemType = 'public', -- tipo de gargem (public, home, work)
        garagemMenu = {
          car = true, -- veículos terrestres
          helicoptero = true, -- veículos aéreos
          barco = true -- veículos áquaticos
        },

        spawnInsideVehicle = true,
        closeUIAfterVehicleSpawn = true,
        allowPlayerSelectVehicleSpawnLocation = false,

        allowVehicleSelling = true,
        allowDeletingClosestVehicle = true,

        garageId = 'g-public',

        vehicles = {} -- caso for work, definir os veiculos aqui
      }
    },

    ['configGaragemHomes'] = {
      type = 'garagem', -- não alterar
      input = 'garagem', -- não alterar
      -- Input configuration
      marker = { -- set custom marker if the type is marker
        id = 8, -- marker id = https://docs.fivem.net/docs/game-references/markers/
        color = {255, 255, 255, 255}, -- marker color (R,G,B,A)
        scale = vec3(0.6, 0.6, 0.6),
        rotacao = vec3(90.0, 0.0, 0.0), -- marker Rotation (x,y,z)
        bobUpAndDown = false, -- marker bopUpAndDown
        faceCamera = true, -- marker faceCamera
        rotation = false, -- marker rotation
        custom = { -- Custom Marker
          active = true,
          dict = 'nfw_marker',
          name = 'garagem'
        }
      },
      actionKey = 38,
      -- Map Configuration
      blip = {
        name = 'Garagem', -- Name to display on the map!
        blipId = 357, -- blip id = https://docs.fivem.net/docs/game-references/blips/
        blipColor = 0, -- color id
        blipScale = 0.5 -- scale for blip
      },

      -- General Settings
      perm = false, -- permissao para acessar o blip               
      garagemConfig = {
        payment = {
            type = 2, -- ( 1 multiplier for vehicle price | 2 static value | 3 function value )
            value = 100,
            paymentType = 1
        },
        deleteVehicleDistance = 30.0, -- Distância máxima para poder deletar o veículo
        garagemType = 'home', -- tipo de gargem (public, home, work)
        garagemMenu = {
          car = true, -- veículos terrestres
          helicoptero = true, -- veículos aéreos
          barco = true -- veículos áquaticos
        },

        spawnInsideVehicle = true,
        closeUIAfterVehicleSpawn = true,
        allowPlayerSelectVehicleSpawnLocation = false,

        allowVehicleSelling = true,
        allowDeletingClosestVehicle = true,

        garageId = 'g-public',

        vehicles = {} -- caso for work, definir os veiculos aqui
      }
    },

    ['configGaragemPolice'] = {
      type = 'garagem', -- não alterar
      input = 'garagem', -- não alterar
      -- Input configuration
      marker = { -- set custom marker if the type is marker
        id = 8, -- marker id = https://docs.fivem.net/docs/game-references/markers/
        color = {255, 255, 255, 255}, -- marker color (R,G,B,A)
        scale = vec3(0.6, 0.6, 0.6),
        rotacao = vec3(90.0, 0.0, 0.0), -- marker Rotation (x,y,z)
        bobUpAndDown = false, -- marker bopUpAndDown
        faceCamera = true, -- marker faceCamera
        rotation = false, -- marker rotation
        custom = { -- Custom Marker
          active = true,
          dict = 'nfw_marker',
          name = 'garagem'
        }
      },
      actionKey = 38,
      -- Map Configuration
      blip = {
        name = 'Garagem', -- Name to display on the map!
        blipId = 357, -- blip id = https://docs.fivem.net/docs/game-references/blips/
        blipColor = 0, -- color id
        blipScale = 0.5 -- scale for blip
      },

      -- General Settings
      perm = "policia.permissao", -- permissao para acessar o blip               
      garagemConfig = {
        payment = false,
        paymentType = 1, -- 1 predefinido, 2 porcentagem
        paymentPrefix = 100, -- Caso Type = 1 define valor para retirar o veiculo
        paymentPorcent = 0.5, -- Caso Type = 2 define a % do caro para retirar o veiculo   

        garagemType = 'work', -- tipo de gargem (public, home, work)
        garagemMenu = {
          carro = true, -- veículos terrestres
          helicoptero = true, -- veículos aéreos
          barco = false -- veículos áquaticos
        },
        vehicles = {{
          vehicle = 'policeb',
          extras = {},
          livery = 0,
          perm = "soldado.permissao"
        }} -- caso for work, definir os veiculos aqui
      }
    },

    ['configGaragemLixeiro'] = {
      type = 'garagem', -- não alterar
      input = 'garagem', -- não alterar
      -- Input configuration
      marker = { -- set custom marker if the type is marker
        id = 8, -- marker id = https://docs.fivem.net/docs/game-references/markers/
        color = {255, 255, 255, 255}, -- marker color (R,G,B,A)
        scale = vec3(0.6, 0.6, 0.6),
        rotacao = vec3(90.0, 0.0, 0.0), -- marker Rotation (x,y,z)
        bobUpAndDown = false, -- marker bopUpAndDown
        faceCamera = true, -- marker faceCamera
        rotation = false, -- marker rotation
        custom = { -- Custom Marker
          active = true,
          dict = 'nfw_marker',
          name = 'garagem'
        }
      },
      actionKey = 38,
      -- Map Configuration
      blip = {
        name = 'Garagem', -- Name to display on the map!
        blipId = 357, -- blip id = https://docs.fivem.net/docs/game-references/blips/
        blipColor = 0, -- color id
        blipScale = 0.5 -- scale for blip
      },

      -- General Settings
      perm = "", -- permissao para acessar o blip               
      garagemConfig = {
        payment = false,
        paymentType = 1, -- 1 predefinido, 2 porcentagem
        paymentPrefix = 100, -- Caso Type = 1 define valor para retirar o veiculo
        paymentPorcent = 0.5, -- Caso Type = 2 define a % do caro para retirar o veiculo   

        garagemType = 'work', -- tipo de gargem (public, home, work)
        garagemMenu = {
          car = true,
        },
        vehicles = {{
          vehicle = 'trash2',
          extras = {},
          livery = 0
        }}, -- caso for work, definir os veiculos aqui
        garageId = 'g-work',
        allowDeletingClosestVehicle = true
      }
    },

    ['configGaragemOnibus'] = {
      type = 'garagem', -- não alterar
      input = 'garagem', -- não alterar
      -- Input configuration
      marker = { -- set custom marker if the type is marker
        id = 8, -- marker id = https://docs.fivem.net/docs/game-references/markers/
        color = {255, 255, 255, 255}, -- marker color (R,G,B,A)
        scale = vec3(0.6, 0.6, 0.6),
        rotacao = vec3(90.0, 0.0, 0.0), -- marker Rotation (x,y,z)
        bobUpAndDown = false, -- marker bopUpAndDown
        faceCamera = true, -- marker faceCamera
        rotation = false, -- marker rotation
        custom = { -- Custom Marker
          active = true,
          dict = 'nfw_marker',
          name = 'garagem'
        }
      },
      actionKey = 38,
      -- Map Configuration
      blip = {
        name = 'Garagem', -- Name to display on the map!
        blipId = 357, -- blip id = https://docs.fivem.net/docs/game-references/blips/
        blipColor = 0, -- color id
        blipScale = 0.5 -- scale for blip
      },

      -- General Settings
      perm = "", -- permissao para acessar o blip               
      garagemConfig = {
        payment = false,
        paymentType = 1, -- 1 predefinido, 2 porcentagem
        paymentPrefix = 100, -- Caso Type = 1 define valor para retirar o veiculo
        paymentPorcent = 0.5, -- Caso Type = 2 define a % do caro para retirar o veiculo   
        useDB = true,
        garagemType = 'work', -- tipo de gargem (public, home, work)
        garagemMenu = {
          UNKNOWN = true,
          car = true,
        },
        vehicles = {{
          vehicle = 'coach',
          extras = {},
          livery = 0,
          perm = '',
          upgrade = ''
        }, {
          vehicle = 'bus',
          extras = {},
          livery = 0
        }, {
            vehicle = 'zentorno',
            extras = {},
            livery = 0,
            mods = {
                [0] = 2,
                primaryColour = { r = 255, g = 255, b = 255}
            }
          }
        }, -- caso for work, definir os veiculos aqui
        garageId = 'g-work',
        allowDeletingClosestVehicle = true
    }
    }
  },

  locs = { -- Garagens Publicas
  {
    showBlip = true,
    coord = vector3(55.43, -876.19, 30.50),
    requestUpgrade = '',
    heading = 359.29,
    config = 'configGaragem',
    homeName = '',
    spawn = {vector4(50.53, -872.89, 30.44, 158.74), vector4(47.33, -871.32, 30.46, 153.07),
              vector4(44.12, -870.12, 30.46, 153.07)}
  }, {
    showBlip = true,
    coord = vector3(596.40, 90.65, 93.12),
    heading = 359.29,
    config = 'configGaragem',
    homeName = '',
    spawn = {vector4(599.38, 98.16, 92.06, 249.86), vector4(600.74, 101.16, 92.06, 249.86)}
  }, {
    showBlip = true,
    coord = vector3(-340.76, 265.97, 85.67),
    heading = 359.29,
    config = 'configGaragem',
    homeName = '',
    spawn = {vector4(-329.74, 274.20, 85.44, 93.80), vector4(-329.88, 277.63, 85.43, 93.80)}
  }, {
    showBlip = true,
    coord = vector3(-2030.01, -465.97, 11.60),
    heading = 359.29,
    config = 'configGaragem',
    homeName = '',
    spawn = {vector4(-2024.27, -471.93, 11.40, 140.0), vector4(-2021.90, -474.17, 11.40, 140.0)}
  }, {
    showBlip = true,
    coord = vector3(-1184.92, -1510.00, 4.64),
    heading = 359.29,
    config = 'configGaragem',
    homeName = '',
    spawn = {vector4(-1183.49, -1495.92, 4.37, 125.0), vector4(-1186.70, -1490.54, 4.37, 125.0)}
  }, {
    showBlip = true,
    coord = vector3(-73.44, -2004.99, 18.27),
    heading = 359.29,
    config = 'configGaragem',
    homeName = '',
    spawn = {vector4(-84.96, -2004.22, 18.01, 352.0)}
  }, {
    showBlip = true,
    coord = vector3(214.02, -808.44, 31.01),
    heading = 359.29,
    config = 'configGaragem',
    homeName = '',
    spawn = {vector4(222.11, -804.16, 29.83, 247.0), vector4(224.14, -799.27, 29.83, 247.0)}
  }, {
    showBlip = true,
    coord = vector3(-348.88, -874.02, 31.31),
    heading = 359.29,
    config = 'configGaragem',
    homeName = '',
    spawn = {vector4(-343.73, -875.45, 30.22, 168.42), vector4(-340.11, -877.03, 30.22, 168.42),
             vector4(-336.49, -877.69, 30.22, 168.42)}
  }, {
    showBlip = true,
    coord = vector3(67.74, 12.27, 69.21),
    heading = 359.29,
    config = 'configGaragem',
    homeName = '',
    spawn = {vector4(64.17, 17.22, 68.37, 339.38), vector4(61.17, 18.40, 68.42, 339.38)}
  }, {
    showBlip = true,
    coord = vector3(361.90, 297.81, 103.88),
    heading = 359.29,
    config = 'configGaragem',
    homeName = '',
    spawn = {vector4(361.08, 293.50, 102.65, 249.67), vector4(360.02, 289.80, 102.64, 249.67),
             vector4(358.35, 286.42, 102.62, 249.67)}
  }, {
    showBlip = true,
    coord = vector3(-773.34, 5598.15, 33.60),
    heading = 359.29,
    config = 'configGaragem',
    homeName = '',
    spawn = {vector4(-772.82, 5578.48, 32.64, 89.01), vector4(-773.07, 5575.31, 32.64, 89.01)}
  }, {
    showBlip = true,
    coord = vector3(275.17, -345.5, 45.18),
    heading = 359.29,
    config = 'configGaragem',
    homeName = '',
    spawn = {vector4(283.04, -342.29, 44.55, 249.40), vector4(284.19, -338.85, 44.55, 249.40)}
  }, {
    showBlip = true,
    coord = vector3(317.25, 2623.14, 44.46),
    heading = 359.29,
    config = 'configGaragem',
    homeName = '',
    spawn = {vector4(334.52, 2623.09, 44.49, 20.0)}
  }, {
    showBlip = true,
    coord = vector3(1156.90, -453.73, 66.98),
    heading = 359.29,
    config = 'configGaragem',
    homeName = '',
    spawn = {vector4(1155.20, -461.58, 65.97, 167.96), vector4(1151.76, -460.61, 65.96, 167.96)}
  }, {
    showBlip = true,
    coord = vector3(-102.21, 6345.18, 31.57),
    heading = 359.29,
    config = 'configGaragem',
    homeName = '',
    spawn = {vector4(-98.29, 6341.76, 30.64, 224.27), vector4(-95.52, 6344.59, 30.64, 224.27),
             vector4(-92.98, 6347.16, 30.64, 224.27), vector4(-85.39, 6338.94, 30.64, 44.80)}
  }, -- Garagens de Empregos
  {
    showBlip = false,
    coord = vector3(-340.83547973633, -1567.5225830078, 25.228786468506),
    heading = 359.29,
    config = 'configGaragemLixeiro',
    homeName = '',
    spawn = {vector4(-345.04, -1561.55, 25.23, 94.55)}
  }, {
    showBlip = false,
    coord = vector3(453.89, -600.57, 28.68),
    heading = 359.29,
    config = 'configGaragemOnibus',
    homeName = '',
    spawn = {vector4(462.51, -605.27, 29.32, 214.04), vector4(461.44, -611.34, 29.33, 214.04)}
  },
  -- Garagens de Polícia
  {
    showBlip = false,
    coord = vector3(457.18, -1009.31, 28.53),
    heading = 359.29,
    config = 'configGaragemPolice',
    homeName = '',
    spawn = {vector4(445.76, -1024.88, 28.22, 7.21)}
  }, 

   -- Garagens Homes
   {
    showBlip = false,
    coord = vector3(36.59, -876.3, 30.34),
    heading = 359.29,
    config = 'configGaragemHomes',
    homeName = 1,
    spawn = {vector4(31.49, -866.78, 30.48, 342.99)}
  }, 

  

  },

  commands = {
      {showBlip = true, coord = vector3(-75.770088195801,-818.69323730469,326.17532348633), distance = 100000000, command = "openGarages", config = 'configGaragem'},
  }
})
