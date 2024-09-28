extends Node

#region debug signals
signal speed_updated(new_speed)
signal position_updated(new_pos)
signal player_state_updated(new_state)
signal camera_pos_updated(new_pos)
signal mouse_pos_updated(new_pos)
signal mouse_in_goldilocks_zone(check)
#endregion

signal camera_zoom_updated(new_zoom, new_speed)

signal change_to_box_cursor
signal change_to_arrow_cursor
