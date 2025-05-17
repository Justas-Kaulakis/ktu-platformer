extends CanvasLayer


@onready var platform_counter: RichTextLabel = $platform_counter
@onready var Health: TextureProgressBar = $Health


func _ready() -> void:

	#platform_counter.set_text("Platforms: " + str(Global.max_platform_count)+"/"+str(Global.max_platform_count))
	update_platform_count(Global.max_platform_count)

func update_health_bar(current_health):
	get_node("Health").value = current_health

func update_platform_count(current):
	var colour: Color
	if current <= float(Global.max_platform_count) / 3:
		colour = Color(255, 0, 0)
	elif current <= float(Global.max_platform_count) / 3 * 2:
		colour = Color(255, 255, 0)
	else:
		colour = Color(0, 255, 0)
	var colour_converted = colour.to_html()
	platform_counter.text = "Platforms: [color=" + colour_converted + "]%d%s%d[/color]" % [current, "/", Global.max_platform_count]
