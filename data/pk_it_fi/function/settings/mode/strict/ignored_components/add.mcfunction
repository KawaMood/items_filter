#> pk_it_fi:settings/mode/strict/ignored_components/add
# @input
#   $id (string): id
# Example: 
#   function pk_it_fi:settings/mode/strict/ignored_components/add {id:"display"}

# Prepare data and score
data remove storage pk:common temp.input
$data modify storage pk:common temp.input.id set value "$(id)"
$execute store result score $already_contains pk.temp if data storage pk:it_fi database.mode.strict.ignored_components[{id:"$(id)"}]

# If found
execute unless score $already_contains pk.temp matches 1.. run data modify storage pk:it_fi database.mode.strict.ignored_components append from storage pk:common temp.input
execute unless score $already_contains pk.temp matches 1.. run tellraw @s [{text:"Added \"",color:"gray"},{nbt:"temp.input.id",storage:"pk:common",color:"yellow"},{text:"\" to components ignored by the strict mode",color:"gray"}]

# If not found
execute if score $already_contains pk.temp matches 1.. run tellraw @s {text:"This component is already ignored",color:"red"}