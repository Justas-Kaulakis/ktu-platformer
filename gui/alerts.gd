extends CanvasLayer

@export var alert: PackedScene = preload("res://gui/individual_alert.tscn")

@onready var panel: Panel = $Panel
@onready var popup: Label = $Panel/Label
@onready var pu_alerts: VBoxContainer = $"Powerup Alerts"
@onready var key_alerts: VBoxContainer = $"Key Alerts"
var active_pu_alerts: Array = []
var active_key_alerts: Array = []

func create_popup_alert(message):
	popup.text = message
	var tween: Tween = panel.create_tween()
	tween.tween_property(panel, "modulate:a", 1.0, 0.2)
	tween.tween_interval(1.6)
	tween.tween_property(panel, "modulate:a", 0.0, 0.2)

func create_powerup_alert(message, duration):
	var middle_text = " is active for "
	var end_text = " seconds!"
	var alert_message = message + middle_text + str(duration) + end_text
	var new_pu_alert: Label = alert.instantiate()
	new_pu_alert.text = alert_message
	pu_alerts.add_child(new_pu_alert)
	active_pu_alerts.append(new_pu_alert)
	
	var remaining_duration = duration
	var update_interval = 0.1
	var loops = duration / update_interval
	while (loops > 0):
		await get_tree().create_timer(update_interval).timeout
		remaining_duration -= update_interval
		loops -= 1
		if !active_pu_alerts.has(new_pu_alert):
			return
		else:
			new_pu_alert.text = message + middle_text + str(remaining_duration) + end_text
	
	var tween: Tween = new_pu_alert.create_tween()
	tween.tween_interval(0.0)
	tween.tween_property(new_pu_alert, "modulate:a", 0.0, 0.25)
	tween.tween_callback(new_pu_alert.queue_free)
	
func add_key_alert(colour):
	var new_key_alert: Label = alert.instantiate()
	new_key_alert.text = "You have a " + colour + " key."
	key_alerts.add_child(new_key_alert)
	active_key_alerts.append(new_key_alert)
	
func remove_key_alert(colour):
	for al in active_key_alerts.duplicate():
		if colour in al.text:
			var tween: Tween = al.create_tween()
			tween.tween_interval(0.0)
			tween.tween_property(al, "modulate:a", 0.0, 0.25)
			active_key_alerts.erase(al)
			tween.tween_callback(al.queue_free)
	
func clear_pu_alerts():
	for al in active_pu_alerts:
		if is_instance_valid(al):
			var tween: Tween = al.create_tween()
			tween.tween_interval(0.0)
			tween.tween_property(al, "modulate:a", 0.0, 0.25)
			tween.tween_callback(al.queue_free)
	active_pu_alerts.clear()
