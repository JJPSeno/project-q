class_name InputAbilityStateMachine
extends Node

var ability_states : Dictionary
var current_state_name : String
var ability_controller : PlayerAbilityController
var parent : Node2D


func _ready() -> void:
	ability_controller = get_parent()
	parent = ability_controller.parent
	ability_states = ability_controller.input_ability_states
	current_state_name = "wait"

func change_state(state_name: String) -> void:
	current_state_name = state_name
	EventBus.emit_signal(ability_states[current_state_name].signal_name)
	
	
func _physics_process(_delta: float) -> void:
	pass
	
	
func _exit_state(_state_name: String) -> void:
	pass
	

func _get_current_state() -> InputAbilityState:
	return ability_states[current_state_name]
	
