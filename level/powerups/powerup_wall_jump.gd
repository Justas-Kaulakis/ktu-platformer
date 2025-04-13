extends Area2D

@onready var area_2d = $"."
@onready var animation_player = $"AnimationPlayer"

@export var path: String = "res://level/powerups/powerup_wall_jump.tscn"

var pickable = true

func _ready() -> void:
	add_to_group("respawnable")
	animation_player.play("new_animation")

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("reload"):
		$"Powerup Sprite".visible = true
		pickable = true

func _on_body_entered(player: Player) -> void:
	if pickable:
		player.apply_powerup("wall_jump", 5.0)
		$"Powerup Sprite".visible = false
		pickable = false
