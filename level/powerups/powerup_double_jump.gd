extends Area2D

@onready var area_2d = $"."
@onready var animation_player = $"AnimationPlayer"

@export var path: String = "res://level/powerups/powerup_double_jump.tscn"

func _on_body_entered(player: Player) -> void:
	player.apply_powerup("double_jump", 5.0)
	queue_free()

func _on_ready() -> void:
	add_to_group("respawnable")
	animation_player.play("new_animation")
