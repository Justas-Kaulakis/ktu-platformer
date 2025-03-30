extends Node
# https://www.youtube.com/watch?v=07Kyqqg31FI&t=25s&ab_channel=DevWorm
@onready var bg_music_player: AudioStreamPlayer = $BackgroundMusicPlayer
@onready var sound: Dictionary[StringName, AudioStreamPlayer] = {
	# PLAYER SOUNDS
	"jump": $SFX/jump,
	"run": $SFX/run,
	"place_platform": $SFX/place_platform,
	"take_hit": $SFX/take_hit,
	"die": $SFX/die,
	
	# LEVEL OBJECTS
	"pickup_power_up": $SFX/pickup_power_up,
	"pickup_power_down": $SFX/pickup_power_down,
}
@onready var current_area: Global.Area = Global.current_area

func _ready() -> void:
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
