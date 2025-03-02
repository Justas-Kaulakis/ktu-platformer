extends Label

#var count = get_owner().get_node("player").SPEED

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	add_theme_font_size_override("font_size", 32)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	var current = get_owner().platform_count
	var count = get_owner().count
	#var current = get_owner().get_node("player/PlatformGun").platform_count
	#var count = get_owner().get_node("player/PlatformGun").count
	set_text(str(current)+"/"+str(count))
