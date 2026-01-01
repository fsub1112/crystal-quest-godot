extends CharacterBody3D
# Minimal working player controller - NO ASSETS REQUIRED!
# This is a simplified version that works immediately

const SPEED = 5.0
const SPRINT_SPEED = 8.0
const JUMP_VELOCITY = 5.0
const ROTATION_SPEED = 10.0

@onready var camera_pivot = $CameraPivot
@onready var camera = $CameraPivot/Camera3D

var gravity = 15.0
var health = 100
var crystals = 0

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	print("✅ Test player loaded successfully!")
	print("🎮 Controls: WASD=Move, Space=Jump, Shift=Sprint, Mouse=Look, ESC=Release Mouse")

func _unhandled_input(event):
	# Camera rotation
	if event is InputEventMouseMotion:
		camera_pivot.rotate_y(-event.relative.x * 0.003)
		camera.rotation.x = clamp(camera.rotation.x - event.relative.y * 0.003, -0.5, 0.5)
	
	# Release mouse
	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		print("🖱️ Mouse released. Click window to recapture.")
	
	# Recapture mouse on click
	if event is InputEventMouseButton and event.pressed:
		if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta):
	# Apply gravity
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	# Jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		print("🦘 Jump!")
	
	# Get input direction
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var camera_basis = camera_pivot.global_transform.basis
	var direction = (camera_basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	# Speed
	var current_speed = SPRINT_SPEED if Input.is_action_pressed("ui_shift") else SPEED
	
	if direction:
		velocity.x = direction.x * current_speed
		velocity.z = direction.z * current_speed
		
		# Rotate character toward movement
		var target_rotation = atan2(direction.x, direction.z)
		rotation.y = lerp_angle(rotation.y, target_rotation, ROTATION_SPEED * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, current_speed)
		velocity.z = move_toward(velocity.z, 0, current_speed)
	
	move_and_slide()

func _input(event):
	# Debug info
	if event.is_action_pressed("ui_text_backspace"):
		print("📊 Position: ", global_position)
		print("💓 Health: ", health)
		print("💎 Crystals: ", crystals)
