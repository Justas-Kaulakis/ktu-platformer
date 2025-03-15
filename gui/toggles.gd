extends VBoxContainer


func _on_fullscreen_toggle_toggled(toggled_on: bool) -> void:
	var mode: DisplayServer.WindowMode
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
