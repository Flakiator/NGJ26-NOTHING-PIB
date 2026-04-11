extends Sprite2D

var random_speed: float
func _ready() -> void:
	var scaling_factor = randf_range(0.07,0.2)
	random_speed = randf_range(0.1, 0.3)
	global_scale = Vector2(scaling_factor, scaling_factor)
	texture = load(get_random_planet())
func _process(delta: float) -> void:
	self.rotate(delta*random_speed)
	
func get_random_planet():
	var files = DirAccess.open("res://Sprites/Planets/").get_files()
	var filtered_files = []
	for file in files:
		if not file.ends_with("import"):
			filtered_files.append(file)
	var random_texture = filtered_files[randi_range(0, filtered_files.size() - 1)]
	return ("res://Sprites/Planets/" + random_texture)
