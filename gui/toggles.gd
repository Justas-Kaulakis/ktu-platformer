extends VBoxContainer

@onready var fullscreen = $ToggleRow/MarginContainer/FullscreenToggle
@onready var video_settings = ConfigHandler.load_video()

func _ready():
	fullscreen.button_pressed = video_settings.fullscreen

func _on_fullscreen_toggle_toggled(toggled_on: bool) -> void:
	ConfigHandler.save_video("fullscreen", toggled_on)
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
