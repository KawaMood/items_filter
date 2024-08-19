#> pk_it_fi:blocks/items_filter/behavior/change_mode/strict/run
# @context item filters controller at @s

# Stop the update process
scoreboard players set $update.stop pk.temp 1

# Update marker
tag @s remove pk.it_fi.mode.lax
tag @s add pk.it_fi.mode.strict

# Update indicator
execute as @e[type=item_display,tag=pk.it_fi.items_filter.mode_indicator,predicate=pk_it_fi:scores/custom_block/component_id/match_temp,limit=1,distance=..10] run function pk_it_fi:blocks/items_filter/behavior/change_mode/strict/mode_indicator

# Update database
data modify storage pk:common params set value {p1:"data modify storage pk:it_fi database.items_filters[{id:",p2:"}].mode set value \"strict\""}
data modify storage pk:common params.v1 set from entity @s data.items_filter.id
function pk_it_fi:packages/dynamic_command/1_var with storage pk:common params

# Animations
playsound block.lever.click block @a[distance=..30] ~ ~ ~ 1 0.6