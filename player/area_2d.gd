extends Area2D

@onready var PlatformGun = get_node("/root/Demo level/Player/Sprite2D/PlatformGun")

func _mouse_enter():
	PlatformGun.can_shoot = 0
	
func _mouse_exit():
	PlatformGun.can_shoot = 1

func _mouse_shape_enter(shape_idx: int) -> void:
	PlatformGun.can_shoot_player = 0

func _mouse_shape_exit(shape_idx: int) -> void:
	PlatformGun.can_shoot_player = 1
	
