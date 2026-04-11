extends Node2D

@export var planet_scene: PackedScene
@export var spawn_interval := 1.5

@onready var camera = $"../Cat/Camera2D"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_loop()

func spawn_loop():
	while true:
		await get_tree().create_timer(spawn_interval).timeout
		spawn_planet()
		cleanup_planets()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func spawn_planet():
	var spawners = get_tree().get_nodes_in_group("spawner")
	print(spawners)
	var spawner = spawners[randi() % spawners.size()]
	print(spawner)
	var pos = spawner.get_random_point()
	var planet = planet_scene.instantiate()
	planet.global_position = pos
	add_child(planet)
	
func cleanup_planets():
	var cam_pos = camera.global_position
	for planet in get_children():
		if planet.global_position.distance_to(cam_pos) > 2000:
			planet.queue_free()
