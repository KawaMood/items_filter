#> pk_it_fi:events/player/inventory_changed/has_items_filter

# Update items from lower versions if needed
execute if items entity @s container.* player_head[custom_data~{pk_data:{id:"items_filter",from:"items_filter"}},!custom_data~{pk_data:{version:2b}}] run function pk_it_fi:items/items_filter/update/run

# Revoke advancement at the end so the function isn't indefinitively triggered by the inventory change above
advancement revoke @s only pk_it_fi:events/inventory_changed/has_items_filter