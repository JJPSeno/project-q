extends Node

const BOX_CURSOR = preload("res://Assets/Cursors/BoxCursorSmall.png")
const ARROW_CURSOR = preload("res://Assets/Cursors/ArrowCursorSmall.png")

func _ready() -> void:
	_set_to_box_cursor()
	EventBus.connect("change_to_arrow_cursor", _set_to_arrow_cursor)
	EventBus.connect("change_to_box_cursor", _set_to_box_cursor)


func _set_to_box_cursor() -> void:
	Input.set_custom_mouse_cursor(BOX_CURSOR, Input.CURSOR_ARROW, Vector2(32,32))


func _set_to_arrow_cursor() -> void:
	Input.set_custom_mouse_cursor(ARROW_CURSOR, Input.CURSOR_ARROW, Vector2.ZERO)
