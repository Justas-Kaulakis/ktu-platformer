# LavaDrop.gd
class_name LavaDrop extends Area2D

@export var damage: float = 10.0  # Damage dealt to player
@export var fall_speed: float = 200.0  # Pixels per second

func _ready():
	add_to_group("lava_drop")  # For despawning detection
	body_entered.connect(_on_body_entered)

func _physics_process(delta):
	# Move downward at constant speed
	position.y += fall_speed * delta

func _on_body_entered(body: Node2D):
	if body is Player:
		body.take_damage(damage)
	queue_free.call_deferred()  # Despawn on player contact
