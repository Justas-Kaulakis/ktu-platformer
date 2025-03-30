extends Node
# https://www.youtube.com/watch?v=07Kyqqg31FI&t=25s&ab_channel=DevWorm
@onready var bg_music_player: AudioStreamPlayer = $BackgroundMusicPlayer
var sound: Dictionary[StringName, AudioStreamPlayer]
@onready var current_area: Global.Area = Global.current_area

func _ready() -> void:
	for child in $SFX.get_children():
		if child is AudioStreamPlayer:
			var sound_name = StringName(child.name)
			sound[sound_name] = child
	stop_all_sfx()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	if current_area != Global.current_area:
		current_area = Global.current_area
		update_music_for_scene()

# Cia galima keisti muzika is BackGroundMusicPlayer 
func update_music_for_scene():
	match current_area:
		Global.Area.MENU:
			bg_music_player["parameters/switch_to_clip"] = "MenuMusic"
		_:
			bg_music_player["parameters/switch_to_clip"] = "GamePlayMusic"

func play_sfx(sfx_name: StringName) -> void:
	if not sound.has(sfx_name):
		printerr("sfx sound does not exist: ", sfx_name)
	else: 
		sound[sfx_name].play()

func stop_sfx(sfx_name: StringName) -> void:
	if not sound.has(sfx_name):
		printerr("sfx sound does not exist: ", sfx_name)
	else: 
		sound[sfx_name].stop()

func stop_all_sfx() -> void:
	for sound_name in sound:
		sound[sound_name].stop()
