class_name PlayerMovementController
extends Node


@export var parent : CharacterBody2D
@export var input_movement_states : Dictionary
@export var ability_sfx: AudioStreamPlayer
@export var footsteps_sfx: AudioStreamPlayer
@onready var input_movement_state_machine: InputMovementStateMachine = $InputMovementStateMachine
@onready var ability_movement_state_machine: AbilityMovementStateMachine = $AbilityMovementStateMachine
var grapple_vector := Vector2.ZERO
const DASH = preload("res://SFX/dash.ogg")
const GRAPPLE_MOVE = preload("res://SFX/grapple_move.wav")

func _ready() -> void:
	EventBus.dash_cast.connect(_on_dash_cast)
	EventBus.spike_hit.connect(_on_spike_hit)
	EventBus.no_cast.connect(_on_no_cast)

#try to add this to func _input
func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("base_movement"):
		if !footsteps_sfx.playing:
			footsteps_sfx.play()
		if Input.is_action_pressed("run"):
			footsteps_sfx.pitch_scale = .25
			input_movement_state_machine.change_state("run")
		else:
			footsteps_sfx.pitch_scale = .2
			input_movement_state_machine.change_state("walk")
	else:
		if footsteps_sfx.playing:
			footsteps_sfx.stop()

		input_movement_state_machine.change_state("idle")
		


func reinitialize() -> void:
	ability_sfx.stop()
	ability_sfx.stream = null
	grapple_vector = Vector2.ZERO

func _on_dash_cast() -> void:
	if int(parent.velocity.length()) > 0:
		if !ability_sfx.playing:
			ability_sfx.stream = DASH
			ability_sfx.play()
		ability_movement_state_machine.change_state("dash")
		
func _on_spike_hit(sling_direction) -> void:
	grapple_vector = sling_direction
	if !ability_sfx.playing:
		ability_sfx.stream = GRAPPLE_MOVE
		ability_sfx.play()
	ability_movement_state_machine.change_state("grapple")

func _on_no_cast() -> void:
	reinitialize()
	ability_movement_state_machine.change_state("wait")
