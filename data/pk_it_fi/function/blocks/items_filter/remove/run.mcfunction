#> pk_it_fi:blocks/items_filter/remove/run
# @context the items filter controller at @s

# Scores
scoreboard players operation $temp pk.custom_block.component.id = @s pk.custom_block.component.id
scoreboard players set $env.stop pk.temp 1

# Load Items Filter data and prepare component-id score
data modify storage pk:common params set value {p1:"data modify storage pk:common temp.items_filter set from storage pk:it_fi database.items_filters[{id:",p2:"}]"}
data modify storage pk:common params.v1 set from entity @s data.items_filter.id
function pk_it_fi:packages/dynamic_command/1_var with storage pk:common params

# Delete from the database
data modify storage pk:common params set value {p1:"data remove storage pk:it_fi database.items_filters[{id:",p2:"}]"}
data modify storage pk:common params.v1 set from storage pk:common temp.items_filter.id
function pk_it_fi:packages/dynamic_command/1_var with storage pk:common params

# Kill dropped GUI items and potential barrel
execute align xyz run kill @e[type=item,nbt={Item:{id:"minecraft:chiseled_deepslate",count:1},Age:0s},dx=0,limit=1]

# Drop the relative item
function pk_it_fi:blocks/items_filter/remove/drop_item

# Force block to be removed
setblock ~ ~ ~ air

# Remove components
kill @e[type=#pk_it_fi:custom_block/components,tag=pk.it_fi.items_filter.component,predicate=pk_it_fi:scores/custom_block/component_id/match_temp,distance=..10]

# Debug logs
execute if score $logs.datapack.it_fi pk.value matches 1 run tellraw @a[tag=pk.dev] [{text: "Items Filter at [", color: "gray"},{nbt:"temp.items_filter.location.x",storage:"pk:common"},{text: ","},{nbt:"temp.items_filter.location.y",storage:"pk:common"},{text: ","},{nbt:"temp.items_filter.location.z",storage:"pk:common"},{text: "] in "},{nbt:"temp.items_filter.location.dimension",storage:"pk:common"},{text: " has been removed"}]