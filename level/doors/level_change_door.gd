extends Area2D


@export_file("*.tscn") var next_scene: String
@export var sensor: Area2D
@onready var animation_player = $"AnimationPlayer"

func _ready() -> void:
	animation_player.play("new_animation")
	if next_scene == null or next_scene == "":
		push_warning("LevelChange door has not set the 'next_scene' property in the Editor")
	if sensor == null:
		push_warning("LevelChange door has no sensor assigned. Preloading will not occur.")
	elif sensor != null:
		sensor.body_entered.connect(door_sensor_reached, CONNECT_ONE_SHOT)

func door_sensor_reached(_body):
	SceneManager.load_next_level(next_scene)

func _on_body_entered(_body: Node2D) -> void:
	if next_scene == null or next_scene == "":
		push_warning("LevelChange door has not set the 'next_scene' property in the Editor")
	else:
		AudioManager.play_sfx("door_opened")
		SceneManager.switch_scene_with_fade(next_scene)
