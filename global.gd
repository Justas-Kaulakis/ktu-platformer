extends Node

# MENU arba GAMEPLAY
enum Area {MENU, GAMEPLAY}
enum Level {DEMO, L1, L2, L3, L4}
var current_area: Area 
var current_level: Level 
var music_volume: int
var sfx_volume: int
const initial_volume_value = 0.5

# PLAYER DATA
var max_health: float = 3.
var max_platform_count = 3

func get_current_level() -> Node2D:
	return get_tree().current_scene.current_level_layer.get_child(0)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
