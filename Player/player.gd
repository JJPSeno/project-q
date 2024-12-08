extends CharacterBody2D


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	EventBus.no_cast.emit()


func _process(_delta: float) -> void:
	look_at(get_global_mouse_position())
