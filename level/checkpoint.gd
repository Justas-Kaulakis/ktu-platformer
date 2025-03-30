extends Area2D

func _on_body_entered(_body: Player) -> void:
	Global.last_location = $RespawnPoint.global_position
