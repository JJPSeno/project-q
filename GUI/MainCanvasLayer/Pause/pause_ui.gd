extends MarginContainer


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		toogle_pause()


func _on_resume_pressed() -> void:
	toogle_pause()


func _on_exit_pressed() -> void:
	get_tree().quit()


func toogle_pause():
	visible = !visible
	get_tree().paused = visible
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE if visible \
		else Input.MOUSE_MODE_CONFINED
