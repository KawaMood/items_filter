execute if score $temp pk.custom_block.facing matches 1 run return run data modify storage pk:common temp.references_untreated set from block ~-1 ~ ~ Items
execute if score $temp pk.custom_block.facing matches 2 run return run data modify storage pk:common temp.references_untreated set from block ~ ~ ~-1 Items
execute if score $temp pk.custom_block.facing matches 3 run return run data modify storage pk:common temp.references_untreated set from block ~1 ~ ~ Items
data modify storage pk:common temp.references_untreated set from block ~ ~ ~1 Items