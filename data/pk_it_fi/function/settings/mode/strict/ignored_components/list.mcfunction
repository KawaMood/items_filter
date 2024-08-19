#> pk_it_fi:settings/mode/strict/ignored_components/list

# Store ignored tags array's length
execute store result score $length pk.temp run data get storage pk:it_fi database.mode.strict.ignored_components

# If no ignored tag found
execute unless score $length pk.temp matches 1.. run tellraw @s {"text":"There is currently no component ignored by the strict mode","color":"gray"}

# If ignored tags found
execute if score $length pk.temp matches 1.. run data modify storage pk:common temp.array_1 set value []
execute if score $length pk.temp matches 1.. run data modify storage pk:common temp.array_1 append from storage pk:it_fi database.mode.strict.ignored_components[].id
execute if score $length pk.temp matches 1.. run tellraw @s [{"score":{"name":"$length","objective":"pk.temp"},"color":"yellow"},{"text":" Ignored component(s):\n","color":"gray"},{"nbt":"temp.array_1","storage":"pk:common","color":"gray"}]