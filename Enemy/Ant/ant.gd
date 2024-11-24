extends CharacterBody2D

@export var speed := 200.0
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var navigation_agent_2d: NavigationAgent2D = $Navigation/NavigationAgent2D
var player: CharacterBody2D = null


func _ready():
	player = get_tree().get_nodes_in_group("player")[0]
	call_deferred("seeker_setup")


func _physics_process(delta: float) -> void:
	if navigation_agent_2d.is_navigation_finished():
		return
	if player:
		navigation_agent_2d.target_position = player.global_position

	var current_agent_position = global_position
	var next_path_position = navigation_agent_2d.get_next_path_position()
	velocity = current_agent_position.direction_to(next_path_position) * speed
	move_and_slide()


func seeker_setup():
	await get_tree().physics_frame
	if player:
		navigation_agent_2d.target_position = player.global_position


func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = safe_velocity
