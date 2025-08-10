# If true
execute unless score $pk.it_fi.settings.mode.lax.ignore_container_color pk.value matches 0 run tellraw @s [{text:"Setting \"",color:"gray"},{text:"Ignore Container Color",color:"yellow"},{text:"\" is currently set to ",color:"gray"},{text:"true",color:"yellow"}]
# If false
execute if score $pk.it_fi.settings.mode.lax.ignore_container_color pk.value matches 0 run tellraw @s [{text:"Setting \"",color:"gray"},{text:"Ignore Container Color",color:"yellow"},{text:"\" is currently set to ",color:"gray"},{text:"false",color:"yellow"}]