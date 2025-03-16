extends Area2D

@onready var game_manager = get_tree().current_scene.get_node("Game Manager")
@onready var timer: Timer = $"Damage Timer"

var initial_damage = -0.1
var damage_increment = -0.05
var current_damage
var delay = 0.1

func _on_ready() -> void:
	await get_tree().process_frame
	current_damage = initial_damage
	timer.wait_time = delay
	#timer.timeout.connect(_on_damage_timer_timeout)

func _on_damage_timer_timeout() -> void:
	current_damage += damage_increment
	game_manager.update_health(current_damage)

func _on_body_entered(_body: Node2D) -> void:
	game_manager.update_health(current_damage)
	timer.start()

func _on_body_exited(_body: Node2D) -> void:
	timer.stop()
	while current_damage < 0:
		current_damage += damage_increment * -4
		if current_damage < 0:
			game_manager.update_health(current_damage)
		await get_tree().create_timer(delay).timeout
	current_damage = initial_damage
