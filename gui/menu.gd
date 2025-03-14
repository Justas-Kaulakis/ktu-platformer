extends Control

@onready var options_panel: Control = $UI/OptionsPanel


func _input(event):
	if event.is_action_pressed("pause_game"):
		options_panel.visible = !options_panel.visible


func _on_ready() -> void:
	Global.current_area = Global.Area.MENU

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://level/demo_level.tscn")


func _on_options_pressed() -> void:
	options_panel.visible = !options_panel.visible 
	

func _on_quit_pressed() -> void:
	get_tree().quit()
