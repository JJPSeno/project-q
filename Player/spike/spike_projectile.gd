extends Area2D

const SPIKE_LINE_TEXTURE := preload("res://Assets/Player/spike/spike_link_sm.png")
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var player : CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventBus.spike_hit.connect(_on_spike_hit)
	EventBus.spike_traversed.connect(_on_spike_traversed)


func _on_spike_hit() -> void:
	print("spike pos:", position)
	print("spike globalpos:", global_position)
	print("player pos:", player.position)
	print("player globalpos:", player.global_position)
	var line = Line2D.new()
	line.add_point(Vector2.ZERO)
	line.add_point(to_local(player.position))
	line.texture = SPIKE_LINE_TEXTURE
	line.texture_mode = Line2D.LINE_TEXTURE_TILE
	add_child(line)

func _on_spike_traversed() -> void:
	queue_free()
