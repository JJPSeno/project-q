extends Area2D


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player_projectile") \
	 and get_parent().has_method("shot"):
		get_parent().shot()
