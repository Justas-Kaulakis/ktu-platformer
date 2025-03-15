extends VBoxContainer

@onready var master: VolumeSlider = $Master
@onready var sfx: VolumeSlider = $SFX
@onready var music: VolumeSlider = $Music


func _on_reset_to_default_pressed() -> void:
	master.set_volume(Global.initial_volume_value)
	sfx.set_volume(Global.initial_volume_value)
	music.set_volume(Global.initial_volume_value)
