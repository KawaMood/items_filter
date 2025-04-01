# Logs
execute unless score $pk.it_fi.settings.reference.allow_double_chest pk.value matches 1 run tellraw @s [{text:"Setting \"",color:"red"},{text:"Allow Double Chest For Reference Items",color:"yellow"},{text:"\" is already set to ",color:"red"},{text:"false",color:"yellow"}]
execute if score $pk.it_fi.settings.reference.allow_double_chest pk.value matches 1 run tellraw @s [{text:"Setting \"",color:"gray"},{text:"Allow Double Chest For Reference Items",color:"yellow"},{text:"\" has been set to ",color:"gray"},{text:"false",color:"yellow"}]

# Update the setting's value
scoreboard players set $pk.it_fi.settings.reference.allow_double_chest pk.value 0