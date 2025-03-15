extends Label

@onready var platform_gun = get_tree().current_scene.get_node("Player/Sprite2D/PlatformGun")
var previous_pcount = -1
var max_pcount

func update_platform_count(current, max):
	
	if current == previous_pcount:
		return
	
	previous_pcount = current
	
	if current <= max / 3:
		add_theme_color_override("font_color", Color(1, 0, 0))
	elif current <= max / 3 * 2:
		add_theme_color_override("font_color", Color(1, 1, 0))
	else:
		add_theme_color_override("font_color", Color(0, 1, 0))
	set_text("Platforms: " + str(current)+"/"+str(max))

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	max_pcount = platform_gun.count
	add_theme_font_size_override("font_size", 32)
	set_text("Platforms: " + str(platform_gun.platform_count)+"/"+str(max_pcount))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	var current_pcount = platform_gun.platform_count
	update_platform_count(current_pcount, max_pcount)
