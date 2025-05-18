class_name PlatformPreview extends Node2D


func attach_preview(platform: PackedScene) -> void:
	# Remove old preview sprite (if any)
	var vsbl: bool = false
	
	# Instantiate a new preview sprite from the platform scene
	var instance = platform.instantiate()
	var sprite = instance.get_node("Sprite2D") as Sprite2D
	#sprite.rotation_degrees = instance.rotation_degrees#+Global.rotate
	instance.remove_child(sprite) # Detach from the full platform instance

	sprite.modulate = Color(0.8, 0.8, 0.8, 0.5) # Gray + transparent
	sprite.global_position = get_global_mouse_position()
	sprite.visible = vsbl
	
	for child in get_children():
		vsbl = child.visible
		child.queue_free()
	# Add to the preview node
	sprite.owner = null
	add_child(sprite)

func handle_drawing(tiles: TileMapLayer, platform_count:int, can_shoot: bool, can_shoot_player: int, is_game_paused) -> void:
	if Input.is_action_pressed("preview"):
		var preview:Sprite2D = get_child(0)
		var global_scaled = tiles.get_global_mouse_position()
		var node_coord = tiles.local_to_map(tiles.to_local(global_scaled))
		if Global.rotatable_platform == true:
			preview.rotation_degrees = Global.rotate
		if platform_count > 0 and can_shoot and can_shoot_player == 1 and \
			tiles.get_cell_source_id(node_coord) == -1 and !is_game_paused:
				preview.modulate = Color(0.5, 0.5, 0.5, 0.8)
		else:
			preview.modulate = Color(0.9, 0.5, 0.5, 0.8)
			
		preview.visible = true
		preview.global_position = get_global_mouse_position()
	else:
		var preview:Sprite2D = get_child(0)
		preview.visible = false
