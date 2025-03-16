extends Node2D

const dynamic_platform = preload("res://level/platforms/default_platform.tscn")
const count = 3
var platform_count = count
var can_shoot_player = 1 #checks if mouse is on player
var can_shoot = 1 # checks if mouse is on created platform
@onready var tiles = get_tree().current_scene.get_node("Layers/Collision Tiles") as TileMapLayer
@onready var game_manager = get_tree().current_scene.get_node("Game Manager")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(tiles)
	#pass # Replace with function body.

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
		
		#var _selected_tile = tiles.get_cell_tile_data(_node_coord)
		#print(node_coord)
		#if tiles.get_cell_source_id(node_coord) != -1:
			#print(tiles.get_cell_source_id(node_coord))
			#print(tiles.get_cell_atlas_coords(node_coord))
			
			#tiles.set_cell(node_coord, tiles.get_cell_source_id(Vector2i(15,5)), Vector2i(15,5))
		if platform_count > 0:
			if can_shoot and can_shoot_player == 1 and tiles.get_cell_source_id(node_coord) == -1 and !game_manager.is_game_paused:
				AudioManager.play_player_sfx("place_platform")
				var new_platform = dynamic_platform.instantiate()
				get_tree().root.add_child(new_platform)
				new_platform.global_position = get_global_mouse_position()
				platform_count -= 1
	if Input.is_action_just_pressed("reload"):
		platform_count = count
		
		
		
	
