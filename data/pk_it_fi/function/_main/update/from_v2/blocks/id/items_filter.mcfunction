#> pk_it_fi:_main/update/from_v2/blocks/id/items_filter
# @input
#   storage pk:common update.old_entry: The current entry from the blocks list to update

# Store old and new entries
data modify storage pk:common update.new_entry set value {mode:"lax"} 

# Set data from old to new entries
#   Id
data modify storage pk:common update.new_entry.id set from storage pk:common update.old_entry.id
#   Owner
data modify storage pk:common update.new_entry.owner set from storage pk:common update.old_entry.Owner.UUID
#   Facing
execute if data storage pk:common update.old_entry{Facing:0b} run data modify storage pk:common update.new_entry.facing set value "south"
execute if data storage pk:common update.old_entry{Facing:1b} run data modify storage pk:common update.new_entry.facing set value "north"
execute if data storage pk:common update.old_entry{Facing:2b} run data modify storage pk:common update.new_entry.facing set value "west"
execute if data storage pk:common update.old_entry{Facing:3b} run data modify storage pk:common update.new_entry.facing set value "east"
#   Location
data modify storage pk:common update.new_entry.location.x set from storage pk:common update.old_entry.x
data modify storage pk:common update.new_entry.location.y set from storage pk:common update.old_entry.y
data modify storage pk:common update.new_entry.location.z set from storage pk:common update.old_entry.z
data modify storage pk:common update.new_entry.location.dimension set from storage pk:common update.old_entry.Dimension

# Append new entry to the datapack's database if the id doesn't exist yet
data modify storage pk:common params set value {p1:"execute unless data storage pk:it_fi database.items_filters[{id:",p2:"}] run data modify storage pk:it_fi database.items_filters prepend from storage pk:common update.new_entry"}
data modify storage pk:common params.v1 set from storage pk:common update.new_entry.id
function pk_it_fi:packages/dynamic_command/1_var with storage pk:common params