extends Node2D
# default values
var global_score = 0
var score_threshold = 100
@onready var end: Control = $Control
@onready var cat: Node2D = $Cat
func _ready() -> void:
	end.visible = false
	var countdown = get_tree().get_first_node_in_group("UI")
	score_threshold = countdown.score_threshold
	global_score = countdown.global_score
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if global_score > score_threshold:
		end.start()
		end.set_visible(true)
