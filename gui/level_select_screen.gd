extends CenterContainer

@onready var vb_container: VBoxContainer = $ScrollContainer/VBoxContainer

func load_levels() -> void:
	var level_paths = DirAccess.get_files_at("res://level/")
	print(level_paths)
	for level_path in level_paths:
		if level_path.begins_with("level_") and level_path.ends_with(".tscn"):
			var stripped_name = level_path.replace(".tscn", "")
			var new_name = stripped_name.capitalize()
			var button = Button.new()
			button.text = new_name
			vb_container.add_child(button)
			SceneManager.load_next_level("res://level/" + level_path)
		
			button.pressed.connect(func():
				Global.current_area = Global.Area.GAMEPLAY
				SceneManager.switch_scene("res://level/" + level_path)
			)

func _ready() -> void:
	load_levels()
	
func _process(delta: float) -> void:
	pass
