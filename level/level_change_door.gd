extends Area2D

@onready var SceneManager = get_parent()
@onready var current_level = get_parent().get_parent().name


func _on_body_entered(_body: Node2D) -> void:
	var current_level_name = str(current_level)
	SceneManager.handle_level_changed(current_level_name)
