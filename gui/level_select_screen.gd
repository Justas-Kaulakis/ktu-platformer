extends Control

@onready var level_selection: Control = $"."
@onready var back_to_main_menu: Button = $"PanelContainer/MarginContainer/VBoxContainer/Back to Main Menu"
@onready var vb_container: VBoxContainer = $PanelContainer/MarginContainer/VBoxContainer

var sound_script: GDScript = preload("res://gui/ButtonWithSounds.gd")

@export_file("*.tscn") var level_scenes: Array[String] = [
	"res://level/level_1.tscn",
	"res://level/level_2.tscn",
	"res://level/level_3.tscn",
	"res://level/level_4.tscn",
]

func load_levels() -> void:
	for level_path in level_scenes:
		var stripped_name = level_path.get_file().replace(".tscn", "")
		var new_name = stripped_name.capitalize()
		var button_font = preload("res://gui/kenney_mini_square.ttf")
		var button = Button.new()
		button.add_theme_font_override("font", button_font)
		button.text = new_name
		button.set_script(sound_script)
		vb_container.add_child(button)
		SceneManager.load_next_level(level_path)
	
		button.pressed.connect(func():
			Global.current_area = Global.Area.GAMEPLAY
			SceneManager.switch_scene(level_path)
		)

func _ready() -> void:
	back_to_main_menu.pressed.connect(_on_back_to_main_menu)
	load_levels()
	pass
	
func _on_back_to_main_menu():
	level_selection.visible = !level_selection.visible
