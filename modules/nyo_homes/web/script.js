  
    
const nyo_homes = new Module('nyo_homes');


nyo_homes.registerOpenUiFunction((data) => {   
    var containerHTML = ''; 
    var hSit = 'LIVRE';
    var hMaxHab = data.initHome.maxHab;
    var hVault = data.initHome.vault;
    var hTaxPrice = data.initHome.taxPrice * 100;
    var hTaxTime = data.initHome.taxTime;
    var hPrice = data.initHome.price;
    var hPerm = data.initHome.perm;
    var hOwner = data.initHome.owner;
    var hInHome = data.initHome.inHome;
    
    if(hOwner != undefined){        
        hSit = 'OCUPADO';
    }

    if(data.homeData == undefined){
       
    }
    
    containerHTML = `
    <div class="row">
        <div class="col-md-12">
            <center>CASA</center>
        </div>
    </div>

    <div class="row">
        <div class="col-md-3 type1_margin">
            <div class="box-style p-1 new">
                <div class="d-flex hw1 style__N1">
                    <div class="box__in1">
                        <p class="mb-1">Situação</p>
                        <h1>${hSit}</h1>
                    </div>

                    <figure>
                        <i class="fa-solid fa-store"></i>
                    </figure>
                </div>
                <div class="card-arrow">
                    <div class="card-arrow-top-left"></div>
                    <div class="card-arrow-top-right"></div>
                    <div class="card-arrow-bottom-left"></div>
                    <div class="card-arrow-bottom-right"></div>
                </div>
            </div>
        </div>
        <div class="col-md-3 type1_margin">
            <div class="box-style p-1 new">
                 <div class="d-flex hw1 style__N1">
                    <div class="box__in1">
                        <p class="mb-1">Max habitantes</p>
                        <h1>${hMaxHab}</h1>
                    </div>

                    <figure>
                        <i class="fa-solid fa-store"></i>
                    </figure>
                </div>
                <div class="card-arrow">
                    <div class="card-arrow-top-left"></div>
                    <div class="card-arrow-top-right"></div>
                    <div class="card-arrow-bottom-left"></div>
                    <div class="card-arrow-bottom-right"></div>
                </div>
            </div>
        </div>

        <div class="col-md-3 type1_margin">
            <div class="box-style p-1 new">
                 <div class="d-flex hw1 style__N1">
                    <div class="box__in1">
                        <p class="mb-1">Bau</p>
                        <h1>${hVault} Kg</h1>
                    </div>

                    <figure>
                        <i class="fa-solid fa-store"></i>
                    </figure>
                </div>
                <div class="card-arrow">
                    <div class="card-arrow-top-left"></div>
                    <div class="card-arrow-top-right"></div>
                    <div class="card-arrow-bottom-left"></div>
                    <div class="card-arrow-bottom-right"></div>
                </div>
            </div>
        </div>

        
        <div class="col-md-3 type1_margin">
            <div class="box-style p-1 new">
                 <div class="d-flex hw1 style__N1">
                    <div class="box__in1">
                        <p class="mb-1">IPTU</p>
                        <h1>${hTaxPrice}% (${hTaxTime} dias)</h1>
                    </div>

                    <figure>
                        <i class="fa-solid fa-store"></i>
                    </figure>
                </div>
                <div class="card-arrow">
                    <div class="card-arrow-top-left"></div>
                    <div class="card-arrow-top-right"></div>
                    <div class="card-arrow-bottom-left"></div>
                    <div class="card-arrow-bottom-right"></div>
                </div>
            </div>
        </div>
    </div>`;
  
    if(hOwner != undefined){        
        hSit = 'OCUPADO';
        if(hInHome == true){
            containerHTML += `  
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <div class="box-style style4 p-1 new">
                        <div class="row">
                            <div class="col-md-12">
                                <button class="btn btn-block btn-success position-relative" onClick="exitHome()">SAIR</button>
                            </div>
                        </div>
                        <div class="card-arrow">
                            <div class="card-arrow-top-left"></div>
                            <div class="card-arrow-top-right"></div>
                            <div class="card-arrow-bottom-left"></div>
                            <div class="card-arrow-bottom-right"></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4"></div>
            </div>`;
        }else{
            containerHTML += `  
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <div class="box-style style4 p-1 new">
                        <div class="row">
                            <div class="col-md-12">
                                <button class="btn btn-block btn-success position-relative" onClick="enterHome()">ENTRAR</button>
                            </div>
                        </div>
                        <div class="card-arrow">
                            <div class="card-arrow-top-left"></div>
                            <div class="card-arrow-top-right"></div>
                            <div class="card-arrow-bottom-left"></div>
                            <div class="card-arrow-bottom-right"></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4"></div>
            </div>`;
        }
       
    }else{
        containerHTML += `  
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <div class="box-style style4 p-1 new">
                    <div class="row">
                        <div class="col-md-12">
                            PREÇO<br><br>
                                <h1>R$ ${hPrice}</h1>
                            <br>
                            <button class="btn btn-block btn-success position-relative" onClick="buyHome()">COMPRAR</button>
                        </div>
                    </div>
                    <div class="card-arrow">
                        <div class="card-arrow-top-left"></div>
                        <div class="card-arrow-top-right"></div>
                        <div class="card-arrow-bottom-left"></div>
                        <div class="card-arrow-bottom-right"></div>
                    </div>
                </div>
            </div>
            <div class="col-md-4"></div>
        </div>`;
    }

    $(".containerHomesHome").html(containerHTML);
})

nyo_homes.registerCloseUiFunction(data => {
    FetchData('close', {})
})

function buyHome(){
    FetchData('nfw:buyHome', {})
}

function enterHome(){
    FetchData('nfw:enterHome', {})
}

function exitHome(){
    FetchData('nfw:exitHome', {})
}
