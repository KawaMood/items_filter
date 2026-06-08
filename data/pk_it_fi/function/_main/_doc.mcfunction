# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Scores:
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
# Common to all PK data packs:
#   Informations
#   $gametime pk.value | used to store the current gametime
#   Logs
#   $logs.load pk.value | default: (undefined) | <=0 = mask load logs | (undefined) or >=1 = show load logs
#   $logs.tick pk.value | default: (undefined) | (undefined) or <=0 = mask tick logs | >=1 = show tick logs
#
# Concerning this specific datapack:
#   Logs (allow you to mask/show logs specific to this data pack
#   $logs.datapack.it_fi pk.value | default: (undefined) | (undefined) or <=0 = masks | >=1 = show Items Filter logs
#
#   Ignore container colors (shulker boxes color) while filtering in lax mode
#   $pk.it_fi.settings.mode.lax.ignore_container_color pk.value | default: (undefined) | (undefined) or <=0 = disabled | >=1 = enabled
#
#   Allow double chests as references container (item filters are more perfs consuming when enabled)
#   $pk.it_fi.settings.reference.allow_double_chest pk.value | default: (undefined) | (undefined) or <=0 = disabled | >=1 = enabled
#
#   Transfer cooldown (idle time of transfer cooldown in ticks) by default on 4 (twice faster as the default hopper transfer cooldown)
#   $pk.it_fi.settings.transfer_cooldown pk.value | default: 4 | min: 0
#
#   Transfer all matching stacks (no matter their count) instantly when detected
#   $pk.it_fi.settings.transfer_whole_stack pk.value | default: (undefined) | (undefined) or <=0 = disabled | >=1 = enabled

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Tags:
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
# pk.dev: Allow player to see data packs specific logs
# tag @s add pk.dev

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Storage:
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
#
#  List of entries {id:<id(string)>} being the ids of components to ignore when filtering in strict mode
#  pk:it_fi database.mode.strict.ignored_components[]