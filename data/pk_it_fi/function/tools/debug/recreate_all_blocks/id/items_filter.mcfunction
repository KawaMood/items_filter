#> pk_it_fi:tools/debug/recreate_all_blocks/id/items_filter

# Remove old entities from V.2
execute if score $update pk.value matches 1 run kill @e[type=#pk_it_fi:custom_block/components,tag=pk.ho_so]

# Replace items filters
data modify storage pk:common temp.items_filter set from storage pk:common debug.recreate.block
function pk_it_fi:blocks/items_filter/place/replace