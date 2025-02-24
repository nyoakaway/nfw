const crafting_images = 'http://127.0.0.1/nfw/itens/'
const nyo_crafting = new Module('nyo_crafting')

let craftingInventory = null
let craftingConfig = null
let craftingSelectedQuantity = 0
let craftingSelectedItem = ''
let craftingSelectedCategory = null

nyo_crafting.registerOpenUiFunction((data) => {
    craftingInventory = data.inventory
    craftingConfig = data.config

    // document.getElementById('crafting-ui-title1').innerHTML = nyo_crafting.lang['ui-title1']
    // document.getElementById('crafting-ui-title2').innerHTML = nyo_crafting.lang['ui-title2']
    // document.getElementById('crafting-ui-search').placeholder = nyo_crafting.lang['ui-search']
    // document.getElementById('crafting-ui-produce-button').innerHTML = nyo_crafting.lang['ui-produce-button']
    // document.getElementById('crafting-ui-container-title').innerHTML = nyo_crafting.lang['ui-container-title']
    // document.getElementById('crafting-ui-container-subtitle').innerHTML = nyo_crafting.lang['ui-container-subtitle']

    document.querySelector('.container-selected-crafting').style.display = 'none'

    craftingSelectedCategory = null

    let categoryListHTMLElement = document.querySelector(".container-select-items-buttons-crafting")
    let innerHTML = ``
    for (let [k, v] of Object.entries(craftingConfig)) {
        innerHTML += `
            <button onclick="craftingSelectCategory('${k}', this)" class="${craftingSelectedCategory ? '' : 'active'}"><i class="${v.icon}"></i></button>
        `
        if (!craftingSelectedCategory) {
            craftingSelectedCategory = k
        }
    }

    categoryListHTMLElement.innerHTML = innerHTML

    craftingSetInventory()
})

nyo_crafting.registerCloseUiFunction((data) => {
    FetchData('close',{})
})

nyo_crafting.addMessageHandler('updateInventory', (data) => {
    craftingInventory = data
    craftingSetItemData()
})

function craftingSelectCategory(category, self) {
    craftingSelectedCategory = category
    document.querySelector('.container-select-items-buttons-crafting .active').classList.remove('active')
    self.classList.add('active')
    craftingSetInventory()
}

function craftingSetInventory() {

    let ul = document.querySelector('.container-select-items-crafting ul')
    let HTML = ``

    for (let [k, v] of Object.entries(craftingConfig[craftingSelectedCategory].itens)) {
        HTML += `
        <li class="container-select-items-list-item-crafting" onclick="craftingSelectItem('${k}', this)" item-name="${v.name}">
            <img src="${crafting_images}/${ParseItemImage(k)}.png">
            <div>
                <p>${v.name}</p>
                <small><i class="far fa-clock"></i> ${v.productionTime} <span lang="ui-seconds"></span></small>
            </div>
        </li>
        `
    }

    ul.innerHTML = HTML

}

function craftingSelectItem(item, self) {
    let _active = document.querySelector('.container-select-items-crafting ul .active')
    if (_active) _active.classList.remove('active')
    self.classList.add('active')

    let containerSelectedCrafting = document.querySelector('.container-selected-crafting')

    craftingSelectedItem = item
    craftingSelectedQuantity = craftingConfig[craftingSelectedCategory].itens[craftingSelectedItem].minAmount

    craftingSetItemData()

    containerSelectedCrafting.style.display = 'block'

}

function craftingSetItemData() {
    let itemData = craftingConfig[craftingSelectedCategory].itens[craftingSelectedItem]
    let requiredItens = ``

    for (let [k, v] of Object.entries(itemData.requiredItens)) {
        requiredItens += `
        <li class="container-selected-content-resources-item-crafting" style="background: ${(craftingInventory[k]?.amount || 0) < (v[1] * craftingSelectedQuantity) ? '#FF3131' : '#0075DE'};">
            <img src="${crafting_images}/${ParseItemImage(k)}.png">
            <p>${craftingInventory[k]?.amount || 0}/${v[1] * craftingSelectedQuantity} ${v[0]}</p>
        </li>
        `
    }

    document.querySelector('.container-selected-crafting .container-selected-content-crafting ul').innerHTML = requiredItens
    document.querySelector('.container-selected-header-crafting').innerHTML = `
        <div class="container-selected-header-infos-crafting">
            <p>${itemData.name}</p>
            <small>${craftingConfig[craftingSelectedCategory].name}</small>
        </div>
        <img id="header-item-crafting" src="${crafting_images}/${ParseItemImage(craftingSelectedItem)}.png">
        <img id="header-stars-crafting" src="../modules/nyo_crafting/web/assets/stars.png">
    `

    const inputRange = document.querySelector('.container-selected-content-finalize-infos-range-crafting')

    inputRange.setAttribute('step', '1')
    inputRange.setAttribute('min', itemData.minAmount)
    inputRange.setAttribute('max', itemData.maxAmount)
    inputRange.setAttribute('value', craftingSelectedQuantity)
    inputRange.setAttribute('oninput', 'craftingSetQuantity(this.value)')

    document.querySelector('#crafting-amount').value = craftingSelectedQuantity
    document.querySelector('.container-selected-content-finalize-infos-time-crafting').innerHTML = `<i class="far fa-clock"></i> ${itemData.productionTime * craftingSelectedQuantity} <span lang="ui-seconds"></span>`
}

function craftingSetQuantity(val) {
    craftingSelectedQuantity = Math.floor(parseInt(val)) || 0
    document.querySelector('#crafting-amount').value = craftingSelectedQuantity
    craftingSetItemData()
}

async function craftingStartProducing() {
    let itemData = craftingConfig[craftingSelectedCategory].itens[craftingSelectedItem]
    let success = true

    for (let [k, v] of Object.entries(itemData.requiredItens)) {
        if ((craftingInventory[k]?.amount || 0) < (v[1] * craftingSelectedQuantity)) {
            success = false
        }
    }

    if (success) {
        const data = await FetchData('produceItens', { category: craftingSelectedCategory, item: craftingSelectedItem, quantity: craftingSelectedQuantity })

        if (data.ableToCraft) {
            let productionTime = itemData.productionTime * craftingSelectedQuantity
            document.querySelector('.container-selected-content-finalize-button-create-crafting').style.display = 'none'
        
            let interval = setInterval(() => {
                document.querySelector('.container-selected-content-finalize-infos-time-crafting').innerHTML = `<i class="far fa-clock"></i> ${productionTime} <span lang="ui-seconds"></span>`     
                productionTime--
                if (productionTime <= 0) {
                    clearInterval(interval)
                    document.querySelector('.container-selected-content-finalize-button-create-crafting').style.display = 'block'
                    craftingSelectedQuantity = itemData.minAmount
                    craftingSetItemData()
                }
            }, 1000)
        }
        
    }    

}

let craftingSearchHTMLElement = document.querySelector('.container-select-header-search-crafting input')
craftingSearchHTMLElement.onkeyup = (e) => {
    let craftingListElements = document.querySelectorAll('.container-select-items-list-item-crafting')
    let value = craftingSearchHTMLElement.value
    craftingListElements.forEach((v, k) => {
        let dataId = v.getAttribute('item-name').toLowerCase();
        if (dataId.indexOf(value) > -1) {
            v.style.display = 'flex'
        }else{
            v.style.display = 'none'
        }
    })
}