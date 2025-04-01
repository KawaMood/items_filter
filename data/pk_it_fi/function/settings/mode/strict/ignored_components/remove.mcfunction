#> pk_it_fi:settings/mode/strict/ignored_components/remove
# @input
#   $id (string): id
# Example: 
#   function pk_it_fi:settings/mode/strict/ignored_components/remove {id:"display"}

# Prepare data and score
data remove storage pk:common temp.input
$data modify storage pk:common temp.input.id set value "$(id)"
$execute store result score $found pk.temp run data remove storage pk:it_fi database.mode.strict.ignored_components[{id:"$(id)"}]

# If found
execute if score $found pk.temp matches 1.. run tellraw @s [{text:"Removed \"",color:"gray"},{nbt:"temp.input.id",storage:"pk:common",color:"yellow"},{text:"\" from components ignored by the strict mode",color:"gray"}]

# If not found
execute unless score $found pk.temp matches 1.. run tellraw @s {text:"This component is not in the list",color:"red"}