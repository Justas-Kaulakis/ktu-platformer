extends Button


func _ready() -> void:
	if Global.current_area == Global.Area.MENU:
		queue_free.call_deferred()
		
func _on_pressed() -> void:
	Global.current_area = Global.Area.MENU
	SceneManager.switch_scene("res://gui/menu.tscn")
