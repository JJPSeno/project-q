extends Node


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("debug_action") and OS.is_debug_build():
		if event.is_action_pressed("exit"):
			get_tree().quit()
		elif event.is_action_pressed("reset"):
			get_tree().reload_current_scene()
		elif event.is_action_pressed("debug_1"):
			pass
		elif event.is_action_pressed("debug_2"):
			pass
		elif event.is_action_pressed("debug_3"):
			pass
