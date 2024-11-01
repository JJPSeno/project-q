class_name InputMovementStateMachine
extends Node


#region movement_states example
"""
should be equal to
states = { 
	"walk":{
		name : String,
		id : int
		speed := float
		camera_zoom := Vector2
		acceleration := float
		friction := float
	},
	"run":{
		name : String,
		id : int
		speed := float
		camera_zoom := Vector2
		camera_speed := float
		acceleration := float
		friction := float
	}
}
"""
#endregion
var movement_states : Dictionary
var current_state_name : String
var movement_controller : Node
var parent : Node2D
var direction := Vector2.ZERO
var speed = 200.0
var acceleration := 12.0
var friction := 6.0
var target_velocity := Vector2.ZERO
var previous_velocity := Vector2.ZERO
var new_velocity := Vector2.ZERO


func _ready() -> void:
	movement_controller = get_parent()
	movement_states = movement_controller.input_movement_states
	parent = movement_controller.parent
	current_state_name = "run"


func change_state(state_name: String) -> void:
	current_state_name = state_name
	#if parent.is_in_group("player"):
		#EventBus.player_state_updated.emit(state_name)
		#EventBus.camera_zoom_updated.emit(movement_states[current_state_name].camera_zoom, movement_states[current_state_name].camera_speed)


func _physics_process(delta: float) -> void:
	direction = Input.get_vector("left","right","up","down")
	target_velocity = direction * movement_states[current_state_name].speed
	EventBus.position_updated.emit("x: %03.0f, y: %03.0f" % [parent.global_position.x, parent.global_position.y])
	previous_velocity = parent.velocity
	new_velocity = \
		parent.velocity.lerp( \
			target_velocity, \
			1 - exp(-(movement_states[current_state_name].acceleration * \
			movement_states[current_state_name].friction) * delta) \
		)
	
	if (previous_velocity != new_velocity):
		EventBus.speed_updated.emit("%03.0f" % [new_velocity.length()])
		parent.velocity = new_velocity
	
	parent.move_and_slide()

func _exit_state(_state_name: String) -> void:
	pass
	

func _get_current_state() -> InputMovementState:
	return movement_states[current_state_name]
	
