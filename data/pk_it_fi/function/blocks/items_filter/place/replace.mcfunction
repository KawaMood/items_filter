#> pk_it_fi:blocks/items_filter/place/replace
# @context any at the items filter to replace
# @requires
#   storage pk:common temp.items_filter
#       data of items filter to replace
say run
# Scores
execute store result score $temp pk.custom_block.component.id run data get storage pk:common temp.items_filter.id

# Remove items filter's entities
kill @e[type=#pk_it_fi:custom_block/components,tag=pk.it_fi.items_filter,predicate=pk_it_fi:scores/custom_block/component_id/match_temp,distance=..20]

# Set components
execute positioned ~.5 ~.5 ~.5 summon marker run function pk_it_fi:blocks/items_filter/place/components/prepare/controller with storage pk:common temp.items_filter
execute positioned ~.5 ~.5 ~.5 summon item_display run function pk_it_fi:blocks/items_filter/place/components/prepare/chest_indicator
execute positioned ~.5 ~.5 ~.5 summon item_display run function pk_it_fi:blocks/items_filter/place/components/prepare/mode_indicator
execute positioned ~.5 ~.375 ~.5 summon interaction run function pk_it_fi:blocks/items_filter/place/components/prepare/mode_switch

# Update components
execute if data storage pk:common temp.items_filter{mode:"strict"} as @e[type=marker,tag=pk.it_fi.items_filter.controller,predicate=pk_it_fi:scores/custom_block/component_id/match_temp] at @s run function pk_it_fi:blocks/items_filter/behavior/change_mode/strict/run

# Place block
setblock ~ ~ ~ chiseled_deepslate