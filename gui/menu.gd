extends Control

@onready var options_panel: Control = get_tree().current_scene.get_node("UI/Options Menu")


func _input(event):
	if event.is_action_pressed("pause_game"):
		options_panel.visible = !options_panel.visible


func _on_ready() -> void:
	Global.current_area = Global.Area.MENU
	find_signal_emitter(get_tree().current_scene, "set_volume")

func _on_play_pressed() -> void:
	#get_tree().change_scene_to_file("res://level/demo_level.tscn")
	get_tree().change_scene_to_file("res://level/level_1.tscn")


func _on_options_pressed() -> void:
	options_panel.visible = !options_panel.visible 

func find_signal_emitter(root: Node, signal_name: String):
	for child in root.get_children():
		if child.has_signal(signal_name):
			print(child.name, " in scene ", child.scene_file_path, " has the signal: ", signal_name)
		find_signal_emitter(child, signal_name)  # Recursively check children

func _on_quit_pressed() -> void:
	get_tree().quit()
