extends CharacterBody3D

# Player's speed (m/s)
@export var speed: int = 14
# Downward acceleration (m/s^2)
@export var fall_acc: int = 75

# Target velocity
var target_velocity: Vector3 = Vector3.ZERO

# Calculate input direction vector
func _physics_process(delta: float) -> void:
	# Input direction
	var direction: Vector3 = Vector3.ZERO
	
	# Check input and update direction accordingly
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	elif Input.is_action_pressed("move_right"):
		direction.x += 1
	elif Input.is_action_pressed("move_forward"):
		# Z axis = forward/backward
		direction.z -= 1
	elif Input.is_action_pressed("move_back"):
		direction.z += 1
	
	# Normalise vector's length
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		# Set the basis
		$Pivot.basis = Basis.looking_at(direction)
	
	# Ground velocity
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed
	
	# Vertical velocity
	# If the character is not on the floor,
	# fall towards the floor -> imitates Gravity.
	if not is_on_floor():
		target_velocity.y = target_velocity.y - (fall_acc * delta)
	
	# Moving the character
	velocity = target_velocity
	move_and_slide()
