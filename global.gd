extends Node

# MENU arba GAMEPLAY
enum Area {MENU, GAMEPLAY, END_SCREEN}
var current_area: Area = Area.MENU:
	set(new_area):
		current_area = new_area
		AudioManager.update_music_for_scene(new_area)
var music_volume: int
var sfx_volume: int
const initial_volume_value = 0.5

var platform : Dictionary[String, PackedScene] = {
	"default": preload("res://level/platforms/default_platform.tscn"),
	"breakable": preload("res://level/platforms/breakable_platform.tscn"),
	"gravity": preload("res://level/platforms/gravity_platform.tscn"),
	"velocity": preload("res://level/platforms/velocity_platform.tscn"),
}
var platformText : Dictionary[String, CompressedTexture2D] = {
	"default": preload("res://assets/textures/default_platform.png"),
	"breakable": preload("res://assets/textures/broken_platform.png"),
	"gravity": preload("res://assets/textures/gravity_platform.png"),
	"velocity": preload("res://assets/textures/velocity_platform.png")
}
var p_1 = platform["default"]
var p_2 = platform["breakable"]
var p_3 = platform["gravity"]
var p_4 = platform["velocity"]

var pt_1 = platformText["default"]
var pt_2 = platformText["breakable"]
var pt_3 = platformText["gravity"]
var pt_4 = platformText["velocity"]

# PLAYER DATA
var max_health: float = 4.
var max_platform_count = 3
var player = null
var gender: String = "male":
	set(new_gender):
		gender = new_gender
		AudioManager.change_sfx_for(new_gender)

# Powerup info
var double_jump = false
var wall_jump = false
var last_location = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
