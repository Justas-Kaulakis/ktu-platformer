extends Node

# MENU arba GAMEPLAY
enum Area {MENU, GAMEPLAY}
var current_area: Area 
var music_volume: int
var sfx_volume: int
const initial_volume_value = 0.5

# PLAYER DATA
var max_health: float = 4.
var max_platform_count = 3
var last_location = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
