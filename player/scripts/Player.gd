extends CharacterBody3D

# Movement speed (m/s)
@export var speed: int = 3
# Fall acceleration (m/s^2)
@export var fall_acc: int = 75
# Vertical impulse for jumping (m/s)
@export var jump_impulse: int = 20

# Target velocity
var target_velocity: Vector3 = Vector3.ZERO

# Physical movements
func _physics_process(delta: float) -> void:
	# Input direction
	var direction: Vector3 = Vector3.ZERO

	# Check for movement input
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	elif Input.is_action_pressed("move_right"):
		direction.x += 1
	elif Input.is_action_pressed("move_forward"):
		direction.z -= 1
	elif Input.is_action_pressed("move_back"):
		direction.z += 1

	# Get input vector
	var input: Vector2 = Input.get_vector("move_left", "move_right", "move_forward", "move_back")

	# Change the movement direction to the camera's rotation
	direction = Vector3(
		input.x,
		0,
		input.y
	).rotated(Vector3.UP, $CameraPivot/CameraGimbal.rotation.y)

	# Normalise vector's length
	if direction != Vector3.ZERO:
		# Normalise the vector
		direction = direction.normalized()
		# Set the pivot's basis
		$Pivot.basis = Basis.looking_at(direction)
	
	# Ground velocity
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed
	
	# Vertical velocity
	if not is_on_floor():
		# Apply fall acceleration to mimic gravity
		target_velocity.y = target_velocity.y - (fall_acc * delta)
	
	# Jumping code
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		target_velocity.y = jump_impulse
	
	# Moving the character
	velocity = target_velocity
	move_and_slide()
