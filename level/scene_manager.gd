extends Node

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var current_scene:Node = get_tree().current_scene

var cs_pu_data: Array = []
var cs_pu_instances: Array = []
var preloaded_scene = null
var next_scene_path = ""
var is_switching_scene = false

## Loads the level intoo memory in the background
func load_next_level(path: String):
	next_scene_path = path
	ResourceLoader.load_threaded_request(path)

func _process(_delta):
	if next_scene_path != "" or null:
		var status = ResourceLoader.load_threaded_get_status(next_scene_path)
		if status == ResourceLoader.THREAD_LOAD_LOADED:
			preloaded_scene = ResourceLoader.load_threaded_get(next_scene_path).instantiate()
			#preloaded_scene.set_meta("scene_path", next_scene_path)
			next_scene_path = "" # Reset after loading
		elif status == ResourceLoader.THREAD_LOAD_FAILED:
			print("Failed to preload scene: ", next_scene_path)
			next_scene_path = ""

# Public call to switch with fade
func switch_scene_with_fade(path: String):
	if is_switching_scene:
		return # Prevent overlapping transitions
	is_switching_scene = true
	load_next_level(path)
	animation_player.play("fade_to_black")
	await animation_player.animation_finished
	switch_scene(path)
	animation_player.play("fade_to_normal")
	await animation_player.animation_finished
	is_switching_scene = false

func switch_scene(path: String):
	if preloaded_scene and path == next_scene_path:
		# Use preloaded scene if available
		if current_scene:
			current_scene.free()
		current_scene = preloaded_scene
		get_tree().root.add_child(current_scene)
		get_tree().current_scene = current_scene
		Alert.load_level_info()
		preloaded_scene = null
	else:
		# Fallback to normal loading
		_deferred_switch_scene.call_deferred(path)
	if Alert.level_info.visible:
		Alert.level_info.visible = !Alert.level_info.visible
	if Alert.progress_info.visible:
		Alert.progress_info.visible = !Alert.progress_info.visible
	if Alert.roto_info.visible:
		Alert.roto_info.visible = !Alert.roto_info.visible
	if Alert.platform_type.visible:
		Alert.platform_type.visible = !Alert.platform_type.visible

func _deferred_switch_scene(path):
	if current_scene:
		current_scene.free()
	var s = ResourceLoader.load(path)
	current_scene = s.instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene
	Alert.load_level_info()

func _set_global_player():
	if current_scene:
		# Adjust this path to match where Player is in your level
		if current_scene.has_node("Player"):
			Global.player = current_scene.get_node("Player")
		elif current_scene.has_node("Characters/Player"):
			Global.player = current_scene.get_node("Characters/Player")
		else:
			Global.player = null

	
func register_pu_nodes():
	cs_pu_data = []
	cs_pu_instances = []
	if current_scene != null:
		for powerup in current_scene.get_tree().get_nodes_in_group("respawnable"):
			var pu_scene = load(powerup.path)
			var data = {
				"scene": pu_scene,
				"position": powerup.global_position
			}
			cs_pu_data.append(data)
			cs_pu_instances.append(powerup)

func restore_pu_nodes():
	for i in cs_pu_data.size():
		if !is_instance_valid(cs_pu_instances[i]):
			var data = cs_pu_data[i]
			var new_pu = data["scene"].instantiate()
			add_child.call_deferred(new_pu)
			new_pu.global_position = data["position"]
			cs_pu_instances[i] = new_pu
