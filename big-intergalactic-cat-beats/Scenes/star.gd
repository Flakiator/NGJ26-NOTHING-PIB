extends Sprite2D

var speed_fraction : float
var cam_pos : Vector2

func _ready() -> void:
	speed_fraction = (30 + randi() % 30) / 100.0
	
func _process(delta: float) -> void:
	var cam = get_tree().get_first_node_in_group("camera")
	var speed = cam.global_position - cam_pos 
	global_position = global_position + speed * speed_fraction
	cam_pos = cam.global_position
