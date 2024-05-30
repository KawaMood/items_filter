#> pk_it_fi:base/uninstall/1

data modify storage pk:it_fi uninstall.items_filter set from storage pk:it_fi uninstall.items_filters[-1]
function pk_it_fi:base/uninstall/2 with storage pk:it_fi uninstall.items_filter.location