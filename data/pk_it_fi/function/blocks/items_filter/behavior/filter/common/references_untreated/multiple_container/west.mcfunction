data modify storage pk:common temp.references_untreated set from block ~1 ~ ~ Items
# Single
execute unless block ~1 ~ ~ #pk_it_fi:chest run return 1
execute if block ~1 ~ ~ #pk_it_fi:chest[type=single] run return 1
# South
execute if block ~1 ~ ~ #pk_it_fi:chest[facing=south,type=right] run return run data modify storage pk:common temp.references_untreated append from block ~2 ~ ~ Items[]
# North
execute if block ~1 ~ ~ #pk_it_fi:chest[facing=north,type=left] run return run data modify storage pk:common temp.references_untreated append from block ~2 ~ ~ Items[]
# West
execute if block ~1 ~ ~ #pk_it_fi:chest[facing=west,type=left] run return run data modify storage pk:common temp.references_untreated append from block ~1 ~ ~-1 Items[]
execute if block ~1 ~ ~ #pk_it_fi:chest[facing=west,type=right] run return run data modify storage pk:common temp.references_untreated append from block ~1 ~ ~1 Items[]
# East
execute if block ~1 ~ ~ #pk_it_fi:chest[facing=east,type=right] run return run data modify storage pk:common temp.references_untreated append from block ~1 ~ ~-1 Items[]
execute if block ~1 ~ ~ #pk_it_fi:chest[facing=east,type=left] run data modify storage pk:common temp.references_untreated append from block ~1 ~ ~1 Items[]