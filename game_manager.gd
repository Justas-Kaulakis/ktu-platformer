extends Node

var max_health = 3
var current_health = max_health

func _process(_delta) -> void:
	if current_health <= 0:
		reset_level()

func update_health(amount):
	current_health += amount
	#print("Current health: " + str(current_health))
	
func reset_level():
	get_tree().reload_current_scene()
