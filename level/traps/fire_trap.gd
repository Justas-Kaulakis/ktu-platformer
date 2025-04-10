extends Area2D

#@onready var game_manager = get_tree().current_scene.get_node("Game Manager")
@onready var timer: Timer = $"Damage Timer"
@onready var area_2d = $"."
@onready var animation_player = $"AnimationPlayer"

@export var initial_damage = 0.1
@export var damage_increment = 0.05
var current_damage
@export var damage_delay = 0.3



func _on_ready() -> void:
	animation_player.play("new_animation")
	await get_tree().process_frame
	current_damage = initial_damage
	timer.wait_time = damage_delay
	#timer.timeout.connect(_on_damage_timer_timeout)

func _on_damage_timer_timeout() -> void:
	for body in get_overlapping_bodies():
		if body is Player:
			current_damage += damage_increment
			body.take_damage(current_damage)

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.take_damage(current_damage)
		timer.start()

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		timer.stop()
		while current_damage > 0:
			current_damage -= damage_increment * 4
			if current_damage > 0:
				body.take_damage(current_damage)
			await get_tree().create_timer(damage_delay).timeout
		current_damage = initial_damage
