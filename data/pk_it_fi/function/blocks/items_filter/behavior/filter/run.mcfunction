#> pk_it_fi:blocks/items_filter/behavior/filter/run
# @writes
#   storage pk:common temp.references_untreated : untreated reference items (from the reference container)
#   storage pk:common temp.inputs_untreated : untreated input items (from the input container)

# Prepare untreated reference items
scoreboard players operation $temp pk.custom_block.facing = @s pk.custom_block.facing
execute if score $temp pk.custom_block.facing matches 0 run data modify storage pk:common temp.references_untreated set from block ~ ~ ~1 Items
execute if score $temp pk.custom_block.facing matches 1 run data modify storage pk:common temp.references_untreated set from block ~-1 ~ ~ Items
execute if score $temp pk.custom_block.facing matches 2 run data modify storage pk:common temp.references_untreated set from block ~ ~ ~-1 Items
execute if score $temp pk.custom_block.facing matches 3 run data modify storage pk:common temp.references_untreated set from block ~1 ~ ~ Items

# Prepare untreated inputs items
data modify storage pk:common temp.inputs_untreated set from block ~ ~1 ~ Items 

# Prepare sanitized data depending on mode
execute if entity @s[tag=pk.it_fi.mode.strict] run function pk_it_fi:blocks/items_filter/behavior/filter/mode/strict/run
execute if entity @s[tag=pk.it_fi.mode.lax] run function pk_it_fi:blocks/items_filter/behavior/filter/mode/lax

# Delay the filtering process
scoreboard players operation @s pk.it_fi.items_filter.transfer_cooldown = $pk.it_fi.settings.transfer_cooldown pk.value