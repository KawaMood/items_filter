#> pk_it_fi:blocks/items_filter/place/data/store

# Set default data values
data modify storage pk:common temp.items_filter set value {mode:"lax",facing:"north"}
#   Version
execute store result storage pk:common temp.items_filter.version int 1 run scoreboard players get $pk.it_fi.version pk.value
#   Id 
execute store result storage pk:common temp.items_filter.id int 1 run scoreboard players get $next pk.custom_block.component.id
#   Location
data modify storage pk:common temp.items_filter.location.dimension set from entity @s Dimension
data modify storage pk:common temp.items_filter.location.x set from storage pk:common temp.block.x
data modify storage pk:common temp.items_filter.location.y set from storage pk:common temp.block.y
data modify storage pk:common temp.items_filter.location.z set from storage pk:common temp.block.z
#   Facing
function pk_it_fi:blocks/items_filter/place/data/set_facing
#   Owner
data modify storage pk:common temp.items_filter.owner set from entity @s UUID

# Add to database
data modify storage pk:it_fi database.items_filters append from storage pk:common temp.items_filter