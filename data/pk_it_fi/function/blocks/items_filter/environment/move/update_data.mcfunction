#> pk_it_fi:blocks/items_filter/environment/move/update_data
# @context the items filter controller at @s

# Set location from controller
execute store result storage pk:common temp.location.x int 1 run data get entity @s Pos[0]
execute store result storage pk:common temp.location.y int 1 run data get entity @s Pos[1]
execute store result storage pk:common temp.location.z int 1 run data get entity @s Pos[2]

# Update database
data modify storage pk:common params set value {p1:"data modify storage pk:it_fi database.items_filters[{id:",p2:"}].location merge from storage pk:common temp.location"}
data modify storage pk:common params.v1 set from entity @s data.items_filter.id
function pk_it_fi:packages/dynamic_command/1_var with storage pk:common params

# Debug logs
execute if score $logs.datapack.it_fi pk.value matches 1 run tellraw @a[tag=pk.dev] [{text: "Items Filter has been moved to [",color: "gray"},{nbt:"temp.location.x",storage:"pk:common"},{text: ","},{nbt:"temp.location.y",storage:"pk:common"},{text: ","},{nbt:"temp.location.z",storage:"pk:common"},{text: "]"}]