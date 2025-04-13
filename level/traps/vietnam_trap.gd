extends Area2D

@onready var spikes: PackedScene = preload("res://level/traps/spikes.tscn")
@onready var spikes_group: Node = get_parent().get_node("Basic Spikes")
var vt_position

func _on_body_entered(body: Player) -> void:
	if spikes:
		var new_trap = spikes.instantiate()
		var nt_sprite = new_trap.get_node("Spikes' Sprite")
		var nt_dims = nt_sprite.texture.get_size() * nt_sprite.scale
		var nt_centre = Vector2(round(nt_dims.x / 2), round(nt_dims.y / 2)) * 4
		new_trap.global_position = vt_position
		new_trap.global_position -= nt_centre
		new_trap.scale = spikes_group.scale
		get_parent().add_child(new_trap)
		queue_free()

func _on_ready() -> void:
	vt_position = global_position
	var vt_dims = $"Vietnam Trap Sprite".texture.get_size()
	vt_position += Vector2(ceil(vt_dims.x / 2), ceil(vt_dims.y / 2))
	print(str(vt_position))
