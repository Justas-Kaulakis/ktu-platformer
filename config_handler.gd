extends Node

var config = ConfigFile.new()
const CONFIG_FILE_PATH = "res://settings.ini"

func _ready():
	config.load(CONFIG_FILE_PATH)
	set_defaults()
	config.save(CONFIG_FILE_PATH)
	#if !FileAccess.file_exists(CONFIG_FILE_PATH):
	#	set_defaults()
	#else:
	#	config.load(CONFIG_FILE_PATH)
		
func set_defaults():
	var default_settings = {
		# Game controls
		"controls": {
			"move_left": "A",
			"move_right": "D",
			"jump": "Space",
			"shoot": "mouse_1",
			"reload": "R",
			"pause_game": "Escape"
		},
		# Audio settings
		"audio_settings": {
			"master_volume": Global.initial_volume_value,
			"sfx_volume": Global.initial_volume_value,
			"music_volume": Global.initial_volume_value
		},
		# Video settings
		"video_settings": {
			"fullscreen": true
		},
		# Character options
		"character": {
			"gender": "male"
		}
	}
	
	# Checks if any rows are missing in the config file
	for section in default_settings.keys():
		for key in default_settings[section].keys():
			if !config.has_section_key(section, key):
				config.set_value(section, key, default_settings[section][key])
	
func save_controls(action: StringName, event: InputEvent):
	var event_str
	if event is InputEventKey:
		event_str = OS.get_keycode_string(event.physical_keycode)
	elif event is InputEventMouseButton:
		event_str = "mouse_" + str(event.button_index)
		
	config.set_value("controls", action, event_str)
	config.save(CONFIG_FILE_PATH)
	
func save_audio(key: String, value):
	config.set_value("audio_settings", key, value)
	config.save(CONFIG_FILE_PATH)
		
func save_video(key: String, value):
	config.set_value("video_settings", key, value)
	config.save(CONFIG_FILE_PATH)

func save_character_settings(key: String, value):
	config.set_value("character", key, value)
	config.save(CONFIG_FILE_PATH)

func loadCharacterSettings():
	var settings = {}
	for key in config.get_section_keys("character"):
		settings[key] = config.get_value("character", key)
	return settings
	
func load_controls():
	var controls = {}
	var keys = config.get_section_keys("controls")
	for key in keys:
		var input_event
		var event_str = config.get_value("controls", key)
		
		if event_str.contains("mouse_"):
			input_event = InputEventMouseButton.new()
			input_event.button_index = int(event_str.split("_")[1])
		else:
			input_event = InputEventKey.new()
			input_event.keycode = OS.find_keycode_from_string(event_str)
		
		controls[key] = input_event
	return controls
	
func load_audio():
	var audio_settings = {}
	for key in config.get_section_keys("audio_settings"):
		audio_settings[key] = config.get_value("audio_settings", key)
	return audio_settings

func load_video():
	var video_settings = {}
	for key in config.get_section_keys("video_settings"):
		video_settings[key] = config.get_value("video_settings", key)
	return video_settings
