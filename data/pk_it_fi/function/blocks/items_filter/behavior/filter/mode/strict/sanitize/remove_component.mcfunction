#> pk_it_fi:blocks/items_filter/behavior/filter/mode/strict/sanitize/remove_component

$data remove storage pk:common temp.references_sanitized[].components."$(id)"
$data remove storage pk:common temp.inputs_sanitized[].components."$(id)"