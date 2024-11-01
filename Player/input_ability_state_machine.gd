class_name InputAbilityStateMachine
extends Node

var ability_states : Dictionary
var current_state_name : String
var ability_controller : PlayerAbilityController
var parent : Node2D
#@export var name : String
#@export var id : int
#@export var input_name : String
#@export var signal_name : String


func _ready() -> void:
	ability_controller = get_parent()
	parent = ability_controller.parent
	ability_states = ability_controller.input_ability_states
	current_state_name = "wait"

func change_state(state_name: String) -> void:
	current_state_name = state_name
	if parent.is_in_group("player"):
		pass
	
func _physics_process(delta: float) -> void:
	pass
	
	
func _exit_state(_state_name: String) -> void:
	pass
	

func _get_current_state():# -> InputMovementState:
	pass
	
