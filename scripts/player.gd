extends CharacterBody3D
class_name Player

# Movement settings
const SPEED = 5.0
const SPRINT_SPEED = 8.0
const JUMP_VELOCITY = 5.0
const ROTATION_SPEED = 10.0
const ATTACK_RANGE = 2.5

# Components
@onready var camera_pivot = $CameraPivot
@onready var camera = $CameraPivot/Camera3D
@onready var animation_player = $Model/AnimationPlayer
@onready var attack_area = $AttackArea
@onready var model = $Model

# State
var gravity = 15.0
var health = 100
var max_health = 100
var crystals = 0
var is_attacking = false
var can_move = true

signal health_changed(new_health, max_health)
signal crystals_changed(amount)

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	attack_area.monitoring = false

func _unhandled_input(event):
	# Camera rotation
	if event is InputEventMouseMotion:
		camera_pivot.rotate_y(-event.relative.x * 0.003)
		camera.rotation.x = clamp(camera.rotation.x - event.relative.y * 0.003, -0.5, 0.5)
	
	# Release mouse
	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _physics_process(delta):
	# Apply gravity
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	# Jump
	if Input.is_action_just_pressed("jump") and is_on_floor() and can_move:
		velocity.y = JUMP_VELOCITY
		if animation_player:
			animation_player.play("jump")
	
	# Attack
	if Input.is_action_just_pressed("attack") and !is_attacking and can_move:
		perform_attack()
	
	# Movement
	if can_move and !is_attacking:
		var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
		var camera_basis = camera_pivot.global_transform.basis
		var direction = (camera_basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		
		# Speed
		var current_speed = SPRINT_SPEED if Input.is_action_pressed("sprint") else SPEED
		
		if direction:
			velocity.x = direction.x * current_speed
			velocity.z = direction.z * current_speed
			
			# Rotate character
			var target_rotation = atan2(direction.x, direction.z)
			model.rotation.y = lerp_angle(model.rotation.y, target_rotation, ROTATION_SPEED * delta)
			
			# Animation
			if is_on_floor() and animation_player:
				if current_speed == SPRINT_SPEED:
					animation_player.play("run")
				else:
					animation_player.play("walk")
		else:
			velocity.x = move_toward(velocity.x, 0, current_speed)
			velocity.z = move_toward(velocity.z, 0, current_speed)
			if is_on_floor() and !is_attacking and animation_player:
				animation_player.play("idle")
	
	move_and_slide()

func perform_attack():
	is_attacking = true
	can_move = false
	if animation_player:
		animation_player.play("attack")
	attack_area.monitoring = true
	
	# Wait for animation
	if animation_player:
		await animation_player.animation_finished
	else:
		await get_tree().create_timer(0.5).timeout
	
	attack_area.monitoring = false
	is_attacking = false
	can_move = true

func take_damage(amount: int):
	health -= amount
	health = max(0, health)
	health_changed.emit(health, max_health)
	
	if health <= 0:
		die()

func collect_crystal():
	crystals += 1
	crystals_changed.emit(crystals)

func die():
	can_move = false
	if animation_player:
		animation_player.play("death")
	await get_tree().create_timer(2.0).timeout
	get_tree().reload_current_scene()
