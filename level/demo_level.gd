extends Node2D

signal level_changed

const level: Global.Level = Global.Level.DEMO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.current_area = Global.Area.GAMEPLAY

func _on_exit_door_reached(_body: Node2D) -> void:
	print("emitting level_changed")
	level_changed.emit()


func cleanup():
	# another level is loaded while this scene is still active, so
	# the current player has to disconnect all of it's signals
	$Player.disconnect_signals()
	queue_free()
