fx_version 'cerulean'
game 'gta5'

repository 'https://github.com/Qbox-project/y_mechanic'
version '1.0.1'

ox_lib 'locale'

shared_scripts {
	'@ox_lib/init.lua',
}

client_scripts {
    '@qbx_core/modules/playerdata.lua',
	'client/*.lua'
}

server_script 'server/*.lua'

files {
    'modules/utils.lua',
	'locales/*.json',
	'config/client.lua'
}

lua54 'yes'
use_experimental_fxv2_oal 'yes'