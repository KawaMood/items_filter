#> pk_it_fi:base/load
# Main load

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Storage:
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
# Define storage
#   pk:common | Used to store installed PK Datapacks names and version and for temp data manipulation
#   pk:it_fi database | Database of Items Filter
#declare storage pk:common
#declare storage pk:it_fi

# Initialize PK data packs storage if needed
execute unless data storage pk:common installed_datapacks[{}] run data modify storage pk:common installed_datapacks set value []

# Add current data pack into the PK data packs storage if needed
execute unless data storage pk:common installed_datapacks[{id:"items_filter"}] run data modify storage pk:common installed_datapacks append value {name:"Items Filter",id:"items_filter"}

# Initialize the storage used to store Items Filter data
execute unless data storage pk:it_fi database.items_filters[{}] run data modify storage pk:it_fi database.items_filters set value []
execute unless data storage pk:it_fi database.mode.strict.ignored_components[{}] run data modify storage pk:it_fi database.mode.strict.ignored_components set value []

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Scores:
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
# Define objectives that are common to each PK data pack:
#   pk.temp only concerns temp values that can be cleared at any time without risks.
#   pk.value is used for fixed values and variable settings, and won't be cleared on uninstallation until there is no PK data pack anymore.
scoreboard objectives add pk.temp dummy
scoreboard objectives add pk.value dummy
scoreboard objectives add pk.custom_block.component.id dummy
scoreboard objectives add pk.custom_block.interaction.id dummy
scoreboard objectives add pk.custom_block.facing dummy
scoreboard objectives add pk.custom_block.move.timer dummy

# Define objective that are specific to the current data pack
#   Players actions:
scoreboard objectives add pk.it_fi.leave_game custom:leave_game
#   Used to store gametime to some entities to know when they were loaded last time
scoreboard objectives add pk.it_fi.gametime dummy
#   Used to delay the filtering process of items filters
scoreboard objectives add pk.it_fi.items_filter.transfer_cooldown dummy

# Settings:
#   Default value for filtering delay
execute unless score $pk.it_fi.settings.transfer_cooldown pk.value matches 0.. run scoreboard players set $pk.it_fi.settings.transfer_cooldown pk.value 4

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Packages:
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Updates:
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
function pk_it_fi:base/update/start

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Logs:
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
execute unless score $logs.load pk.value matches ..0 run tellraw @a [{"text": "Loaded ","color": "yellow"},{"text": "KawaMood's Items Filter ","color": "aqua","bold": true},{"text": "(V.","color": "aqua"},{"nbt":"installed_datapacks[{id:\"items_filter\"}].version", "storage": "pk:common","color": "aqua"},{"text": ")","color": "aqua"},{"text": " successfully"}]