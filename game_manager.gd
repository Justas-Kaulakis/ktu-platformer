extends Node

@onready var options_panel: Control = get_tree().current_scene.get_node("UI/Options Menu")

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

func apply_powerup(name, duration):
	match name:
		"double_jump":
			Global.double_jump = true
			await get_tree().create_timer(duration).timeout
			Global.double_jump = false
		"wall_jump":
			Global.wall_jump = true
			await get_tree().create_timer(duration).timeout
			Global.wall_jump = false
		_:
			print("Kas skaitys, tas gaidys")

"""
func _process(_delta) -> void:
	if current_health <= 0:
		AudioManager.play_player_sfx("die")
		reset_level()

func update_health(amount):
	current_health += amount
	AudioManager.play_player_sfx("take_hit")
	
func reset_level():
	get_tree().reload_current_scene()

"""
