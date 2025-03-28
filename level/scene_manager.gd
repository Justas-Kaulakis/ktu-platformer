class_name SceneManager extends Node

#@onready var current_level: Node2D = $"CurrentLevelLayer/Demo level"
@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var current_level_layer: CanvasLayer = $CurrentLevelLayer
@onready var next_level_layer: CanvasLayer = $NextLevelLayer

var next_level: Node2D

func _ready() -> void:
	current_level_layer.get_child(0).level_changed.connect(handle_level_changed)

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
			current_level_layer.get_child(0).queue_free()
			next_level.reparent(current_level_layer)
			next_level = null
			anim.play("fade_out")
