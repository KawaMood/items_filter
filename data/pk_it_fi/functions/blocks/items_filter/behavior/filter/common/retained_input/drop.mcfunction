#> pk_it_fi:blocks/items_filter/behavior/filter/common/retained_input/drop

# Drop
$summon item ~ ~ ~ {Item:{id:"$(id)",components:$(components),count:1}}

# Animations
playsound block.dispenser.dispense block @a[distance=..30]
particle smoke ~ ~ ~ 0 0 0 0.1 2