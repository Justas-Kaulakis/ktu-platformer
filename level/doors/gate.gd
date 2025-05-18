@tool
class_name Gate extends StaticBody2D

## The color that is coded into the gate. Only the same color key can open it
@export_enum("white", "yellow", "red", "blue", "green") var color_name: String = "yellow":
	set(new_color):
		color_name = new_color
		$Indicator.modulate = Color(new_color, 1)
		$PointLight2D.color = Color(new_color).lightened(0.5);


var is_open = false

func _input(event: InputEvent) -> void:
	if not Engine.is_editor_hint():
		if event.is_action_pressed("reload"):
			close_gate()

func _on_detection_area_body_entered(player) -> void:
	if not Engine.is_editor_hint() and player is Player:
		# Check if the gate is closed and the body is the player
		print("Player entered sensor")
		print((player as Player).keys)
		if not is_open and player.has_key(color_name):
			print("Player has the key: Open gate!")
			open_gate()
			# Consume the key after use
			(player as Player).consume_key(color_name)
			Alert.remove_checkpoint_alert(color_name)

func open_gate():
	AudioManager.play_sfx("door_opened")
	is_open = true
	$Closed.visible = false
	$Opened.visible = true
	$CollisionShape2D.set_deferred("disabled", true)

func close_gate():
	is_open = false
	$Closed.visible = true
	$Opened.visible = false
	$CollisionShape2D.set_deferred("disabled", false)
