(() => {
    const module = new Module('nyo_races')
    const raceStatus = document.getElementById("race-status")
    const finishStatus = document.getElementById("race-finish-status")

    function FormatTime(milliseconds) {
        let seconds = Math.floor(milliseconds / 1000)
        let minutes = Math.floor(seconds / 60)
        let ms = String(milliseconds % 1000).padStart(2,'0')
        return `${String(minutes).padStart(2,'0')}:${String(seconds % 60).padStart(2,'0')}:${ms.slice(0,2) + ms.slice(2).replace(/.*/g, '')}`
    }

    module.registerOpenUiFunction(({numPlayers, currentPosition, numLaps, numCheckpoints, }) => {
        raceStatus.style.display = 'flex'
        finishStatus.style.display = 'none'
        raceStatus.innerHTML = `
            <h1>${currentPosition}<b><span>/</span>${numPlayers}</b></h1>
            <div class="timing-race">
                <div class="column">
                    <small lang="ui-racing-current-time"></small>
                    <span>00:00:00</span>
                </div>
                <div class="column">
                    <small lang="ui-racing-current-lap"></small>
                    <span>0/${numLaps}</span>
                </div>
            </div>
            <div class="race-steps">
                <i class="far fa-flag-checkered"></i>
                <span>1/${numCheckpoints}</span>
            </div>
        `
    })

    module.registerCloseUiFunction(() => {

    })

    module.addMessageHandler('update', ({
        numPlayers,
        currentPosition,
        numLaps,
        numCheckpoints,
        currentLap,
        currentCheckpoint,
        time,
        maxRaceTime
    }) => {
        raceStatus.innerHTML = `
            <h1>${currentPosition}<b><span>/</span>${numPlayers}</b></h1>
            <div class="timing-race">
                <div class="column" ${maxRaceTime ? maxRaceTime - time <= 10000 ? 'style="background: #c51e0b;"' : '' :''}>
                    <small lang="ui-racing-current-time"></small>
                    <span>${maxRaceTime ? FormatTime(maxRaceTime - time) : FormatTime(time)}</span>
                </div>
                <div class="column">
                    <small lang="ui-racing-current-lap"></small>
                    <span>${currentLap}/${numLaps}</span>
                </div>
            </div>
            <div class="race-steps">
                <i class="far fa-flag-checkered"></i>
                <span>${currentCheckpoint}/${numCheckpoints}</span>
            </div>
        `
    })

    module.addMessageHandler('finishStatus', (data) => {
        finishStatus.style.display = 'flex'
        raceStatus.style.display = 'none'
        let racers = ''
        for (let i = 0; i < 5; i++) {
            if (data[2][i]) {
                const v = data[2][i]
                racers += `
                <div class="item">
                    <div class="item-info">${i + 1}° <span lang="ui-status-position-text"></span></div>
                    <div class="center">
                        <i class="fas fa-clock"></i>
                        <sub>${FormatTime(v[0])}</sub>
                    </div>
                    <div class="item-info">${v[1]}</div>
                </div>
            `
            } else {
                racers += `
                <div class="item">
                    <div class="item-info"> - </div>
                    <div class="center">
                        <i class="fas fa-clock"></i>
                        <sub> - </sub>
                    </div>
                    <div class="item-info"> - </div>
                </div>
                `
            }
        }
        finishStatus.innerHTML = `
            <div class="title" lang="ui-status-title"></div>
            <small lang="ui-status-subtitle"></small>
            <span>${data[1]}° <span lang="ui-status-position-text"></span></span>
        
            <div class="racers">${racers}</div>
            <p><b lang="ui-status-footer-button">[esc]</b> <span lang="ui-status-footer-text"></span></p>
        `
    })

    module.addMessageHandler('raceCloseUi', (data) => {
        raceStatus.style.display = 'none'
        finishStatus.style.display = 'none'
    })

    // module.registerCloseUiFunction(data => {
    //     raceStatus.style.display = 'none'
    //     finishStatus.style.display = 'none'
    //     module.fetch('close',{})
    // })

})()
