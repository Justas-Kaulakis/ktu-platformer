extends ButtonWithSounds 


func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	if Global.current_area == Global.Area.MENU:
		queue_free.call_deferred()
		
func _on_pressed() -> void:
	Global.current_area = Global.Area.MENU
	SceneManager.switch_scene("res://gui/menu.tscn")
	AudioManager.play_sfx(pressed_sound_name)
