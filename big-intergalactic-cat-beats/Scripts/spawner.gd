extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("spawner")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func get_random_point():
	var shape = $CollisionShape2D.shape
	var extents = shape.extents
	var local_point = Vector2(
		randf_range(-extents.x, extents.x),
		randf_range(-extents.y, extents.y))
	return to_global(local_point)
