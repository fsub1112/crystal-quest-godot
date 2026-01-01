extends CharacterBody3D
class_name Enemy

@export var max_health = 50
@export var damage = 10
@export var move_speed = 3.0
@export var attack_range = 2.0
@export var detection_range = 15.0

@onready var animation_player = $Model/AnimationPlayer
@onready var nav_agent = $NavigationAgent3D
@onready var attack_timer = $AttackTimer

var health = max_health
var player: Player
var is_attacking = false
var gravity = 15.0

enum State {IDLE, CHASE, ATTACK, DEAD}
var current_state = State.IDLE

func _ready():
	player = get_tree().get_first_node_in_group("player")
	if attack_timer:
		attack_timer.timeout.connect(_on_attack_timer_timeout)

func _physics_process(delta):
	if current_state == State.DEAD:
		return
	
	# Apply gravity
	if not is_on_floor():
		velocity.y -= gravity * delta
	else:
		velocity.y = 0
	
	# Check distance to player
	if player:
		var distance = global_position.distance_to(player.global_position)
		
		match current_state:
			State.IDLE:
				if distance < detection_range:
					current_state = State.CHASE
					if animation_player:
						animation_player.play("walk")
			
			State.CHASE:
				if distance > detection_range:
					current_state = State.IDLE
					if animation_player:
						animation_player.play("idle")
				elif distance < attack_range:
					current_state = State.ATTACK
					velocity = Vector3.ZERO
				else:
					chase_player()
			
			State.ATTACK:
				if distance > attack_range:
					current_state = State.CHASE
				else:
					look_at_player()
					if !is_attacking:
						perform_attack()
	
	move_and_slide()

func chase_player():
	if nav_agent and player:
		nav_agent.target_position = player.global_position
		var next_pos = nav_agent.get_next_path_position()
		var direction = (next_pos - global_position).normalized()
		
		velocity.x = direction.x * move_speed
		velocity.z = direction.z * move_speed
		
		# Rotate toward player
		look_at_player()

func look_at_player():
	if player:
		var direction = (player.global_position - global_position).normalized()
		var target_rotation = atan2(direction.x, direction.z)
		rotation.y = lerp_angle(rotation.y, target_rotation, 0.1)

func perform_attack():
	is_attacking = true
	if animation_player:
		animation_player.play("attack")
	if attack_timer:
		attack_timer.start(1.5)  # Attack cooldown

func _on_attack_timer_timeout():
	if player and global_position.distance_to(player.global_position) < attack_range:
		player.take_damage(damage)
	is_attacking = false

func take_damage(amount: int):
	health -= amount
	if health <= 0:
		die()
	else:
		# Flash red or play hurt animation
		pass

func die():
	current_state = State.DEAD
	if animation_player:
		animation_player.play("death")
	if has_node("CollisionShape3D"):
		$CollisionShape3D.disabled = true
	await get_tree().create_timer(2.0).timeout
	queue_free()
