extends Node



#try to add this to func _input
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("movement"):
		if Input.is_action_pressed("run"):
			get_node("MovementStateMachine").change_state("run")
		else:
			get_node("MovementStateMachine").change_state("walk")
		if Input.is_action_just_pressed("dash"):
			get_node("MovementStateMachine").change_state("dash")
	else:
		get_node("MovementStateMachine").change_state("idle")
