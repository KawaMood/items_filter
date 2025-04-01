#> pk_it_fi:blocks/items_filter/main/on_entity_load
# Trigger once when the items filter is placed and every time it is loaded from an unloaded area
# @context current items filter's controller (tag=pk.current.controller) at @s

# Prepare scores
scoreboard players operation $temp pk.custom_block.component.id = @s pk.custom_block.component.id
scoreboard players operation @s pk.it_fi.gametime = $gametime pk.value

# Store the current items filter's data in pk:common temp.items_filter
data remove storage pk:common temp.items_filter
data modify storage pk:common params set value {p1:"data modify storage pk:common temp.items_filter set from storage pk:it_fi database.items_filters[{id:",p2:"}]"}
data modify storage pk:common params.v1 set from entity @s data.items_filter.id
function pk_it_fi:packages/dynamic_command/1_var with storage pk:common params

# Check if the data pack's version updated
scoreboard players set $controller.version pk.temp 0
execute store result score $controller.version pk.temp run data get entity @s data.items_filter.version
execute if score $controller.version pk.temp < $pk.it_fi.version pk.value run function pk_it_fi:blocks/items_filter/main/on_update

# Debug logs
execute if score $logs.datapack.it_fi pk.value matches 1 run tellraw @a[tag=pk.dev] [{text: "Items Filter loaded at [",color: "gray"},{nbt:"temp.items_filter.location.x",storage:"pk:common"},{text: ","},{nbt:"temp.items_filter.location.y",storage:"pk:common"},{text: ","},{nbt:"temp.items_filter.location.z",storage:"pk:common"},{text: "] in "},{nbt:"temp.items_filter.location.dimension",storage:"pk:common"}]