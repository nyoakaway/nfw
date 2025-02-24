const routes_images = 'http://127.0.0.1/nfw/itens/'
const nyo_routes = new Module('nyo_routes')

let routesCurrentConfig = null
let routesCurrentCategory = null
let routesCurrentItem = null

nyo_routes.registerOpenUiFunction((data) => {
    routesCurrentConfig = data.config
    routesCurrentCategory = null

    document.getElementById("routes-ui-title").innerHTML = nyo_routes.lang['ui-title']
    document.getElementById("routes-ui-search-field").placeholder = nyo_routes.lang['ui-search-field']

    let categoryInnerHTML = ``
    let categoryListHTMLElement = document.querySelector('.container-select-items-buttons-routes')

    for (let [k, v] of Object.entries(data.config)) {
        categoryInnerHTML += `
            <button class="${routesCurrentCategory ? '' : 'active'}" onclick="routesChangeCategory('${k}', this)"><i class="${v.icon}"></i></button>
        `
        if (!routesCurrentCategory) routesCurrentCategory = k
    }

    categoryListHTMLElement.innerHTML = categoryInnerHTML
    document.querySelector('.container-selected-routes').style.display = 'none'
    routesSetCategoryItens()
})

nyo_routes.registerCloseUiFunction(() => {
    FetchData('close', {})
})

function routesChangeCategory(index, self){
    routesCurrentCategory = index; 

    let _active = document.querySelector('.container-select-items-buttons-routes .active');
    if (_active) _active.classList.remove('active');
    self.classList.add('active');

    routesSetCategoryItens();
}

function routesSetCategoryItens() {
    let itemListHTMLElement = document.querySelector('.container-select-items-list-routes')
    let innerHTML = ``

    for (let [k, v] of Object.entries(routesCurrentConfig[routesCurrentCategory].routes)) {
        innerHTML += `
        <li class="container-select-items-list-item-routes" onclick="routeSelectItem(${k}, this)" item-name="${v.name}">
            <img src="${routes_images}/${ParseItemImage(v.image)}.png">
            <div>
                <p>${v.name}</p>
            </div>
        </li>
        `
    }

    itemListHTMLElement.innerHTML = innerHTML
}

function routeSelectItem(item, self) {
    let _active = document.querySelector('.container-select-items-list-routes .active')
    if (_active) _active.classList.remove('active')
    self.classList.add('active')

    routesCurrentItem = item

    const selectedRoutesHTMLElement = document.querySelector('.container-selected-routes')
    selectedRoutesHTMLElement.style.display = 'block'

    let resultItens = ``
    routesCurrentConfig[routesCurrentCategory].routes[item].resultItens.map((v, k) => {
        resultItens += `
        <li class="container-selected-content-resources-item-routes">
            <img src="${routes_images}/${ParseItemImage(v.index)}.png">
            <p>${v.min} - ${v.max} | ${v.name}</p>
        </li>
        `
    })

    let requiredItens = ``
    routesCurrentConfig[routesCurrentCategory].routes[item].requiredItens.map((v, k) => {
        requiredItens += `
        <li class="container-selected-content-resources-item-routes">
            <img src="${routes_images}/${ParseItemImage(v.index)}.png">
            <p>${v.min} - ${v.max} | ${v.name}</p>
        </li>
        `
    })

    selectedRoutesHTMLElement.innerHTML = `
        <div class="container-selected-header-routes">
            <div class="container-selected-header-infos-routes">
                <p>${routesCurrentConfig[routesCurrentCategory].routes[item].name}</p>
                <small>${routesCurrentConfig[routesCurrentCategory].name}</small>
            </div>
                <img id="header-item-routes" src="${routes_images}/${ParseItemImage(routesCurrentConfig[routesCurrentCategory].routes[item].image)}.png">
                <img id="header-stars-routes" src="../modules/nyo_routes/web/assets/stars.png">
            </div>
            <div class="container-selected-content-routes">
            <div class="container-selected-content-title-routes">
                <small class="active-route-routes" onclick="routesSetItensType(1, this)">${nyo_routes.lang['ui-subtitle-1']}</small>
                <small>|</small>
                <small onclick="routesSetItensType(2, this)">${nyo_routes.lang['ui-subtitle-2']}</small>
            </div>
            <ul class="container-selected-content-resources-routes route-result">
                ${resultItens}
            </ul>
            <ul class="container-selected-content-resources-routes route-required" style="display: none;">
                ${requiredItens}
            </ul>
            <div class="container-selected-content-finalize-routes">
                <div class="container-selected-content-finalize-infos-routes">
                    <div class="container-selected-content-finalize-infos-buttons-routes">
                        <button class="container-selected-content-finalize-button-cancel-routes" onclick="FetchData('cancelRoute',{})">${nyo_routes.lang['ui-stop-button']}</button>
                        <button class="container-selected-content-finalize-button-create-routes" onclick="startRoute()">${nyo_routes.lang['ui-start-button']}</button>
                    </div>
                </div>
            </div>
        </div>
    `

}

function routesSetItensType(type, self) {
    document.querySelector('.active-route-routes').classList.remove('active-route-routes')
    self.classList.add('active-route-routes')
    if (type == 1) {
        document.querySelector('.route-result').style.display = 'grid'
        document.querySelector('.route-required').style.display = 'none'
    } else if (type == 2) {
        document.querySelector('.route-result').style.display = 'none'
        document.querySelector('.route-required').style.display = 'grid'
    }
}

function startRoute() {
    FetchData('startRoute', {
        category: routesCurrentCategory,
        route: routesCurrentItem
    })
}

let routeSearchHTMLElement = document.querySelector('.container-select-header-search-routes input')
routeSearchHTMLElement.onkeyup = (e) => {
    let routesListElements = document.querySelectorAll('.container-select-items-list-item-routes')
    let value = routeSearchHTMLElement.value
    routesListElements.forEach((v, k) => {
        let dataId = v.getAttribute('item-name').toLowerCase();
        if (dataId.indexOf(value) > -1) {
            v.style.display = 'flex'
        }else{
            v.style.display = 'none'
        }
    })
}