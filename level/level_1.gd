extends Node2D

@onready var platform_gun = get_tree().current_scene.get_node("Player/Sprite2D/PlatformGun")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#get_tree().root.print_tree_pretty()
	Global.current_area = Global.Area.GAMEPLAY


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
