extends Control

@onready var input_button = preload("res://gui/input_button.tscn")
@onready var action_list = $"PanelContainer/MarginContainer/VBoxContainer/ScrollContainer/List of Actions"

var input_actions = {
	"move_left": "Move leftwards",
	"move_right": "Move rightwards",
	"jump": "Jump",
	"shoot": "Platform gun – shoot",
	"reload": "Platform gun – reload"
}

var is_remapping = false
var action_to_remap = null
var remapping_button = null

func create_action_list():
	InputMap.load_from_project_settings()
	for item in action_list.get_children():
		item.queue_free()
	
	for action in input_actions:
		var button = input_button.instantiate()
		var action_label = button.find_child("Action Label")
		var input_label = button.find_child("Input Label")
		
		action_label.text = input_actions[action]
		
		var events = InputMap.action_get_events(action)
		if events.size() > 0:
			input_label.text = events[0].as_text().trim_suffix(" (Physical)")
		else:
			input_label.text = ""
			
		action_list.add_child(button)
		button.pressed.connect(_on_input_button_pressed.bind(button, action))
		
func update_action_list(button, event):
	button.find_child("Input Label").text = event.as_text().trim_suffix(" (Physical)")
	

func _ready() -> void:
	create_action_list()
	
func _on_input_button_pressed(button, action):
	if !is_remapping:
		is_remapping = true
		action_to_remap = action
		remapping_button = button
		button.find_child("Input Label").text = "Input key..."
		
func _input(event):
	if is_remapping:
		if (
			event is InputEventKey ||
			(event is InputEventMouseButton && event.pressed)
		):
			if event is InputEventMouseButton && event.double_click:
				event.double_click = false
			
			InputMap.action_erase_events(action_to_remap)
			InputMap.action_add_event(action_to_remap, event)
			update_action_list(remapping_button, event)
			
			is_remapping = false
			action_to_remap = null
			remapping_button = null
			
			accept_event()


func _on_reset_to_default_pressed() -> void:
	create_action_list()
