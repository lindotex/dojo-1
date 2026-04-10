class_name Interface extends Node

@export var player : Player

@onready var health: Label = $PanelContainer/VBoxContainer/Health
@onready var stamina: Label = $PanelContainer/VBoxContainer/Stamina


func _process(_delta: float) -> void:
	health.text = "Health: " + str(player.player_status.base_max_health) 
	stamina.text = "Stamina: " + str(player.player_status.base_max_stamina)
