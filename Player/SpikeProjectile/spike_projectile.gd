extends CharacterBody2D

const SPIKE_LINE_TEXTURE := preload("res://Assets/Player/SpikeProjectile/spike_link_sm.png")
@export var spike_speed := 200.0
@onready var sprite: AnimatedSprite2D = $Sprite
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var line = Line2D.new()
var isTrailing = false
var player : CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	line.add_point(Vector2.ZERO)
	line.add_point(Vector2.ZERO)
	EventBus.spike_hit.connect(_on_spike_hit)
	EventBus.spike_traversed.connect(_on_spike_traversed)


func _physics_process(_delta: float) -> void:
	if isTrailing:
		line.points[1] = to_local(player.position)
	else:
		velocity = spike_speed * Vector2.from_angle(rotation).normalized()
		move_and_slide()
		if(get_slide_collision_count()>0):
			EventBus.spike_hit.emit(Vector2.from_angle(rotation).normalized())
		await get_tree().create_timer(0.5).timeout
		queue_free()


func _on_spike_hit(_sling_direction) -> void:
	if isTrailing:
		return
	isTrailing = true
	sprite.play("planted")
	line.texture = SPIKE_LINE_TEXTURE
	line.texture_mode = Line2D.LINE_TEXTURE_TILE
	add_child(line)


func _on_spike_traversed() -> void:
	queue_free()
