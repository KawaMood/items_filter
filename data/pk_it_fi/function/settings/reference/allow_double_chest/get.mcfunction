# If false
execute unless score $pk.it_fi.settings.reference.allow_double_chest pk.value matches 1 run tellraw @s [{text:"Setting \"",color:"gray"},{text:"Allow Double Chest For Reference Items",color:"yellow"},{text:"\" is currently set to ",color:"gray"},{text:"false",color:"yellow"}]
# If true
execute if score $pk.it_fi.settings.reference.allow_double_chest pk.value matches 1 run tellraw @s [{text:"Setting \"",color:"gray"},{text:"Allow Double Chest For Reference Items",color:"yellow"},{text:"\" is currently set to ",color:"gray"},{text:"true",color:"yellow"}]