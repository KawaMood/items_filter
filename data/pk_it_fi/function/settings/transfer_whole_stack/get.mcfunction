# If false
execute unless score $pk.it_fi.settings.transfer_whole_stack pk.value matches 1 run tellraw @s [{text:"Setting \"",color:"gray"},{text:"Transfer Whole Stack",color:"yellow"},{text:"\" is currently set to ",color:"gray"},{text:"false",color:"yellow"}]
# If true
execute if score $pk.it_fi.settings.transfer_whole_stack pk.value matches 1 run tellraw @s [{text:"Setting \"",color:"gray"},{text:"Transfer Whole Stack",color:"yellow"},{text:"\" is currently set to ",color:"gray"},{text:"true",color:"yellow"}]