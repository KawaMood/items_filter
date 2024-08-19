#> pk_it_fi:blocks/items_filter/behavior/change_mode/from_interaction
# @context mode interaction entity at @s

# Scores
scoreboard players operation $temp pk.custom_block.component.id = @s pk.custom_block.component.id

# Remove the interaction data
data remove entity @s interaction

# Execute as the controller
execute as @e[type=marker,tag=pk.it_fi.items_filter.controller,predicate=pk_it_fi:scores/custom_block/component_id/match_temp] at @s run function pk_it_fi:blocks/items_filter/behavior/change_mode/from_controller