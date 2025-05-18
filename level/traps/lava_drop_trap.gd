extends Node2D

# Export variables for customization
@export var spawn_interval: float = 2.0  # Seconds between spawns
@export var spawn_offset: float = 0.0    # Initial delay before first spawn
@export var drop_damage: float = 10.0    # Damage passed to drops
@export var drop_speed: float = 200.0    # Fall speed passed to drops
@export var drop_scale: float = 1.0    # drop rendering scale

# Reference to the LavaDrop scene
@export var lava_drop_scene: PackedScene = preload("res://level/traps/Lava_drop.tscn")
@onready var area_2d = $Area2D
@onready var spawn_point = $SpawnPoint
@onready var timer: Timer = $Timer

func _ready():
	timer.wait_time = spawn_interval
	timer.autostart = false
	timer.one_shot = false
	timer.timeout.connect(_on_timer_timeout)
	#add_child(timer)
	# Start with offset
	timer.start(spawn_offset)
	# Connect area_exited to despawn drops
	area_2d.area_exited.connect(_on_area_exited)

func _on_timer_timeout():
	spawn_drop()
	timer.start(spawn_interval)  # Restart timer
	#print("LavaDrop spawned at: ", get_tree().get_frame() / 60.0, "s")  # Debug

func spawn_drop():
	var drop = lava_drop_scene.instantiate() as LavaDrop
	drop.scale = Vector2(4,4)
	drop.damage = drop_damage
	drop.fall_speed = drop_speed
	# Spawn at the exact position of SpawnPoint
	drop.position = spawn_point.global_position
	drop.apply_scale(Vector2(drop_scale, drop_scale));
	drop.add_to_group("lava_group")
	# Add to scene tree
	get_tree().current_scene.add_child(drop)

func _on_area_exited(area: Node2D):
	if area.is_in_group("lava_drop"):
		area.queue_free()  # Despawn when drop exits Area2D
