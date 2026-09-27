# Assign item_filter's facing data as the opposite direction of player's facing direction
execute if entity @s[y_rotation=-135..-45] run return run data modify storage pk:common temp.items_filter.facing set value "east"
execute if entity @s[y_rotation=135..224.999999] run return run data modify storage pk:common temp.items_filter.facing set value "north"
execute if entity @s[y_rotation=45..134.999999] run return run data modify storage pk:common temp.items_filter.facing set value "west"
data modify storage pk:common temp.items_filter.facing set value "south"