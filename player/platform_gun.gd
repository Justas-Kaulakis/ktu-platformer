extends Node2D

const dynamic_platform = preload("res://level/platforms/default_platform.tscn")
const count = 3
var platform_count = count


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	if rotation_degrees > 90 and rotation_degrees < 270:
		scale.y = -1
	else:
		scale.y = 1
		
	if Input.is_action_just_pressed("shoot"):
		if platform_count > 0:
			var new_platform = dynamic_platform.instantiate()
			get_tree().root.add_child(new_platform)
			new_platform.global_position = get_global_mouse_position()
			platform_count -= 1
	if Input.is_action_just_pressed("reload"):
		platform_count = count
		
		
		
	
