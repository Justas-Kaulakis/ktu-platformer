extends Area2D

@onready var game_manager = SceneManager.current_scene.get_node("Game Manager")
@onready var player = SceneManager.current_scene.get_node("Player")
@onready var area_2d = $"."
@onready var animation_player = $"AnimationPlayer"

func _on_body_entered(_body: Node2D) -> void:
	game_manager.apply_powerup("double_jump", 5.0)
	queue_free()


func _on_ready() -> void:
	animation_player.play("new_animation")
