extends MarginContainer


@export var player: CharacterBody2D
@onready var camera_2d: Camera2D = %Camera2D


func _physics_process(delta: float) -> void:
	camera_2d.position = player.position
