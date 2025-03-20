extends CanvasLayer

@onready var health_bar: Label = $"Health Bar"
@onready var platform_counter: Label = $platform_counter


func _ready() -> void:
	health_bar.set_text("Health: " + str(Global.max_health)+"/"+str(Global.max_health))
	platform_counter.set_text("Platforms: " + str(Global.max_platform_count)+"/"+str(Global.max_platform_count))

func update_health_bar(current_health):
	if current_health <= Global.max_health * 0.3:
		health_bar.add_theme_color_override("font_color", Color(1, 0, 0))
	elif current_health <= Global.max_health * 0.7:
		health_bar.add_theme_color_override("font_color", Color(1, 1, 0))
	else:
		health_bar.add_theme_color_override("font_color", Color(0, 1, 0))
	health_bar.set_text("Health: " + str(current_health)+"/"+str(Global.max_health))

func update_platform_count(current):
	if current <= Global.max_platform_count / 3:
		platform_counter.add_theme_color_override("font_color", Color(1, 0, 0))
	elif current <= Global.max_platform_count / 3 * 2:
		platform_counter.add_theme_color_override("font_color", Color(1, 1, 0))
	else:
		platform_counter.add_theme_color_override("font_color", Color(0, 1, 0))
	platform_counter.set_text("Platforms: " + str(current)+"/"+str(Global.max_platform_count))
