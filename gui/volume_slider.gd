extends HBoxContainer 

class_name VolumeSlider 

@export var label = "volume" 
@export_enum("Master", "Music", "SFX") 
var bus_name: String = "Master"
@onready var slider_label: Label = $Container/SliderLabel
@onready var h_slider: HSlider = $HSlider


var bus_index: int

func _ready():
	slider_label.text = label
	bus_index = AudioServer.get_bus_index(bus_name)
	AudioServer.set_bus_volume_linear(bus_index,Global.initial_volume_value)

func _on_h_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_linear(bus_index,value)

func set_volume(volume:float) -> void:
	h_slider.value = volume
