const nyo_jobintermed = new Module('nyo_jobintermed')

nyo_jobintermed.registerOpenUiFunction(({ job }) => {
    document.querySelector('#actionmenuJobIntermed').style.display = 'flex'
    document.querySelector(".textoJobIntermedDisplay").innerHTML = job    
})

nyo_jobintermed.registerCloseUiFunction(() => {
    document.querySelector('#actionmenuJobIntermed').style.display = 'none'
})