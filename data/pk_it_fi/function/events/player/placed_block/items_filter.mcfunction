#> pk_it_fi:events/player/placed_block/items_filter

# Revoke advancement
advancement revoke @s only pk_it_fi:events/placed_block/items_filter

# Mark the current player
tag @s add pk.current.player

# Store item data the player used to place the Waystone and tell the process it has been placed by a player
data modify storage pk:common temp.item set from entity @s SelectedItem
scoreboard players set $pk.custom_block.placed_by_player pk.temp 1

# Search the placed block
# @callback function pk_it_fi:blocks/items_filter/place/run
data modify storage pk:common params set value {distance:10,block:"#pk_it_fi:player_heads",nbt:{components:{"minecraft:custom_data":{pk_data:{custom_block:1b,id:"items_filter",from:"items_filter"}}}},callback:"function pk_it_fi:blocks/items_filter/place/run",stop_at_first:true}
function pk_it_fi:packages/search_block/start with storage pk:common params

# Unmark the current player
tag @s remove pk.current.player

# Reset the placing by player score
scoreboard players set $pk.custom_block.placed_by_player pk.temp 0