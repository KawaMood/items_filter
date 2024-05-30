#> pk_it_fi:blocks/items_filter/place/data/set_facing/player_wall_head

# North (default)
# East
execute if block ~ ~ ~ player_wall_head[facing=east] run scoreboard players set $temp pk.custom_block.facing 1
# South
execute if block ~ ~ ~ player_wall_head[facing=south] run scoreboard players set $temp pk.custom_block.facing 2
# West
execute if block ~ ~ ~ player_wall_head[facing=west] run scoreboard players set $temp pk.custom_block.facing 3