#> pk_it_fi:blocks/items_filter/behavior/filter/common/retained_input/insert

# Store items from receiving container
data modify storage pk:common temp.receiving.before set from block ~ ~-1 ~ Items

# Try to insert
$loot insert ~ ~-1 ~ loot {pools:[{rolls:1,entries:[{type:"item",name:"$(id)",functions:[{function:"set_components",components:$(components)},{function:"set_count",count:1}]}]}]}

# Check if the insertion failed
data modify storage pk:common temp.receiving.after set from block ~ ~-1 ~ Items
execute store result score $is_different pk.temp run data modify storage pk:common temp.receiving.after set from storage pk:common temp.receiving.before
execute if score $is_different pk.temp matches 0 run scoreboard players set $insert_failed pk.temp 1