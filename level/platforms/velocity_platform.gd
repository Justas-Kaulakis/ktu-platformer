extends StaticBody2D

@onready var player = get_tree().current_scene.get_node("Player") as Player
@onready var platform_gun = get_tree().current_scene.get_node("Player/Sprite2D/PlatformGun")

func reload():
	platform_gun.can_shoot = 1
	queue_free()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotation_degrees = Global.rotate

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("reload") or player.current_health <= 0:
			reload()

func _mouse_enter():
	platform_gun.can_shoot = 0
	
func _mouse_exit():
	platform_gun.can_shoot = 1

func _on_area_2d_body_entered(_body: Player) -> void:
	AudioManager.play_sfx("velocity_boost")
	player.boost()
