#> pk_it_fi:base/update/from_v2/stop

# Reset score
scoreboard players reset $updating pk.value

# Logs
tellraw @a[tag=pk.update_from_v2,limit=1] [{"text": "Updated all Waystones from ","color": "yellow"},{"text": "KawaMood's Waystones (V.2)","color": "aqua","bold": true},{"text": " successfully. You can now safely uninstall the V.2 data pack."}]

# Unmark updater
tag @a[tag=pk.update_from_v2,limit=1] remove pk.update_from_v2