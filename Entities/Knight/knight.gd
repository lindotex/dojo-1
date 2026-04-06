extends CharacterBody2D

const PLAYER_GROUP : StringName = "player_group"
const SPEED : float = 250.0

var state_machine =  CallableStateMachine.new()

func _ready():
	state_machine.add_states(state_follow, Callable(), Callable())
	state_machine.set_initial_state(state_follow)

func _process(_delta: float) -> void:
	state_machine.update()

func state_follow():
	var player = get_player()
	
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * SPEED
	move_and_slide()

func get_player() -> CharacterBody2D:
	return get_tree().get_first_node_in_group(PLAYER_GROUP)
