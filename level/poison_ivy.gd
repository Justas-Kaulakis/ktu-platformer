extends Area2D

#@onready var game_manager = get_tree().current_scene.get_node("Game Manager")
@onready var timer: Timer = $"Damage Timer"

@export var damage = 0.5
@export var damage_interval = 0.8
var poison_duration = damage_interval * 3 # seconds

func _ready() -> void:
	await get_tree().process_frame
	timer.wait_time = damage_interval

func _on_damage_timer_timeout() -> void:
	for body in get_overlapping_bodies():
		if body is Player:
			body.take_damage(damage)
			break

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		if !body.is_poisoned:
			await get_tree().create_timer(0.1).timeout
			body.is_poisoned = true
		else:
			body.is_poisoned = false
		timer.start()

func _on_body_exited(body: Player) -> void:
	timer.stop()
	var elapsed_time = 0
	while elapsed_time <= poison_duration and body.is_poisoned:
		elapsed_time += damage_interval
		body.take_damage(damage)
		await get_tree().create_timer(damage_interval).timeout
	body.is_poisoned = false
