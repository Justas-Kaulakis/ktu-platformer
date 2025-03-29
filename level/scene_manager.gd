class_name SceneManager extends Node

@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var current_level_layer: CanvasLayer = $CurrentLevelLayer
@onready var next_level_layer: CanvasLayer = $NextLevelLayer
@onready var player_ui: PlayerUI = $"Player UI"

var next_level: Node2D

func _ready() -> void:
	current_level_layer.get_child(0).level_changed.connect(handle_level_changed)
	#connect_player_signals()

const level_path: Dictionary[Global.Level, String] = {
	Global.Level.DEMO: "res://level/demo_level.tscn",
	Global.Level.L1: "res://level/level_1.tscn"
}

func handle_level_changed():
	swap_to(Global.current_level+1)

func on_player_died():
	restart_level()

func restart_level():
	swap_to(Global.current_level)

func swap_to(new_level_ind: Global.Level):
	next_level = load(level_path[new_level_ind]).instantiate()
	next_level_layer.call_deferred("add_child",next_level)
	anim.play("fade_in") # handles the swaping of levels at the end of animation
	next_level.level_changed.connect(handle_level_changed)
	Global.current_level = new_level_ind

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	match anim_name:
		"fade_in":
			var old_level: Node2D = current_level_layer.get_child(0)
			if old_level.has_method("cleanup"):
				old_level.cleanup()
			else:
				printerr("Last scene ["+ old_level.name +"] doesn't have cleanup() function")
			next_level.reparent(current_level_layer)
			next_level = null
			anim.play("fade_out")
