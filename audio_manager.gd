extends Node
# https://www.youtube.com/watch?v=07Kyqqg31FI&t=25s&ab_channel=DevWorm
@onready var bg_music_player: AudioStreamPlayer = $BackgroundMusicPlayer


@onready var _jump: AudioStreamPlayer = $SFX/jump
@onready var _run: AudioStreamPlayer = $SFX/run
@onready var _place_platform: AudioStreamPlayer = $SFX/place_platform
@onready var _take_hit: AudioStreamPlayer = $SFX/take_hit
@onready var _die: AudioStreamPlayer = $SFX/die


var sound: Dictionary[StringName, AudioStreamPlayer]

var current_area: Global.Area

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sound = {
		"jump": _jump,
		"run": _run,
		"place_platform": _place_platform,
		"take_hit": _take_hit,
		"die": _die
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
	sound[sfx_name].play()

func stop_player_sfx(sfx_name: StringName) -> void:
	if not sound.has(sfx_name):
		printerr("sfx sound does not exist: ", sfx_name)
	sound[sfx_name].stop()
