# args
#   variant (string): items_filter variant
# context a temporary armor stand holding the item to change, at the current player

function pk_it_fi:items/items_filter/attributes
data modify storage pk:common temp.attributes.count set from storage pk:common temp.item.count
data modify entity @s equipment.mainhand set from storage pk:common temp.attributes