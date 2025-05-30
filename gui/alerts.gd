extends CanvasLayer

@export var alert: PackedScene = preload("res://gui/individual_alert.tscn")

@onready var panel: Panel = $Panel
@onready var popup: Label = $Panel/Label
@onready var pu_alerts: VBoxContainer = $"Powerup Alerts"
@onready var checkpoint_alerts: VBoxContainer = $"Key Alerts"
@onready var level_info: RichTextLabel = $"Level Information"
@onready var progress_info: RichTextLabel = $"Progress Information"
@onready var roto_info: RichTextLabel = $"Rotation Information"
@onready var platform_type: RichTextLabel = $"Platform Type"
 
var active_pu_alerts: Array = []
var active_checkpoint_alerts: Array = []
var active_checkpoint_alerts_cn: Array = []
var keys_collected_array: Array = []

var font := preload("res://gui/kenney_mini_square.ttf")
var default_text_colour = Color.from_rgba8(192, 192, 192).to_html()

var keys_collected: int = 0
var keys_collected_checkpoint: int = 0
var keys_total: int = 0


func create_popup_alert(message):
	popup.text = message
	var tween: Tween = panel.create_tween()
	tween.tween_property(panel, "modulate:a", 1.0, 0.2)
	tween.tween_interval(1.6)
	tween.tween_property(panel, "modulate:a", 0.0, 0.2)

func create_powerup_alert(message, duration):
	var default_colour: Color = Color.from_rgba8(0, 255, 0)
	var colour_converted = default_colour.to_html()
	var middle_text = " is active for "
	var end_text = " seconds!"
	var duration_string = "[color=" + colour_converted + "]%.1f[/color]" % duration
	var new_pu_alert: RichTextLabel = alert.instantiate()
	new_pu_alert.bbcode_enabled = true
	new_pu_alert.fit_content = true
	new_pu_alert.autowrap_mode = TextServer.AUTOWRAP_OFF
	new_pu_alert.add_theme_font_override("normal_font", font)
	new_pu_alert.text = message + middle_text + duration_string + end_text
	pu_alerts.add_child(new_pu_alert)
	active_pu_alerts.append(new_pu_alert)
	
	var remaining_duration = duration
	var update_interval = 0.1
	var loops = duration / update_interval
	var one_third = floor(loops / 3)
	var two_thirds = floor(loops * 2 / 3)
	while (loops > 0):
		var colour: Color
		await get_tree().create_timer(update_interval).timeout
		remaining_duration -= update_interval
		if loops <= one_third:
			colour = Color.from_rgba8(255, 0, 0)
		elif loops <= two_thirds:
			colour = Color.from_rgba8(255, 255, 0)
		else:
			colour = default_colour
		colour_converted = colour.to_html()
		duration_string = "[color=" + colour_converted + "]%.1f[/color]" % remaining_duration
		loops -= 1
		if !active_pu_alerts.has(new_pu_alert):
			return
		else:
			new_pu_alert.text = message + middle_text + duration_string + end_text
	
	var tween: Tween = new_pu_alert.create_tween()
	tween.tween_interval(0.0)
	tween.tween_property(new_pu_alert, "modulate:a", 0.0, 0.25)
	tween.tween_callback(new_pu_alert.queue_free)
	
func add_checkpoint_alert(colour):
	var new_checkpoint_alert: RichTextLabel = alert.instantiate()
	new_checkpoint_alert.bbcode_enabled = true
	new_checkpoint_alert.fit_content = true
	new_checkpoint_alert.autowrap_mode = TextServer.AUTOWRAP_OFF
	new_checkpoint_alert.add_theme_font_override("normal_font", font)
	new_checkpoint_alert.text = "You have a [color=" + Color(colour).to_html() + "]%s[/color] key." % colour
	checkpoint_alerts.add_child(new_checkpoint_alert)
	active_checkpoint_alerts.append(new_checkpoint_alert)
	active_checkpoint_alerts_cn.append(colour)
	
func remove_checkpoint_alert(colour):
	for al in active_checkpoint_alerts.duplicate():
		if colour in al.text:
			var tween: Tween = al.create_tween()
			tween.tween_interval(0.0)
			tween.tween_property(al, "modulate:a", 0.0, 0.25)
			active_checkpoint_alerts_cn.erase(colour)
			active_checkpoint_alerts.erase(al)
			tween.tween_callback(al.queue_free)
	
func clear_pu_alerts():
	for al in active_pu_alerts:
		if is_instance_valid(al):
			var tween: Tween = al.create_tween()
			tween.tween_interval(0.0)
			tween.tween_property(al, "modulate:a", 0.0, 0.25)
			tween.tween_callback(al.queue_free)
	active_pu_alerts.clear()
	
func clear_checkpoint_alerts():
	for kal in active_checkpoint_alerts:
		if is_instance_valid(kal):
			var tween: Tween = kal.create_tween()
			tween.tween_interval(0.0)
			tween.tween_property(kal, "modulate:a", 0.0, 0.25)
			tween.tween_callback(kal.queue_free)
	active_checkpoint_alerts.clear()
	active_checkpoint_alerts_cn.clear()
	
func load_level_info():
	if Global.current_area == Global.Area.GAMEPLAY:
		var cs_path = SceneManager.current_scene.scene_file_path
		var stripped_name = cs_path.get_file().replace(".tscn", "")
		var new_name = stripped_name.capitalize()
		level_info.add_theme_color_override("default_color", SceneManager.current_scene.level_aesthetic_colour)
		level_info.text = new_name
		level_info.visible = !level_info.visible
		
		keys_collected = 0
		keys_collected_checkpoint = 0
		keys_total = SceneManager.current_scene.get_node("Keys").get_child_count()
		update_keys(0)
		progress_info.visible = !progress_info.visible
		
		update_rotation_info(Global.rotate)
		roto_info.visible = !roto_info.visible
		
		update_platform_info(Global.pdn_1, 1)
		platform_type.visible = !platform_type.visible
	
func update_keys_info(increment):
	keys_collected += increment
	update_keys(keys_collected)

func update_keys(count):
	if count == 0:
		keys_collected = 0
	
	progress_info.text = "[color=" + default_text_colour + "]Keys: [/color]%d%s%d" % [count, "/", keys_total]
	
func update_rotation_info(degrees):
	roto_info.text = "[color=" + default_text_colour + "]Rotation: [/color]%d°" % degrees

func update_platform_info(platform_name, index):
	platform_type.text = "%s (%d)" % [platform_name, index]
