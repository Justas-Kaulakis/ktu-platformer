@tool
class_name Gate extends StaticBody2D

## The color that is coded into the gate. Only the same color key can open it
@export_enum("white", "yellow", "red", "blue", "green") var color_name: String = "yellow":
	set(new_color):
		color_name = new_color
		$Indicator.modulate = Color(new_color, 1)


var is_open = false

func _process(_delta: float) -> void:
	if not Engine.is_editor_hint():
		if Input.is_action_just_pressed("reload"):
			close_gate()

func _on_detection_area_body_entered(player) -> void:
	if not Engine.is_editor_hint() and player is Player:
		# Check if the gate is closed and the body is the player
		if not is_open and player.has_key(color_name):
			open_gate()
			# Consume the key after use
			player.consume_key(color_name)

func open_gate():
	AudioManager.play_sfx("door_opened")
	is_open = true
	($Sprite2D.texture as AtlasTexture).region.position.x = 0
	$CollisionShape2D.set_deferred("disabled", true)

func close_gate():
	is_open = false
	($Sprite2D.texture as AtlasTexture).region.position.x = 24
	$CollisionShape2D.set_deferred("disabled", false)
