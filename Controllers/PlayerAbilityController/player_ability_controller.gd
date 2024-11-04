class_name PlayerAbilityController
extends Node


@export var parent : CharacterBody2D
@export var input_ability_states : Dictionary
@onready var input_ability_state_machine: InputAbilityStateMachine = $InputAbilityStateMachine


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("special"):
		input_ability_state_machine.change_state("dash")
		EventBus.dash_cast.emit()
