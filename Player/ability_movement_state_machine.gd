class_name AbilityMovementStateMachine
extends Node


@export var movement_controller : PlayerMovementController
var movement_states : Array[Node]
var current_state_name : String
var parent : Node2D

func _ready() -> void:
	parent = movement_controller.parent
	await get_parent().ready
	movement_states = get_children()


func change_state(_state_name: String) -> void:
	_exit_state(current_state_name)
	current_state_name = _state_name
	get_node(current_state_name).start_physics


func _exit_state(_state_name: String) -> void:
	get_node(_state_name).lock_physics


func _get_current_state() -> AbilityMovementState:
	return get_node(current_state_name)
	
