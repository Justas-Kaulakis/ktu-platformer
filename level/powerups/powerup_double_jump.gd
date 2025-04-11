extends Area2D

func _on_body_entered(player: Player) -> void:
	player.apply_powerup("double_jump", 5.0)
	queue_free()
