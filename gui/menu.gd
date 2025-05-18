extends Control

@onready var options_panel: Control = $"UI/Options Menu"
@onready var level_selection: Control = $"UI/Level Selection Menu"


func _input(event):
	if event.is_action_pressed("pause_game"):
		if !level_selection.visible and options_panel.visible:
			options_panel.visible = !options_panel.visible
		elif !options_panel.visible and level_selection.visible:
			level_selection.visible = !level_selection.visible


func _ready() -> void:
	Global.current_area = Global.Area.MENU
	#SceneManager.load_next_level("res://level/level_1.tscn") # load in memory 
	find_signal_emitter(SceneManager.current_scene, "set_volume")

func _on_play_pressed() -> void:
	#get_tree().change_scene_to_file("res://level/demo_level.tscn")
	#Global.current_area = Global.Area.GAMEPLAY
	#SceneManager.switch_scene("res://gui/level_select_screen.tscn")
	level_selection.visible = !level_selection.visible
	


func _on_options_pressed() -> void:
	options_panel.visible = !options_panel.visible 

func find_signal_emitter(root: Node, signal_name: String):
	for child in root.get_children():
		if child.has_signal(signal_name):
			print(child.name, " in scene ", child.scene_file_path, " has the signal: ", signal_name)
		find_signal_emitter(child, signal_name)  # Recursively check children

func _on_quit_pressed() -> void:
	AudioManager.play_sfx("button_pressed")
	get_tree().quit()
