extends Area2D

#@onready var game_manager = get_tree().current_scene.get_node("Game Manager")
@onready var timer: Timer = $"Damage Timer"

@export var damage = 0.5
@export var damage_interval = 0.8

func _on_ready() -> void:
	await get_tree().process_frame
	timer.wait_time = damage_interval

func _on_body_entered(body: Player) -> void:
	body.take_damage(damage)
	timer.start()

func _on_body_exited(_body: Node2D) -> void:
	timer.stop()

func _on_damage_timer_timeout() -> void:
	for body in get_overlapping_bodies():
		if body is Player:
			body.take_damage(damage)
			break
