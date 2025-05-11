extends TextEdit
#logika priklauso nuo node pavadinimo

func _ready() -> void:
	var text
	for inputEvent in InputMap.action_get_events(name):
		text = inputEvent.as_text().trim_suffix(" (Physical)")
	var name_text = name.replace("_", " ")
	set_deferred("text",str(name_text)+": "+str(text))
	
func _process(delta: float) -> void:
	if(Input.is_action_pressed(name)):
		set_deferred("visible",false)
