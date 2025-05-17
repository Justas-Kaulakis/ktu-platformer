extends Area2D

@onready var area_2d = $"."
@onready var animation_player = $"AnimationPlayer"

@export var path: String = "res://level/powerups/powerup_wall_jump.tscn"
@export var duration: float = 5.0
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
		player.apply_powerup("wall_jump", duration)
		$"Powerup Sprite".visible = false
		pickable = false
