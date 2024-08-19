#> pk_it_fi:blocks/items_filter/place/components/prepare/controller

# Scores
#   Component id
scoreboard players operation @s pk.custom_block.component.id = $temp pk.custom_block.component.id
#   Facing score has been defined in the data storing process (default to North)
#      0: North | 1: East | 2: South | 3: West
#      @within function pk_it_fi:blocks/items_filter/place/data/set_facing/player_head or
#      @within function pk_it_fi:blocks/items_filter/place/data/set_facing/player_wall_head
scoreboard players operation @s pk.custom_block.facing = $temp pk.custom_block.facing

# Set tags
$data modify entity @s Tags set value ["pk.it_fi","pk.custom_block","pk.it_fi.items_filter","pk.it_fi.items_filter.component","pk.it_fi.items_filter.controller","pk.it_fi.mode.lax","pk.it_fi.facing.$(facing)"]

# Store information to the controller
data modify entity @s data.items_filter.id set from storage pk:common temp.items_filter.id