extends TextureRect

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("platform_1"):
		texture = Global.pt_1
	if Input.is_action_just_pressed("platform_2"):
		texture = Global.pt_2
	if Input.is_action_just_pressed("platform_3"):
		texture = Global.pt_3
