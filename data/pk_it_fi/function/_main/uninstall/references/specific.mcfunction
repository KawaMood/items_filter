#> pk_it_fi:_main/uninstall/references/specific

# Clear scores
scoreboard objectives remove pk.waystones.gametime

# Clear storage
data remove storage pk:it_fi database
data remove storage pk:it_fi settings
data remove storage pk:common installed_datapacks[{id:"item_filters"}]
