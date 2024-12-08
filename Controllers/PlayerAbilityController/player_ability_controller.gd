class_name PlayerAbilityController
extends Node


const SPIKE_PROJECTILE = preload("res://Player/SpikeProjectile/spike_projectile.tscn")
const SPIKE_SHOT = preload("res://SFX/spike_shot.wav")
@export var parent : CharacterBody2D
@export var input_ability_states : Dictionary
@export var bullet_origin : Marker2D
@onready var input_ability_state_machine: InputAbilityStateMachine = $InputAbilityStateMachine
@onready var ability_sfx: AudioStreamPlayer = $AbilitySFX
var is_casting := false


func _ready() -> void:
	EventBus.spike_cast.connect(_on_spike_cast)
	EventBus.no_cast.connect(_on_no_cast)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("special") and !is_casting:
		is_casting = true
		input_ability_state_machine.change_state("dash")
		await get_tree().create_timer(0.3).timeout
		is_casting = false
	if event.is_action_pressed("secondary") and !is_casting:
		is_casting = true
		input_ability_state_machine.change_state("spike")
		await get_tree().create_timer(0.5).timeout
		is_casting = false


func _on_spike_cast():
	var spike_instance = SPIKE_PROJECTILE.instantiate()
	spike_instance.player = parent
	spike_instance.rotation = parent.rotation
	spike_instance.position = bullet_origin.global_position
	var projectile_space = get_node('../../ProjectileSpace')
	if projectile_space != null:
		projectile_space.add_child(spike_instance)
		if !ability_sfx.playing:
			ability_sfx.volume_db = 0
			ability_sfx.stream = SPIKE_SHOT
			ability_sfx.play()
		
func _on_no_cast():
	ability_sfx.stop()
	ability_sfx.stream = null
	input_ability_state_machine.change_state("wait")
