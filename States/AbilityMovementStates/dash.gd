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


func ability_movement_fire(delta: float) -> void:
	direction = Input.get_vector("left","right","up","down")
	target_velocity = direction * speed
	previous_velocity = state_machine.parent.velocity
	new_velocity = \
		state_machine.parent.velocity.lerp( \
			target_velocity, \
			1 - exp(-(acceleration * \
			friction) * delta) \
		)
	
	if (previous_velocity != new_velocity):
		state_machine.parent.velocity = new_velocity
	
	state_machine.parent.move_and_slide()
	EventBus.no_cast.emit()


func enter_state() -> void:
	print("entered dash")


func exit_state() -> void:
	pass
