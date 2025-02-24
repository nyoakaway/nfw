(() => { 
    const dealership_images = 'http://127.0.0.1/nfw/vehicles/'
    const nyo_dealership = new Module('nyo_dealership');

    function dealershipGenerateBars(amountActive, amount) {
        let text = "";
        for (let i = 1; i <= (amount || 12); i++) {
            text += `
                <div class="shape ${i <= amountActive ? "active" : ""}"></div>
            `;
        }
        return text;
    }

    let dealershipConfig = {}
    let dealershipData = {}

    function DealershipStart(data) {
        dealershipConfig = data.config
        dealershipData = data.dealershipData
    
        let categoriesAside = document.querySelector('#actionMenuConce mainConce menu aside')
        let categoriesSection = document.querySelector('#actionMenuConce mainConce menu section')
        let categoriesHTML = ``
        let vehiclesHTML = null
    
        document.getElementById('dealership-name').innerHTML = dealershipConfig.name
    
        for (let [k, v] of Object.entries(data.dealershipData)) {
            if (k != 'playerVehicles' && dealershipConfig.categories[k]) {
                categoriesHTML += `
                    <div class="item ${vehiclesHTML ? '' : 'active'} dealership-category" data-category="${k}">${dealershipConfig.categories[k].icon}</div>
                `
                // vehicle, category, self
                if (!vehiclesHTML) {
                    document.getElementById('dealership-category-name').innerHTML = dealershipConfig.categories[k].title
                    vehiclesHTML = ``
                    for (let [l, w] of Object.entries(v)) {
                        vehiclesHTML += `
                        <div class="item dealership-vehicle" data-veh="${l}" data-category="${k}" data-vehicle="${w['name']}" >
                            <img src="${dealership_images}/${w['index']}.png" onerror="this.src='https://cdn.discordapp.com/attachments/746851286422519928/997303294332522526/no_car.png';">
                            <div class="item-info">
                            <span>${w['name']}</span><br>
                            <small>R$${w['price']}</small>
                            </div>
                        </div>
                        `
                    }
                }
            }
        }
    
        if (data.dealershipData.playerVehicles)
        categoriesHTML = `
            <div class="item dealership-category" data-category="playerVehicles"><i class="fas fa-cars" style="color: #FFFFFF;"></i></div>
            ${categoriesHTML}
        `
    
        categoriesAside.innerHTML = categoriesHTML
        categoriesSection.innerHTML = vehiclesHTML
    
        document.querySelector('#actionMenuConce mainConceMeio').style.display = 'none'

        function selectDealershipCategory(e) {
            const self = e.currentTarget
            const category = self.getAttribute('data-category')
            document.querySelector('#actionMenuConce mainConce menu aside .active').classList.remove('active')
            self.classList.add('active')
            
            let categoriesSection = document.querySelector('#actionMenuConce mainConce menu section')
            let vehiclesHTML = ``
            document.getElementById('dealership-category-name').innerHTML = category == 'playerVehicles' ? 'Seus veículos' : dealershipConfig.categories[category].title
        
            for (let [l, w] of Object.entries(dealershipData[category])) {
                vehiclesHTML += `
                <div class="item dealership-vehicle" data-index="${l}" data-veh="${w['index']}" data-category="${category}" data-vehicle="${w['name']}" data-plate="${w['plate']}" >
                    <img src="${dealership_images}/${w['index']}.png" onerror="this.src='https://cdn.discordapp.com/attachments/746851286422519928/997303294332522526/no_car.png';">
                    <div class="item-info">
                    <span>${w['name']}</span><br>
                    <small>R$${w['price']}</small><br>
                    <small>${w['plate'] || ''}</small>
                    </div>
                </div>
                `
            }
        
            categoriesSection.innerHTML = vehiclesHTML
            document.querySelectorAll(".dealership-vehicle").forEach(element => element.onclick = selectDealershipVehicle)
        }

        let dealershipSpawningVehicle = false

        function selectDealershipVehicle(e) {
            const self = e.currentTarget
            var vId = self.getAttribute("data-index");
            var vehicle = self.getAttribute("data-veh");
            const category = self.getAttribute("data-category");
            var plate = self.getAttribute("data-plate");
            if (dealershipSpawningVehicle) return
            dealershipSpawningVehicle = true
            let _active = document.querySelector('#actionMenuConce mainConce menu section .active')
            if (_active) _active.classList.remove('active')
            self.classList.add('active')
            
            if(vId == null){ vId = vehicle; }
   
            const vehData = dealershipData[category][vId]
            const mainConce = document.querySelector('#actionMenuConce mainConceMeio')
        
            FetchData('setVehicle', { vehicle, category, vId }, () => {
                dealershipSpawningVehicle = false
            })
        
            mainConce.style.display = 'block'
            mainConce.innerHTML = `
            <header>
                <div class="title">
                <h1>Estatistícas</h1>
                <small>do veiculo</small>
                </div>
                <div class="price"><div class="prefix">$</div> ${vehData['price']}</div>
                <div class="btns">
                <button onclick="FetchData('${category == 'playerVehicles' ? 'sellVehicle' : 'buyVehicle'}', { category: '${category}', vehicle: '${vehicle}', plate: '${plate}' })"><i class="fas fa-shopping-cart"></i><div class="toltip">${category == 'playerVehicles' ? 'vender' : 'comprar'}</div></button>
                <button id="dealership-test-drive"><i class="fa-solid fa-gauge-low"></i><div class="toltip" >test-drive</div></button>
                </div>
            </header>
            <section>
                <div class="column">
                <div class="rowDS">
                    <span>Velocidade</span>
                    <small>${Math.floor(vehData.maxSpeed)} KM/H</small>
                    <div class="bar">
                        ${dealershipGenerateBars((12 * vehData.maxSpeed) / 250)}
                    </div>
                </div>
                <div class="rowDS">
                    <span>Freio</span>
                    <small>${vehData.maxBraking.toFixed(2)}</small>
                    <div class="bar">
                    ${dealershipGenerateBars((12 * vehData.maxBraking) / 1.5)}
                    </div>
                </div>
                </div>
                <div class="column" style="position:relative;top: -70px;">
                <div class="rowDS">
                    <span>Capacidade Porta Malas</span>
                    <small>${parseInt(vehData['trunk'])}L</small>
                    <div class="bar">
                    ${dealershipGenerateBars((12 * vehData['trunk']) / 100)}
                    </div>
                </div>
                <div class="rowDS">
                    <span>Quantidade de Assentos</span>
                    <small>${vehData.maxSeats}</small>
                    <div class="bar">
                    ${dealershipGenerateBars(vehData.maxSeats, 10)}
                    </div>
                </div>
                </div>
            </section>
            `

            document.getElementById("dealership-test-drive").onclick = dealershipStartTestDrive

            function dealershipStartTestDrive() {
                FetchData('startTestDrive', {})
                document.getElementById('actionMenuConce').style.display = 'none'
                document.getElementById('concealert').style.display = 'flex'
            }
        }

        document.querySelectorAll(".dealership-category").forEach(element => element.onclick = selectDealershipCategory)
        document.querySelectorAll(".dealership-vehicle").forEach(element => element.onclick = selectDealershipVehicle)
    }


    nyo_dealership.registerOpenUiFunction(DealershipStart)
    nyo_dealership.addMessageHandler('updateUI', DealershipStart)

    nyo_dealership.registerCloseUiFunction(() => {
        FetchData('close',{})
    })
    
    nyo_dealership.addMessageHandler('stopTestDrive', (data) => {
        document.getElementById('actionMenuConce').style.display = 'flex'
        document.getElementById('concealert').style.display = 'none'
    })
    
    document.querySelector('#dealership-search').onkeyup = () => {
        var el = $('#actionMenuConce mainConce menu section .item');
        var value = document.querySelector('#dealership-search').value.toLowerCase();
    
        $.each(el, function (e, e2) {
            let dataId = e2.getAttribute('data-vehicle').toLowerCase();
            if (dataId.indexOf(value) > -1) {
                $(e2).css("display","inline-flex");
            }else{
                $(e2).css("display","none");
            }
       });
    }

})()