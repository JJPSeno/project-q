extends AbilityMovementState


@export var speed = 900.0
@export var acceleration := 90000.0
@export var camera_zoom := Vector2(0.9, 0.9)
@export var camera_speed := 6
@export var friction := 1
@export var state_machine : AbilityMovementStateMachine
var direction := Vector2.ZERO
var target_velocity := Vector2.ZERO
var previous_velocity := Vector2.ZERO
var new_velocity := Vector2.ZERO


func ability_movement_fire(delta: float) -> void:
	EventBus.camera_zoom_updated.emit(camera_zoom, camera_speed)
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
	await get_tree().create_timer(0.3).timeout
	EventBus.no_cast.emit()


func enter_state() -> void:
	pass


func exit_state() -> void:
	pass
