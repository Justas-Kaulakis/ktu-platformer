extends Node2D

# Export variables for customization
@export var fire_duration: float = 2.0  # Total duration of active fire (start + burn + end)
@export var cooldown_duration: float = 2.0  # Time between fire cycles
@export var damage_per_second: float = 1.0  # Damage dealt per second during burn

# Animation durations (based on 15 FPS)
const START_DURATION: float = 0.02  # 4 frames
const END_DURATION: float = 0.45  # 7 frames

# References to nodes
@onready var area_2d: Area2D = $Area2D
@onready var collision_shape: CollisionShape2D = $Area2D/CollisionShape2D
@onready var sprite: Sprite2D = $Area2D/Sprite2D
@onready var timer: Timer = $Timer
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Track overlapping players for continuous damage
var overlapping_players: Array[Node] = []
# Track current state
var is_active: bool = false

func _ready():
	# Initialize timer for first cycle (start with cooldown)
	timer.wait_time = cooldown_duration
	timer.autostart = true
	timer.timeout.connect(_on_timer_timeout)
	# Connect signals for player detection
	area_2d.body_entered.connect(_on_body_entered)
	area_2d.body_exited.connect(_on_body_exited)
	# Connect AnimationPlayer signals for transitions
	animation_player.animation_finished.connect(_on_animation_finished)
	# Match sprite size to collision shape
	update_sprite_size()
	# Start with fire off
	#sprite.visible = false
	#collision_shape.disabled = true
	_on_animation_finished("end")

func _physics_process(delta):
	# Apply damage during burn animation
	if animation_player.current_animation == "burn":
		for player in overlapping_players:
			if player.has_method("take_damage"):
				player.take_damage(damage_per_second * delta)

func _on_timer_timeout():
	if is_active:
		# Active cycle ended, play end animation
		animation_player.play("end")
		is_active = false
	else:
		# Cooldown ended, start active cycle
		animation_player.play("start")
		is_active = true

func _on_animation_finished(anim_name: String):
	if anim_name == "start":
		# Start finished, play burn for remaining fire_duration
		var burn_duration = fire_duration - START_DURATION - END_DURATION
		if burn_duration > 0:
			animation_player.play("burn")
			# Set timer to stop burn after duration
			timer.start(burn_duration)
		else:
			# Skip burn if duration too short, go to end
			animation_player.play("end")
	elif anim_name == "end":
		# End finished, start cooldown
		timer.start(cooldown_duration)
		overlapping_players.clear()  # Clear players to prevent lingering damage

func _on_body_entered(body: Node):
	if body is Player:
		overlapping_players.append(body)

func _on_body_exited(body: Node):
	if body is Player:
		overlapping_players.erase(body)

func update_sprite_size():
	# Match AnimatedSprite2D size to collision shape
	"""
	var shape = collision_shape.shape as RectangleShape2D
	if shape and sprite and sprite.te:
		var frame_size = sprite.sprite_frames.get_frame_texture("burn", 0).get_size()
		sprite.scale = Vector2(
			shape.extents.x * 2 / frame_size.x,
			shape.extents.y * 2 / frame_size.y
		)
	"""
