# Logs
execute unless score $pk.it_fi.settings.transfer_whole_stack pk.value matches 1 run tellraw @s [{text:"Setting \"",color:"red"},{text:"Transfer Whole Stack",color:"yellow"},{text:"\" is already set to ",color:"red"},{text:"false",color:"yellow"}]
execute if score $pk.it_fi.settings.transfer_whole_stack pk.value matches 1 run tellraw @s [{text:"Setting \"",color:"gray"},{text:"Transfer Whole Stack",color:"yellow"},{text:"\" has been set to ",color:"gray"},{text:"false",color:"yellow"}]

# Update the setting's value
scoreboard players set $pk.it_fi.settings.transfer_whole_stack pk.value 0