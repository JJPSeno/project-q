extends Node


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("debug_action") and OS.is_debug_build():
		if event.is_action_pressed("exit"):
			get_tree().quit()
		elif event.is_action_pressed("reset"):
			get_tree().reload_current_scene()
		elif event.is_action_pressed("debug_1"):
			for p in get_tree().get_nodes_in_group("player"):
				p.set_global_position(Vector2.ZERO)
		elif event.is_action_pressed("debug_2"):
			EventBus.emit_signal("change_to_arrow_cursor")
		elif event.is_action_pressed("debug_3"):
			EventBus.emit_signal("change_to_box_cursor")
