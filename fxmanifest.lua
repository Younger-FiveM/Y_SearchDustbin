--shared_script '@WaveShield/resource/waveshield.lua' --this line was automatically written by WaveShield

version '1.0.0'
author 'YOUNGER'
description 'Y_SearchDustbin'

fx_version 'cerulean'
game 'gta5'

client_scripts {
    'config.lua',
    'client/main.lua',
}


server_scripts {
    'config.lua',
	'server/main.lua',
}
