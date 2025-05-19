extends RichTextLabel
#logika priklauso nuo node pavadinimo

@onready var text_colour = SceneManager.current_scene.level_aesthetic_colour.to_html()

func _ready() -> void:
	add_to_group("control_displays")
	var key_name
	for inputEvent in InputMap.action_get_events(name):
		key_name = inputEvent.as_text().trim_suffix(" (Physical)")

	var name_text = name.replace("_", " ")
	if name in Global.input_actions:
		name_text = Global.input_actions[name]
	text = "[color=%s]%s:[/color] %s" % [text_colour, name_text, key_name]
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed(name):
		set_deferred("visible",false)
