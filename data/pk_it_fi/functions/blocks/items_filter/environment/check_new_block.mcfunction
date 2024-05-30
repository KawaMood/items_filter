#> pk_it_fi:blocks/items_filter/environment/check_new_block
# @context the items filter controller at @s

# Scores
scoreboard players set $check.stop pk.temp 0

# Has been pushed by piston
execute if block ~ ~ ~ moving_piston{extending:1b} run function pk_it_fi:blocks/items_filter/environment/move/push
execute if score $check.stop pk.temp matches 1 run return 1

# Has been pulled by piston
execute if predicate pk_it_fi:environment/adjacent_pulling_piston run function pk_it_fi:blocks/items_filter/environment/move/pull
execute if score $check.stop pk.temp matches 1 run return 1

# Has been broken
execute if score $check.stop pk.temp matches 0 run function pk_it_fi:blocks/items_filter/remove/run