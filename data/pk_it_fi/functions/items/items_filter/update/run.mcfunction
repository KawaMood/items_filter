#> pk_it_fi:items/items_filter/update/run
# Update items_filter items from lower versions

# Mark player
tag @s add pk.current.player

# Container
data modify storage pk:common temp.container set value []
data modify storage pk:common temp.container append from entity @s Inventory[{components:{"minecraft:custom_data":{pk_data:{id:"items_filter",from:"items_filter"}}}}]
data remove storage pk:common temp.container[{components:{"minecraft:custom_data":{pk_data:{id:"items_filter",from:"items_filter",version:2b}}}}]
data remove storage pk:common temp.container[{Slot:-106b}]
data remove storage pk:common temp.container[{Slot:100b}]
data remove storage pk:common temp.container[{Slot:101b}]
data remove storage pk:common temp.container[{Slot:102b}]
data remove storage pk:common temp.container[{Slot:103b}]
execute if data storage pk:common temp.container[{}] run function pk_it_fi:items/items_filter/update/change/slot/container_recursive

# Offhand
execute if items entity @s weapon.offhand player_head[custom_data~{pk_data:{id:"items_filter",from:"items_filter"}},!custom_data~{pk_data:{version:2b}}] at @s summon armor_stand run function pk_it_fi:items/items_filter/update/change/slot/offhand

# Free player
tag @s remove pk.current.player