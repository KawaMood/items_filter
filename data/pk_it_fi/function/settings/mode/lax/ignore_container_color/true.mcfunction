# Cancel process if setting is already set on the attempted value
execute if score $pk.it_fi.settings.mode.lax.ignore_container_color pk.value matches 1 run tellraw @s [{text:"Setting \"",color:"red"},{text:"Ignore Container Color",color:"yellow"},{text:"\" is already set to ",color:"red"},{text:"true",color:"yellow"}]
execute unless score $pk.it_fi.settings.mode.lax.ignore_container_color pk.value matches 1 run tellraw @s [{text:"Setting \"",color:"gray"},{text:"Ignore Container Color",color:"yellow"},{text:"\" has been set to ",color:"gray"},{text:"true",color:"yellow"}]

# Update the setting's value
scoreboard players set $pk.it_fi.settings.mode.lax.ignore_container_color pk.value 1