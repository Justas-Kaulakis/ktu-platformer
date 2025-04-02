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
		else:
			Engine.time_scale = 1
			options_panel.visible = false
		get_tree().root.get_viewport().set_input_as_handled()

func apply_powerup(powerup_name, duration):
	match powerup_name:
		"double_jump":
			Global.double_jump = true
			AudioManager.play_sfx("pickup_power_up")
			await get_tree().create_timer(duration).timeout
			Global.double_jump = false
			AudioManager.play_sfx("pickup_power_down")
		"wall_jump":
			Global.wall_jump = true
			AudioManager.play_sfx("pickup_power_up")
			await get_tree().create_timer(duration).timeout
			Global.wall_jump = false
			AudioManager.play_sfx("pickup_power_down")
		_:
			print("Kas skaitys, tas gaidys")
