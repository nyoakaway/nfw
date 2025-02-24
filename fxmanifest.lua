fx_version 'bodacious'
game 'gta5'
lua54 'yes'

author 'NyO Network'
description 'NyO Modules'

escrow_ignore {
    'config/**/*.lua',
    'functions/**/*.lua'
}


shared_scripts { 'lib/shared.lua', 'lib/shared.js', 'config/**/*.lua', 'modules/**/config.lua' }
server_scripts { 'lib/server.lua', 'nyo_module_sv.lua', 'functions/**/server.lua', 'modules/**/server.lua', 'modules/**/server.js', "modules/**/server/**/*.lua", "modules/**/server/**/*.js", "modules/**/shared/**/*.lua", "modules/**/shared/**/*.js", 'website/*.lua', "website/main.js" }
client_scripts { 'lib/protect.lua', 'lib/client.lua', 'nyo_module_cl.lua', 'functions/**/client.lua', 'modules/**/client.lua', 'modules/**/client.js', "modules/**/client/**/*.lua", "modules/**/client/**/*.js", "modules/**/shared/**/*.lua", "modules/**/shared/**/*.js" }

ui_page 'web/index.html'
files { 'web/*', 'web/**/*', 'modules/**/web/**/*', 'modules/**/lang/*' }

loadscreen "modules/loadscreen/web/index.html"
