extends Node

@onready var input_settings: Control = $"../UI/Input Settings"

var is_game_paused = false
var max_health = 3
var current_health = max_health

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
    

func _process(_delta) -> void:
	if current_health <= 0:
		reset_level()

func update_health(amount):
	current_health += amount
	#print("Current health: " + str(current_health))
	
func reset_level():
	get_tree().reload_current_scene()
