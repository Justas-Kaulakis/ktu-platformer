extends Node

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var current_scene = get_tree().current_scene
var preloaded_scene = null
var next_scene_path = ""
var is_switching_scene = false

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

# Public call to switch with fade
func switch_scene_with_fade(path: String):
	if is_switching_scene:
		return  # Prevent overlapping transitions
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
