#> pk_it_fi:base/update/from_v2/start

# Check if an update is in progress
execute if score $updating pk.value matches 1 run tellraw @s {"text": "Error: Another update is already in progress.","color": "red"}
execute if score $updating pk.value matches 1 run return fail

# Mark updater
tag @s add pk.update_from_v2

# Starting the process
tellraw @s [{"text": "Starting to update all features from ","color": "gray"},{"text": "KawaMood's Hopper Sorter (V.2)","color": "aqua","bold": true},{"text": "...","color": "gray"}]
scoreboard players set $updating pk.value 1
data remove storage pk:common update

# Update stored blocks in database
#   Items Filters
function pk_it_fi:base/update/from_v2/blocks/start {source:"pk.ho_so:data Blocks.HopperSorters",block_id:"items_filter"}

# Recreate all blocks
function pk_it_fi:tools/debug/recreate_all_blocks/start {source:"pk:it_fi database.items_filters", block_id:"items_filter", fallback: "function pk_it_fi:base/update/from_v2/stop"}