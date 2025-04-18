class_name PlatormGun extends Node2D

@onready var platform_preview: PlatformPreview = $"../../PlatformPreview"
@onready var tiles = SceneManager.current_scene.get_node("Layers/Collision Tiles") as TileMapLayer
@onready var game_manager = SceneManager.current_scene.get_node("Game Manager")
@onready var player_ui: CanvasLayer = $"../../Player UI"


var selected_platform = Global.p_1:
	set(new_platform):
		selected_platform = new_platform
		platform_preview.attach_preview(new_platform)
var platform_count = Global.max_platform_count
var can_shoot_player = 1 # checks if mouse is on player
var can_shoot = 1 # checks if mouse is on created platform

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	selected_platform = Global.p_1

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
		if platform_count > 0:
			if can_shoot and can_shoot_player == 1 and \
			tiles.get_cell_source_id(node_coord) == -1 and !game_manager.is_game_paused:
				AudioManager.play_sfx("place_platform")
				var new_platform = selected_platform.instantiate()
				get_tree().current_scene.add_child(new_platform)
				new_platform.global_position = get_global_mouse_position()
				platform_count -= 1
				player_ui.update_platform_count(platform_count)

	if Input.is_action_just_pressed("platform_1"):
		selected_platform = Global.p_1
		Global.rotate = 0
	if Input.is_action_just_pressed("platform_2"):
		selected_platform = Global.p_2
		Global.rotate = 0
	if Input.is_action_just_pressed("platform_3"):
		selected_platform = Global.p_3
		Global.rotate = 0
	
	if Input.is_action_just_pressed("rotate"):
		Global.rotate += 90
		if Global.rotate == 360:
			Global.rotate = 0
	
	if selected_platform.resource_path == "res://level/platforms/trampoline_platform.tscn" or \
	selected_platform.resource_path == "res://level/platforms/velocity_platform.tscn":
		#print(selected_platform.resource_path)
		Global.selected_platform = "rotatable"
	else:
		Global.selected_platform = "not_rotatable"
	
	if game_manager:
		platform_preview.handle_drawing(tiles, platform_count, can_shoot, can_shoot_player, game_manager.is_game_paused)
	
	if Input.is_action_just_pressed("reload"):
		reload()

func reload():
	platform_count = Global.max_platform_count
	player_ui.update_platform_count(platform_count)
