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
	current_state_name = "wait"


func _physics_process(delta: float) -> void:
	_get_current_state().ability_movement_fire(delta)


func change_state(state_name: String) -> void:
	_exit_state(current_state_name)
	current_state_name = state_name
	_enter_state(current_state_name)
	if parent.is_in_group("player"):
		EventBus.player_ability_state_updated.emit(state_name)


func _exit_state(_state_name: String) -> void:
	get_node(_state_name).exit_state()
	
func _enter_state(_state_name: String) -> void:
	get_node(_state_name).enter_state()


func _get_current_state() -> AbilityMovementState:
	return get_node(current_state_name)
	
