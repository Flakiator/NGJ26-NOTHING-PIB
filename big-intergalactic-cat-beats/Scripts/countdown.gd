extends Label

@export var global_score = 0
var score_threshold = 10
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
	stars.spawn_interval += 0.02
	
	if global_score > score_threshold-1:
		var streamers = get_tree().get_nodes_in_group("audio_streamers")
		streamers[0].fade_out()
		streamers[1].fade_in()
