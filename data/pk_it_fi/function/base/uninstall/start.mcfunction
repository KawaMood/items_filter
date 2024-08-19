#> pk_it_fi:base/uninstall/start

tag @s add pk.it_fi.uninstaller
tellraw @s [{"text": "Starting ","color": "gray"},{"text": "KawaMood's Items Filter","color": "aqua","bold": true},{"text": " uninstallation...","color": "gray"}]
execute store result score $pk.it_fi.uninstall.items_filters.length pk.value run data get storage pk:it_fi database.items_filters
data modify storage pk:it_fi uninstall.items_filters set from storage pk:it_fi database.items_filters
execute if score $pk.it_fi.uninstall.items_filters.length pk.value matches 0 run function pk_it_fi:base/uninstall/stop
execute if score $pk.it_fi.uninstall.items_filters.length pk.value matches 1.. run function pk_it_fi:base/uninstall/1