#> pk_it_fi:blocks/items_filter/behavior/filter/common/inputs_check_recursive

# Check if current sanitized input matches a sanitized reference
data modify storage pk:common temp.in set from storage pk:common temp.references_sanitized
execute store result score $changes pk.temp run data modify storage pk:common temp.in[] set from storage pk:common temp.destructive.inputs_sanitized[-1]
execute if score $references_sanitized.length pk.temp > $changes pk.temp run function pk_it_fi:blocks/items_filter/behavior/filter/common/retained_input/start

# Recursive call
data remove storage pk:common temp.destructive.inputs_sanitized[-1]
scoreboard players remove $i pk.temp 1
execute unless score $absorbed_input pk.temp matches 1 unless score $i pk.temp matches -1 run function pk_it_fi:blocks/items_filter/behavior/filter/common/inputs_check_recursive