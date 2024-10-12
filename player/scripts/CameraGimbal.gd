extends Node3D

# Mouse sensitivity
var mouse_sens: float = 0.2
# Camera angle
var camera_angle: float = 0
# Camera angle for looking up and down
var camera_up_down: float = 0

# Rotating x and y axes
var rot_x: float = 0
var rot_y: float = 0

# Function to look for the mouse input
func _input(event: InputEvent) -> void:
	# Check if the player is moving the mouse or not
	if event is InputEventMouseMotion:
		# Modify rotation
		rot_x += event.relative.x * mouse_sens
		rot_y += event.relative.y * mouse_sens
	
		# Reset the transformation by getting its basis
		transform.basis = Basis()
	
		# Rotate the camera on the y-axis first
		rotate_object_local(
			Vector3(0, -1, 0),
			deg_to_rad(rot_x)
		)

		# Then rotate the camera on the x-axis
		rotate_object_local(
			Vector3(-1, 0, 0),
			deg_to_rad(rot_y)
		)
	
	# Reset rotation and orientation
	if event is InputEventKey:
		if event.is_action_pressed("reset_pov"):
			rot_x = 0
			rot_y = 0
			transform.basis = Basis()
