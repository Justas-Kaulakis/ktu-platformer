@tool
class_name Key extends Area2D
var pickable = true
@onready var player = SceneManager.current_scene.get_node("Player")

## Color coded key. A key can only open a gate with the same color_name
@export_enum("white", "yellow", "red", "blue", "green") var color_name: String = "yellow":
	set(new_color):
		color_name = new_color
		$Sprite2D.modulate = Color(new_color,1)

func _process(_delta: float) -> void:
	if not Engine.is_editor_hint():
		if Input.is_action_just_pressed("reload"):
			player.consume_key(color_name)
			pickable = true
			$Sprite2D.visible = true

func _on_body_entered(body):
	if not Engine.is_editor_hint() and body is Player and pickable:
		body.pick_up_key(color_name)
		$Sprite2D.visible = false
		pickable = false
		#queue_free()
