#> pk_it_fi:blocks/items_filter/environment/move/pull
# @context the items filter controller at @s

# Switch direction
execute if block ~-1 ~ ~ moving_piston{extending:0b} as @e[type=#pk_it_fi:custom_block/components,tag=pk.it_fi.items_filter.component,predicate=pk_it_fi:scores/custom_block/component_id/match_temp,distance=..2] at @s run tp @s ~-1 ~ ~
execute if block ~1 ~ ~ moving_piston{extending:0b} as @e[type=#pk_it_fi:custom_block/components,tag=pk.it_fi.items_filter.component,predicate=pk_it_fi:scores/custom_block/component_id/match_temp,distance=..2] at @s run tp @s ~1 ~ ~
execute if block ~ ~ ~-1 moving_piston{extending:0b} as @e[type=#pk_it_fi:custom_block/components,tag=pk.it_fi.items_filter.component,predicate=pk_it_fi:scores/custom_block/component_id/match_temp,distance=..2] at @s run tp @s ~ ~ ~-1
execute if block ~ ~ ~1 moving_piston{extending:0b} as @e[type=#pk_it_fi:custom_block/components,tag=pk.it_fi.items_filter.component,predicate=pk_it_fi:scores/custom_block/component_id/match_temp,distance=..2] at @s run tp @s ~ ~ ~1
execute if block ~ ~-1 ~ moving_piston{extending:0b} as @e[type=#pk_it_fi:custom_block/components,tag=pk.it_fi.items_filter.component,predicate=pk_it_fi:scores/custom_block/component_id/match_temp,distance=..2] at @s run tp @s ~ ~-1 ~
execute if block ~ ~1 ~ moving_piston{extending:0b} as @e[type=#pk_it_fi:custom_block/components,tag=pk.it_fi.items_filter.component,predicate=pk_it_fi:scores/custom_block/component_id/match_temp,distance=..2] at @s run tp @s ~ ~1 ~

# Set scores
scoreboard players set $check.stop pk.temp 1
scoreboard players set @s pk.custom_block.move.timer 3

# Update block info
function pk_it_fi:blocks/items_filter/environment/move/update_data

