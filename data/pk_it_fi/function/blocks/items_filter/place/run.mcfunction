#> pk_it_fi:blocks/items_filter/place/run
# Place an Items Filter and store its relative information in the database
# @context the player who placed the items filter head, at the block location

# Scores
#   Define the component id
scoreboard players add $next pk.custom_block.component.id 1
scoreboard players operation $temp pk.custom_block.component.id = $next pk.custom_block.component.id
#   Facing score is defined further in the data storing process (default to North)
#      0: North | 1: East | 2: South | 3: West
#      @within function pk_it_fi:blocks/items_filter/place/data/set_facing/player_head or
#      @within function pk_it_fi:blocks/items_filter/place/data/set_facing/player_wall_head
scoreboard players set $temp pk.custom_block.facing 0

# Get data from the current block
data modify storage pk:common temp.block set from block ~ ~ ~

# Prepare and store the data of items filter
function pk_it_fi:blocks/items_filter/place/data/store

# Set components
execute positioned ~.5 ~.5 ~.5 summon marker run function pk_it_fi:blocks/items_filter/place/components/prepare/controller with storage pk:common temp.items_filter
execute positioned ~.5 ~.5 ~.5 summon item_display run function pk_it_fi:blocks/items_filter/place/components/prepare/chest_indicator
execute positioned ~.5 ~.5 ~.5 summon item_display run function pk_it_fi:blocks/items_filter/place/components/prepare/mode_indicator
execute positioned ~.5 ~.375 ~.5 summon interaction run function pk_it_fi:blocks/items_filter/place/components/prepare/mode_switch

# Place block
setblock ~ ~ ~ chiseled_deepslate

# Debug logs
execute if score $logs.datapack.item_filters pk.value matches 1 run tellraw @a[tag=pk.dev] [{"selector":"@a[tag=pk.current.player,limit=1]",color: "gray"},{text: " placed Items Filter at ["},{nbt:"temp.items_filter.location.x",storage:"pk:common"},{text: ","},{nbt:"temp.items_filter.location.y",storage:"pk:common"},{text: ","},{nbt:"temp.items_filter.location.z",storage:"pk:common"},{text: "] in "},{nbt:"temp.items_filter.location.dimension",storage:"pk:common"}]