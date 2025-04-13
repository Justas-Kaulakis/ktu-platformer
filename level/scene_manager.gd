extends Node

@onready var current_scene = get_tree().current_scene

var cs_pu_data: Array = []
var cs_pu_instances: Array = []
var preloaded_scene = null
var next_scene_path = ""

func load_next_level(path: String):
	next_scene_path = path
	ResourceLoader.load_threaded_request(path)

func _process(_delta):
	if next_scene_path != "" or null:
		var status = ResourceLoader.load_threaded_get_status(next_scene_path)
		if status == ResourceLoader.THREAD_LOAD_LOADED:
			preloaded_scene = ResourceLoader.load_threaded_get(next_scene_path).instantiate()
			next_scene_path = ""  # Reset after loading
		elif status == ResourceLoader.THREAD_LOAD_FAILED:
			print("Failed to preload scene: ", next_scene_path)
			next_scene_path = ""

func switch_scene(path):
	if preloaded_scene and path == next_scene_path:
		# Use preloaded scene if available
		if current_scene:
			current_scene.free()
		current_scene = preloaded_scene
		get_tree().root.add_child(current_scene)
		get_tree().current_scene = current_scene
		preloaded_scene = null
	else:
		# Fallback to normal loading
		_deferred_switch_scene.call_deferred(path)

func _deferred_switch_scene(path):
	if current_scene:
		current_scene.free()
	var s = ResourceLoader.load(path)
	current_scene = s.instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene
	
func register_pu_nodes():
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
			add_child(new_pu)
			new_pu.global_position = data["position"]
			cs_pu_instances[i] = new_pu

"""
@onready var current_scene = get_tree().current_scene

func switch_scene(path):
	
	current_scene = get_tree().current_scene
	_deferred_switch_scene.call_deferred(path)

func _deferred_switch_scene(path):
	# It is now safe to remove the current scene.
	if(current_scene):
		current_scene.free()
	# Load the new scene.
	var s = ResourceLoader.load(path)
	# Instance the new scene.
	current_scene = s.instantiate()
	# Add it to the active scene, as child of root.
	get_tree().root.add_child(current_scene)
	# Optionally, to make it compatible with the SceneTree.change_scene_to_file() API.
	get_tree().current_scene = current_scene

"""
