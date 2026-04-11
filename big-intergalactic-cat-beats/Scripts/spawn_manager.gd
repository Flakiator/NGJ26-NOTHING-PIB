extends Node2D

@export var planet_scene: PackedScene
@export var spawn_interval: int
@export var no_of_planets: int
@export var spawn_distance: int
@export var camera: Camera2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_loop()

func spawn_loop():		
	await get_tree().create_timer(1).timeout # spawn 1 planet at start
	spawn_planet()
	
	while true:
		await get_tree().create_timer(spawn_interval).timeout
		spawn_planet()
		cleanup_planets()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func spawn_planet(attempt = 0):
	if attempt >= 5:
		return
	if get_tree().get_first_node_in_group("player").planet: # no spawning if cat is on planet
		return
	var planets = get_tree().get_nodes_in_group("planets") 
	if  planets.size() < no_of_planets:
		var spawners = get_tree().get_nodes_in_group("spawner")
		#var spawner = spawners[get_spawner_from_direction()] # Spawn planet in the direction the player is heading
		var spawner = spawners[get_spawner_from_direction().pick_random()]
		var pos = spawner.get_random_point()
		var planet = planet_scene.instantiate()
		planet.global_position = pos
		var valid = true
		for p in planets:
			if (p.global_position - pos).length() < spawn_distance:
				valid = false
				break
		
		if valid:
			get_parent().add_child(planet)
		else:
			planet.free()
			spawn_planet(attempt + 1)

	
func cleanup_planets():
	var cam_pos = camera.global_position
	for planet in get_tree().get_nodes_in_group("planets"):
		if planet.global_position.distance_to(cam_pos) > 1000:
			planet.queue_free()


func get_spawner_from_direction():
	var idxes = []
	var speed = get_tree().get_first_node_in_group("player").speed
	if not abs(speed.y) > abs(speed.x) * 3:
		if speed.x < 0:
			idxes.append(3)
		else:
			idxes.append(2)
	if not abs(speed.x) > abs(speed.y) * 3:
		if speed.y < 0:
			idxes.append(0)
		else:
			idxes.append(1)
	return idxes
	
