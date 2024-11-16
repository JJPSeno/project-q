extends CharacterBody2D

@export var speed := 200.0
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var navigation_agent_2d: NavigationAgent2D = $Navigation/NavigationAgent2D
@onready var recalculation_timer: Timer = $Navigation/RecalculationTimer
var player: CharacterBody2D = null
var home_position := Vector2.ZERO


func _ready():
	home_position = global_position
	player = get_tree().get_nodes_in_group("player")[0]
	print(player)
	animation_player.play("skitter")
	navigation_agent_2d.path_desired_distance = 4
	navigation_agent_2d.target_desired_distance = 4


func _physics_process(delta: float) -> void:
	if navigation_agent_2d.is_navigation_finished():
		return
	
	var axis = to_local(navigation_agent_2d.get_next_path_position()).normalized()
	
	velocity = axis * speed
	move_and_slide()


func recalc_path():
	if player:
		navigation_agent_2d.target_position = player.global_position
	else:
		navigation_agent_2d.target_position = home_position

func shot():
	pass


func _on_recalculation_timer_timeout() -> void:
	recalc_path()
