extends Area2D

@onready var game_manager = get_tree().current_scene.get_node("Game Manager")
@onready var timer: Timer = $"Damage Timer"

var damage = -0.25
var delay = 0.75
var poison_duration = delay * 3 # seconds

func _on_ready() -> void:
	await get_tree().process_frame
	timer.wait_time = delay
	timer.timeout.connect(_on_damage_timer_timeout)
	
func _on_damage_timer_timeout() -> void:
	game_manager.update_health(damage)

func _on_body_entered(body: Node2D) -> void:
	await get_tree().create_timer(delay / 5).timeout
	game_manager.update_health(damage)
	timer.start()

func _on_body_exited(body: Node2D) -> void:
	timer.stop()
	await get_tree().create_timer(delay).timeout
	var elapsed_time = 0
	while elapsed_time < poison_duration:
		elapsed_time += delay
		game_manager.update_health(damage)
		await get_tree().create_timer(delay).timeout
