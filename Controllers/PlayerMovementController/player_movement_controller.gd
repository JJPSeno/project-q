class_name PlayerMovementController
extends Node


@export var parent : CharacterBody2D
@export var input_movement_states : Dictionary
@onready var input_movement_state_machine: InputMovementStateMachine = $InputMovementStateMachine
@onready var ability_movement_state_machine: AbilityMovementStateMachine = $AbilityMovementStateMachine
var grapple_vector := Vector2.ZERO

#try to add this to func _input
func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("base_movement"):
		if Input.is_action_pressed("run"):
			input_movement_state_machine.change_state("run")
		else:
			input_movement_state_machine.change_state("walk")
	else:
		input_movement_state_machine.change_state("idle")


func _ready() -> void:
	EventBus.dash_cast.connect(_on_dash_cast)
	EventBus.spike_hit.connect(_on_spike_hit)
	EventBus.no_cast.connect(_on_no_cast)

func reinitialize() -> void:
	grapple_vector = Vector2.ZERO

func _on_dash_cast() -> void:
	if int(parent.velocity.length()) > 0:
		ability_movement_state_machine.change_state("dash")
		
func _on_spike_hit(sling_direction) -> void:
	grapple_vector = sling_direction
	ability_movement_state_machine.change_state("grapple")

func _on_no_cast() -> void:
	reinitialize()
	ability_movement_state_machine.change_state("wait")
