#> pk_it_fi:blocks/items_filter/place/data/set_facing/player_head

# Check rotation
scoreboard players set $rotation pk.temp 0
execute if block ~ ~ ~ player_head[rotation=3] run scoreboard players set $rotation pk.temp 3
execute if block ~ ~ ~ player_head[rotation=4] run scoreboard players set $rotation pk.temp 4
execute if block ~ ~ ~ player_head[rotation=5] run scoreboard players set $rotation pk.temp 5
execute if block ~ ~ ~ player_head[rotation=6] run scoreboard players set $rotation pk.temp 6
execute if block ~ ~ ~ player_head[rotation=7] run scoreboard players set $rotation pk.temp 7
execute if block ~ ~ ~ player_head[rotation=8] run scoreboard players set $rotation pk.temp 8
execute if block ~ ~ ~ player_head[rotation=9] run scoreboard players set $rotation pk.temp 9
execute if block ~ ~ ~ player_head[rotation=10] run scoreboard players set $rotation pk.temp 10
execute if block ~ ~ ~ player_head[rotation=11] run scoreboard players set $rotation pk.temp 11
execute if block ~ ~ ~ player_head[rotation=12] run scoreboard players set $rotation pk.temp 12
execute if block ~ ~ ~ player_head[rotation=13] run scoreboard players set $rotation pk.temp 13
execute if block ~ ~ ~ player_head[rotation=14] run scoreboard players set $rotation pk.temp 14

# North (default)
# East
execute if score $rotation pk.temp matches 3..6 run scoreboard players set $temp pk.custom_block.facing 1
# South
execute if score $rotation pk.temp matches 7..10 run scoreboard players set $temp pk.custom_block.facing 2
# West
execute if score $rotation pk.temp matches 11..14 run scoreboard players set $temp pk.custom_block.facing 3