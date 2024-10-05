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
	
	# Connect the mob to the score label
	# to display how many mobs have been squashed
	mob.squashed.connect(
		$UserInterface/ScoreLabel._on_mob_squashed.bind()
	)

# Function to signal when a player gets hit
func _on_player_hit() -> void:
	# Stop the timer
	$SpawnTimer.stop()
	# Show the retry overlay
	$UserInterface/Retry.show()

# Function to hide the retry screen at the start of the game
func _ready():
	$UserInterface/Retry.hide()

# Function to restart the game
func _unhandled_input(event: InputEvent) -> void:
	# If the user presses Retry then reload the scene
	if event.is_action_pressed("ui_accept") and $UserInterface/Retry.visible:
		get_tree().reload_current_scene()
