#> pk_it_fi:blocks/items_filter/behavior/filter/mode/strict/run
# @writes
#   storage pk:common temp.references_sanitized : sanitized reference items
#   storage pk:common temp.inputs_sanitized : sanitized input items

# Sanitize
data modify storage pk:common temp.destructive.ignored_components set from storage pk:it_fi database.mode.strict.ignored_components
data modify storage pk:common temp.references_sanitized set from storage pk:common temp.references_untreated
data modify storage pk:common temp.inputs_sanitized set from storage pk:common temp.inputs_untreated
#   Force sanitized entries to have components data, and remove count and Slot
data modify storage pk:common temp.references_sanitized[].components.pk_force_components_data set value 1b
data remove storage pk:common temp.references_sanitized[].components.pk_force_components_data
data remove storage pk:common temp.references_sanitized[].count
data remove storage pk:common temp.references_sanitized[].Slot
data modify storage pk:common temp.inputs_sanitized[].components.pk_force_components_data set value 1b
data remove storage pk:common temp.inputs_sanitized[].components.pk_force_components_data
data remove storage pk:common temp.inputs_sanitized[].count
data remove storage pk:common temp.inputs_sanitized[].Slot
#   Start to sanitize
execute if data storage pk:common temp.destructive.ignored_components[-1] run function pk_it_fi:blocks/items_filter/behavior/filter/mode/strict/sanitize/recursive

# Store amount of sanitized references
execute store result score $references_sanitized.length pk.temp run data get storage pk:common temp.references_sanitized

# For each input items
scoreboard players set $absorbed_input pk.temp 0
data modify storage pk:common temp.destructive.inputs_sanitized set from storage pk:common temp.inputs_sanitized
execute store result score $i pk.temp run data get storage pk:common temp.destructive.inputs_sanitized
scoreboard players remove $i pk.temp 1
function pk_it_fi:blocks/items_filter/behavior/filter/common/inputs_check_recursive