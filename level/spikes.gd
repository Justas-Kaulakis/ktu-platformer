extends Area2D

@onready var game_manager = get_tree().current_scene.get_node("Game Manager")
@onready var timer: Timer = $"Damage Timer"

var damage = -0.6
var delay = 0.8

func _on_ready() -> void:
	await get_tree().process_frame
	timer.wait_time = delay
	#timer.timeout.connect(_on_damage_timer_timeout)
	
func _on_body_entered(_body: Node2D) -> void:
	game_manager.update_health(damage)
	timer.start()
	
func _on_body_exited(_body: Node2D) -> void:
	timer.stop()
	
func _on_damage_timer_timeout() -> void:
	game_manager.update_health(damage)
