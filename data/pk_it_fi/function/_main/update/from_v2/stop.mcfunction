#> pk_it_fi:_main/update/from_v2/stop

# Reset score
scoreboard players reset $update pk.value

# Logs
tellraw @a[tag=pk.update_from_v2,limit=1] [{text: "Updated all Items Filters from ",color: "yellow"},{text: "KawaMood's Items Filters (V.2)",color: "aqua",bold: true},{text: " successfully. You can now safely uninstall the V.2 data pack."}]

# Unmark updater
tag @a[tag=pk.update_from_v2,limit=1] remove pk.update_from_v2