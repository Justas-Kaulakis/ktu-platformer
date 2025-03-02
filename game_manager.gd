extends Node

@onready var input_settings: Control = $"../UI/Input Settings"

var is_game_paused = false

func _ready() -> void:
	Engine.time_scale = 1
	print("Input Settings found: ", input_settings)
	get_tree().root.print_tree_pretty()

func _input(event):
	if event.is_action_pressed("pause_game"):
		is_game_paused = !is_game_paused
		if is_game_paused:
			Engine.time_scale = 0
			input_settings.visible = true
		else:
			Engine.time_scale = 1
			input_settings.visible = false
		get_tree().root.get_viewport().set_input_as_handled()
