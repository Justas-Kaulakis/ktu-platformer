extends Node2D

@onready var platform_gun = SceneManager.current_scene.get_node("Player/Sprite2D/PlatformGun")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.current_area = Global.Area.GAMEPLAY
	SceneManager.register_pu_nodes()
	#for powerup in get_tree().get_nodes_in_group("respawnable"):
	#	var pu_scene = load(powerup.path)
	#	var data = {
	#		"scene": pu_scene,
	#		"position": powerup.global_position
	#	}
	#	pu_data.append(data)
	#	pu_instances.append(powerup)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
