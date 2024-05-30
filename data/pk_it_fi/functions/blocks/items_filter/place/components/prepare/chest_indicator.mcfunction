#> pk_it_fi:blocks/items_filter/place/components/prepare/chest_indicator

# Scores
scoreboard players operation @s pk.custom_block.component.id = $temp pk.custom_block.component.id

# Set all common data
data merge entity @s {Tags:["pk.it_fi","pk.it_fi.items_filter","pk.it_fi.items_filter.component","pk.it_fi.items_filter.chest_indicator"],item:{id:"minecraft:observer",count:1},transformation:{scale:[0.25f,0.25f,0.25f],translation:[0f,0f,-0.55f]}}

# Set data relative to the current facing state
execute if data storage pk:common temp.items_filter{facing:"north"} run data modify storage pk:common temp.chest_indicator set value {position:"~ ~ ~1",rotation:[0f,0f]}
execute if data storage pk:common temp.items_filter{facing:"east"} run data modify storage pk:common temp.chest_indicator set value {position:"~-1 ~ ~",rotation:[90f,0f]}
execute if data storage pk:common temp.items_filter{facing:"south"} run data modify storage pk:common temp.chest_indicator set value {position:"~ ~ ~-1",rotation:[180f,0f]}
execute if data storage pk:common temp.items_filter{facing:"west"} run data modify storage pk:common temp.chest_indicator set value {position:"~1 ~ ~",rotation:[-90f,0f]}
#   Pos
data modify storage pk:common params set value {p1:"tp @s ",p2:""}
data modify storage pk:common params.v1 set from storage pk:common temp.chest_indicator.position
function pk_it_fi:packages/dynamic_command/1_var with storage pk:common params
#   Rotation
data modify entity @s Rotation set from storage pk:common temp.chest_indicator.rotation