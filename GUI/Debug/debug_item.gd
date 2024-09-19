extends HBoxContainer


@onready var value_label: Label = $value_label

# Called when the node enters the scene tree for the first time.
func _on_signal_value_updated(new_value: String) -> void:
	value_label.text = new_value
