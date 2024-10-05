extends CharacterBody3D

# Signal that the mob is squashed
signal squashed

# Minimum speed (m/s)
@export var min_speed = 10
# Maximum speed (m/s)
@export var max_speed = 18

# Move the character
func _physics_process(_delta: float) -> void:
	move_and_slide()

# Initialise mobs
func initialise(
	start_position: Vector3,
	player_position: Vector3
):
	# Position the mob, and
	# rotate it to face the player
	look_at_from_position(
		start_position,
		player_position,
		Vector3.UP
	)
	# Rotate the mob randomly
	rotate_y(
		randf_range(-PI / 4, PI / 4)
	)
	
	# Calculate random speed
	var random_speed = randi_range(min_speed, max_speed)
	# Calculate forward velocity
	velocity = Vector3.FORWARD * random_speed
	# Rotate velocity vector based on the mob's Y position
	velocity = velocity.rotated(Vector3.UP, rotation.y)
	
	# Change the animation's playback speed
	$AnimationPlayer.speed_scale = random_speed / min_speed

# Notify when a mob has exited the screen
func _on_visible_on_screen_notifier_3d_screen_exited() -> void:
	# Destroy the instance
	queue_free()

# Function for squashing mob
func squash():
	squashed.emit()
	queue_free()
