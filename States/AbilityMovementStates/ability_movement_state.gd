class_name AbilityMovementState
extends Node2D

var is_processing_physics: bool
#extends Resource
##TODO: CHANGE OR EVEN REMOVE
#@export var name : String
#@export var id : int
#@export var speed := 200.0
#@export var camera_zoom := Vector2(1,1)
#@export var camera_speed := 5.0
#@export var acceleration := 1.0
#@export var friction := 1.0
#@export_multiline var callback : String

func _ready() -> void:
	pass


func ability_movement_fire(_delta: float) -> void:
	pass


func enter_state() -> void:
	pass


func exit_state() -> void:
	pass
