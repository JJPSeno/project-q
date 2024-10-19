class_name AbilityMovementStateMachine
extends Node

var movement_states : Dictionary
var current_state_name : String
var movement_controller : Node
var parent : Node2D

func _ready() -> void:
	movement_controller = get_parent()
	parent = movement_controller.parent
	movement_states = movement_controller.ability_movement_states



func change_state(_state_name: String) -> void:
	pass


func _physics_process(_delta: float) -> void:
	pass


func _exit_state(_state_name: String) -> void:
	pass
	

#func _get_current_state() -> InputMovementState:
	#pass
	
