extends CanvasLayer

@export var alert: PackedScene = preload("res://gui/individual_alert.tscn")

@onready var panel: Panel = $Panel
@onready var container: VBoxContainer = $VBoxContainer

var active_alerts: Array = []

func create_powerup_alert(message, duration):
	var middle_text = " is active for "
	var end_text = " seconds!"
	var alert_message = message + middle_text + str(duration) + end_text
	var new_alert: Label = alert.instantiate()
	new_alert.text = alert_message
	container.add_child(new_alert)
	active_alerts.append(new_alert)
	
	var remaining_duration = duration
	var update_interval = 0.1
	var loops = duration / update_interval
	while (loops > 0):
		await get_tree().create_timer(update_interval).timeout
		remaining_duration -= update_interval
		loops -= 1
		if !active_alerts.has(new_alert):
			return
		else:
			new_alert.text = message + middle_text + str(remaining_duration) + end_text
	
	var tween: Tween = new_alert.create_tween()
	tween.tween_interval(0.0)
	tween.tween_property(new_alert, "modulate:a", 0.0, 0.25)
	tween.tween_callback(new_alert.queue_free)
	
func clear_alerts():
	for alert in active_alerts:
		if is_instance_valid(alert):
			var tween: Tween = alert.create_tween()
			tween.tween_interval(0.0)
			tween.tween_property(alert, "modulate:a", 0.0, 0.25)
			tween.tween_callback(alert.queue_free)
	active_alerts.clear()
