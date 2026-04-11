extends Area2D

@onready var collider = $CollisionShape2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("spawner")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func get_random_point():
	var rect = collider.shape.get_rect()

	var x = randi_range(0, rect.size.x*global_scale.x)
	var y = randi_range(0, rect.size.y*global_scale.y)
	var rand_point = global_position + Vector2(x,y) 
	return rand_point
