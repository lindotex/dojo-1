class_name Player extends CharacterBody2D

@onready var player_animation: AnimationPlayer = $Animation
@onready var player_camera_2d: Camera2D = $Camera2D
@onready var player_collision: CollisionShape2D = $CollisionShape2D
@onready var player_sprite: Sprite2D = $Sprite
@export var player_status : Stats

const SPEED : float = 380.0
const JUMP_VELOCITY : float = -500.0


func _ready() -> void:
	player_animation.play("idle_right")

func _physics_process(_delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * _delta

	if Input.is_action_just_pressed(input_map.ACTION_JUMP) and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := get_movement_direction()
	if direction:
		velocity.x = direction.x * SPEED
		if direction.x >  0:
			player_animation.play("idle_right")
		elif direction.x < 0:
			player_animation.play("idle_left")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func get_movement_direction() -> Vector2:
	return Input.get_vector(input_map.ACTION_MOVE_LEFT, input_map.ACTION_MOVE_RIGHT, input_map.ACTION_MOVE_UP, input_map.ACTION_MOVE_DOWN)
