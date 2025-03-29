extends CanvasLayer


@onready var platform_counter: Label = $platform_counter
@onready var Health: TextureProgressBar = $Health


func _ready() -> void:

	platform_counter.set_text("Platforms: " + str(Global.max_platform_count)+"/"+str(Global.max_platform_count))

func update_health_bar(current_health):
	get_node("Health").value = current_health


func update_platform_count(current):
	if current <= Global.max_platform_count / 3:
		platform_counter.add_theme_color_override("font_color", Color(1, 0, 0))
	elif current <= Global.max_platform_count / 3 * 2:
		platform_counter.add_theme_color_override("font_color", Color(1, 1, 0))
	else:
		platform_counter.add_theme_color_override("font_color", Color(0, 1, 0))
	platform_counter.set_text("Platforms: " + str(current)+"/"+str(Global.max_platform_count))
