#> pk_it_fi:base/update/versions/3_1_0

# Update database
data modify storage pk:it_fi database.mode.strict.ignored_components set from storage pk:it_fi database.mode.strict.ignored_tags
data remove storage pk:it_fi database.mode.strict.ignored_tags