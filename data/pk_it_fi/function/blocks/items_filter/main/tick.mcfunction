#> pk_it_fi:blocks/items_filter/main/tick
# Ticking item filters
# @context marker with the tag "pk.it_fi.items_filter.controller" at @s

# Mark the current controller
tag @s add pk.current.controller

# Each time the entity is loaded
scoreboard players add @s pk.it_fi.gametime 1
execute unless score $gametime pk.value = @s pk.it_fi.gametime run function pk_it_fi:blocks/items_filter/main/on_entity_load

# Watch environnement
function pk_it_fi:blocks/items_filter/environment/tick

# Unmark the current controller
tag @s remove pk.current.controller