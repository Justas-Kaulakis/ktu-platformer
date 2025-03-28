extends CharacterBody2D

class_name Player

const WALK_SPEED = 300.0
const ACCELERATION_SPEED = WALK_SPEED * 6.0
@export var JUMP_VELOCITY = -725.0
## Maximum speed at which the player can fall.
const TERMINAL_VELOCITY = 700

var gravity: int = ProjectSettings.get("physics/2d/default_gravity")
@onready var platform_detector := $PlatformDetector as RayCast2D
@onready var animation_player := $AnimationPlayer as AnimationPlayer
@onready var shoot_timer := $ShootAnimation as Timer
@onready var sprite := $Sprite2D as Sprite2D
#@onready var jump_sound := $Jump as AudioStreamPlayer
#@onready var running_sound := $Running as AudioStreamPlayer
@onready var camera := $Camera as Camera2D
var _double_jump_charged := false
@onready var PlatformGun = $Sprite2D/PlatformGun
@onready var player_ui: CanvasLayer = $"Player UI"


var was_on_floor := false
var current_health: float
var is_poisoned = false

func _ready() -> void:
	current_health = Global.max_health
	AudioManager.stop_player_sfx("run")

func _physics_process(delta: float) -> void:
	if is_on_floor():
		_double_jump_charged = true
	if Input.is_action_just_pressed("jump"):
		try_jump()
	elif Input.is_action_just_released("jump") and velocity.y < 0.0:
		# The player let go of jump early, reduce vertical momentum.
		velocity.y *= 0.6
	# Fall.
	velocity.y = minf(TERMINAL_VELOCITY, velocity.y + gravity * delta)

	var direction := Input.get_axis("move_left", "move_right") * WALK_SPEED
	velocity.x = move_toward(velocity.x, direction, ACCELERATION_SPEED * delta)

	if not is_zero_approx(velocity.x):
		if velocity.x > 0.0:
			sprite.scale.x = 0.35
		else:
			sprite.scale.x = -0.35

	floor_stop_on_slope = not platform_detector.is_colliding()
	move_and_slide()
	
	var new_animation := get_new_animation()
	if animation_player.current_animation != "run" and \
		new_animation == "run":
		AudioManager.play_player_sfx("run")
	elif animation_player.current_animation == "run" and \
		new_animation != "run":
		AudioManager.stop_player_sfx("run")
		
	if new_animation != animation_player.current_animation: #and shoot_timer.is_stopped():
	#	if is_shooting:
	#		shoot_timer.start()
		animation_player.play(new_animation)


func get_new_animation() -> String:
	var animation_new: String
	if is_on_floor():
		if absf(velocity.x) > 0.1:
			animation_new = "run"
		else:
			animation_new = "idle"
	else:
		if velocity.y > 0.0:
			animation_new = "falling" # "falling"
		else:
			animation_new = "jumping" # "jumping"
	#if is_shooting:
	#	animation_new += "_weapon"
	return animation_new


func try_jump() -> void:
	if not is_on_floor():
		if not _double_jump_charged:
			return
		_double_jump_charged = false
		velocity.x *= 2.5
	velocity.y = JUMP_VELOCITY
	AudioManager.play_player_sfx("jump")
	
func mouse_entered():
	PlatformGun.can_shoot = 0
	print("enter")
	
func _mouse_exit():
	PlatformGun.can_shoot = 1
	print("exit")
func _mouse_shape_enter(_shape_idx: int) -> void:
	print("enter2")

func take_damage(damage_amount: float) -> void:
	current_health -= damage_amount
	player_ui.update_health_bar(current_health)
	if current_health > 0:
		AudioManager.play_player_sfx("take_hit")
	else:
		die()


func die():
	AudioManager.play_player_sfx("die")
	# Reikia naudot call_referred nes die() kviečiamas sinale
	# jis leidžia root apdorot visa physics ir tada iškvies reload_current_scene
	get_tree().call_deferred("reload_current_scene")
