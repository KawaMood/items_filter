#> pk_it_fi:blocks/items_filter/place/components/prepare/mode_switch

# Scores
scoreboard players operation @s pk.custom_block.component.id = $temp pk.custom_block.component.id

# Set all common data
data merge entity @s {Tags:["pk.it_fi","pk.it_fi.items_filter","pk.it_fi.items_filter.component","pk.it_fi.items_filter.mode_switch"],width:0.25f,height:0.25f}

# Set data relative to the current facing state
execute if data storage pk:common temp.items_filter{facing:"north"} run data modify storage pk:common temp.mode_indicator set value {position:"~ ~ ~-0.4425"}
execute if data storage pk:common temp.items_filter{facing:"east"} run data modify storage pk:common temp.mode_indicator set value {position:"~0.4425 ~ ~"}
execute if data storage pk:common temp.items_filter{facing:"south"} run data modify storage pk:common temp.mode_indicator set value {position:"~ ~ ~0.4425"}
execute if data storage pk:common temp.items_filter{facing:"west"} run data modify storage pk:common temp.mode_indicator set value {position:"~-0.4425 ~ ~"}
#   Pos
data modify storage pk:common params set value {p1:"tp @s ",p2:""}
data modify storage pk:common params.v1 set from storage pk:common temp.mode_indicator.position
function pk_it_fi:packages/dynamic_command/1_var with storage pk:common params
#   Rotation
data modify entity @s Rotation set from storage pk:common temp.mode_indicator.rotation