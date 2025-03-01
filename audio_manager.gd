extends Node
# https://www.youtube.com/watch?v=07Kyqqg31FI&t=25s&ab_channel=DevWorm
@export var bg_music_player: AudioStreamPlayer 

var current_area: AudioGlobal.Area

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_area = AudioGlobal.current_area
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if current_area != AudioGlobal.current_area:
		current_area = AudioGlobal.current_area
		update_music_for_scene()


# Cia galima keisti muzika is BackGroundMusicPlayer 
func update_music_for_scene():
	match current_area:
		AudioGlobal.Area.MENU:
			bg_music_player["parameters/switch_to_clip"] = "MenuMusic"
		_:
			bg_music_player["parameters/switch_to_clip"] = "GamePlayMusic"
		
