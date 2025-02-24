const item_img = 'http://127.0.0.1/nfw/itens/'

const nyo_notify = new Module('nyo_notify');

// NOTIFY & NOTIFY REQUEST 
nyo_notify.addMessageHandler('notify', (data) => {
    var cssNotify = '#b1b1b1';
    if(data['color'] != undefined){
        cssNotify = data['color'];
    }

    var nIcon = "fa-solid fa-exclamation";
    if(data['icon'] != undefined){
        nIcon = data['icon'];
    }
    
    var notifyClass = "Notify";
    var requestHtml = '';
    var requestHtmlContent = '';
    if(data['request']) { 
        notifyClass = "Request";
        requestHtml = 'notifyRequest'; 
        requestHtmlContent = `
            <div class="Buttons">
                <button id="accept">Y</button>
                <button id="deny">U</button>
            </div>
        `;
    }

    var html = `
        <div class="${notifyClass} containerNotify ${requestHtml}" data-requestId="${data['requestId']}" >
            <i class="${nIcon}" style="color: ${cssNotify}"></i>
            <div class="LeftAbsolute" style="background-color: ${cssNotify}"></div>
            <div class="Infos">
                <p class="Title" style="color: ${cssNotify}">${data['title']}</p>
                <p class="Content">${data['content']}</p>
            </div>
            ${requestHtmlContent}
        </div>
    `;
    
    $(html).appendTo(".NotifysWrapper").hide().fadeIn(1000).delay(data['delay']).fadeOut(1000);
    setTimeout(function(){ 
        var notifys = $(".containerNotify:hidden");
        notifys.remove();
    }, (data['delay']+3000));
})

nyo_notify.addMessageHandler('requestAccept', (data) => {
    var notifys = $(".notifyRequest");
    if(notifys.length > 0){
        var reqId = notifys[0].getAttribute('data-requestId');
        notifys[0].remove();
        $.post('https://nfw/notifyRequestCallBack', JSON.stringify({ type: 'accept', id: reqId }));
    }
})

nyo_notify.addMessageHandler('requestDeny', (data) => {
    var notifys = $(".notifyRequest");
    if(notifys.length > 0){
        var reqId = notifys[0].getAttribute('data-requestId');
        notifys[0].remove();
        $.post('https://nfw/notifyRequestCallBack', JSON.stringify({ type: 'deny', id: reqId }));
    }
})


// NOTIFY ITEM 

nyo_notify.addMessageHandler('notifyItem', (data) => {
    var cssNotify = '#b1b1b1';
    if(data['cor'] != undefined){
        cssNotify = data['cor'];
    }
    var html = `
        <div class="Item containerNotifyItem">
            <div class="LeftAbsolute" style="background-color: ${cssNotify}"></div>
            <img src="${item_img}${data['img']}.png" onerror="this.src='${item_img}item_error.png';">
            <div class="Text">
                <p class="Type" style="color: ${cssNotify}">${data['title']}</p>
                <p class="Qtd">${data['qtd']}x ${data['itemName']}</p>
            </div>
        </div>
    `;

    $(html).appendTo(".ItemsWrapper").hide().fadeIn(1000).delay(data['delay']).fadeOut(1000);
    setTimeout(function(){ 
        var notifys = $(".containerNotifyItem:hidden");
        notifys.remove();
    }, (data['delay']+3000));

})


// PROGRESSBAR
var pStart = false;
nyo_notify.addMessageHandler("progressbar", (data) => {
    if(!pStart){
        pStart = true;
        $(".Progress").css("display", 'flex');
        $(".Progress .Title").html(data['title']);
        $(".progressPorcent").html('0%');
        $(".Progress .Time").html("00:00:00");
        $(".Progress > .Bar > div").css('width', '0%');
        
        var start = new Date();
        var time = data['time']
        var maxTime = time;
        var timeoutVal = Math.floor(maxTime/100);
        animateUpdate();     

        function startTime(nTime) {
            var newTime = parseInt((time - nTime)/1000)+1;
        
            var h = '00';
            var m = '00';
            var s = '00';
        
            
            m = parseInt(newTime / 60);
            s = parseInt(newTime % 60);       
        
            if(m > 60){
                h = parseInt(m / 60);
                m = parseInt(m % 60);            
            }
        
            if(s < 10){
                s = "0"+s;
            }
        
            if(m < 10){
                m = "0"+m;
            }
        
            $(".Progress .Time").html(h+":"+m+":"+s);
        }
        
        function updateProgress(percentage) {
            $(".progressPorcent").html(percentage+'%');
            $(".Progress > .Bar > div").css('width', percentage+'%');
        }
        
        function animateUpdate() {
            var now = new Date();
            var timeDiff = now.getTime() - start.getTime();
            var perc = Math.round((timeDiff/maxTime)*100);
            startTime(timeDiff);
            if (perc <= 100) {
                updateProgress(perc);
                setTimeout(animateUpdate, timeoutVal);
            } else {
                $(".Progress").css("display", 'none');
                pStart = false;
            }
        }

    }
});

// PROMPT
nyo_notify.addMessageHandler('openPrompt', (data) => {
    var title = 'Prompt';
    var text = '';

    if(data['title'] != undefined){ title = data['title']; }
    if(data['text'] != undefined){ text = data['text']; }
    $(".Prompt .Title").html(title);
    $(".textareaPrompt").val(text);
    $(".Prompt").css("display", "flex");    
    $(".textareaPrompt").focus();
});

function promptConfirmar(){
    $(".Prompt").css("display", "none");
    var textVal = $(".textareaPrompt").val();
    $.post('https://nfw/promptCallback', JSON.stringify({ type: 'confirmar', text: textVal }));
}

function promptCancelar(){
    $(".Prompt").css("display", "none");
    $.post('https://nfw/promptCallback', JSON.stringify({ type: 'cancelar' }));
}
  





// nyo_notify.registerOpenUiFunction(({ title, content, color, delay, icon, request, requestId }) => {
//     var cssNotify = '#b1b1b1';
//     if(color != undefined){
//         cssNotify = color;
//     }

//     var nIcon = "fa-exclamation";
//     if(icon != undefined){
//         nIcon = icon;
//     }
    
//     var requestHtml = '';
//     var requestHtmlContent = '';
//     if(request) { 
//         requestHtml = 'notifyRequest'; 
//         requestHtmlContent = '<br><br><hr><br>Y = SIM | U = NÃO';
//     }
//     var html =`
//     <div class="containerNotify ${requestHtml}" data-requestId="${requestId}" style="border: 2px dashed ${cssNotify}88">
//         <div class="contentNotify">   
//             <div class="notify-icon centerNotify" style="background-color: ${cssNotify}50">
//                 <i class="fas ${nIcon} fa-2x" style="filter:drop-shadow(1px 1px 1px #000000);"></i>
//             </div>         
//             <div class="textNotify">
//                 <b>${title}</b>:<br>
//                 ${content}
//                 ${requestHtmlContent}
//             </div>
//         </div>         
//     </div>`;
    
//     $(html).appendTo("notify").hide().fadeIn(1000).delay(delay).fadeOut(1000);
//     setTimeout(function(){ 
//         var notifys = $(".containerNotify:hidden");
//         notifys.remove();
//     }, (delay+3000));
// })



