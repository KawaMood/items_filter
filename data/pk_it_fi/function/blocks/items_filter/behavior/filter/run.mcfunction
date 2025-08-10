#> pk_it_fi:blocks/items_filter/behavior/filter/run
# @writes
#   storage pk:common temp.references_untreated : untreated reference items (from the reference container)
#   storage pk:common temp.inputs_untreated : untreated input items (from the input container)

# Delay the filtering process
scoreboard players operation @s pk.it_fi.items_filter.transfer_cooldown = $pk.it_fi.settings.transfer_cooldown pk.value

# Prepare untreated reference items
scoreboard players operation $temp pk.custom_block.facing = @s pk.custom_block.facing
data remove storage pk:common temp.references_untreated
execute unless score $pk.it_fi.settings.reference.allow_double_chest pk.value matches 1 run function pk_it_fi:blocks/items_filter/behavior/filter/common/references_untreated/single_container
execute if score $pk.it_fi.settings.reference.allow_double_chest pk.value matches 1 run function pk_it_fi:blocks/items_filter/behavior/filter/common/references_untreated/multiple_container/switch
# @return if there is no reference items
execute unless data storage pk:common temp.references_untreated[] run return fail

# Prepare untreated inputs items
data modify storage pk:common temp.inputs_untreated set from block ~ ~1 ~ Items

# Prepare sanitized data depending on mode
execute if entity @s[tag=pk.it_fi.mode.strict] run function pk_it_fi:blocks/items_filter/behavior/filter/mode/strict/run
execute if entity @s[tag=pk.it_fi.mode.lax] run function pk_it_fi:blocks/items_filter/behavior/filter/mode/lax/run