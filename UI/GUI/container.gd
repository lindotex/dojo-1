extends Container

@export var player : Player

@onready var health: Label = $PanelContainer/VBoxContainer/Health
@onready var stamina: Label = $PanelContainer/VBoxContainer/Stamina


func _process(_delta: float) -> void:
	health.text = "Health: " + str(player.stats.health) 
	stamina.text = "Stamina: " + str(player.stats.base_max_stamina)
