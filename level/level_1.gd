extends Node2D


signal level_changed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.current_area = Global.Area.GAMEPLAY

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
