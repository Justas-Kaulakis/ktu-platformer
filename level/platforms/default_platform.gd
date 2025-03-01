extends StaticBody2D

@onready var PlatformGun = get_node("/root/Demo level/Player/Sprite2D/PlatformGun")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("reload"):
		PlatformGun.can_shoot = 1
		queue_free()

func _mouse_enter():
	PlatformGun.can_shoot = 0
	
func _mouse_exit():
	PlatformGun.can_shoot = 1
