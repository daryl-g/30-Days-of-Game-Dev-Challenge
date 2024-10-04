extends Node

# Assign mobs
@export var mob_scene: PackedScene

# Notify when the spawn timer is timed out
func _on_spawn_timer_timeout() -> void:
	# Create new instance of the Mob scene
	var mob = mob_scene.instantiate()
	
	# Choose a random location on the spawn path,
	# then store the reference to the spawn location
	var mob_spawn_location: Node = get_node("SpawnPath/SpawnLocation")
	# And give it a random offset
	mob_spawn_location.progress_ratio = randf()
	
	# Get the player's current position
	var player_position = $Player.position
	# Initialise a mob
	mob.initialise(mob_spawn_location.position, player_position)
	
	# Spawn the mob by adding it to the Main scene
	add_child(mob)
