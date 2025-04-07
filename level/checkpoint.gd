extends Area2D

@onready var player = get_tree().current_scene.get_node("Player") as Player
@export var new_platform_count = Global.max_platform_count
@export var platform_1 = "default"
@export var platform_2 = "breakable"
@export var platform_3 = "gravity"
var visited = false

func _on_body_entered(_body: Player) -> void:
	if not visited:
		AudioManager.play_sfx("checkpoint_reached")
		Input.action_press("platform_1")
		Input.action_release("platform_1")
		visited = true
	#GIGA ASS
	match platform_1:
			"default":
				Global.p_1 = Global.platform_1
				Global.pt_1 = Global.ptexture_1
			"breakable":
				Global.p_1 = Global.platform_2
				Global.pt_1 = Global.ptexture_2
			"gravity":
				Global.p_1 = Global.platform_3
				Global.pt_1 = Global.ptexture_3
	match platform_2:
			"default":
				Global.p_2 = Global.platform_2
				Global.pt_2 = Global.ptexture_2
			"breakable":
				Global.p_2 = Global.platform_2
				Global.pt_2 = Global.ptexture_2
			"gravity":
				Global.p_2 = Global.platform_3
				Global.pt_2 = Global.ptexture_3
	match platform_3:
			"default":
				Global.p_3 = Global.platform_1
				Global.pt_3 = Global.ptexture_1
			"breakable":
				Global.p_3 = Global.platform_2
				Global.pt_3 = Global.ptexture_2
			"gravity":
				Global.p_3 = Global.platform_3
				Global.pt_3 = Global.ptexture_3
	Global.max_platform_count = new_platform_count #sets ammo count
	Global.last_location = player.global_position #sets respawn point
	player.reset_player()
	$off.visible = false
	$on.visible = true
