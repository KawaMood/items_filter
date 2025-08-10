#> pk_it_fi:blocks/items_filter/behavior/filter/mode/lax/run
# @writes
#   storage pk:common temp.references_sanitized : sanitized reference items
#   storage pk:common temp.inputs_sanitized : sanitized input items

# Sanitize
data modify storage pk:common temp.references_sanitized set from storage pk:common temp.references_untreated
data modify storage pk:common temp.inputs_sanitized set from storage pk:common temp.inputs_untreated
#   Keep only the ids
data remove storage pk:common temp.references_sanitized[].components
data remove storage pk:common temp.references_sanitized[].count
data remove storage pk:common temp.references_sanitized[].Slot
data remove storage pk:common temp.inputs_sanitized[].components
data remove storage pk:common temp.inputs_sanitized[].count
data remove storage pk:common temp.inputs_sanitized[].Slot

# Apply optional exception for bundles and shulker boxes
execute if score $pk.it_fi.settings.mode.lax.ignore_container_color pk.value matches 1 run function pk_it_fi:blocks/items_filter/behavior/filter/mode/lax/ignore_container_color

# Store amount of sanitized references
execute store result score $references_sanitized.length pk.temp run data get storage pk:common temp.references_sanitized

# For each input items
scoreboard players set $absorbed_input pk.temp 0
data modify storage pk:common temp.destructive.inputs_sanitized set from storage pk:common temp.inputs_sanitized
execute store result score $i pk.temp run data get storage pk:common temp.destructive.inputs_sanitized
scoreboard players remove $i pk.temp 1
function pk_it_fi:blocks/items_filter/behavior/filter/common/inputs_check_recursive