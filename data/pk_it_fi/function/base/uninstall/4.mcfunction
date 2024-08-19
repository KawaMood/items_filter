#> pk_it_fi:base/uninstall/4

# Check if the chunk of the items filter to remove is loaded
scoreboard players set $is_loaded pk.temp 0
$execute in $(dimension) if loaded $(x) $(y) $(z) run scoreboard players set $is_loaded pk.temp 1

# If yes, remove all items filters entities and blocks from the chunk
execute unless score $is_loaded pk.temp matches 0 run function pk_it_fi:base/uninstall/5 with storage pk:it_fi uninstall.items_filter.location

# If not, wait 1 second and retry
execute if score $is_loaded pk.temp matches 0 run schedule function pk_it_fi:base/uninstall/3 1s