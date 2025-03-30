extends Area2D

@onready var game_manager = get_tree().current_scene.get_node("Game Manager")
@onready var player = get_tree().current_scene.get_node("Player")

func _on_body_entered(_body: Node2D) -> void:
	game_manager.apply_powerup("wall_jump", 5.0)
	queue_free()
