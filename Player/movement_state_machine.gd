class_name MovementStateMachine
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
		acceleration := float
		friction := float
	}
}
"""
#endregion
@export var movement_states : Dictionary
@export var parent : CharacterBody2D
var current_state_name : String

var direction := Vector2.ZERO
var speed = 200.0
var acceleration := 12.0
var friction := 6.0
var target_velocity := Vector2.ZERO
var previous_velocity := Vector2.ZERO
var new_velocity := Vector2.ZERO


func _ready() -> void:
	current_state_name = "run"
	print_debug(movement_states[current_state_name].speed)
	for s in movement_states:
		print_debug(movement_states[s])


func change_state(state_name: String) -> void:
	current_state_name = state_name


func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left","right","up","down")
	target_velocity = direction * movement_states[current_state_name].speed

func _exit_state(state_name: String) -> void:
	pass
	

func _get_current_state() -> MovementState:
	return movement_states[current_state_name]
	
