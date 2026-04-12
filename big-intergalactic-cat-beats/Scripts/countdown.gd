extends Label

@export var global_score = 0
@export var end_cutscene: PackedScene
var end_countdown = 5
var score_threshold = 3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_score(global_score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_score(score: int):
	text = "%s" % score
	global_score = score

func increase_score():
	var planets = get_tree().get_first_node_in_group("planet_spawner")
	var stars = get_tree().get_first_node_in_group("star_spawner")
	print(stars)
	global_score += 1
	set_score(global_score)
	if global_score > score_threshold:
		stars.no_of_planets = 0
		planets.no_of_planets = 0
		await get_tree().create_timer(end_countdown).timeout
		get_parent().add_child(end_cutscene.instantiate())
	stars.spawn_interval += 0.02
