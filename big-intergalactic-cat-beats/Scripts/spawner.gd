extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("spawner")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func get_random_point():
	var shape = $CollisionShape2D.shape
	var rect = $CollisionShape2D.shape.get_rect()
	var x = randi_range(rect.position.x, rect.position.x+rect.size.x)
	var y = randi_range(rect.position.y, rect.position.y+rect.size.y)
	var rand_point = Vector2(x,y) 
	return rand_point
