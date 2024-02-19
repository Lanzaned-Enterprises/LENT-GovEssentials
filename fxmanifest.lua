--[[ Metadata ]]--
fx_version 'cerulean'
games { 'gta5' }

-- [[ Author ]] --
author 'Izumi S. <https://discordapp.com/users/871877975346405388>'
description 'Lananed Development | Government Essentials'
discord 'https://discord.lanzaned.com'
github 'https://github.com/Lanzaned-Enterprises/'
docs 'https://docs.lanzaned.com/'

-- [[ Version ]] --
version '1.0.0'

-- [[ Files ]] --
ui_page "html/index.html"

shared_scripts { 
    '@ox_lib/init.lua',
    'shared/*.lua',
}

server_scripts { 
    'server/*.lua',
}

client_scripts {
    -- Client Events
    'client/*.lua',
}

files {
    'html/index.html',
    'html/index.js',
}

-- [[ Tebex ]] --
lua54 'yes'

escrow_ignore {
    'shared/*.lua'
}