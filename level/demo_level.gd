extends Node2D

@onready var platform_gun = SceneManager.current_scene.get_node("Player/Sprite2D/PlatformGun")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.current_area = Global.Area.GAMEPLAY
	SceneManager.register_pu_nodes()
	for actionName in InputMap.get_actions():
		print("%s:" % actionName)
		for inputEvent in InputMap.action_get_events(actionName):
			print("  %s" % inputEvent.as_text().trim_suffix(" (Physical)"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
