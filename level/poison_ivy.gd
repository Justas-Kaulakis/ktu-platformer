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
	if !game_manager.is_poisoned:
		await get_tree().create_timer(0.1).timeout
		game_manager.is_poisoned = true
	else:
		game_manager.is_poisoned = false
	timer.start()

func _on_body_exited(body: Node2D) -> void:
	timer.stop()
	var elapsed_time = 0
	while elapsed_time <= poison_duration and game_manager.is_poisoned:
		elapsed_time += delay
		game_manager.update_health(damage)
		await get_tree().create_timer(delay).timeout
	game_manager.is_poisoned = false
