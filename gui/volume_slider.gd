extends HBoxContainer 

class_name VolumeSlider 

@export var label = "volume" 
@export_enum("Master", "Music", "SFX") 
var bus_name: String = "Master"
@onready var slider_label: Label = $Container/SliderLabel
@onready var h_slider: HSlider = $HSlider
@onready var audio_settings = ConfigHandler.load_audio()

var bus_index: int

func _ready():
	h_slider.mouse_entered.connect(_on_mouse_entered)
	slider_label.text = label
	bus_index = AudioServer.get_bus_index(bus_name)
	var volume_value
	match bus_name:
		"Master":
			volume_value = min(audio_settings.master_volume, 1.0)
		"SFX":
			volume_value = min(audio_settings.sfx_volume, 1.0)
		"Music":
			volume_value = min(audio_settings.music_volume, 1.0)
	AudioServer.set_bus_volume_linear(bus_index, volume_value)
	h_slider.value = volume_value

func _on_h_slider_value_changed(value: float) -> void:
	match bus_name:
		"Master":
			ConfigHandler.save_audio("master_volume", value)
		"SFX":
			ConfigHandler.save_audio("sfx_volume", value)
		"Music":
			ConfigHandler.save_audio("music_volume", value)
	AudioServer.set_bus_volume_linear(bus_index,value)
	AudioManager.play_sfx("button_hover")

func set_volume(volume:float) -> void:
	h_slider.value = volume

func _on_mouse_entered():
		AudioManager.play_sfx("button_hover")
