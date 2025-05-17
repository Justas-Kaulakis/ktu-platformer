@tool
class_name Key extends Area2D

@onready var player = SceneManager.current_scene.get_node("Player")
@onready var area_2d = $"."
@onready var animation_player = $"AnimationPlayer"
var pickable = true

## Color coded key. A key can only open a gate with the same color_name
@export_enum("white", "yellow", "red", "blue", "green") var color_name: String = "yellow":
	set(new_color):
		color_name = new_color
		$Sprite2D.modulate = Color(new_color, 1)
		$PointLight2D.color = Color(new_color).lightened(0.5);

func _on_ready() -> void:
	animation_player.play("new_animation")

	
func _process(_delta: float) -> void:
	if not Engine.is_editor_hint():
		if Input.is_action_just_pressed("reload"):
			player.consume_key(color_name)
			Alert.remove_key_alert(color_name)
			if Alert.active_key_alerts_cn.has(color_name):
				print("Turejai ", color_name, " rakta krc")
				Alert.update_keys_info(-1)
			#Alert.update_keys_info(-1)
			pickable = true
			$Sprite2D.visible = true

func _on_body_entered(body):
	if not Engine.is_editor_hint() and body is Player and pickable:
		body.pick_up_key(color_name)
		Alert.add_key_alert(color_name)
		$Sprite2D.visible = false
		pickable = false
