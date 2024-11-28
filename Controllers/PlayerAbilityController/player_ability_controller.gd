class_name PlayerAbilityController
extends Node


const SPIKE_PROJECTILE = preload("res://Player/SpikeProjectile/spike_projectile.tscn")
@export var parent : CharacterBody2D
@export var input_ability_states : Dictionary
@export var bullet_origin : Marker2D
@onready var input_ability_state_machine: InputAbilityStateMachine = $InputAbilityStateMachine


func _ready() -> void:
	EventBus.spike_cast.connect(_on_spike_cast)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("special"):
		input_ability_state_machine.change_state("dash")
	if event.is_action_pressed("secondary"):
		input_ability_state_machine.change_state("spike")


func _on_spike_cast():
	var spike_instance = SPIKE_PROJECTILE.instantiate()
	spike_instance.rotation = parent.rotation
	spike_instance.position = bullet_origin.global_position
	var projectile_space = get_node('../../ProjectileSpace')
	if projectile_space != null:
		projectile_space.add_child(spike_instance)
		
