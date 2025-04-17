extends Node

@onready var options_panel: Control = $"../UI/Options Menu"

var is_game_paused = false
var is_poisoned = false

func _ready() -> void:
	Engine.time_scale = 1

func _input(event):
	if event.is_action_pressed("pause_game"):
		is_game_paused = !is_game_paused
		if is_game_paused:
			Engine.time_scale = 0
			options_panel.visible = true
			AudioManager.mute_2d_sfx(true)
		else:
			Engine.time_scale = 1
			options_panel.visible = false
			AudioManager.mute_2d_sfx(false)
		get_tree().root.get_viewport().set_input_as_handled()
