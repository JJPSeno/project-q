extends Node


@export var health : int

func take_damage(damage: int):
	health = clamp(health-damage,0,health)
	if health == 0 and get_parent().has_method("die"):
		get_parent().die()
