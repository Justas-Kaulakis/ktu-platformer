extends Area2D

@onready var game_manager = SceneManager.current_scene.get_node("Game Manager")
@onready var player = SceneManager.current_scene.get_node("Player")
var pickable = true

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("reload"):
		$"Powerup Sprite".visible = true
		pickable = true
		
func _on_body_entered(_body: Node2D) -> void:
	if pickable:
		game_manager.apply_powerup("wall_jump", 5.0)
		$"Powerup Sprite".visible = false
		pickable = false
