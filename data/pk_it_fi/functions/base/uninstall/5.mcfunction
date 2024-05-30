#> pk_it_fi:base/uninstall/5
# @context any at the items filter to remove (chunk loaded)

# Logs
tellraw @a[tag=pk.it_fi.uninstaller] [{"text": "Removed Items Filter at [","color": "gray"},{"nbt":"uninstall.items_filter.location.x","storage":"pk:it_fi"},{"text": ","},{"nbt":"uninstall.items_filter.location.y","storage":"pk:it_fi"},{"text": ","},{"nbt":"uninstall.items_filter.location.z","storage":"pk:it_fi"},{"text": "] in "},{"nbt":"uninstall.items_filter.location.dimension","storage":"pk:it_fi"}]

# Remove items filters blocks and entities
execute at @e[type=marker,tag=pk.it_fi.items_filter.controller] run setblock ~ ~ ~ air
kill @e[type=#pk_it_fi:custom_block/components,tag=pk.it_fi.items_filter.component]

# Unload the chunk if needed
execute if score $pk.it_fi.uninstall.chunk.already_forceload pk.value matches 0 run forceload remove ~ ~

# Continue process with next items filter to remove, or stop it if there are no items filters anymore
data remove storage pk:it_fi uninstall.items_filters[-1]
scoreboard players remove $pk.it_fi.uninstall.items_filters.length pk.value 1
execute if score $pk.it_fi.uninstall.items_filters.length pk.value matches 0 as @a[tag=pk.it_fi.uninstaller] run function pk_it_fi:base/uninstall/stop
execute unless score $pk.it_fi.uninstall.items_filters.length pk.value matches 0 run function pk_it_fi:base/uninstall/1