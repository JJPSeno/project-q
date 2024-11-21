class_name PlayerAbilityController
extends Node


@export var parent : CharacterBody2D
@export var input_ability_states : Dictionary
@onready var input_ability_state_machine: InputAbilityStateMachine = $InputAbilityStateMachine
const SPIKE_PROJECTILE = preload("res://Player/spike/spike_projectile.tscn")


func _ready() -> void:
	EventBus.spike_cast.connect(_on_spike_cast)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("special"):
		input_ability_state_machine.change_state("dash")
	if event.is_action_pressed("secondary"):
		input_ability_state_machine.change_state("spike")


func _on_spike_cast():
	var spike_instance = SPIKE_PROJECTILE.instantiate()
	spike_instance.position = parent.position
	spike_instance.rotation_degrees = parent.rotation_degrees
	get_parent().add_child(spike_instance)
