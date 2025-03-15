extends TileMapLayer

@onready var platform_gun = get_tree().current_scene.get_node("Player/Sprite2D/PlatformGun")

func _mouse_enter():
	platform_gun.can_shoot = 0
	
func _mouse_exit():
	platform_gun.can_shoot = 1
	
