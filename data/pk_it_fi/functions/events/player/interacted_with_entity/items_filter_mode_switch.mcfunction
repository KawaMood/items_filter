#> pk_it_fi:events/player/interacted_with_entity/items_filter_mode_switch

# Revoke advancement
advancement revoke @s only pk_it_fi:events/player_interacted_with_entity/items_filter_mode_switch

# Search interaction
execute as @e[type=interaction,tag=pk.it_fi.items_filter.mode_switch,distance=..20] at @s if data entity @s interaction run function pk_it_fi:blocks/items_filter/behavior/change_mode/from_interaction