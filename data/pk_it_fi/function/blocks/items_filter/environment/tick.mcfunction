#> pk_it_fi:blocks/items_filter/environment/tick
# Monitor adjacent/current block(s)
# @context the items filter controller at @s

# Set scores
scoreboard players set $env.stop pk.temp 0
scoreboard players remove @s[scores={pk.custom_block.move.timer=1..}] pk.custom_block.move.timer 1
scoreboard players remove @s[scores={pk.it_fi.items_filter.transfer_cooldown=1..}] pk.it_fi.items_filter.transfer_cooldown 1

# Check if the block has been moved or broken
execute unless block ~ ~ ~ chiseled_deepslate unless entity @s[scores={pk.custom_block.move.timer=1..}] run function pk_it_fi:blocks/items_filter/environment/check_new_block
execute if score $env.stop pk.temp matches 1 run return 1

# Check if it should filter
#   If items filter is not disabled
#   and predicate: 
#       If the pk.it_fi.items_filter.transfer_cooldown score of the controller doesn't matches 1.. 
#       and a container or fluid block below
#       and a container on the reference face
#       and there is a container with items above
execute if entity @s[tag=!pk.it_fi.items_filter.disabled,predicate=pk_it_fi:environment/filtering_items_filter] if items block ~ ~1 ~ container.* *[count~{min:1}] run function pk_it_fi:blocks/items_filter/behavior/filter/run