extends StaticBody2D

@onready var player = get_tree().current_scene.get_node("Player") as Player
@onready var platform_gun = get_tree().current_scene.get_node("Player/Sprite2D/PlatformGun")
var timer = 0

func reload():
	platform_gun.can_shoot = 1
	queue_free()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if timer > 0:
		timer -= delta
	else:
		$Sprite2D.visible = true
		$onSprite.visible = false
	
	if Input.is_action_just_pressed("reload") or player.current_health <= 0:
			reload()

func _mouse_enter():
	platform_gun.can_shoot = 0
	
func _mouse_exit():
	platform_gun.can_shoot = 1

func _on_area_2d_body_entered(body: Node2D) -> void:
	$Sprite2D.visible = false
	$onSprite.visible = true
	player.velocity.y += 0.8*player.JUMP_VELOCITY*cos(deg_to_rad(rotation_degrees))
	player.velocity.x += -0.3*(player.JUMP_VELOCITY*sin(deg_to_rad(rotation_degrees)))
	player.boost()
	timer = 1
