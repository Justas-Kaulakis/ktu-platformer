extends Node

# MENU arba GAMEPLAY
enum Area {MENU, GAMEPLAY}
var current_area: Area
var music_volume: int
var sfx_volume: int
const initial_volume_value = 0.5

var platform_1 = preload("res://level/platforms/default_platform.tscn")
var platform_2 = preload("res://level/platforms/breakable_platform.tscn")
var platform_3 = preload("res://level/platforms/gravity_platform.tscn")
var p_1 = platform_1
var p_2 = platform_2
var p_3 = platform_3

var ptexture_1 = preload("res://assets/textures/default_platform.png")
var ptexture_2 = preload("res://assets/textures/broken_platform.png")
var ptexture_3 = preload("res://assets/textures/gravity_platform.png")

var pt_1 = ptexture_1
var pt_2 = ptexture_2
var pt_3 = ptexture_3

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
