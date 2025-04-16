extends CharacterBody2D

class_name Player

const WALK_SPEED = 300.0
const ACCELERATION_SPEED = WALK_SPEED * 6.0
@export var JUMP_VELOCITY = -725.0
## Maximum speed at which the player can fall.
const TERMINAL_VELOCITY = 700
const WALL_JUMP_FACTOR = 150
const MAX_BOOST_Y = 1000
const MAX_BOOST_X = 1000

var gravity: int = ProjectSettings.get("physics/2d/default_gravity")
@onready var platform_detector := $PlatformDetector as RayCast2D
@onready var animation_player := $AnimationPlayer as AnimationPlayer
@onready var shoot_timer := $ShootAnimation as Timer
@onready var sprite := $Sprite2D as Sprite2D
@onready var camera := $Camera as Camera2D
@onready var PlatformGun = $Sprite2D/PlatformGun
@onready var player_ui: CanvasLayer = $"Player UI"



var _double_jump_charged := false
var was_on_floor := false
var current_health: float
var is_poisoned = false
var keys: Array[StringName] = []



func _ready() -> void:
	Global.last_location = position
	current_health = Global.max_health
	AudioManager.stop_sfx("run")

func _physics_process(delta: float) -> void:
	if is_on_floor() and Global.double_jump == true:
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
	
	if Input.is_action_just_pressed("reload"):
		position = Global.last_location
	
	if not is_zero_approx(velocity.x):
		if velocity.x > 0.0:
			sprite.scale.x = 0.35
		else:
			sprite.scale.x = -0.35
			

	floor_stop_on_slope = not platform_detector.is_colliding()
	move_and_slide()
	
	var new_animation := get_new_animation()
	if Global.gender == "male":
		if animation_player.current_animation != "run_male" and \
			new_animation == "run_male":
			AudioManager.play_sfx("run")
		elif animation_player.current_animation == "run_male" and \
			new_animation != "run_male":
			AudioManager.stop_sfx("run")
	if Global.gender != "male":
		if animation_player.current_animation != "run_female" and \
			new_animation == "run_female":
			AudioManager.play_sfx("run")
		elif animation_player.current_animation == "run_female" and \
			new_animation != "run_female":
			AudioManager.stop_sfx("run")
	animation_player.play(new_animation)


func get_new_animation() -> String:
	var animation_new: String
	if Global.gender == "male":
		if is_on_floor():
			if absf(velocity.x) > 0.1:
				animation_new = "run_male"
			else:
				animation_new = "idle_male"
		else:
			if velocity.y > 0.0:
				animation_new = "falling_male" # "falling"
			else:
				animation_new = "jumping_male" # "jumping"
	
	if Global.gender == "female":
		if is_on_floor():
			if absf(velocity.x) > 0.1:
				animation_new = "run_female"
			else:
				animation_new = "idle_female"
		else:
			if velocity.y > 0.0:
				animation_new = "falling_female" # "falling"
			else:
				animation_new = "jumping_female" # "jumping"
		
	return animation_new

func reload_animation():
	var new_anim = get_new_animation()
	# Force stop
	animation_player.stop()
	animation_player.play(new_anim)

func try_jump() -> void:
	if Global.wall_jump and is_on_wall_only():
		velocity.x = get_wall_normal().x * WALL_JUMP_FACTOR
	elif not is_on_floor():
		if not _double_jump_charged or !Global.double_jump:
			return
		_double_jump_charged = false
		velocity.x *= 2.5
	velocity.y = JUMP_VELOCITY
	AudioManager.play_sfx("jump")
	
func boost():
	velocity.x = min(velocity.x* 4, MAX_BOOST_X)
	velocity.y = min(velocity.y* 1.5, MAX_BOOST_Y)

func mouse_entered():
	PlatformGun.can_shoot = 0
	print("enter")
	
func _mouse_exit():
	PlatformGun.can_shoot = 1
	print("exit")
func _mouse_shape_enter(_shape_idx: int) -> void:
	print("enter2")

func pick_up_key(key_color: StringName):
	AudioManager.play_sfx("collect_key")
	keys.append(key_color)

func has_key(key_color: StringName):
	return key_color in keys

func consume_key(key_color: StringName):
	keys.erase(key_color)

func take_damage(damage_amount: float) -> void:
	current_health -= damage_amount
	player_ui.update_health_bar(current_health)
	if current_health > 0:
		AudioManager.play_sfx("take_hit")
	else:
		die()


func die():
	AudioManager.play_sfx("die")
	reset_player()
	position = Global.last_location
	
func reset_player():
	Input.action_press("reload")
	Input.action_release("reload")
	is_poisoned = false
	PlatformGun.reload()
	current_health = Global.max_health
	player_ui.update_health_bar(current_health)
	SceneManager.restore_pu_nodes()
	Alert.clear_pu_alerts()
	disable_powerup("double_jump")
	disable_powerup("wall_jump")

func apply_powerup(powerup_name, duration):
	match powerup_name:
		"double_jump":
			Global.double_jump = true
			AudioManager.play_sfx("pickup_power_up")
			Alert.create_powerup_alert("Double Jump", duration)
		"wall_jump":
			Global.wall_jump = true
			AudioManager.play_sfx("pickup_power_up")
			Alert.create_powerup_alert("Wall Jump", duration)
		_:
			print("Kas skaitys, tas gaidys")
			
	await get_tree().create_timer(duration).timeout
	disable_powerup(powerup_name)

func disable_powerup(powerup_name: String) -> void:
	var past_state: bool = true
	match powerup_name:
		"double_jump":
			past_state = Global.double_jump
			Global.double_jump = false
		"wall_jump":
			past_state = Global.wall_jump
			Global.wall_jump = false
		_:
			push_warning("This powerup name is not handled: " + powerup_name)
	if past_state == true:
		AudioManager.play_sfx("pickup_power_down")
