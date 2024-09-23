extends Node2D


@export var parent : Node2D


func _process(_delta: float) -> void:
	if parent != null:
		parent.look_at(get_global_mouse_position())
