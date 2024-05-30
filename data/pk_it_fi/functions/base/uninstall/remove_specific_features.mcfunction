#> pk_it_fi:base/uninstall/remove_specific_features

# Clear scores
scoreboard objectives remove pk.it_fi.gametime
scoreboard objectives remove pk.it_fi.items_filter.transfer_cooldown
scoreboard objectives remove pk.it_fi.leave_game

# Clear storage
data remove storage pk:it_fi database
data remove storage pk:it_fi uninstall
data remove storage pk:common installed_datapack[{id:"items_filter"}]