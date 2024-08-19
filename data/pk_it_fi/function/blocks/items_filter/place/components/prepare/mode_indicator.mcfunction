#> pk_it_fi:blocks/items_filter/place/components/prepare/mode_indicator

# Scores
scoreboard players operation @s pk.custom_block.component.id = $temp pk.custom_block.component.id

# Set all common data
data merge entity @s {Tags:["pk.it_fi","pk.it_fi.items_filter","pk.it_fi.items_filter.component","pk.it_fi.items_filter.mode_indicator"],item:{id:"minecraft:player_head",count:1,components:{"minecraft:profile":{properties:[{name:"textures",value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZmY3YmJjZTIzZTgxNjJlNDJkMjA3MDU1YjBjZTkwZjBlZDU3YjAxNWU1MjEyMTM5YWM4ZmM3ZTZkNDVkZGZjYSJ9fX0="}]}}},response:1b,transformation:{scale:[0.5f,0.5f,0.5f],translation:[0f,0.125f,0.55f]}}

# Set data relative to the current facing state
execute if data storage pk:common temp.items_filter{facing:"north"} run data modify storage pk:common temp.mode_indicator set value {position:"~ ~ ~-1",rotation:[0f,0f]}
execute if data storage pk:common temp.items_filter{facing:"east"} run data modify storage pk:common temp.mode_indicator set value {position:"~1 ~ ~",rotation:[90f,0f]}
execute if data storage pk:common temp.items_filter{facing:"south"} run data modify storage pk:common temp.mode_indicator set value {position:"~ ~ ~1",rotation:[180f,0f]}
execute if data storage pk:common temp.items_filter{facing:"west"} run data modify storage pk:common temp.mode_indicator set value {position:"~-1 ~ ~",rotation:[-90f,0f]}
#   Pos
data modify storage pk:common params set value {p1:"tp @s ",p2:""}
data modify storage pk:common params.v1 set from storage pk:common temp.mode_indicator.position
function pk_it_fi:packages/dynamic_command/1_var with storage pk:common params
#   Rotation
data modify entity @s Rotation set from storage pk:common temp.mode_indicator.rotation