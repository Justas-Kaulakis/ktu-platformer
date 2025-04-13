extends Area2D


@export_file("*.tscn") var next_scene: String
@export var sensor: Area2D
@onready var area_2d = $"."
@onready var animation_player = $"AnimationPlayer"
@onready var animation_player2 = $"AnimationPlayer2"
@onready var canvas_modulate = $CanvasModulate

func _ready() -> void:
	animation_player2.play("fade_to_normal")
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
		do_fade_out()
		Alert.clear_pu_alerts()
		
func do_fade_out() -> void:
	# start the fade animation
	animation_player2.play("fade_to_black")
	
	# wait for the animation to finish before continuing
	await animation_player2.animation_finished
	SceneManager.switch_scene(next_scene)
	
	# do the next thing
	animation_player2.play("fade_to_normal")
