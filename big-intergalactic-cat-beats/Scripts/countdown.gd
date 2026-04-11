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
	global_score += 1
	set_score(global_score)
	if global_score > score_threshold:
		get_tree().get_first_node_in_group("star_spawner").no_of_planets = 0
	get_tree().get_first_node_in_group("star_spawner").spawn_interval += 0.02
	print(get_tree().get_first_node_in_group("star_spawner").spawn_interval)
