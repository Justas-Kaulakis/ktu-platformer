extends Area2D

var visited = false

func _on_body_entered(_body: Player) -> void:
	if not visited:
		AudioManager.play_sfx("checkpoint_reached")
		visited = true
	Global.last_location = $RespawnPoint.global_position
	$off.visible = false
	$on.visible = true
