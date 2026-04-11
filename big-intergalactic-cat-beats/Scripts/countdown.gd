extends Label

@export var global_score = 0
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
