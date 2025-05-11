extends StaticBody2D

@onready var player = get_tree().current_scene.get_node("Player") as Player
@onready var platform_gun = get_tree().current_scene.get_node("Player/Sprite2D/PlatformGun")
var timer = 0.5
func reload():
	platform_gun.can_shoot = 1
	queue_free()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D.visible = false
	$off.visible = true
	$CollisionShape2D.disabled = true
	rotation_degrees = Global.rotate

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer -= delta;
	if timer < 1.5:
		$Sprite2D.visible = false
		$off.visible = true
		$CollisionShape2D.disabled = true
	if timer < 0:
		$Sprite2D.visible = true
		$off.visible = false
		$CollisionShape2D.disabled = false
		timer = 3


	if Input.is_action_just_pressed("reload") or player.current_health <= 0:
			reload()

func _mouse_enter():
	platform_gun.can_shoot = 0
	
func _mouse_exit():
	platform_gun.can_shoot = 1
