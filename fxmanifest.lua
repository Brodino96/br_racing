fx_version "cerulean"
game "gta5"
lua54 "yes"

author "Brodino"
version "dev"
description "A racing script that I would actually use"

shared_scripts { "@oxmysql/lib/MySQL.lua", "config.lua", "shared/utils.lua", "shared/locales/*", }
client_scripts { "client/*", }
server_scripts { "server/*", }

dependencies { "oxmysql", }