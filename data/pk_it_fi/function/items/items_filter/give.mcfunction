#> pk_it_fi:items/items_filter/give

function pk_it_fi:items/items_filter/attributes
data modify storage pk:common params set value {count:1}
data modify storage pk:common params merge from storage pk:common temp.attributes
function pk_it_fi:packages/dynamic_item/give with storage pk:common params