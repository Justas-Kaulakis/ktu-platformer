extends TextureRect

const p_1 = preload("res://assets/textures/default_platform.png")
const p_2 = preload("res://assets/textures/broken_platform.png")
const p_3 = preload("res://assets/textures/gravity_platform.png")
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("platform_1"):
		texture = p_1
	if Input.is_action_just_pressed("platform_2"):
		texture = p_2
	if Input.is_action_just_pressed("platform_3"):
		texture = p_3
