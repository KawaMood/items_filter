#> pk_it_fi:_main/update/start
# Update the current data pack if needed

# V.3.1.0 (#30100)
execute unless score $pk.it_fi.version pk.value matches 30100.. run function pk_it_fi:_main/update/versions/3_1_0

# Set the data pack current version score
scoreboard players set $pk.it_fi.version pk.value 30202
data modify storage pk:common installed_datapacks[{id:"items_filter"}].version set value "3.2.2"