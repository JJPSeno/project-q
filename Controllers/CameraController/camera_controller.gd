extends Node2D

""" IMPLEMENTATION A """
#@export var MIN_DISTANCE_SQUARED : float = 256
#@export var MAX_DISTANCE_SQUARED : float = 90000
""" END IMPLEMENTATION A """
""" IMPLEMENTATION B """
@export var MAX_DISTANCE : float = 100
@export var SMOOTH_SPEED : float = 6
""" END IMPLEMENTATION B """
@onready var player_camera: Camera2D = %PlayerCamera
@onready var world_camera: Camera2D = %WorldCamera
@export var player_node : CharacterBody2D
var world_node : Node2D
var mouse_position : Vector2
var target_position : Vector2
var check_mouse_too_far : bool
var check_mouse_too_near : bool
var mouse_distance_just_right : bool
func _ready() -> void:
	var missing_camera = (player_camera == null or world_camera == null)
	if missing_camera:
		assert(!missing_camera, "Missing camera reference")
	if player_node == null:
		assert(player_node == null, "Missing player reference")
	player_camera.enabled = true
	world_node = world_camera.get_parent()
	EventBus.camera_zoom_updated.connect(_on_camera_zoom_change)


func _process(delta: float) -> void:
	EventBus.camera_pos_updated.emit("x: %03.0f, y: %03.0f" % [player_camera.global_position.x, player_camera.global_position.y])
	mouse_position = get_global_mouse_position()
	EventBus.mouse_pos_updated.emit("x: %03.0f, y: %03.0f" % [mouse_position.x, mouse_position.y])
	""" IMPLEMENTATION A """
	#check_mouse_too_near = (mouse_position-player_node.position).length_squared() < MIN_DISTANCE_SQUARED
	#check_mouse_too_far = (mouse_position-player_node.position).length_squared() > MAX_DISTANCE_SQUARED
	#mouse_distance_just_right = !check_mouse_too_near and !check_mouse_too_far
	#EventBus.mouse_in_goldilocks_zone.emit(str(mouse_distance_just_right))
	#
	#if !check_mouse_too_near:
		#set_player_cam_position.call_deferred(player_camera, target_position)
	#else:
		#set_player_cam_position.call_deferred(player_camera, player_node.position)
	""" END IMPLEMENTATION A """
	""" IMPLEMENTATION B """
	#target_position.x = clamp(mouse_position.x, -MAX_DISTANCE, MAX_DISTANCE)
	#target_position.y = clamp(mouse_position.y, -MAX_DISTANCE, MAX_DISTANCE)
	target_position.x = mouse_position.x
	target_position.y = mouse_position.y
	if target_position != Vector2.INF:
		set_player_cam_position.call_deferred(player_camera, player_node.position+target_position, delta)
	""" END IMPLEMENTATION B """

func _on_camera_zoom_change(new_zoom: Vector2, new_speed: float) -> void:
	if (player_camera.enabled):
		var tween = create_tween()
		tween.tween_property(player_camera, "zoom", new_zoom, 0.5)\
			.set_trans(Tween.TRANS_SINE)\
			.set_ease(Tween.EASE_OUT)
		tween.parallel().tween_property(player_camera, "position_smoothing_speed", new_speed, 0.5)\
			.set_trans(Tween.TRANS_SINE)\
			.set_ease(Tween.EASE_OUT)
		
func set_player_cam_position(_player_camera: Camera2D, new_position: Vector2, _delta: float) -> void:
	_player_camera.position = lerp(_player_camera.position, new_position, SMOOTH_SPEED * _delta)
