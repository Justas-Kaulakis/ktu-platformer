extends PointLight2D

@export var flicker_range: float = 0.3
@export var flicker_speed: float = 30.0

@export var move_light: bool = false
@export var movement_radius: float = 4.0
@export var movement_speed: float = 1.5

var flicker_noise := FastNoiseLite.new()
var move_noise_x := FastNoiseLite.new()
var move_noise_y := FastNoiseLite.new()

var time_passed := 0.0
var original_position := Vector2.ZERO

var base_energy: float

func _ready():
	base_energy = energy
	flicker_noise.seed = randi()
	flicker_noise.noise_type = FastNoiseLite.TYPE_SIMPLEX

	move_noise_x.seed = randi()
	move_noise_x.noise_type = FastNoiseLite.TYPE_SIMPLEX
	move_noise_y.seed = randi()
	move_noise_y.noise_type = FastNoiseLite.TYPE_SIMPLEX

	original_position = position

func _process(delta):
	time_passed += delta

	# Smooth energy flicker
	var flicker = flicker_noise.get_noise_1d(time_passed * flicker_speed) * flicker_range
	energy = base_energy + flicker

	# Optional circular/noisy movement
	if move_light:
		var offset_x = move_noise_x.get_noise_1d(time_passed * movement_speed)
		var offset_y = move_noise_y.get_noise_1d((time_passed + 100.0) * movement_speed)  # Offset time for variation
		position = original_position + Vector2(offset_x, offset_y) * movement_radius
