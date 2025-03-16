extends Node

func handle_level_changed(current_level_name: String):
	match current_level_name:
		"Demo level":
			get_tree().change_scene_to_file("res://level/level_1.tscn")
		"Level 1":
			get_tree().change_scene_to_file("res://level/demo_level.tscn")
