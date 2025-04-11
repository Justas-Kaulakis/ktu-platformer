extends Area2D

func _on_body_entered(player: Player) -> void:
	player.apply_powerup("wall_jump", 5.0)
	queue_free()
