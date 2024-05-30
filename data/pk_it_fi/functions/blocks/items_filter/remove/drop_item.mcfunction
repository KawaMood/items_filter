#> pk_it_fi:blocks/items_filter/remove/drop_item

function pk_it_fi:items/items_filter/attributes
data modify storage pk:common temp.packages.dynamic_item set value {apply_random_motion:1b}
data modify storage pk:common temp.packages.dynamic_item.entity_data.Item set from storage pk:common temp.attributes
data modify storage pk:common temp.packages.dynamic_item.entity_data.Item.count set value 1
function pk_it_fi:packages/dynamic_item/drop/run