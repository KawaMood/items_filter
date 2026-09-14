# Revoke advancement
advancement revoke @s only pk_it_fi:events/item_used_on_block/items_filter_placer_on_any

# Mark the current player
tag @s add pk.current.player

# Store item data the player used to place the block and tell the process it has been placed by a player
data modify storage pk:common temp.item set from entity @s SelectedItem
scoreboard players set $pk.custom_block.placed_by_player pk.temp 1

# Search the placed entity
execute as @n[type=glow_item_frame,tag=pk.it_fi.block_placer,distance=..20] at @s align xyz run function pk_it_fi:events/player/item_used_on_block/items_filter_placer_on_any/from_placer_entity

# Unmark the current player
tag @s remove pk.current.player

# Reset the placing by player score
scoreboard players set $pk.custom_block.placed_by_player pk.temp 0