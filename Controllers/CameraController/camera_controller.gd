extends Node2D

@export var player_camera : Camera2D
var player_node : CharacterBody2D

@export var world_camera : Camera2D
var world_node : Node2D

func _ready() -> void:
	player_camera.enabled = true
	EventBus.camera_zoom_updated.connect(_on_camera_zoom_change)
	var missing_camera = (player_camera == null or world_camera == null)
	if missing_camera:
		assert(!missing_camera, "Missing camera reference")


func _on_camera_zoom_change(new_zoom: Vector2, new_speed: float) -> void:
	if (player_camera.enabled):
		var tween = create_tween()
		tween.tween_property(player_camera, "zoom", new_zoom, 0.5)\
			.set_trans(Tween.TRANS_SINE)\
			.set_ease(Tween.EASE_OUT)
		tween.parallel().tween_property(player_camera, "position_smoothing_speed", new_speed, 0.5)\
			.set_trans(Tween.TRANS_SINE)\
			.set_ease(Tween.EASE_OUT)
		
