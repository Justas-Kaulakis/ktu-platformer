extends Area2D

var checkpoint_manager

func _ready() -> void:
	checkpoint_manager = get_parent().get_parent().get_node("CheckpointManager")

func _on_body_entered(body: Player) -> void:
	print("enterplayer")
	checkpoint_manager.last_location = $RespawnPoint.global_position
