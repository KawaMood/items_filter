#> pk_it_fi:blocks/items_filter/main/on_update
# @context items filter controller at @s

# Store current controller version
execute store result score $version pk.temp run data get entity @s data.items_filter.version

# Switch updates
#   3.1.1
execute unless score $version pk.temp matches 30101.. as @e[type=interaction,tag=pk.it_fi.items_filter.mode_switch,distance=..2] run data modify entity @s response set value 1b

# Update controller version
execute store result entity @s data.items_filter.version int 1 run scoreboard players get $pk.it_fi.version pk.value