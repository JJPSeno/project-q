extends Node

@onready var music_player: AudioStreamPlayer2D = $MusicPlayer


func _ready() -> void:
	EventBus.toggle_music_mute.connect(_on_music_mute_toggled)


func _on_music_mute_toggled(value) -> void:
	if value:
		music_player.play()
	else:
		music_player.stop()
