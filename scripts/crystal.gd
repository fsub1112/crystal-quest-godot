extends Area3D

@export var rotation_speed = 2.0
@export var bob_height = 0.3
@export var bob_speed = 2.0

var initial_y = 0.0
var time = 0.0

func _ready():
	initial_y = global_position.y
	body_entered.connect(_on_body_entered)

func _process(delta):
	# Rotate
	rotate_y(rotation_speed * delta)
	
	# Bob up and down
	time += delta * bob_speed
	global_position.y = initial_y + sin(time) * bob_height

func _on_body_entered(body):
	if body is Player:
		body.collect_crystal()
		# Play collection sound here
		queue_free()
