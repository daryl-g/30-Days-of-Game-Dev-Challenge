extends CharacterBody3D

# Signal when a player gets hit by a mob
signal hit

# Player's speed (m/s)
@export var speed: int = 14
# Downward acceleration (m/s^2)
@export var fall_acc: int = 75
# Vertical impulse for jumping (m/s)
@export var jump_impulse: int = 20
# Vertical impulse for bouncing (m/s)
@export var bounce_impulse: int = 16

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
	
	# Prevent player from moving at light speed
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		# Set the basis
		$Pivot.basis = Basis.looking_at(direction)
		# Increase the animation speed
		$AnimationPlayer.speed_scale = 4
	else:
		$AnimationPlayer.speed_scale = 1
	
	# Ground velocity
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed
	
	# Vertical velocity
	# If the character is not on the floor,
	# fall towards the floor -> imitates Gravity.
	if not is_on_floor():
		target_velocity.y = target_velocity.y - (fall_acc * delta)
	
	# Jumping code
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		target_velocity.y = jump_impulse
	
	# Iterate through all collisions occurred in the frame
	for index in range(get_slide_collision_count()):
		# Get one of the collisions with the player
		var collision: KinematicCollision3D = get_slide_collision(index)
		
		# Check if the player collides with the ground
		if collision.get_collider() == null:
			continue
		
		# Check if the player collides with a mob
		if collision.get_collider().is_in_group("mob"):
			# Get the colliding body
			var mob = collision.get_collider()
			
			# Check if the player is hitting the mob from above
			if Vector3.UP.dot(collision.get_normal()) > 0.1:
				# If yes, squash it and bounce
				mob.squash()
				target_velocity.y = bounce_impulse
				
				# Prevent further calls
				break
	
	# Moving the character
	velocity = target_velocity
	move_and_slide()
	
	# Add an arc to the character's jump
	$Pivot.rotation.x = PI / 6 * velocity.y / jump_impulse

# Function to end the game
func die():
	hit.emit()
	queue_free()

# Function to detect if the player has collided with a mob on the ground
func _on_mob_detector_body_entered(_body: Node3D) -> void:
	die()
