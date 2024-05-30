#> pk_it_fi:blocks/items_filter/behavior/filter/mode/strict/sanitize/recursive

# Remove the current ignored component from sanitized references and inputs
data modify storage pk:common params.id set from storage pk:common temp.destructive.ignored_components[-1].id
function pk_it_fi:blocks/items_filter/behavior/filter/mode/strict/sanitize/remove_component with storage pk:common params

# Recursive call
data remove storage pk:common temp.destructive.ignored_components[-1]
execute if data storage pk:common temp.destructive.ignored_components[-1] run function pk_it_fi:blocks/items_filter/behavior/filter/mode/strict/sanitize/recursive