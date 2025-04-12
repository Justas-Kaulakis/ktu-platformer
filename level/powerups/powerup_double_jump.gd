extends Area2D

@onready var area_2d = $"."
@onready var animation_player = $"AnimationPlayer"

func _on_body_entered(player: Player) -> void:
	player.apply_powerup("double_jump", 5.0)
	queue_free()

func _on_ready() -> void:
	animation_player.play("new_animation")
