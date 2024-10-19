class_name PlayerAbilityController
extends Node


@export var parent : CharacterBody2D
@export var input_ability_states : Dictionary
@onready var input_ability_state_machine: InputAbilityStateMachine = $InputAbilityStateMachine
#
##try to add this to func _input
#func _physics_process(_delta: float) -> void:
	#if Input.is_action_pressed("base_movement"):
		#if Input.is_action_pressed("run"):
			#input_movement_state_machine.change_state("run")
		#else:
			#input_movement_state_machine.change_state("walk")
		##if Input.is_action_just_pressed("dash") and int(parent.velocity.length()) > 0:
			##get_node("MovementStateMachine").change_state("dash")
	#else:
		#input_movement_state_machine.change_state("idle")
