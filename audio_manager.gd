extends Node
# https://www.youtube.com/watch?v=07Kyqqg31FI&t=25s&ab_channel=DevWorm
@onready var bg_music_player: AudioStreamPlayer = $BackgroundMusicPlayer
var sound: Dictionary[StringName, AudioStreamPlayer]
var voice: Dictionary[StringName, Dictionary] = {
	"male": {
		"jump": preload("res://assets/audio/male_jump_voice.wav"),
		"die": preload("res://assets/audio/death_scream.wav"),
	},
	"female": {
		"jump": preload("res://assets/audio/female_jump.wav"),
		"die": preload("res://assets/audio/female_death_scream.wav"),
	},
}

func _ready() -> void:
	for child in $SFX.get_children():
		if child is AudioStreamPlayer:
			var sound_name = StringName(child.name)
			sound[sound_name] = child
	stop_all_sfx()

# Cia galima keisti muzika is BackGroundMusicPlayer 
func update_music_for_scene(area):
	match area:
		Global.Area.MENU:
			bg_music_player["parameters/switch_to_clip"] = "MenuMusic"
		Global.Area.END_SCREEN:
			bg_music_player["parameters/switch_to_clip"] = "EndMusic"
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

## for 'male' or 'female'
func change_sfx_for(type: StringName):
	var s = sound['jump'].stream as AudioStreamSynchronized
	var s2 = s.get_sync_stream(1) as AudioStreamRandomizer
	var d = sound['die'].stream as AudioStreamSynchronized
	
	#var jump_voice = s2.get_stream(0)
	#var die_sound = d.get_sync_stream(0)
	s2.set_stream(0, voice[type]['jump'])
	d.set_sync_stream(0, voice[type]['die'])
