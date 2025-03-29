extends Area2D

@onready var platform_gun = $"../Sprite2D/PlatformGun"

func _mouse_enter():
	platform_gun.can_shoot = 0
	
	
func _mouse_exit():
	platform_gun.can_shoot = 1
	

func _mouse_shape_enter(_shape_idx: int) -> void:
	platform_gun.can_shoot_player = 0

func _mouse_shape_exit(_shape_idx: int) -> void:
	platform_gun.can_shoot_player = 1
	
