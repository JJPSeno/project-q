extends Node

#region debug signals
signal speed_updated(new_speed)
signal position_updated(new_pos)
signal player_movement_state_updated(new_state)
signal player_ability_state_updated(new_state)
signal camera_pos_updated(new_pos)
signal mouse_pos_updated(new_pos)
signal camera_zoom_updated(new_zoom, new_speed)
#endregion

signal change_to_box_cursor
signal change_to_arrow_cursor

#region ability signals
signal none
signal no_cast
signal dash_cast
signal spike_cast
#endregion

#region spike signals
signal spike_hit(sling_direction)
signal spike_traversed
#endregion

#region music / sfx signals
signal toggle_music_mute(value)
#endregion
