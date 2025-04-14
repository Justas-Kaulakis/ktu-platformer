extends Control

func _ready() -> void:
	Global.current_area = Global.Area.END_SCREEN

func _on_button_pressed() -> void:
	SceneManager.switch_scene_with_fade("res://gui/menu.tscn")
