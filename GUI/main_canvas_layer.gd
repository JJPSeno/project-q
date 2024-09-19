extends CanvasLayer


@onready var debug_ui: Control = $DebugUI

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !OS.is_debug_build():
		debug_ui.queue_free()
