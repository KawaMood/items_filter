# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Scores :
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

# ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
# Tags:
# ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
# pk.dev: Allow player to see data packs specific logs
tag @s add pk.dev