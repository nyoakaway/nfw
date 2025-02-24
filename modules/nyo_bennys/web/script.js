const nyo_bennys_images = 'http://127.0.0.1/nfw/bennys/'

const nyo_bennys = new Module('nyo_bennys');

let bennysConfig,
	bennysModTypes,
	bennysAvailableModifications,
	bennysVehModifications,
	bennysVName,
	bennysIsBike;

let bennysTotalPrice = 0;
let changedMods = {};

const bennysCategoriesNames = {
	appearance: "Aparência",
	customization: "Customização",
	performance: "Performance",
	interior: "Interior",
	wheels: "Rodas",
	extras: "Extras",
};

const bennysWheelTypes = [
	"Sport",
	"Muscle",
	"Lowrider",
	"SUV",
	"Off Road",
	"Tuner",
	"Bike",
	"High End",
	"Benny's Original",
	"Benny's Bespoke",
	"Open Wheel",
	"Street",
	"Track",
];

const bennysPaintTypes = [
	"Normal",
	"Metálico",
	"Perolado",
	"Fosco",
	"Metal",
	"Cromado",
];

const bennysWheelColours = [
	{ name: "Black", colorindex: 0, color: '#000' },
	{ name: "Carbon Black", colorindex: 147, color: '#000' },
	{ name: "Hraphite", colorindex: 1, color: '#0d0d0d' },
	{ name: "Anhracite Black", colorindex: 11, color: '#121212' },
	{ name: "Black Steel", colorindex: 2, color: '#1c1c1c' },
	{ name: "Dark Steel", colorindex: 3, color: '#333333' },
	{ name: "Silver", colorindex: 4, color: '#a1a1a1' },
	{ name: "Bluish Silver", colorindex: 5, color: '#b5b5b5' },
	{ name: "Rolled Steel", colorindex: 6, color: '#949494' },
	{ name: "Shadow Silver", colorindex: 7, color: '#435367' },
	{ name: "Stone Silver", colorindex: 8, color: '#4C4B4B' },
	{ name: "Midnight Silver", colorindex: 9, color: '#2A303C' },
	{ name: "Cast Iron Silver", colorindex: 10, color: '#49545D' },
	{ name: "Red", colorindex: 27, color: '#A41D29' },
	{ name: "Torino Red", colorindex: 28, color: '#AE1D1F' },
	{ name: "Formula Red", colorindex: 29, color: '#C8121E' },
	{ name: "Lava Red", colorindex: 150, color: '#AF1520' },
	{ name: "Blaze Red", colorindex: 30, color: '#BD3030' },
	{ name: "Grace Red", colorindex: 31, color: '#7C1F23' },
	{ name: "Garnet Red", colorindex: 32, color: '#82313B' },
	{ name: "Sunset Red", colorindex: 33, color: '#6F2125' },
	{ name: "Cabernet Red", colorindex: 34, color: '#501730' },
	{ name: "Wine Red", colorindex: 143, color: '#1F1A21' },
	{ name: "Candy Red", colorindex: 35, color: '#C42049' },
	{ name: "Hot Pink", colorindex: 135, color: '#FE30A0' },
	{ name: "Pfsiter Pink", colorindex: 137, color: '#E8659C' },
	{ name: "Salmon Pink", colorindex: 136, color: '#FEDBD1' },
	{ name: "Sunrise Orange", colorindex: 36, color: '#FE856B' },
	{ name: "Orange", colorindex: 38, color: '#FF8C27' },
	{ name: "Bright Orange", colorindex: 138, color: '#FFB93B' },
	{ name: "Gold", colorindex: 99, color: '#B29C7F' },
	{ name: "Bronze", colorindex: 90, color: '#A17852' },
	{ name: "Yellow", colorindex: 88, color: '#FEC130' },
	{ name: "Race Yellow", colorindex: 89, color: '#F3CE22' },
	{ name: "Dew Yellow", colorindex: 91, color: '#D3CF4B' },
	{ name: "Dark Green", colorindex: 49, color: '#1E383C' },
	{ name: "Racing Green", colorindex: 50, color: '#1D5241' },
	{ name: "Sea Green", colorindex: 51, color: '#135052' },
	{ name: "Olive Green", colorindex: 52, color: '#59635B' },
	{ name: "Bright Green", colorindex: 53, color: '#187F34' },
	{ name: "Gasoline Green", colorindex: 54, color: '#2B8E8E' },
	{ name: "Lime Green", colorindex: 92, color: '#AEDD24' },
	{ name: "Midnight Blue", colorindex: 141, color: '#22273B' },
	{ name: "Galaxy Blue", colorindex: 61, color: '#213D51' },
	{ name: "Dark Blue", colorindex: 62, color: '#1F3F6D' },
	{ name: "Saxon Blue", colorindex: 63, color: '#4C6F99' },
	{ name: "Blue", colorindex: 64, color: '#194DA5' },
	{ name: "Mariner Blue", colorindex: 65, color: '#869DC1' },
	{ name: "Harbor Blue", colorindex: 66, color: '#677083' },
	{ name: "Diamond Blue", colorindex: 67, color: '#C9D9DD' },
	{ name: "Surf Blue", colorindex: 68, color: '#82B1BF' },
	{ name: "Nautical Blue", colorindex: 69, color: '#4B7186' },
	{ name: "Racing Blue", colorindex: 73, color: '#3073BA' },
	{ name: "Ultra Blue", colorindex: 70, color: '#0EA9F2' },
	{ name: "Light Blue", colorindex: 74, color: '#82ADCA' },
	{ name: "Chocolate Brown", colorindex: 96, color: '#403B3D' },
	{ name: "Bison Brown", colorindex: 101, color: '#5D4B51' },
	{ name: "Creeen Brown", colorindex: 95, color: '#655C50' },
	{ name: "Feltzer Brown", colorindex: 94, color: '#6C523A' },
	{ name: "Maple Brown", colorindex: 97, color: '#7D5846' },
	{ name: "Beechwood Brown", colorindex: 103, color: '#60413D' },
	{ name: "Sienna Brown", colorindex: 104, color: '#813E29' },
	{ name: "Saddle Brown", colorindex: 98, color: '#715447' },
	{ name: "Moss Brown", colorindex: 100, color: '#83806A' },
	{ name: "Woodbeech Brown", colorindex: 102, color: '#B2A178' },
	{ name: "Straw Brown", colorindex: 99, color: '#B39C80' },
	{ name: "Sandy Brown", colorindex: 105, color: '#CAB389' },
	{ name: "Bleached Brown", colorindex: 106, color: '#EDDBBB' },
	{ name: "Schafter Purple", colorindex: 71, color: '#4D4C72' },
	{ name: "Spinnaker Purple", colorindex: 72, color: '#434569' },
	{ name: "Midnight Purple", colorindex: 142, color: '#272337' },
	{ name: "Bright Purple", colorindex: 145, color: '#7B2A8B' },
	{ name: "Cream", colorindex: 107, color: '#F5E6D0' },
	{ name: "Ice White", colorindex: 111, color: '#EADED1' },
	{ name: "Frost White", colorindex: 112, color: '#ffffff' },
];

let customNames = {
	[14]: [
		"Buzina de Caminhão",
		"Buzina Policial",
		"Buzina de Palhaço",
		"Buzina Musical 1",
		"Buzina Musical 2",
		"Buzina Musical 3",
		"Buzina Musical 4",
		"Buzina Musical 5",
		"Trombone Triste",
		"Buzina Clássica 1",
		"Buzina Clássica 2",
		"Buzina Clássica 3",
		"Buzina Clássica 4",
		"Buzina Clássica 5",
		"Buzina Clássica 6",
		"Buzina Clássica 7",
		"Nota Musical Do",
		"Nota Musical Re",
		"Nota Musical Mi",
		"Nota Musical Fa",
		"Nota Musical Sol",
		"Nota Musical La",
		"Nota Musical Ti",
		"Nota Musical Do (Grave)",
		"Buzina de Jazz 1",
		"Buzina de Jazz 2",
		"Buzina de Jazz 3",
		"Buzina de Jazz Loop",
		"Star Spangled Banner",
		"Star Spangled Banner",
		"Star Spangled Banner",
		"Star Spangled Banner",
		"Buzina Clássica Loop",
		"Buzina Clássica 8",
		"Buzina Clássica Loop 2",
		"Halloween Loop 1",
		"Halloween Loop 2",
		"San Andreas Loop",
		"Liberty City Loop",
		"Loop Festival 1",
		"Loop Festival 2",
		"Loop Festival 3",
		"Street Transmission",
		"Buzina Musical Loop 6",
		"Buzina Musical Loop 7",
		"Buzina Musical Loop 8",
		"Buzina Natalina 1",
		"Buzina Natalina 2",
		"Buzina Natalina 3",
		"Buzina Natalina 4",
		"Buzina Natalina 5",
		"Buzina Natalina 6",
		"Buzina de Corneta Loop 1",
		"Buzina de Corneta 1",
		"Buzina de Corneta Loop 2",
		"Buzina de Corneta 2",
		"Buzina de Corneta Loop 3",
		"Buzina de Corneta 3",
	],
};

const bennysToggleMods = {
	[18]: "turbo",
	[20]: "tyreSmokeOn",
};

customNames[14][-1] = "Original";

function hexToRgb(hex) {
	var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
	return result
		? {
				r: parseInt(result[1], 16),
				g: parseInt(result[2], 16),
				b: parseInt(result[3], 16),
		  }
		: null;
}

function rgbToHex(r, g, b) {
	return "#" + ((1 << 24) + (r << 16) + (g << 8) + b).toString(16).slice(1);
}

let bennysAudioPlayer

function setHomeMenu(cfg) {
    bennysInWheelsMenu = false
    let shopContent = document.getElementById('bennys-shop-content');
	let categories = {};
	let shopContentHtml = "";

    nyo_bennys.fetch('stopBurnout', {})


	for (let i = 0; i <= 49; i++) {
		if (
			bennysAvailableModifications[i] &&
            bennysAvailableModifications[i][0] > 0 &&
            bennysConfig[i]
		) {
			let modConfig = bennysModTypes[i];
			if (!categories[modConfig.category])
				categories[modConfig.category] = [];
			categories[modConfig.category].push({
				name: modConfig.name,
				modIndex: i,
			});
		}
	}

	if (!categories.appearance) categories.appearance = [];
	if (bennysConfig.primaryColour) categories.appearance.push({
		name: "Cor Primária",
		modIndex: "primaryColour",
	});
	if (bennysConfig.secondaryColour) categories.appearance.push({
		name: "Cor Secundária",
		modIndex: "secondaryColour",
	});
	if (bennysConfig.pearlescentColour) categories.appearance.push({
		name: "Perolado",
		modIndex: "pearlescentColour",
	});
	if (bennysConfig.windowTint) categories.appearance.push({
		name: "Vidros",
		modIndex: "windowTintColour",
	});
	if (bennysConfig.neon) categories.appearance.push({
		name: "Neon",
		modIndex: "neon",
	});
	if (bennysConfig.xenonColour) categories.appearance.push({
		name: "Xenon",
		modIndex: "xenon",
	});
    if (bennysConfig.plate) categories.appearance.push({
		name: "Cor da Placa",
		modIndex: "plate",
	});

	if (!categories.wheels) categories.wheels = [];
	if (bennysConfig.wheelColour) categories.wheels.push({ name: "Cor da Roda", modIndex: "wheelColour" });
	if (bennysConfig.tyreSmokeColour) categories.wheels.push({ name: "Fumaça do Pneu", modIndex: "tyreSmoke" });

	if (!categories.performance) categories.performance = [];
	if (bennysConfig[18]) categories.performance.push({ name: "Turbo", modIndex: "turbo" });

    for ([k, v] of Object.entries(categories)) {
        if (v.length > 1) {
            let text = ""
            v.forEach((v) => {
                let imgUrl =  ''
                let defaultImgUrl = `${nyo_bennys_images}/default/${v.modIndex}`
                text += `
                    <div class="item bennys-item" mod-index="${v.modIndex}" style="background-image: url('${imgUrl}.png'), url('${defaultImgUrl}.png');" >
                        <span>${v.name}</span>
                    </div>
                `;
            });
            shopContentHtml += `
                <div class="itens-grid grid" id="${k}">
                    <div class="grid-title">
                        <span>${bennysCategoriesNames[k]}</span>
                    </div>
                    <div class="grid-content">
                        ${text}
                    </div>
                </div>
            `;
        }
	}

	shopContent.innerHTML = shopContentHtml

    let homeItemClickHandlers = {}

    function setHomeItemClickHandler(modIndex, handler) {
        homeItemClickHandlers[modIndex] = handler
    }


    async function sendClientModificationRequest(mod, data, preventMultipleFetching = true) {
        if (!data.hover && !data.r && cfg.playAudioOnModChange) {
            if (!bennysAudioPlayer) bennysAudioPlayer = new Audio("../modules/nyo_bennys/web/effect.ogg");
            bennysAudioPlayer.currentTime = 0
            bennysAudioPlayer.volume = 0.5;
            bennysAudioPlayer.play();
        }
        const res = await nyo_bennys.fetch('setMod', { ...data, mod }, null, preventMultipleFetching)
        document.getElementById('bennys-cart-price').innerHTML = `<span lang="ui-currency-symbol"></span>${new Intl.NumberFormat(nyo_bennys.currentLanguage, { minimumFractionDigits: 2 }).format(res.cart)}`
    }

    setHomeItemClickHandler('turbo', () => {
        shopContent.innerHTML = `
            <div class="column-grid grid-buttons">
                <button ${ bennysVehModifications[18] && 'class="forceactive"' } state="true">Ativar</button>
                <button ${ !bennysVehModifications[18] && 'class="forceactive"'} >Desativar</button>
            </div>
        `

        shopContent.querySelectorAll('button').forEach(e => e.onclick = e => {
            const state = Boolean(e.currentTarget.getAttribute('state'))
            bennysVehModifications[18] = state
            shopContent.querySelector('.forceactive').classList.remove('forceactive')
            e.currentTarget.classList.add('forceactive')
            sendClientModificationRequest(18, { state })
        })
    })

    setHomeItemClickHandler('plate', () => {
        let innerHTML = '';
        
        const plates = [
            'Azul / Branco 1',
            'Amarelo / Preto',
            'Amarelo / Azul',
            'Azul / Branco 2',
            'Azul / Branco 3',
            'Yankton'
        ]

        plates.forEach((v, k) => innerHTML += `<button ${bennysVehModifications.plate == k ? 'class="forceactive"' : ""} plate="${k}">${v}</button>`)

        shopContent.innerHTML = `
            <div class="column-grid grid-buttons">
                ${innerHTML}
            </div>
        `

        shopContent.querySelectorAll('button').forEach(e => {
            e.onclick = e => {
                const plate = parseInt(e.currentTarget.getAttribute('plate'))
                bennysVehModifications.plate = plate
                shopContent.querySelector('.forceactive').classList.remove('forceactive')
                e.currentTarget.classList.add('forceactive')
                sendClientModificationRequest('plateIndex',{plate})
            }

            if (cfg.previewOnItemHover) {
                e.onmouseenter = e => {
                    const plate = parseInt(e.currentTarget.getAttribute('plate'))
                    sendClientModificationRequest('plateIndex', { plate, hover: true })
                }

                e.onmouseleave = e => {
                    sendClientModificationRequest('plateIndex', { plate: bennysVehModifications.plate, hover: true })
                }
            }
        })
    })

    setHomeItemClickHandler('xenon', () => {
        let innerHTML = ``;

        let xenonColours = [
			{name: "Branco", color:"#fff"},
			{name: "Azul", color:"#0021ff"},
			{name: "Azul Elétrico", color:"#006eff"},
			{name: "Verde Menta", color:"#00ff9d"},
			{name: "Verde Limão", color:"#6eff00"},
			{name: "Amarelo", color:"#eeff00"},
			{name: "Dourado", color:"#ffbf00"},
			{name: "Laranja", color:"#ff6100"},
			{name: "Vermelho", color:"#ff0004"},
			{name: "Rosa", color:"#ff005d"},
			{name: "Rosa Choque", color:"#ff00e1"},
			{name: "Roxo", color:"#2600ff"},
			{name: "Luz Negra", color:"#0c00ff"},
		];
        xenonColours[-1] = { name: "Original", color: '' };
        
        xenonColours.forEach((v, k) => innerHTML += `
            <div class="item-color ${k == bennysVehModifications.xenonColour ? 'item-color-active' : ''}" value="${k}">
                <div class="color-palete" style="background-color: ${v.color}"></div>
            </div>
			`);

        shopContent.innerHTML = `
            <div class="column-grid grid-buttons">
                <button ${bennysVehModifications[22] ? 'class="forceactive"' : ""} state="true" >Ativar</button>
                <button ${!bennysVehModifications[22] ? 'class="forceactive"' : ""} >Desativar</button>
            </div>
            <div class="itens-grid grid" id="${k}">
                <div class="grid-content">
                    ${innerHTML}
                </div>
            </div>
        `

        shopContent.querySelectorAll(".item-color").forEach(e => {
            e.onclick = e => {
                const value = parseInt(e.currentTarget.getAttribute('value'))
                shopContent.querySelector('.item-color-active')?.classList.remove('item-color-active')
                bennysVehModifications.xenonColour = value
                sendClientModificationRequest('xenonColour',{value})
            }

            if (cfg.previewOnItemHover) {
                e.onmouseenter = e => {
                    const value = parseInt(e.currentTarget.getAttribute('value'))
                    sendClientModificationRequest('xenonColour', { value, hover: true })
                }

                e.onmouseleave = e => {
                    sendClientModificationRequest('xenonColour', { value: bennysVehModifications.xenonColour, hover: true })
                }
            }
        })

        shopContent.querySelectorAll("button").forEach(e => {
            e.onclick = e => {
                const state = Boolean(e.currentTarget.getAttribute('state'))
                bennysVehModifications[22] = state
                document.querySelector('.forceactive')?.classList.remove('forceactive')
                e.currentTarget.classList.add('forceactive')
                sendClientModificationRequest(22,{state})
            }

            if (cfg.previewOnItemHover) {
                e.onmouseenter = e => {
                    const state = Boolean(e.currentTarget.getAttribute('state'))
                    if (!e.currentTarget.classList.contains('forceactive')) sendClientModificationRequest(22, { state, hover: true })
                }

                e.onmouseleave = e => {
                    sendClientModificationRequest(22, { state: bennysVehModifications[22], hover: true })
                }
            }
        })
    })

    setHomeItemClickHandler('neon', () => {
        const neonPositions = ["Esquerda", "Direita", "Frente", "Atrás"];
        let innerHTML = ''

		neonPositions.forEach((v, k) => innerHTML += `<button ${ bennysVehModifications.neon[k] ? 'class="forceactive"' : "" } index="${k}" >${v}</button> `)

		shopContent.innerHTML = `
            <div class="column-grid grid-buttons">
                ${innerHTML}
            </div>
            <div class="color-grid">
                <input type="color" value="${rgbToHex(bennysVehModifications.neon.color.r,bennysVehModifications.neon.color.g,bennysVehModifications.neon.color.b)}">
            </div>
        `;
        
        shopContent.querySelectorAll('button').forEach(e => {
            e.onclick = e => {
                const index = parseInt(e.currentTarget.getAttribute('index'))
                const state = e.currentTarget.classList.contains('forceactive')
                e.currentTarget.classList.toggle('forceactive')
                bennysVehModifications.neon[index] = !state
                sendClientModificationRequest('neon', {state:!state,index})
            }

            if (cfg.previewOnItemHover) {
                e.onmouseenter = e => {
                    const index = parseInt(e.currentTarget.getAttribute('index'))
                    const state = e.currentTarget.classList.contains('forceactive')
                    if (!state) sendClientModificationRequest('neon', { state: !state, index, hover: true })
                }

                e.onmouseleave = e => {
                    const index = parseInt(e.currentTarget.getAttribute('index'))
                    sendClientModificationRequest('neon', { state: bennysVehModifications.neon[index], index, hover: true })
                }
            }
        })

        shopContent.querySelector('input[type=color]').oninput = e => {
            const rgb = hexToRgb(e.currentTarget.value)
            bennysVehModifications.neon.color = rgb
            sendClientModificationRequest('neonColor', rgb, false)
        }
    })

    setHomeItemClickHandler('windowTintColour', () => {
        let innerHTML = ''
        const windowColors = [
			"Normal",
			"Preto",
			"Cinza Escuro",
			"Cinza Claro",
			"Original",
			"Limousine",
			"Verde",
		];

		windowColors.map((v, k) =>innerHTML += `<button ${ bennysVehModifications.windowTint == k ? 'class="forceactive"' : "" } value="${k}" >${v}</button>`);

		shopContent.innerHTML = ` <div class="column-grid grid-buttons"> ${innerHTML} </div> `;

        shopContent.querySelectorAll('button').forEach(e => {
            e.onclick = (e) => {
                const { currentTarget } = e
                const value = parseInt(currentTarget.getAttribute('value'))
                shopContent.querySelector('.forceactive').classList.remove('forceactive')
                currentTarget.classList.add('forceactive')
                bennysVehModifications.windowTint = value
                sendClientModificationRequest('windowTint', { value })
            }
            
            if (cfg.previewOnItemHover) {
                e.onmouseenter = (e) => {
                    const { currentTarget } = e
                    const value = parseInt(currentTarget.getAttribute('value'))
                    sendClientModificationRequest('windowTint', { value, hover: true })
                }

                e.onmouseleave = (e) => {
                    sendClientModificationRequest('windowTint', { value: bennysVehModifications.windowTint, hover: true })
                }
            }
        })
    })

    setHomeItemClickHandler('tyreSmoke', () => {
        nyo_bennys.fetch('startBurnout', {})

        shopContent.innerHTML = `
        <div class="column-grid grid-buttons">
            <button ${bennysVehModifications[20] ? 'class="forceactive"' : ''} state="true">Ativar</button>
            <button ${!bennysVehModifications[20] ? 'class="forceactive"': ''} >Desativar</button>
        </div>

        <div class="color-grid">
            <input type="color" value="${rgbToHex(
                bennysVehModifications.tyreSmokeColour.r,
                bennysVehModifications.tyreSmokeColour.g,
                bennysVehModifications.tyreSmokeColour.b
            )}">
        </div>
    `

        shopContent.querySelector('input[type=color]').oninput = (e) => {
            const { currentTarget } = e
            const rgb = hexToRgb(currentTarget.value)
            bennysVehModifications.tyreSmokeColour = rgb
            sendClientModificationRequest('tyreSmokeColor', rgb, false)
        }

        shopContent.querySelectorAll('button').forEach(e => {
            e.onclick = (e) => {
                const state = e.currentTarget.getAttribute('state') ? true : false
                shopContent.querySelector('.forceactive').classList.remove('forceactive')
                e.currentTarget.classList.add('forceactive')
                bennysVehModifications[20] = state
                sendClientModificationRequest(20, { state })
                if (!state) {
                    nyo_bennys.fetch('stopBurnout', {})
                    setTimeout(() => nyo_bennys.fetch('startBurnout', {}), 2000)
                }
            }
        })
    })
    
    setHomeItemClickHandler('pearlescentColour', () => { 
        let innerHTML = ''
        bennysWheelColours.map((v) => {
			innerHTML += `
            <div class="item-color ${v.colorindex == bennysVehModifications.pearlescentColour ? 'item-color-active' : ''}" colour-index="${v.colorindex}">
                <div class="color-palete" style="background-color: ${v.color}"></div>
            </div>
			`;
		});

        shopContent.innerHTML = `
            <div class="itens-grid grid" id="${k}">
                <div class="grid-content">
                    ${innerHTML}
                </div>
            </div>
        `;

        shopContent.querySelectorAll('.item-color').forEach(e => {
            e.onclick = e => {
                const { currentTarget } = e
                const colourIndex = parseInt(currentTarget.getAttribute('colour-index'))
                bennysVehModifications.pearlescentColour = v.colourIndex
                document.querySelector('.item-color-active').classList.remove('item-color-active')
                currentTarget.classList.add('item-color-active')
                sendClientModificationRequest('pearlescentColour', { colourIndex })
            }

            if (cfg.previewOnItemHover) {
                e.onmouseenter = e => {
                    const { currentTarget } = e
                    const colourIndex = parseInt(currentTarget.getAttribute('colour-index'))
                    sendClientModificationRequest('pearlescentColour', { colourIndex, hover: true })
                }

                e.onmouseleave = e => {
                    sendClientModificationRequest('pearlescentColour', { colourIndex: bennysVehModifications.pearlescentColour, hover: true })
                }
            }
        })
    })
    
    setHomeItemClickHandler('primaryColour', () => { 
        let paintTypes = "";

		bennysPaintTypes.forEach((v, k) => paintTypes += `<button ${bennysVehModifications.primaryPaintType == k ? 'class="forceactive"' : "" } paint-type="${k}">${v}</button>`);

		shopContent.innerHTML = `
            <div class="column-grid grid-buttons">
                ${paintTypes}
            </div>
            <div class="color-grid">
                <input type="color" value="${rgbToHex(
					bennysVehModifications.primaryColour.r,
					bennysVehModifications.primaryColour.g,
					bennysVehModifications.primaryColour.b
				)}">
            </div>
        `;

        shopContent.querySelector('input[type=color]').oninput = (e) => {
            const { currentTarget } = e
            let rgb = hexToRgb(currentTarget.value);
            bennysVehModifications.primaryColour = rgb
            sendClientModificationRequest('colour', { ...rgb, type: 1 }, false)
        }

        shopContent.querySelectorAll('button[paint-type]').forEach(e => {
            e.onclick = (e) => {
                const { currentTarget } = e
                const paintType = parseInt(currentTarget.getAttribute('paint-type'))
                bennysVehModifications.primaryPaintType = paintType
                document.querySelector('.forceactive').classList.remove('forceactive')
                currentTarget.classList.add('forceactive')
                sendClientModificationRequest('paintType', { paintType, type: 1 })
            }

            if (cfg.previewOnItemHover) {
                e.onmouseenter = e => {
                    const { currentTarget } = e
                    const paintType = parseInt(currentTarget.getAttribute('paint-type'))
                    sendClientModificationRequest('paintType', { paintType, type: 1, hover: true })
                }

                e.onmouseleave = e => {
                    sendClientModificationRequest('paintType', { paintType: bennysVehModifications.primaryPaintType, type: 1, hover: true })
                }
            }
        })
    })
    
    setHomeItemClickHandler('secondaryColour', () => {
		let paintTypes = "";

		bennysPaintTypes.map((v, k) => paintTypes += `<button ${ bennysVehModifications.secondaryPaintType == k ? 'class="forceactive"' : "" } paint-type="${k}" >${v}</button>`);

		shopContent.innerHTML = `
            <div class="column-grid grid-buttons">
                ${paintTypes}
            </div>
            <div class="color-grid">
                <input type="color" value="${rgbToHex(
					bennysVehModifications.secondaryColour.r,
					bennysVehModifications.secondaryColour.g,
					bennysVehModifications.secondaryColour.b
				)}">
            </div>
        `;

        shopContent.querySelector('input[type=color]').oninput = (e) => {
            const { currentTarget } = e
            let rgb = hexToRgb(currentTarget.value);
            bennysVehModifications.secondaryColour = rgb
            sendClientModificationRequest('colour', { ...rgb, type: 2 }, false)
        }

        shopContent.querySelectorAll('button[paint-type]').forEach(e => {
            e.onclick = (e) => {
                const { currentTarget } = e
                const paintType = parseInt(currentTarget.getAttribute('paint-type'))
                bennysVehModifications.secondaryPaintType = paintType
                document.querySelector('.forceactive')?.classList.remove('forceactive')
                currentTarget.classList.add('forceactive')
                sendClientModificationRequest('paintType', { paintType, type: 2 })
            }

            if (cfg.previewOnItemHover) {
                e.onmouseenter = e => {
                    const { currentTarget } = e
                    const paintType = parseInt(currentTarget.getAttribute('paint-type'))
                    sendClientModificationRequest('paintType', { paintType, type: 2, hover: true })
                }

                e.onmouseleave = e => {
                    sendClientModificationRequest('paintType', { paintType: bennysVehModifications.secondaryPaintType, type: 2, hover: true })
                }
            }
        })
    })
    
    setHomeItemClickHandler('wheelColour', () => { 
        let innerHTML = ''
        bennysWheelColours.map((v) => innerHTML += `
            <div class="item-color ${bennysVehModifications.wheelColour == v.colorindex ? 'item-color-active' : ''}" colour-index="${v.colorindex}">
                <div class="color-palete" style="background-color: ${v.color}"></div>
            </div>
			`);

        shopContent.innerHTML = `
            <div class="itens-grid grid" id="${k}">
                <div class="grid-content">
                    ${innerHTML}
                </div>
            </div>
        `;

        shopContent.querySelectorAll('.item-color').forEach(e => {

            e.onclick = e => {
                const colourIndex = parseInt(e.currentTarget.getAttribute('colour-index'))
                shopContent.querySelector('.item-color-active')?.classList.remove('item-color-active')
                e.currentTarget.classList.add('item-color-active')
                bennysVehModifications.wheelColour = colourIndex
                sendClientModificationRequest('wheelColour', {colourIndex})
            }

            if (cfg.previewOnItemHover) {
                e.onmouseenter = e => {
                    console.log('mouseover')
                    const colourIndex = parseInt(e.currentTarget.getAttribute('colour-index'))
                    sendClientModificationRequest('wheelColour', { colourIndex, hover: true })
                }

                e.onmouseleave = e => {
                    console.log('mouseout')
                    sendClientModificationRequest('wheelColour', { colourIndex: bennysVehModifications.wheelColour, hover: true })
                }
            }

        })
    })
    
    setHomeItemClickHandler('23', () => { 
        let text = "";
        let innerHTML = '';
        
        if (bennysIsBike) {
            let bgImg = `${nyo_bennys_images}/wheels/type_6/0`;
            let dfUrl = `${nyo_bennys_images}/default/23`
            text = `
                <div class="item" wheel-type="6" style="background-image: url('${bgImg}.png');">
                    <span>Roda Dianteira</span>
                </div>
                <div class="item" wheel-type="6" rear-wheel="true" style="background-image: url('${bgImg}.png'), url('${dfUrl}.png');">
                    <span>Roda Traseira</span>
                </div>
            `
        } else {
            for (let i = 0; i <= 12; i++) {
                if (i != 6) {
                    let bgImg = `${nyo_bennys_images}/wheels/type_${i}/0`;
                    let dfUrl = `${nyo_bennys_images}/default/23`
                    text += `
                    <div class="item" wheel-type="${i}" style="background-image: url('${bgImg}.png'), url('${dfUrl}.png');">
                        <span>${bennysWheelTypes[i]}</span>
                    </div>`;
                }
            }
        }

        innerHTML += `
            ${bennysConfig.customTires ? `
                <h4>Pneus Customizados</h4>
                <div class="column-grid grid-buttons customTires1">
                    <button class="${bennysVehModifications.customTires1 && 'forceactive'}" state="true">Ativar</button>
                    <button class="${!bennysVehModifications.customTires1 && 'forceactive'}" >Desativar</button>
                </div>`: ""
            }
            ${bennysConfig.bulletProofTyres ?
            ` 
                ${bennysConfig.customTires ? '<br/>' : '' }
                <h4>Pneus à Prova de Balas</h4>
                <div class="column-grid grid-buttons bulletProofTyres">
                    <button class="${ !bennysVehModifications.bulletProofTyres && 'forceactive' }" state="true" >Ativar</button>
                    <button class="${ bennysVehModifications.bulletProofTyres && 'forceactive' }" >Desativar</button>
                </div> `: ""
            }
            <div class="itens-grid grid">
                <div class="grid-content">
                    ${text}
                </div>
            </div>
        `;

		shopContent.innerHTML = innerHTML;

        shopContent.querySelectorAll('.customTires1 button').forEach(e => {

            e.onclick = e => {
                const state = Boolean(e.currentTarget.getAttribute('state'))
                bennysVehModifications.customTires1 = state
                shopContent.querySelector('.customTires1 .forceactive')?.classList.remove('forceactive')
                e.currentTarget.classList.add('forceactive')
                sendClientModificationRequest('customTires',{customTires:state, customTiresType:1})
            }

            if (cfg.previewOnItemHover) {
                e.onmouseenter = e => {
                    const state = Boolean(e.currentTarget.getAttribute('state'))
                    if (!e.currentTarget.classList.contains('forceactive')) sendClientModificationRequest('customTires',{customTires:state,customTiresType:1,hover:true})
                }

                e.onmouseleave = e => {
                    sendClientModificationRequest('customTires',{customTires:bennysVehModifications.customTires1,customTiresType:1,hover:true})
                }
            }

        })

        shopContent.querySelectorAll('.bulletProofTyres button').forEach(e => {

            e.onclick = e => {
                const state = Boolean(e.currentTarget.getAttribute('state'))
                bennysVehModifications.bulletProofTyres = state
                shopContent.querySelector('.bulletProofTyres .forceactive')?.classList.remove('forceactive')
                e.currentTarget.classList.add('forceactive')
                sendClientModificationRequest('bulletProofTyres',{state})
            }

            if (cfg.previewOnItemHover) {
                e.onmouseenter = e => {
                    const state = Boolean(e.currentTarget.getAttribute('state'))
                    if (!e.currentTarget.classList.contains('forceactive')) sendClientModificationRequest('bulletProofTyres',{state,hover:true})
                }

                e.onmouseleave = e => {
                    sendClientModificationRequest('bulletProofTyres',{state:bennysVehModifications.bulletProofTyres,hover:true})
                }
            }

        })

        shopContent.querySelectorAll('.item[wheel-type]').forEach(e => {
            e.onclick = e => {
                let wheelType = parseInt(e.currentTarget.getAttribute("wheel-type"));
                let rearWheel = Boolean(e.currentTarget.getAttribute('rear-wheel'))
                console.log(wheelType)
                let innerHTML = "";
            
                bennysInWheelsMenu = true
                
                if (!bennysIsBike) {
                    for ( let i = -1; i <= bennysAvailableModifications[23][1][wheelType].numMods - 1; i++) {
                        let imgUrl = i == -1 ? `${nyo_bennys_images}/${bennysVName}/wheel_default` : `${nyo_bennys_images}/wheels/type_${wheelType}/${i}`
                        let dfUrl = `${nyo_bennys_images}/default/23`
                        innerHTML += `
                            <div class="item-menu ${ (bennysVehModifications.wheelType == wheelType && bennysVehModifications[23] == i) ? "forceactive" : '' }" wheel-type="${wheelType}" wheel-index="${i}" style="background-image: url('${imgUrl}.png'), url('${dfUrl}.png');">
                                <div>
                                    <span>${i == -1 ? "Original": bennysAvailableModifications[23][1][wheelType][i] }</span>
                                    <b>R$ ${bennysModTypes[23].price + ( bennysModTypes[23].increaseBy * i )}</b>
                                </div>
                            </div>
                        `;
                    }
                } else {
                    for (let i = -1;i <= bennysAvailableModifications[23][1][wheelType].numMods - 1;i++ ) {
                        let imgUrl = i == -1 ? `${nyo_bennys_images}/${bennysVName}/wheel_default` : `${nyo_bennys_images}/wheels/type_6/${i}`
                        let dfUrl = `${nyo_bennys_images}/default/23`
                        innerHTML += `
                            <div class="item-menu ${bennysVehModifications[rearWheel ? 24 : 23] == i ?"forceactive" : ''}" wheel-type="${6}" wheel-index="${i}" style="background-image: url('${imgUrl}.png'), url('${dfUrl}.png');">
                                <div>
                                    <span>${ i == -1 ? "Original" : bennysAvailableModifications[23][1][wheelType][i]}</span>
                                    <b>R$ ${bennysModTypes[23].price + ( bennysModTypes[23].increaseBy * i )}</b>
                                </div>
                            </div>
                        `;
                    }
                }
            
                innerHTML = '<div class="column-grid">' + innerHTML + "</div>";
            
                shopContent.innerHTML = innerHTML

                shopContent.querySelectorAll('.item-menu[wheel-index]').forEach(e => {
                    e.onclick = e => {
                        const wheelType = parseInt(e.currentTarget.getAttribute('wheel-type'))
                        const wheelIndex = parseInt(e.currentTarget.getAttribute('wheel-index'))
                        bennysVehModifications.wheelType = wheelType
                        bennysVehModifications[rearWheel ? 24 : 23] = wheelIndex
                        shopContent.querySelector('.forceactive')?.classList.remove('forceactive')
                        e.currentTarget.classList.add('forceactive')
                        sendClientModificationRequest('wheel',{wheelType,wheelIndex,rearWheel})
                    }

                    if (cfg.previewOnItemHover) {
                        e.onmouseenter = e => {
                            const wheelType = parseInt(e.currentTarget.getAttribute('wheel-type'))
                            const wheelIndex = parseInt(e.currentTarget.getAttribute('wheel-index'))
                            sendClientModificationRequest('wheel',{wheelType,wheelIndex,rearWheel,hover:true},false)
                        }
    
                        e.onmouseleave = e => {
                            sendClientModificationRequest('wheel',{wheelType:bennysVehModifications.wheelType,wheelIndex:bennysVehModifications[rearWheel ? 24 : 23],rearWheel,hover:true},false)
                        }
                    }
                })
            }

            e.onmouseenter = e => e.currentTarget.classList.add('active')
            e.onmouseleave = e => e.currentTarget.classList.remove('active')
        })

    })

    function handleBennysItemClick(e) {
        const { currentTarget } = e
        const modIndex = currentTarget.getAttribute('mod-index')
        if (homeItemClickHandlers[modIndex]) homeItemClickHandlers[modIndex]()
        else {
            let innerHTML = ``;

            for (let i = -1; i < bennysAvailableModifications[modIndex][0]; i++) {
                let imgUrl = `${nyo_bennys_images}/${bennysVName}/mod_${modIndex}/${i}`
                let defaultUrl = `${nyo_bennys_images}/default/${modIndex}`
                innerHTML += `
                    <div class="item-menu ${bennysVehModifications[modIndex] == i && "forceactive"}" mod-value="${i}"style="background-image: url('${imgUrl}.png'), url('${defaultUrl}.png');">
                        <div>
                            <span>${
                                customNames[modIndex]
                                    ? customNames[modIndex][i]
                                    : i == -1
                                    ? "Original"
                                    : bennysAvailableModifications[modIndex][1][
                                            i
                                      ] || "Nível " + (i + 1)
                            }</span>
                            <b>R$ ${bennysModTypes[modIndex].price + (bennysModTypes[modIndex].increaseBy * i)}</b>
                        </div>
                    </div>
                `;
            }
    
            shopContent.innerHTML = '<div class="column-grid">' + innerHTML + "</div>";

            shopContent.querySelectorAll(".item-menu").forEach(e => {
                e.onclick = e => {
                    const value = parseInt(e.currentTarget.getAttribute('mod-value'))
                    bennysVehModifications[modIndex] = value;
                    shopContent.querySelector('.forceactive').classList.remove('forceactive')
                    e.currentTarget.classList.add('forceactive')
                    sendClientModificationRequest(parseInt(modIndex), {modIndex: value})
                }

                e.onmouseenter = e => {
                    const value = parseInt(e.currentTarget.getAttribute('mod-value'))
                    sendClientModificationRequest(parseInt(modIndex), {modIndex: value, hover:true})
                }

                e.onmouseleave = e => {
                    sendClientModificationRequest(parseInt(modIndex), {modIndex: bennysVehModifications[modIndex], hover:true})
                }
            })
        }

    }
    
    document.querySelectorAll(".bennys-item").forEach(element => {
        element.onmouseenter = e => e.currentTarget.classList.add('active')
        element.onmouseleave = e => e.currentTarget.classList.remove('active')
        element.onclick = handleBennysItemClick
    })

    document.getElementById('bennys-return-button').onclick = e => {
        if (bennysInWheelsMenu) {
            homeItemClickHandlers[23]()
            bennysInWheelsMenu = false
        } else setHomeMenu(bennysRawConfig)
    }
}

function updateHoverActive() {
	$(".item").mouseenter(function () {
		$(this).addClass("active");
	});

	$(".item").mouseleave(function () {
		$(this).removeClass("active");
	});
}

let bennysRawConfig

function initBennysNUI({
	config,
	vehModifications,
	availableModifications,
	modTypes,
	vname,
	isBike,
    rawConfig
}) {
    bennysConfig = config
	bennysModTypes = modTypes;
	bennysAvailableModifications = availableModifications;
	bennysVehModifications = vehModifications;
	bennysVName = vname;
	bennysIsBike = isBike;
    bennysRawConfig = rawConfig
	bennysTotalPrice = 0;
	changedMods = {};

    document.getElementById('bennys-cart-price').innerHTML = `<span lang="ui-currency-symbol"></span>${new Intl.NumberFormat(nyo_bennys.currentLanguage, { minimumFractionDigits: 2 }).format(0)}`

	setHomeMenu(rawConfig);
}


function returnMenuBennys() {
    if (bennysInWheelsMenu) {
        handleHomeMenuItemClick(null, 23)
        bennysInWheelsMenu = false
    } else {
        setHomeMenu(bennysRawConfig)
    }
}

nyo_bennys.registerOpenUiFunction((data) => {
    initBennysNUI(data)
})

nyo_bennys.registerCloseUiFunction(() => {
    FetchData('bennysClose', {})
})

nyo_bennys.addKeyPressHandler('h', () => {
    FetchData("bennysSetFocus", {});
})