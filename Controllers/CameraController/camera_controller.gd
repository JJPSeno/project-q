extends Node2D

@export var player_camera : Camera2D
var player_node : CharacterBody2D

@export var world_camera : Camera2D
var world_node : Node2D

func _ready() -> void:
	player_camera.enabled = true
	var missing_camera = (player_camera == null or world_camera == null)
	if missing_camera:
		assert(!missing_camera, "Missing camera reference")
