#> pk_it_fi:_main/uninstall/start

# @return check if an uninstalling process is already running
execute if score $uninstall pk.value matches 1 run return run tellraw @s {text: "An uninstalling process is already running",color:"red"}

# Set uninstalling process score
scoreboard players set $uninstall pk.value 1

# Mark player
tag @s add pk.uninstall

# Remove items filters
function pk_it_fi:_main/uninstall/feature/start {feature_storage_path:"pk:it_fi database.items_filters",callback:"function pk_it_fi:_main/uninstall/callback/after_removing_items_filters",feature_id:"item_filter"}