class_name MovementController
extends Node


@export var parent : CharacterBody2D

#try to add this to func _input
func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("base_movement"):
		if Input.is_action_pressed("run"):
			get_node("MovementStateMachine").change_state("run")
		else:
			get_node("MovementStateMachine").change_state("walk")
		
		if Input.is_action_just_pressed("dash") and int(parent.velocity.length()) > 0:
			get_node("MovementStateMachine").change_state("dash")
	else:
		get_node("MovementStateMachine").change_state("idle")
