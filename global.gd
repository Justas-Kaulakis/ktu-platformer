extends Node

## MENU, GAMEPLAY, END_SCREEN
enum Area {MENU, GAMEPLAY, END_SCREEN}
var current_area: Area = Area.MENU:
	set(new_area):
		current_area = new_area
		AudioManager.update_music_for_scene(new_area)
var music_volume: int
var sfx_volume: int
const initial_volume_value = 0.5

var platform: Dictionary[String, PackedScene] = {
	"default": preload("res://level/platforms/default_platform.tscn"),
	"breakable": preload("res://level/platforms/breakable_platform.tscn"),
	"gravity": preload("res://level/platforms/gravity_platform.tscn"),
	"velocity": preload("res://level/platforms/velocity_platform.tscn"),
	"trampoline": preload("res://level/platforms/trampoline_platform.tscn"),
	"flicker": preload("res://level/platforms/flicker_platform.tscn"),
	"rotate": preload("res://level/platforms/rotate_platform.tscn"),
}
var platformText: Dictionary[String, CompressedTexture2D] = {
	"default": preload("res://assets/textures/default_platform.png"),
	"breakable": preload("res://assets/textures/broken_platform.png"),
	"gravity": preload("res://assets/textures/gravity_platform.png"),
	"velocity": preload("res://assets/textures/velocity_platform.png"),
	"trampoline": preload("res://assets/textures/trampoline_platform.png"),
	"trampoline2": preload("res://assets/textures/trampoline_platform2.png"),
	"flicker": preload("res://assets/textures/flicker_platform.png"),
	"flicker2": preload("res://assets/textures/flicker_platform2.png"),
	"rotate": preload("res://assets/textures/rotate_platform.png"),
}

var platform_display_names: Dictionary = {
	"default": "Default",
	"breakable": "Crumbling",
	"gravity": "Falling",
	"velocity": "Acceleration",
	"trampoline": "Trampoline",
	"flicker": "Vanishing",
	"rotate": "Rotating"
}

var input_actions

var p_1 = platform["default"]
var p_2 = platform["breakable"]
var p_3 = platform["gravity"]
var p_4 = platform["velocity"]
var p_5 = platform["trampoline"]
var p_6 = platform["flicker"]
var p_7 = platform["rotate"]

 
var pt_1 = platformText["default"]
var pt_2 = platformText["breakable"]
var pt_3 = platformText["gravity"]
var pt_4 = platformText["velocity"]
var pt_5 = platformText["trampoline"]
var pt_5_2 = platformText["trampoline2"]
var pt_6 = platformText["flicker"]
var pt_6_2 = platformText["flicker2"]
var pt_7 = platformText["rotate"]

var pdn_1 = platform_display_names["default"]
var pdn_2 = platform_display_names["breakable"]
var pdn_3 = platform_display_names["gravity"]
var pdn_4 = platform_display_names["velocity"]
var pdn_5 = platform_display_names["trampoline"]
var pdn_6 = platform_display_names["flicker"]
var pdn_7 = platform_display_names["rotate"]

# PLAYER DATA
var max_health: float = 4.
var max_platform_count: int = 3
var player: Player = null
var gender: String = "male":
	set(new_gender):
		gender = new_gender
		AudioManager.change_sfx_for(new_gender)

# Powerup info
var double_jump = false
var wall_jump = false
var last_location = 0
var rotate = 0
var rotatable_platform = false

# Checkpoint info
var lastCheckpoint: Checkpoint = null;
