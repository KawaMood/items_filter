#> pk_it_fi:blocks/items_filter/behavior/filter/common/retained_input/start

# Store retained input from untreated input matching the index of current sanitized input
execute store result storage pk:common params.index int 1 run scoreboard players get $i pk.temp
function pk_it_fi:blocks/items_filter/behavior/filter/common/retained_input/store with storage pk:common params

# Drop or try to insert to receving container
scoreboard players set $insert_failed pk.temp 0
execute store result score $should_drop pk.temp if block ~ ~-1 ~ #pk_it_fi:fluid
data modify storage pk:common params set from storage pk:common temp.retained_input
execute unless data storage pk:common params.components run data modify storage pk:common params.components set value {}
execute if score $should_drop pk.temp matches 0 run function pk_it_fi:blocks/items_filter/behavior/filter/common/retained_input/insert with storage pk:common params
execute if score $should_drop pk.temp matches 1 align xyz positioned ~0.5 ~-0.3 ~0.5 run function pk_it_fi:blocks/items_filter/behavior/filter/common/retained_input/drop with storage pk:common params
#   If should insert and insertion failed, stop current process and continue to check other inputs
execute if score $insert_failed pk.temp matches 1 run return fail

# @continue Retained input item as been absorbed successfully
scoreboard players set $absorbed_input pk.temp 1

# Reduce or remove from input container
data modify storage pk:common params.slot set from storage pk:common temp.retained_input.Slot
execute store result score $count pk.temp run data get storage pk:common temp.retained_input.count
scoreboard players remove $count pk.temp 1
execute if score $count pk.temp matches 1.. run function pk_it_fi:blocks/items_filter/behavior/filter/common/retained_input/reduce with storage pk:common params
execute if score $count pk.temp matches 0 run function pk_it_fi:blocks/items_filter/behavior/filter/common/retained_input/remove with storage pk:common params