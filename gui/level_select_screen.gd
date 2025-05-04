extends CenterContainer

@onready var vb_container: VBoxContainer = $ScrollContainer/VBoxContainer
@onready var level_selection: CenterContainer = $"."
@onready var back_to_main_menu: Button = $"ScrollContainer/VBoxContainer/Back to Main Menu"

func load_levels() -> void:
	var level_paths = DirAccess.get_files_at("res://level/")
	for level_path in level_paths:
		if level_path.begins_with("level_") and level_path.ends_with(".tscn"):
			var stripped_name = level_path.replace(".tscn", "")
			var new_name = stripped_name.capitalize()
			var button_font = FontFile.new()
			button_font.load_dynamic_font("res://gui/kenney_mini_square.ttf")
			var button = Button.new()
			button.add_theme_font_override("font", button_font)
			button.text = new_name
			vb_container.add_child(button)
			SceneManager.load_next_level("res://level/" + level_path)
		
			button.pressed.connect(func():
				Global.current_area = Global.Area.GAMEPLAY
				SceneManager.switch_scene("res://level/" + level_path)
			)

func _ready() -> void:
	back_to_main_menu.pressed.connect(_on_back_to_main_menu)
	load_levels()
	pass
	
func _on_back_to_main_menu():
	level_selection.visible = !level_selection.visible
	
func _process(delta: float) -> void:
	pass
