extends Node2D

@onready var PlatformGun = get_node("/root/Demo level/Player/Sprite2D/PlatformGun")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.current_area = Global.Area.GAMEPLAY


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
