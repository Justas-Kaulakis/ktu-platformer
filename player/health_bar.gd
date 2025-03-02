extends Label

@onready var game_manager = get_node("/root/Demo level/Game Manager")

var previous_health = -1
var max

func update_health_bar(current, max):
	
	if current == previous_health:
		return
	
	previous_health = current
	
	if current <= max * 0.3:
		add_theme_color_override("font_color", Color(1, 0, 0))
	elif current <= max * 0.7:
		add_theme_color_override("font_color", Color(1, 1, 0))
	else:
		add_theme_color_override("font_color", Color(0, 1, 0))
	set_text("Health: " + str(current)+"/"+str(max))

func _ready() -> void:
	max = game_manager.max_health
	add_theme_font_size_override("font_size", 32)
	set_text("Health: " + str(game_manager.current_health)+"/"+str(max))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	var current = game_manager.current_health
	update_health_bar(current, max)
