class_name Key extends Area2D


# Exported variable to set the key's color in the inspector
@export var color_name = "white"

func _ready():
	# Define a color map to convert color names to Color values
	var color_map = {
		"white": Color(1, 1, 1),
		"red": Color(1, 0, 0),
		"blue": Color(0, 0, 1),
		"green": Color(0, 1, 0)
	}
	# Apply the color filter to the sprite
	$Sprite2D.modulate = color_map[color_name]

func _on_body_entered(player: Player):
	player.pick_up_key(color_name)
	queue_free()
