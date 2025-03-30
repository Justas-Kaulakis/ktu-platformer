extends Area2D

func _on_body_entered(body: Player) -> void:
	Global.last_location = $RespawnPoint.global_position
