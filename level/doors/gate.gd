class_name Gate extends StaticBody2D

# Exported variables to set in the inspector
@export var color_name = "white"

var is_open = false

func _ready():
	# Define a color map for tinting
	var color_map = {
		"white": Color(1, 1, 1),
		"red": Color(1, 0, 0),
		"blue": Color(0, 0, 1),
		"green": Color(0, 1, 0)
	}
	# Apply the color filter to the sprite
	$Sprite2D.modulate = color_map[color_name]
	
func _on_detection_area_body_entered(player: Player) -> void:
	# Check if the gate is closed and the body is the player
	if not is_open:
		# Check if the player has the matching key
		if player.has_key(color_name):
			open_gate()
			# Consume the key after use
			player.consume_key(color_name)

func open_gate():
	AudioManager.play_sfx("door_opened")
	is_open = true
	($Sprite2D.texture as AtlasTexture).region.position.x = 0
	$CollisionShape2D.set_deferred("disabled", true)
