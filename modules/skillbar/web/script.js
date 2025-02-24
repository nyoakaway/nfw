const nyo_skillbar = new Module('skillbar')


nyo_skillbar.registerOpenUiFunction((data) => {
    Skillbar.Start(data);
})

nyo_skillbar.registerCloseUiFunction(() => {
})

nyo_skillbar.addMessageHandler('skillRepeat', (data) => {
    Skillbar.Start(data);
})

nyo_skillbar.addMessageHandler('skillStop', (data) => {
    Skillbar.Stop();
})

nyo_skillbar.addMessageHandler('skillCheck', (data) => {
    Skillbar.Check(data);
})

$(document).ready(function(){
    Skillbar = {};

    Skillbar.Start = function(data) {
        $("mgSkillBar .bar-check").css({"right": data.pos + "%"});
        $("mgSkillBar .bar-check").css({"width": data.width + "%"});
        $("mgSkillBar .bar-container").fadeIn('fast', function() {
            $("mgSkillBar .bar-total").stop().css({"width": 0}).animate({
              width: '100%'
            }, {
              duration: parseInt(data.duration),
              easing: 'linear',
              complete: function() {
                var Percentage = Math.round((($("mgSkillBar .bar-total").width() / $("mgSkillBar .bar-container").width()) * 100));
                $("mgSkillBar .bar-check").css({
                    "background-color": "rgba(231, 76, 60, 0.897)"
                });
                $("mgSkillBar .bar-total").stop();
                    $("mgSkillBar .bar-container").fadeOut('fast', function() {
                        $("mgSkillBar .bar-total").css("width", 0);
                        $("mgSkillBar .bar-check").css({"background-color": "rgba(65, 65, 65, 0.897)"});
                        FetchData('Check', {success:false})
                    });
              }
            });
        });
    }

    Skillbar.Stop = function() {
        $("mgSkillBar .bar-container").fadeOut('fast', function() {
            $("mgSkillBar .bar-total").css("width", 0);
        })
    }

    Skillbar.Check = function(data) {
        var Percentage = (($("mgSkillBar .bar-total").width() / $("mgSkillBar .bar-container").width()) * 100);
        var Check = 100 - data.data.pos
        var Minimum = Check - (data.data.width)

        $("mgSkillBar .bar-total").stop();
        if (Percentage + 2 >= Minimum && Percentage - 2 <= Check) {
            $("mgSkillBar .bar-check").css({
                "background-color": "#9fff78"
            });
            FetchData('Check', {success:true})
        } else {
            $("mgSkillBar .bar-check").css({
                "background-color": "rgba(231, 76, 60, 0.897)"
            });
            FetchData('Check', {success:false})
        }

        $("mgSkillBar .bar-container").fadeOut('fast', function() {
            $(".bar-total").css("width", 0);
            $(".bar-check").css({"background-color": "rgba(65, 65, 65, 0.897)"});
        });
    }
});