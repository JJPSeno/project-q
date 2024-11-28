extends CharacterBody2D

const SPIKE_LINE_TEXTURE := preload("res://Assets/Player/SpikeProjectile/spike_link_sm.png")
var line = Line2D.new()
var isTrailing = false
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var player : CharacterBody2D
@export var spike_speed := 200.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventBus.spike_hit.connect(_on_spike_hit)
	EventBus.spike_traversed.connect(_on_spike_traversed)


func _physics_process(delta: float) -> void:
	if isTrailing:
		line.points[1] = to_local(player.position)
	velocity = spike_speed * Vector2.from_angle(rotation)
	move_and_slide()

func _on_spike_hit() -> void:
	isTrailing = true
	line.add_point(Vector2.ZERO)
	line.add_point(to_local(player.position))
	line.texture = SPIKE_LINE_TEXTURE
	line.texture_mode = Line2D.LINE_TEXTURE_TILE
	add_child(line)


func _on_spike_traversed() -> void:
	queue_free()
