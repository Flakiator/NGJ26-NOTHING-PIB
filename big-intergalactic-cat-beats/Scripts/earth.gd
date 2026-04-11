extends Sprite2D

var random_speed: float
func _ready() -> void:
	var scaling_factor = randf_range(0.07,0.2)
	random_speed = randf_range(0.1, 0.3)
	global_scale = Vector2(scaling_factor, scaling_factor)
	texture = load("res://Sprites/earth.png")
func _process(delta: float) -> void:
	self.rotate(delta*random_speed)
