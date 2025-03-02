extends CollisionShape2D

@onready var PlatformGun = get_node("/root/Demo level/Player/Sprite2D/PlatformGun")

func _mouse_enter():
	print("enter")
	PlatformGun.can_shoot = 0
	
func _mouse_exit():
	PlatformGun.can_shoot = 1
