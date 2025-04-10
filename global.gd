extends Node

# MENU arba GAMEPLAY
enum Area {MENU, GAMEPLAY}
var current_area: Area
var music_volume: int
var sfx_volume: int
const initial_volume_value = 0.5

var platform : Dictionary[String, PackedScene] = {
	"default": preload("res://level/platforms/default_platform.tscn"),
	"breakable": preload("res://level/platforms/breakable_platform.tscn"),
	"gravity": preload("res://level/platforms/gravity_platform.tscn"),
}
var platformText : Dictionary[String, CompressedTexture2D] = {
	"default": preload("res://assets/textures/default_platform.png"),
	"breakable": preload("res://assets/textures/broken_platform.png"),
	"gravity": preload("res://assets/textures/gravity_platform.png"),
}
var p_1 = platform["default"]
var p_2 = platform["breakable"]
var p_3 = platform["gravity"]

var pt_1 = platformText["default"]
var pt_2 = platformText["breakable"]
var pt_3 = platformText["gravity"]

# PLAYER DATA
var max_health: float = 4.
var max_platform_count = 3

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
