class_name Checkpoint extends Area2D

@export var new_platform_count: int = 3#Global.max_platform_count
@export_enum("default", "breakable", "gravity", "velocity", "trampoline", "flicker", "rotate") var platform_1 = "default"
@export_enum("default", "breakable", "gravity", "velocity", "trampoline", "flicker", "rotate") var platform_2 = "breakable"
@export_enum("default", "breakable", "gravity", "velocity", "trampoline", "flicker", "rotate") var platform_3 = "gravity"
var visited = false

func _ready() -> void:
	$on.visible = false
	
func _on_body_entered(player: Player) -> void:
	if Global.lastCheckpoint == self:
		return
	if not visited:
		AudioManager.play_sfx("checkpoint_reached")
		Global.lastCheckpoint = self
		visited = true
		Alert.keys_collected_checkpoint = Alert.keys_collected
		for key in Alert.active_checkpoint_alerts_cn:
			Alert.keys_collected_array.append(key)
		
	Input.action_press("platform_1")
	Input.action_release("platform_1")
	Global.p_1 = Global.platform[platform_1]
	Global.pt_1 = Global.platformText[platform_1]
	Global.pdn_1 = Global.platform_display_names[platform_1]
	Global.p_2 = Global.platform[platform_2]
	Global.pt_2 = Global.platformText[platform_2]
	Global.pdn_2 = Global.platform_display_names[platform_2]
	Global.p_3 = Global.platform[platform_3]
	Global.pt_3 = Global.platformText[platform_3]
	Global.pdn_3 = Global.platform_display_names[platform_3]
	
	Global.max_platform_count = new_platform_count # sets ammo count
	Global.last_location = player.global_position # sets respawn point
	player.reset_player()
	$off.visible = false
	$on.visible = true
	$PointLight2D.enabled = true;
