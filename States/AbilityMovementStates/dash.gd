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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#direction = Input.get_vector("left","right","up","down")
	#target_velocity = direction * speed
	#EventBus.position_updated.emit("x: %03.0f, y: %03.0f" % [state_machine.parent.global_position.x, state_machine.parent.global_position.y])
	#previous_velocity = state_machine.parent.velocity
	#new_velocity = \
		#state_machine.parent.velocity.lerp( \
			#target_velocity, \
			#1 - exp(-(acceleration * \
			#friction) * delta) \
		#)
	#
	#if (previous_velocity != new_velocity):
		#EventBus.speed_updated.emit("%03.0f" % [new_velocity.length()])
		#state_machine.parent.velocity = new_velocity
	#
	#state_machine.parent.move_and_slide()
