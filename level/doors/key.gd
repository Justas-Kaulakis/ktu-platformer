@tool
class_name Key extends Area2D

@onready var area_2d = $"."
@onready var animation_player = $"AnimationPlayer"

## Color coded key. A key can only open a gate with the same color_name
@export_enum("white", "yellow", "red", "blue", "green") var color_name: String = "yellow":
	set(new_color):
		color_name = new_color
		$Sprite2D.modulate = Color(new_color,1)


func _on_body_entered(body):
	if not Engine.is_editor_hint() and body is Player:
		body.pick_up_key(color_name)
		queue_free()


func _on_ready() -> void:
	animation_player.play("new_animation")
