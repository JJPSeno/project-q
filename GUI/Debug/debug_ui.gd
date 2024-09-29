extends Control


const DEBUG_ITEM = preload("res://GUI/Debug/debug_item.tscn")
@onready var debug_column: VBoxContainer = $MarginContainer/DebugColumn


func _ready() -> void:
	add_debug_item("speed","value", EventBus.speed_updated)
	add_debug_item("global pos","value", EventBus.position_updated)
	add_debug_item("player state","run", EventBus.player_state_updated)
	add_debug_item("camera pos","value", EventBus.camera_pos_updated)
	add_debug_item("mouse pos","value", EventBus.mouse_pos_updated)

# this debug item needs to subscribe to signals
func add_debug_item(label_name: String, value: String, update_signal = null) -> void:
	var debug_item_instance = DEBUG_ITEM.instantiate()
	if debug_item_instance.get_children()[0] is Label:
		debug_item_instance.get_children()[0].text = label_name+": "
	if debug_item_instance.get_children()[1] is Label:
		debug_item_instance.get_children()[1].text = value
	if update_signal is Signal:
		update_signal.connect(debug_item_instance._on_signal_value_updated)
	debug_column.add_child(debug_item_instance)
	
