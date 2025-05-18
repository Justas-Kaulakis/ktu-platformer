extends TextEdit
#logika priklauso nuo node pavadinimo

func _ready() -> void:
	var key_name
	for inputEvent in InputMap.action_get_events(name):
		key_name = inputEvent.as_text().trim_suffix(" (Physical)")
	var name_text = name.replace("_", " ")
	text = str(name_text)+": "+str(key_name)
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed(name):
		set_deferred("visible",false)
