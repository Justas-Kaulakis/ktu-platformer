class_name ButtonWithSounds extends BaseButton

@export var hover_enter_sound_name: String = "button_hover"  # Set in the Inspector if needed
@export var hover_exit_sound_name: String = ""#button_hover"  # Set in the Inspector if needed
@export var pressed_sound_name: String = "button_pressed"  # Set in the Inspector if needed

var last_hover_play_time := 0.0
var hover_cooldown := 0.1  # seconds


func _ready():
	if hover_enter_sound_name:
		mouse_entered.connect(_on_mouse_entered)
	if hover_exit_sound_name:
		mouse_exited.connect(_on_mouse_exited)
	if pressed_sound_name:
		pressed.connect(_on_button_pressed)

func cooldown_passed() -> bool:
	var now = Time.get_ticks_msec() / 1000.0
	if now - last_hover_play_time < hover_cooldown:
		return false
	else:
		last_hover_play_time = now
		return true

func _on_mouse_entered():
	if(cooldown_passed()):
		AudioManager.play_sfx(hover_enter_sound_name)

func _on_mouse_exited():
	if(cooldown_passed()):
		AudioManager.play_sfx(hover_exit_sound_name)

func _on_button_pressed() -> void:
	AudioManager.play_sfx(pressed_sound_name)
