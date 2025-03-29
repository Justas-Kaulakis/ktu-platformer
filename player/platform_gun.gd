class_name PlatformGun extends Node2D

const dynamic_platform = preload("res://level/platforms/gravity_platform.tscn")
@onready var tiles = $"../../../Layers/Collision Tiles" as TileMapLayer
@onready var game_manager = $"../../../Game Manager"
var can_shoot_player = 1 #checks if mouse is on player
var can_shoot = 1 # checks if mouse is on created platform
var _platform_count: int = Global.max_platform_count:  # Private variable with setter
	set(value):
		_platform_count = value
		platform_count_changed.emit(_platform_count)
	get:
		return _platform_count

signal platform_count_changed(new_count)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if get_tree().current_scene is SceneManager:
		var scene_manager = get_tree().current_scene as SceneManager
		var player_ui = scene_manager.get_node("Player UI") as PlayerUI
		platform_count_changed.connect(player_ui.update_platform_count)
	# Emit initial signal to update the UI
	platform_count_changed.emit(_platform_count)

func disconnect_signals() -> void:
	var scene_manager = get_tree().current_scene as SceneManager
	if scene_manager:
		var player_ui = scene_manager.get_node("Player UI") as PlayerUI
		if platform_count_changed.is_connected(player_ui.update_platform_count):
			platform_count_changed.disconnect(player_ui.update_platform_count)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	look_at(get_global_mouse_position())
	
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	if rotation_degrees > 90 and rotation_degrees < 270:
		scale.y = -1
	else:
		scale.y = 1
		
	if Input.is_action_just_pressed("shoot"):
		var global_scaled = tiles.get_global_mouse_position() 
		var node_coord = tiles.local_to_map(tiles.to_local(global_scaled))
		if _platform_count > 0:
			if can_shoot and can_shoot_player == 1 and \
			tiles.get_cell_source_id(node_coord) == -1 and !game_manager.is_game_paused:
				AudioManager.play_player_sfx("place_platform")
				var new_platform = dynamic_platform.instantiate()
				Global.get_current_level().add_child(new_platform)
				new_platform.global_position = get_global_mouse_position()
				_platform_count -= 1
	if Input.is_action_just_pressed("reload"):
		_platform_count = Global.max_platform_count
