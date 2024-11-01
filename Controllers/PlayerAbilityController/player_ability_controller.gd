class_name PlayerAbilityController
extends Node


@export var parent : CharacterBody2D
@export var input_ability_states : Dictionary
@onready var input_ability_state_machine: InputAbilityStateMachine = $InputAbilityStateMachine

func _input(event: InputEvent) -> void:
	var current_state = input_ability_state_machine._get_current_state()
	if event.is_action_pressed("special") and current_state.signal_name != "":
		EventBus.emit_signal(current_state.signal_name)
