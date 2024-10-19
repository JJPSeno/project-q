class_name InputAbilityStateMachine
extends Node

var ability_states : Dictionary
var current_state_name : String
var ability_controller : Node
var parent : Node2D

func _ready() -> void:
	ability_controller = get_parent()
	parent = ability_controller.parent
	#ability_states = ability_controller.ability_movement_states
