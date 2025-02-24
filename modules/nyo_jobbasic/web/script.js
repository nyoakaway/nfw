const nyo_jobbasic = new Module('nyo_jobbasic')

nyo_jobbasic.registerOpenUiFunction(({ job }) => {
    document.querySelector('#actionmenuJobBasic').style.display = 'flex'
    document.querySelector(".textoJobBasicDisplay").innerHTML = job    
})

nyo_jobbasic.registerCloseUiFunction(() => {
    document.querySelector('#actionmenuJobBasic').style.display = 'none'
})