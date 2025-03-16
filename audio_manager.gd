extends Node
# https://www.youtube.com/watch?v=07Kyqqg31FI&t=25s&ab_channel=DevWorm
@onready var bg_music_player: AudioStreamPlayer = $BackgroundMusicPlayer

var sound: Dictionary[StringName, AudioStreamPlayer]

var current_area: Global.Area

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sound = {
		"jump": $SFX/jump,
		"run": $SFX/run,
		"place_platform": $SFX/place_platform,
		"take_hit": $SFX/take_hit,
		"die": $SFX/die
	}
	#print(player_sfx.stream["initial_clip"])
	#player_sfx.stream["initial_clip"] = 1
	#var stream : AudioStreamInteractive = player_sfx.stream
	#for i in range(stream.clip_count):
	#	audio_names.append(stream.get_clip_name(i))
	current_area = Global.current_area

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

func play_player_sfx(sfx_name: StringName) -> void:
	if not sound.has(sfx_name):
		printerr("sfx sound does not exist: ", sfx_name)
	else: 
		sound[sfx_name].play()

func stop_player_sfx(sfx_name: StringName) -> void:
	if not sound.has(sfx_name):
		printerr("sfx sound does not exist: ", sfx_name)
	else: 
		sound[sfx_name].stop()

func stop_all_player_sfx() -> void:
	for name in sound:
		sound[name].stop()
