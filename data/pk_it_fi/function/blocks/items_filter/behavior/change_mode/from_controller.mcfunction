#> pk_it_fi:blocks/items_filter/behavior/change_mode/from_controller

# Define score $update.mode: 0 lax, 1 strict
scoreboard players set $update.mode pk.temp 0
execute if entity @s[tag=pk.it_fi.mode.lax] run scoreboard players set $update.mode pk.temp 1
execute if score $update.mode pk.temp matches 0 run function pk_it_fi:blocks/items_filter/behavior/change_mode/lax/run
execute if score $update.mode pk.temp matches 1 run function pk_it_fi:blocks/items_filter/behavior/change_mode/strict/run