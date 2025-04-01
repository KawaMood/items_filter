#> pk_it_fi:settings/transfer_cooldown/set
# @input
#   count: count
# Example: 
#   function pk_it_fi:settings/transfer_cooldown/set {value:1}

$scoreboard players set $sanitize_value pk.temp $(value)
execute if score $sanitize_value pk.temp matches ..-1 run scoreboard players set $sanitize_value pk.temp 0
scoreboard players operation $pk.it_fi.settings.transfer_cooldown pk.value = $sanitize_value pk.temp

# Logs
tellraw @s [{text:"Items Filters Transfer Cooldown is now set to ",color:"gray"},{score:{name:"$pk.it_fi.settings.transfer_cooldown",objective:"pk.value"},color:"yellow"},{text:" ticks",color:"gray"}]