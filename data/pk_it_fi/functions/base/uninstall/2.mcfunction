#> pk_it_fi:base/uninstall/2

# Check if the chunk is already forceloaded and forceload it if needed
$execute in $(dimension) store result score $pk.it_fi.uninstall.chunk.already_forceload pk.value run forceload query $(x) $(z)
$execute in $(dimension) if score $pk.it_fi.uninstall.chunk.already_forceload pk.value matches 0 run forceload add $(x) $(z)

# Wait one second and check if the chunk is fully loaded
schedule function pk_it_fi:base/uninstall/3 1s