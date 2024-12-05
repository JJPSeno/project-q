extends AbilityMovementState


@export var speed = 3000.0
@export var acceleration := 4500.0
@export var camera_zoom := Vector2(0.9, 0.9)
@export var cemra_speed := 6
@export var friction := 1
@export var state_machine : AbilityMovementStateMachine
var direction := Vector2.ZERO
var target_velocity := Vector2.ZERO
var previous_velocity := Vector2.ZERO
var new_velocity := Vector2.ZERO


func ability_movement_fire(_delta: float) -> void:
	pass


func enter_state() -> void:
	pass


func exit_state() -> void:
	pass
