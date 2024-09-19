extends CharacterBody2D


@export var SPEED = 200.0
@export var acceleration := 12.0
@export var friction := 6.0
var direction := Vector2.ZERO
var target_velocity := Vector2.ZERO
var previous_velocity := Vector2.ZERO
var new_velocity := Vector2.ZERO


func _physics_process(delta: float) -> void:
	direction = Input.get_vector("left","right","up","down")
	if direction:
		target_velocity = direction * SPEED
		EventBus.position_updated.emit("x: %03.0f, y: %03.0f" % [global_position.x, global_position.y])
		previous_velocity = velocity
		new_velocity = velocity.lerp(target_velocity, 1 - exp(-acceleration * delta))
	else:
		previous_velocity = velocity
		new_velocity = velocity.lerp(Vector2.ZERO, 1 - exp(-friction * delta))
		
	if (previous_velocity != new_velocity):
		EventBus.speed_updated.emit("%03.0f" % [new_velocity.length()])
		velocity = new_velocity
	
	move_and_slide()
