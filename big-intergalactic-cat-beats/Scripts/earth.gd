extends Sprite2D

var files = [
	preload("res://Sprites/Planets/earth.PNG"),
	preload("res://Sprites/Planets/porple_planet.png"),
	preload("res://Sprites/Planets/planet_bubble.PNG"),
	preload("res://Sprites/Planets/planet_blue.PNG"),
	preload("res://Sprites/Planets/planet_daisy.PNG"),
	preload("res://Sprites/Planets/planet_rabbit.PNG"),
	preload("res://Sprites/Planets/planet_saturn.PNG"),
	preload("res://Sprites/Planets/planet_sauron.PNG")
	
]

var random_speed: float
func _ready() -> void:
	var scaling_factor = randf_range(0.07,0.2)
	random_speed = randf_range(0.1, 0.3)
	global_scale = Vector2(scaling_factor, scaling_factor)
	#texture = get_random_planet()
func _process(delta: float) -> void:
	self.rotate(delta*random_speed)
	
func get_random_planet():
	var random_texture = files[randi_range(0, files.size() - 1)]
	return random_texture
