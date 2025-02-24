const imgGarage = 'http://127.0.0.1/nfw/vehicles/'

function NyoGarages() {

    const module = new Module('nyo_garages')
    
    let vehicleList = {}

    var garage = {
        allNuiGaragem: $("#actionMenuGaragem"),
        mainGaragem: $(".mainGaragem"),
    
        vehicles: undefined,
        type: undefined,
        openedVehicle: undefined,
    
        categoryIcons: {},
        
        changeScreen: (screen,self) => {
            $(".step").removeClass("active");
            self.classList.add('active')
    
            $(".category").hide();
            $("." + screen).show();
        },
    
        changeCategory: (self) => {
            let category = self.getAttribute("category");
            $(".category-item").removeClass("active");
            self.classList.add("active");
            $(".vehicle-item").hide(0);
            $("." + category).show(0);
        },
    
        open: async (data) => {
            let vehicleList = $("#vehicle-list");
            let categoryList = $("#category-list");
            let vehiclesHtml = "";
            let categoriesHtml = "";
    
            garage.vehicles = data.vehicles;
            garage.type = data.garageType;
            garage.nuiType = data.type
    
            $(".vehicle-item").hide(0);
            garage.mainGaragem.fadeOut(1);
            
    
            for ([k, v] of Object.entries(data.vehicles)) {
                vehiclesHtml += `
                <div class="item vehicle-item ${v.category}" vehicle="${
                    v.vehicle
                }" onclick="garage.openCar(this)" >
                    <img src="${imgGarage}/${v.vehicle}.png">
                    <div class="item-info">
                        <span>${v.vehicleName}</span>
                        <br>
                        <small id="taxlate-${v.vehicle}">${
                    v.taxLate ? module.lang.taxLate : module.lang.vehicleOk
                }</small>
                    </div>
                </div>
                `;
            }
    
            for ([k, v] of Object.entries(data.categoryTypes)) {
                categoriesHtml += `
                    <div class="item category-item ${
                        k == 0 ? "active" : ""
                    } " category="${v}" onclick="garage.changeCategory(this)" ><img src="${imgGarage}/category/${v}.png"></div>
                `;
            }
    
            vehicleList.html(vehiclesHtml);
            categoryList.html(categoriesHtml);
    
            $("." + data.categoryTypes[0]).show(0);
    
            garage.allNuiGaragem.fadeIn(1);
        },
    
        generateBars: (amountActive, amount) => {
            let text = "";
            for (let i = 1; i <= (amount || 12); i++) {
                text += `
                    <div class="shape ${i <= amountActive ? "active" : ""}"></div>
                `;
            }
            return text;
        },
    
        openCar: async (self, veh) => {
            let vehicle = self ? self.getAttribute("vehicle") : veh;
            let vehCfg = garage.vehicles[vehicle];
    
    
            garage.openedVehicle = vehicle;
            
            try {
                vehCfg.custom = JSON.parse(vehCfg.custom)
            } catch(err) {
                vehCfg.custom = {}
            }
    
            let mainGarageHtml = `
                <header>
                    <h1>${vehCfg.vehicleName}</h1>
                    <small>${module.lang.vehicleCategory} ${vehCfg.class}</small>
                    <img id="img-stars" src="../modules/nyo_garages/web/assets/stars.png">
                    <img id="img-car" src="${imgGarage}/${vehCfg.vehicle}.png" onerror="this.src='https://cdn.discordapp.com/attachments/746851286422519928/997303294332522526/no_car.png';">
                </header>
                <section>
                    <h1>estatisticas</h1>
                    <small>do veiculo</small>
                    <div class="infos-content category">
                    <div class="column">
                        <div class="rowGR">
                        <span>${module.lang.maxSpeed}</span>
                        <small>${vehCfg.maxSpeed} km/h</small>
                        <div class="bar">
                            ${garage.generateBars((12 * vehCfg.maxSpeed) / 250)}
                        </div>
                        </div>
                        <div class="rowGR">
                        <span>${module.lang.engineHealth}</span>
                        <small>${vehCfg.engine / 10}%</small>
                        <div class="bar">
                            ${garage.generateBars((12 * vehCfg.engine) / 1000)}
                        </div>
                        </div>
                        <div class="rowGR">
                        <span>${module.lang.maxBraking}</span>
                        <small>${vehCfg.maxBraking.toFixed(2)}</small>
                        <div class="bar">
                            ${garage.generateBars((12 * vehCfg.maxBraking) / 1.5)}
                        </div>
                        </div>
                        <div class="rowGR">
                        <span>${module.lang.bodyHealth}</span>
                        <small>${vehCfg.body / 10}%</small>
                        <div class="bar">
                            ${garage.generateBars((12 * vehCfg.body) / 1000)}
                        </div>
                        </div>
                        <div class="rowGR">
                        <span>${module.lang.maxTraction}</span>
                        <small>${vehCfg.maxTraction.toFixed(2)}</small>
                        <div class="bar">
                            ${garage.generateBars((12 * vehCfg.maxTraction) / 3)}
                        </div>
                        </div>  
                        <div class="rowGR">
                        <span>${module.lang.fuelLevel}</span>
                        <small>${vehCfg.fuel}%</small>
                        <div class="bar">
                            ${garage.generateBars((12 * vehCfg.fuel) / 100)}
                        </div>
                        </div>
                    </div>
                    <div class="column">
                        <div class="info-column">
                        <small>Status</small>
                        <span>${
                        vehCfg.allowed == false ? module.lang.isNotAllowedToSpawnCar
                                : vehCfg.taxLate
                                ? module.lang.taxLate
                                : vehCfg.exploded
                                ? module.lang.vehicleExploded
                                : vehCfg.impound
                                ? module.lang.vehicleImpounded
                                : module.lang.vehicleOk
                        }</span>
                        </div>
                        <div class="info-column">
                        <small>${module.lang.garageType}</small>
                        <span>${garage.type}</span>
                        </div>
                        <div class="info-column">
                        <small>${
                            vehCfg.taxLate
                                ? module.lang.taxLate2
                                : vehCfg.exploded || vehCfg.impound
                                ? module.lang.insurance
                                : vehCfg.garageTax
                                ? module.lang.garageTax
                                : module.lang.taxLate2
                        }</small>
                        <span>${
                            vehCfg.taxLate || vehCfg.exploded || vehCfg.impound
                                ? "$" + vehCfg.taxPrice
                                : vehCfg.garageTax
                                ? "$" + vehCfg.garageTax
                                : module.lang.noTax
                        }</span>
                        </div>
                    </div>
                    </div>
    
                    <div class="infos-content2 category" style="display: none;">
                    <div class="column">
                        <div class="rowGR">
                        <span>Motor</span>
                        <small>${(vehCfg.custom ? parseInt(vehCfg.custom["11"])|| -1 : -1 )+ 1} / 4</small>
                        <div class="bar">
                            ${garage.generateBars((vehCfg.custom ? parseInt(vehCfg.custom["11"])|| -1 : -1) + 1,4)}
                        </div>
                        </div>
                        <div class="rowGR">
                        <span>Freio</span>
                        <small>${(vehCfg.custom ? parseInt(vehCfg.custom["12"])|| -1 : -1 )+ 1} / 3</small>
                        <div class="bar">
                            ${garage.generateBars((vehCfg.custom ? parseInt(vehCfg.custom["12"])|| -1 : -1) + 1,3)}
                        </div>
                        </div>
                        <div class="rowGR">
                        <span>Transmissão</span>
                        <small>${(vehCfg.custom ? parseInt(vehCfg.custom["13"])|| -1 : -1 )+ 1} / 3</small>
                        <div class="bar">
                            ${garage.generateBars((vehCfg.custom ? parseInt(vehCfg.custom["13"])|| -1 : -1) + 1,3)}
                        </div>
                        </div>
                        <div class="rowGR">
                        <span>Suspensão</span>
                        <small>${(vehCfg.custom ? parseInt(vehCfg.custom["15"])|| -1 : -1 )+ 1} / 4</small>
                        <div class="bar">
                            ${garage.generateBars((vehCfg.custom ? parseInt(vehCfg.custom["15"])|| -1 : -1) + 1,3)}
                        </div>
                        </div>
                        <div class="rowGR">
                        <span>Blindagem</span>
                        <small>${(vehCfg.custom ? parseInt(vehCfg.custom["16"])|| -1 : -1 )+ 1} / 5</small>
                        <div class="bar">
                            ${garage.generateBars((vehCfg.custom ? parseInt(vehCfg.custom["16"])|| -1 : -1) + 1,3)}
                        </div>
                        </div>  
                    </div>
                    <div class="column">
                        <div class="info-column">
                        <small>Status</small>
                        <span>${
                            vehCfg.taxLate
                                ? "Taxas atrasadas"
                                : vehCfg.exploded
                                ? "Veículo Explodido"
                                : vehCfg.impound
                                ? "Veículo detido"
                                : "Liberado"
                        }</span>
                        </div>
                        <div class="info-column">
                        <small>Tipo</small>
                        <span>${garage.type}</span>
                        </div>
                        <div class="info-column">
                        <small>${
                            vehCfg.taxLate
                                ? "Taxa"
                                : vehCfg.exploded || vehCfg.impound
                                ? "Seguro"
                                : vehCfg.garageTax
                                ? "Taxa de retirada"
                                : "Taxa"
                        }</small>
                        <span>${
                            vehCfg.taxLate || vehCfg.exploded || vehCfg.impound
                                ? "$" + vehCfg.taxPrice
                                : vehCfg.garageTax
                                ? "$" + vehCfg.garageTax
                                : "Sem taxas"
                        }</span>
                        </div>
                    </div>
                    </div>
                    
                </section>
                <footer class="footerGaragem">
                    <div class="steps">
                        <small>Paginas</small>
                        <div class="step-content">
                            <div class="step active" onclick="garage.changeScreen('infos-content',this)"></div>
                            <div class="step" onclick="garage.changeScreen('infos-content2',this)"></div>
                        </div>
                    </div>
                    <div class="btns">
                        ${
                            garage.nuiType == 'sellNUI'
                                ?
                                    '<input type="number" placeholder="' + module.lang.typeSellPrice + '" id="garages-vehicle-value"></input> <button onclick="garage.sellVehicle()">'+module.lang.sellVehicle+'</button>'
                                :
                                    `${
                                        // `<button style="background: #d8a80a;" onclick="garage.storeNearestVehicle()">Guardar Próximo</button>` 
                                        ""
                                    }
                                    ${
                                        vehCfg.allowed != false && vehCfg.taxLate
                                            ? `<button style="background: #FF2D2D;" onclick="garage.payTax()">${module.lang.payTax}</button>`
                                            : ""
                                    }
                                    ${
                                        vehCfg.allowed != false && vehCfg.exploded
                                            ? `<button style="background: #FF2D2D;" onclick="garage.payInsurance()">${module.lang.payInsurance}</button>`
                                            : ""
                                    }
                                    ${
                                        vehCfg.allowed != false && vehCfg.impound
                                            ? `<button style="background: #FF2D2D;" onclick="garage.removeFromDetention()">${module.lang.payInsurance}</button>`
                                            : ""
                                    }
                                    ${
                                        vehCfg.allowed != false && !vehCfg.taxLate && !vehCfg.exploded && !vehCfg.impound
                                            ? vehCfg.spawned
                                                ? `
                                                <button style="background: #FF2D2D;" onclick="garage.storeVehicle()">${module.lang.storeVehicle}</button>`
                                                : `<button  onclick="garage.spawnVehicle()">${module.lang.spawnVehicle}</button>`
                                            : ""
                                    }`
                        }
    
                    </div>
                </footer>
            `;
    
            if (self) {
                $(".vehicle-item").removeClass("active");
                self.classList.add("active");
            }
    
            garage.mainGaragem.html(mainGarageHtml);
            garage.mainGaragem.fadeIn(1);
        },
    
        payTax: () => {
            let vehicle = garage.openedVehicle;
            FetchData("garage_pay_tax", { vehicle },
                ({ success }) => {
                    if (success) {
                        garage.vehicles[vehicle].taxLate = false;
                        garage.openCar(null, vehicle);
                        $("#taxlate-" + vehicle).html(`Liberado`);
                    }
                }
            );
        },
    
        payInsurance: () => {
            let vehicle = garage.openedVehicle;
            FetchData("garage_pay_insurance", { vehicle },
                ({ success }) => {
                    if (success) {
                        garage.vehicles[vehicle].engine = 1000;
                        garage.vehicles[vehicle].body = 1000;
                        garage.vehicles[vehicle].fuel = 100;
                        garage.vehicles[vehicle].exploded = false;
                        garage.openCar(null, vehicle);
                    }
                }
            );
        },
    
        removeFromDetention: () => {
            let vehicle = garage.openedVehicle;
            FetchData("garage_remove_detention", { vehicle },
                ({ success }) => {
                    if (success) {
                        garage.vehicles[vehicle].impound = false;
                        garage.openCar(null, vehicle);
                    }
                }
            );
        },
    
        storeVehicle: () => {
            if (garage.disableButton) return;
            else garage.disableButton = true
            let vehicle = garage.openedVehicle;
            FetchData("store_vehicle", { vehicle },
                ({ success, engine, body, fuel, exploded }) => {
                    if (success) {
                        garage.vehicles[vehicle].engine = engine;
                        garage.vehicles[vehicle].body = body;
                        garage.vehicles[vehicle].fuel = fuel;
                        garage.vehicles[vehicle].exploded = exploded;
                        garage.vehicles[vehicle].spawned = false;
                        garage.openCar(null, vehicle);
                    }
                    setTimeout(() => {
                        garage.disableButton = false
                    }, 1000)
                }
            );
        },
    
        spawnVehicle: () => {
            if (garage.disableButton) return;
            else garage.disableButton = true
            let vehicle = garage.openedVehicle;
            module.disableKeyPress('Escape')
            FetchData("spawn_vehicle", { vehicle },
                ({ success }) => {
                    module.enableKeyPress('Escape')
                    if (success) {
                        garage.vehicles[vehicle].spawned = true;
                        garage.openCar(null, vehicle);
                    }
                    setTimeout(() => {
                        garage.disableButton = false
                    }, 1000)
                }
            );
        },
    
        storeNearestVehicle: () => {
            let vehicle = garage.openedVehicle;
            FetchData("store_nearest_vehicle", { vehicle });
        },
    
        close: () => {
            garage.allNuiGaragem.fadeOut(1);
        },
    
        sellVehicle: () => {
            let vehicle = garage.openedVehicle;
            let price = parseInt(document.getElementById('garages-vehicle-value').value)
            if (!price || price == 0) return
            FetchData('sell_vehicle', { vehicle, price })
        },
    };

    function GenerateBars(amountActive, amount) {
        let text = "";
        for (let i = 1; i <= (amount || 12); i++) {
            text += `
                <div class="shape ${i <= amountActive ? "active" : ""}"></div>
            `;
        }
        return text;
    }

    module.registerOpenUiFunction((data) => {
        const VehicleListHTMLElement = document.getElementById('vehicle-list')
        const CategoriesListHTMLElement = document.getElementById('category-list')
        const MainGarageHTMLElement = document.querySelector('.mainGaragem')

        MainGarageHTMLElement.style.display = 'none'

        let VehicleListInnerHTML = ''
        let CategoriesListInnerHTML = ''

        for ([k, v] of Object.entries(data.vehicles)) {
            if (v.info.category == data.categories[0])
            VehicleListInnerHTML += `
                <div class="item vehicle-item" vehicle="${k}">
                    <img src="${imgGarage}/${v.info.model}.png" onerror="this.src='https://cdn.discordapp.com/attachments/746851286422519928/997303294332522526/no_car.png';">
                    <div class="item-info">
                        <span>${v.info.name}</span>
                        <br>
                        <small>${v[3]}</small>
                    </div>
                </div>
            `;
        }

        for ([k, v] of Object.entries(data.categories)) {
            CategoriesListInnerHTML += `<div class="item category-item ${k == 0 ? "active" : ""} " category="${v}"><img src="../modules/nyo_garages/web/assets/${v}.png"></div>`;
        }

        VehicleListHTMLElement.innerHTML = VehicleListInnerHTML
        CategoriesListHTMLElement.innerHTML = CategoriesListInnerHTML

        async function SetVehiclePage(vehIndex, vehElement) {
            const vehicle = data.vehicles[vehIndex]
            if (vehicle) {
                MainGarageHTMLElement.style.display = 'block'
                MainGarageHTMLElement.innerHTML = `
                <header>
                    <h1>${vehicle.info.name}</h1>
                    <small>PLACA: ${vehicle[3]}</small>
                    <img id="img-stars" src="../modules/nyo_garages/web/assets/stars.png">
                    <img id="img-car" src="${imgGarage}/${vehicle.info.model}.png" onerror="this.src='https://cdn.discordapp.com/attachments/746851286422519928/997303294332522526/no_car.png';">
                </header>
                <section>
                    <img src="https://icon-library.com/images/waiting-icon-gif/waiting-icon-gif-1.jpg" class="garages-loading-icon"/>
                </section>
                `

                
                if (!vehicle.info.body) vehicle.info = { ... await module.fetch('getVehicleInfo', { id: vehicle[1], vehIndex: parseInt(vehIndex) + 1 }), ...vehicle.info }

                let status = [
                    vehicle.info.allowed ? 
                        vehicle.info.taxLate ? 'ui-status-taxLate' :
                        vehicle.info.exploded ? 'ui-status-vehicleExploded' :
                        vehicle.info.impounded ? 'ui-status-vehicleImpounded' :
                        vehicle.info.scrapped ? 'ui-status-vehicleScrapped' :
                        'ui-status-vehicleStatusOk'
                    : 'ui-status-notAllowedToSpawnVehicle',
                    
                    vehicle.info.taxLate ? 'Atrasado' : vehicle.info.nextTax + ' dias',

                    vehicle.info.taxLate ? vehicle.info.taxPrice :
                    vehicle.info.exploded ? vehicle.info.explodedVehicleInsuranceTax :
                    vehicle.info.impounded ? vehicle.info.detentionTax :
                    vehicle.info.scrapped ? vehicle.info.scrappedVehicleInsuranceTax :
                    vehicle.info.garageTax ? vehicle.info.garageTax : 
                        false,
                    
                    vehicle.info.taxLate ? 'Taxas' :
                    vehicle.info.exploded ? 'Seguro' :
                    vehicle.info.impounded ? 'Taxa de detenção' :
                    vehicle.info.scrapped ? 'Seguro' :
                    vehicle.info.garageTax ? 'Taxa de serviço' :
                        'Taxas',
                ]

                MainGarageHTMLElement.innerHTML = `
                <header>
                    <h1>${vehicle.info.name}</h1>
                    <small>PLACA: ${vehicle[3]}</small>
                    <img id="img-stars" src="../modules/nyo_garages/web/assets/stars.png">
                    <img id="img-car" src="${imgGarage}/${vehicle.info.model}.png" onerror="this.src='https://cdn.discordapp.com/attachments/746851286422519928/997303294332522526/no_car.png';">
                </header>
                <section>
                    <h1>estatisticas</h1>
                    <small>do veiculo</small>
                    <div class="infos-content category">
                    <div class="column">
                        <div class="rowGR">
                        <span lang="ui-title-maxSpeed"></span>
                        <small>${vehicle.info.maxSpeed} km/h</small>
                        <div class="bar">
                            ${GenerateBars((12 * vehicle.info.maxSpeed) / 250)}
                        </div>
                        </div>
                        <div class="rowGR">
                        <span lang="ui-title-engineHealth"></span>
                        <small>${vehicle.info.engine / 10}%</small>
                        <div class="bar">
                            ${GenerateBars((12 * vehicle.info.engine) / 1000)}
                        </div>
                        </div>
                        <div class="rowGR">
                        <span lang="ui-title-maxBraking"></span>
                        <small>${vehicle.info.maxBraking.toFixed(2)}</small>
                        <div class="bar">
                            ${GenerateBars((12 * vehicle.info.maxBraking) / 1.5)}
                        </div>
                        </div>
                        <div class="rowGR">
                        <span lang="ui-title-bodyHealth"></span>
                        <small>${vehicle.info.body / 10}%</small>
                        <div class="bar">
                            ${GenerateBars((12 * vehicle.info.body) / 1000)}
                        </div>
                        </div>
                        <div class="rowGR">
                        <span lang="ui-title-maxTraction"></span>
                        <small>${vehicle.info.maxTraction.toFixed(2)}</small>
                        <div class="bar">
                            ${GenerateBars((12 * vehicle.info.maxTraction) / 3)}
                        </div>
                        </div>  
                        <div class="rowGR">
                        <span lang="ui-title-fuelLevel"></span>
                        <small>${vehicle.info.fuel}%</small>
                        <div class="bar">
                            ${GenerateBars((12 * vehicle.info.fuel) / 100)}
                        </div>
                        </div>
                    </div>
                    <div class="column">
                        <div class="info-column">
                        <small>Status</small>
                        <span lang="${status[0]}"></span>
                        </div>
                        <div class="info-column">
                        <small>Próxima taxa em:</small>
                        <span>${status[1]}</span>
                        </div>
                        <div class="info-column">
                        <small>${status[3]}</small>
                        <span>${!status[2] ? 'Sem taxas' : 'R$ '+new Intl.NumberFormat(module.currentLanguage, { minimumFractionDigits: 2 }).format(status[2])}</span>
                        </div>
                    </div>
                    <modal id="modal-sell-vehs" style="display:none;">
                        <span>Vender veículo</span>
                        <small>Digite o passaporte</small>
                        <input placeholder="ex: 3" name="id" type="number">
                        <small>Digite o valor</small>
                        <input placeholder="ex: 5000000" name="value" type="number">
                        <div>
                        <button cancel>Cancelar</button>
                        <button confirm>Confirmar</button>
                        </div>
                    </modal>
                    </div>
                </section>
                <footer class="footerGaragem">
                    <div class="steps">
                        <small>Paginas</small>
                        <div class="step-content">
                            <div class="step active" page="1"></div>
                            ${vehicle[3] ? '<div class="step" page="2"></div>' : ''}
                        </div>
                    </div>
                    <div class="btns">
                        ${data.config.garagemConfig.allowDeletingClosestVehicle ? `<button style="background: #d8a80a;" id="StoreClosestVehicle">Guardar Próximo</button>` : ''}
                        ${data.config.garagemConfig.allowVehicleSelling && data.config.garagemConfig.garagemType != 'work' ? `<button style="background: #d8a80a;" id="SellVehicle">Vender</button>` : ''}
                        ${vehicle.info.allowed && vehicle.info.taxLate ? `<button style="background: #FF2D2D;" id="PayVehicleTax">${module.lang.payTax}</button>` : ""}
                        ${vehicle.info.allowed && vehicle.info.exploded ? `<button style="background: #FF2D2D;" id="PayExplodedVehicleInsuranceTax">Seguro de Explosão</button>`  : ""}
                        ${vehicle.info.allowed && vehicle.info.impounded ? `<button style="background: #FF2D2D;" id="PayDetentionTax">Pagar detenção</button>`: ""}
                        ${vehicle.info.allowed && vehicle.info.scrapped ? `<button style="background: #FF2D2D;" id="PayScrappedVehicleInsuranceTax">Seguro de Desmanche</button>`: ""}
                        ${vehicle.info.allowed && !vehicle.info.taxLate && !vehicle.info.exploded && !vehicle.info.impounded && !vehicle.info.scrapped ? vehicle.info.spawned ? `<button style="background: #FF2D2D;" id="StoreVehicle">${module.lang.storeVehicle}</button>` : `<button id="SpawnVehicle">${module.lang.spawnVehicle}</button>` : ""}
                    </div>
                </footer>
                `

                let disableButtons = false

                function HandleButtonClicks() {

                    MainGarageHTMLElement.querySelector(".step[page='1']").onclick = e => SetVehiclePage(vehIndex, vehElement)
                    if (vehicle[3]) MainGarageHTMLElement.querySelector(".step[page='2']").onclick = async e => {
                        MainGarageHTMLElement.innerHTML = `
                        <header>
                            <h1>${vehicle.info.name}</h1>
                            <small>PLACA: ${vehicle[3]}</small>
                            <img id="img-stars" src="../modules/nyo_garages/web/assets/stars.png">
                            <img id="img-car" src="${imgGarage}/${vehicle.info.model}.png" onerror="this.src='https://cdn.discordapp.com/attachments/746851286422519928/997303294332522526/no_car.png';">
                        </header>
                        <section>
                            <img src="https://icon-library.com/images/waiting-icon-gif/waiting-icon-gif-1.jpg" class="garages-loading-icon"/>
                        </section>
                        `

                        if (!vehicle.keys) vehicle.keys = await module.fetch("GetVehicleKeys",{vehId: vehicle[1]})

                        let innerHTML = 

                        MainGarageHTMLElement.innerHTML = `
                        <header>
                            <h1>${vehicle.info.name}</h1>
                            <small>PLACA: ${vehicle[3]}</small>
                            <img id="img-stars" src="../modules/nyo_garages/web/assets/stars.png">
                            <img id="img-car" src="${imgGarage}/${vehicle.info.model}.png" onerror="this.src='https://cdn.discordapp.com/attachments/746851286422519928/997303294332522526/no_car.png';">
                        </header>
                        <section>
                        <div class="friend-panel category" >
                            <table>
                            <tr>
                                <th>Nome</th>
                                <th>Passaporte</th>
                                <th>ação</th>
                            </tr>
                            ${vehicle.keys.map(v => `
                            <tr>
                                <td>${v[0]}</td>
                                <td>${v[1]}</td>
                                <td class="remove-key" id="${v[1]}">Remover</td>
                            </tr>
                            `).join('')}
                            </table>
                            <modal style="display: none;">
                            <span>Adicionar Amigo</span>
                            <small>Digite o passaporte</small>
                            <input name="id" placeholder="ex: 5">
                            <div>
                                <button cancel>Cancelar</button>
                                <button confirm>Confirmar</button>
                            </div>
                            </modal>
                            <button class="add-friend"><i class="far fa-plus"></i></button>
                        </div>
                        </section>
                        <footer class="footerGaragem">
                        <div class="steps">
                            <small>Paginas</small>
                            <div class="step-content">
                                <div class="step" page="1"></div>
                                ${vehicle[3] ? '<div class="step active" page="2"></div>' : ''}
                            </div>
                        </div>
                        <div class="btns">
                            <button id="AddKey">Adicionar</button>
                            </div>
                        </footer>
                        `

                        MainGarageHTMLElement.querySelectorAll('.remove-key').forEach(e => e.onclick = e => {
                            module.fetch("RemoveKey",{vehId: vehicle[1], id: parseInt(e.currentTarget.getAttribute("id"))})
                            e.currentTarget.parentElement.remove()
                        })

                        MainGarageHTMLElement.querySelector('#AddKey').onclick = e => {
                            console.log('aaaa')
                            const modal = MainGarageHTMLElement.querySelector('modal')
                            modal.style.display = 'flex'
                            const idInput = modal.querySelector('input[name="id"]')
                            idInput.value = ''
                            modal.querySelector('button[cancel]').onclick = e => {
                                disableButtons = false
                                modal.style.display = 'none'
                            }
                            modal.querySelector('button[confirm]').onclick = async e => {
                                const id = parseInt(idInput.value)
                                if (id) {
                                    const data = await module.fetch('AddKey', { id, vehId: vehicle[1] }, null, true)
                                    if (!data) return
                                    disableButtons = false
                                    modal.style.display = 'none'
                                    if (data.success) {
                                        MainGarageHTMLElement.querySelector('table').innerHTML += `
                                        <tr>
                                            <td>${data.name}</td>
                                            <td>${id}</td>
                                            <td class="remove-key" id="${id}">Remover</td>
                                        </tr>
                                        `
                                    }
                                }
                            }
                        }

                        
                    }

                    if (data.config.garagemConfig.allowDeletingClosestVehicle) MainGarageHTMLElement.querySelector("#StoreClosestVehicle").onclick = () => { if (!disableButtons) module.fetch('StoreClosestVehicle', null, null, true) }

                    if (data.config.garagemConfig.allowVehicleSelling && data.config.garagemConfig.garagemType != 'work') MainGarageHTMLElement.querySelector("#SellVehicle").onclick = () => {
                        if (!disableButtons) {
                            disableButtons = true
                            const modal = MainGarageHTMLElement.querySelector('#modal-sell-vehs')
                            const idInput = modal.querySelector('input[name="id"]')
                            const valueInput = modal.querySelector('input[name="value"]')
                            modal.style.display = 'flex'
                            idInput.value = ''
                            valueInput.value = ''
                            modal.querySelector('button[cancel]').onclick = e => {
                                disableButtons = false
                                modal.style.display = 'none'
                            }
                            modal.querySelector('button[confirm]').onclick = async e => {
                                const id = parseInt(idInput.value)
                                const value = parseInt(valueInput.value)
                                if (id && value) {
                                    const data = await module.fetch('SellVehicle', { id, value, vehId: vehicle[1] }, null, true)
                                    if (!data) return
                                    disableButtons = false
                                    modal.style.display = 'none'
                                    if (data.success) {
                                        vehElement.remove()
                                        MainGarageHTMLElement.style.display = 'none'
                                    }
                                }
                            }
                        }
                    }

                    if (vehicle.info.allowed && vehicle.info.taxLate) MainGarageHTMLElement.querySelector('#PayVehicleTax').onclick = async () => {
                        if (!disableButtons) {
                            const res = await module.fetch('PayVehicleTax', { vehId: vehicle[1] }, false, true)
                            if (res && res.success) {
                                vehicle.info.taxLate = false
                                vehicle.info.nextTax = res.nextTax
                                SetVehiclePage(vehIndex, vehElement)
                            }
                        }
                    }

                    if (vehicle.info.allowed && vehicle.info.impounded) MainGarageHTMLElement.querySelector('#PayDetentionTax').onclick = async () => {
                        if (!disableButtons) {
                            const res = await module.fetch('PayDetentionTax', { vehId: vehicle[1] }, null, true)
                            if (res && res.success) {
                                vehicle.info.impounded = false
                                SetVehiclePage(vehIndex, vehElement)
                           } 
                        }
                    }

                    if (vehicle.info.allowed && vehicle.info.scrapped) MainGarageHTMLElement.querySelector('#PayScrappedVehicleInsuranceTax').onclick = async () => {
                        if (!disableButtons) {
                            const res = await module.fetch("PayScrappedVehicleInsuranceTax", { vehId: vehicle[1] }, null, true)
                            if (res && res.success) {
                                vehicle.info.scrapped = false
                                SetVehiclePage(vehIndex, vehElement)
                            }
                        }
                    }

                    if (vehicle.info.allowed && !vehicle.info.taxLate && !vehicle.info.exploded && !vehicle.info.impounded && !vehicle.info.scrapped) {
                        if (vehicle.info.spawned) MainGarageHTMLElement.querySelector('#StoreVehicle').onclick = async () => {
                            if (!disableButtons) {
                                const res = await module.fetch("StoreVehicle", { vehId: vehicle[1] }, null, true)
                                if (res && res.success) {
                                    vehicle.info.spawned = false
                                    console.log(res.vehId);
                                    console.log(res.plate);
                                    //vehicle[1] = res.vehId
                                    //vehicle[3] = res.plate
                                    SetVehiclePage(vehIndex, vehElement)
                                }
                            }
                        }
                        else MainGarageHTMLElement.querySelector('#SpawnVehicle').onclick = async () => {
                            if (!disableButtons) {
                                const res = await module.fetch("SpawnVehicle", { vehId: vehicle[1], workConfig: vehicle.workConfig }, null, true)
                                if (res && res.success) {
                                    vehicle.info.spawned = true
                                    SetVehiclePage(vehIndex, vehElement)
                                }
                            }
                        }
                    }



                }

                HandleButtonClicks()
            }
        }

        let currentVehicle

        function UpdateClickHandler() {

            
            function HandleVehicleClick(e) {
                const vehIndex = parseInt(e.currentTarget.getAttribute('vehicle'))
                if (currentVehicle == vehIndex) {
                    currentVehicle = null
                    MainGarageHTMLElement.style.display = 'none'
                    e.currentTarget.classList.remove('active')
                } else {
                    currentVehicle = vehIndex
                    VehicleListHTMLElement.querySelector('.active')?.classList.remove('active')
                    e.currentTarget.classList.add('active')
                    SetVehiclePage(currentVehicle)
                }
            }

            document.querySelectorAll('.vehicle-item').forEach(e => e.onclick = HandleVehicleClick)

        }

        function HandleCategoryClick(e) {
            const categoryId = e.currentTarget.getAttribute("category")
            CategoriesListHTMLElement.querySelector('.active').classList.remove('active')
            e.currentTarget.classList.add('active')
            VehicleListInnerHTML = ''
            for ([k, v] of Object.entries(data.vehicles)) {
                if (v.info.category == categoryId)
                VehicleListInnerHTML += `
                    <div class="item vehicle-item" vehicle="${k}">
                        <img src="${imgGarage}/${v.info.model}.png" onerror="this.src='https://cdn.discordapp.com/attachments/746851286422519928/997303294332522526/no_car.png';">
                        <div class="item-info">
                            <span>${v.info.name}</span>
                            <br>
                            <small>${v[3]}</small>
                        </div>
                    </div>
                `;
            }
            VehicleListHTMLElement.innerHTML = VehicleListInnerHTML
            UpdateClickHandler()
        }

        UpdateClickHandler()

        CategoriesListHTMLElement.querySelectorAll('.category-item').forEach(e => e.onclick = HandleCategoryClick)


    }, { hideUIsType3: true })
    
    module.registerCloseUiFunction(() => {
        FetchData("garageClose", {})
    })
    
    module.addMessageHandler('setVehicleList', (data) => {
        vehicleList = data
    })

}

NyoGarages()