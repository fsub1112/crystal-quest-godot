extends CanvasLayer

@onready var health_bar = $HealthBar
@onready var crystal_label = $CrystalLabel

func _ready():
	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.health_changed.connect(_on_health_changed)
		player.crystals_changed.connect(_on_crystals_changed)
		
		# Initialize values
		_on_health_changed(player.health, player.max_health)
		_on_crystals_changed(player.crystals)

func _on_health_changed(current, maximum):
	if health_bar:
		health_bar.max_value = maximum
		health_bar.value = current

func _on_crystals_changed(amount):
	if crystal_label:
		crystal_label.text = "Crystals: " + str(amount)
