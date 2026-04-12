extends Polygon2D

func _ready() -> void:
	for i in range(256):
		color.a8 -= 1
		await get_tree().create_timer(.01).timeout
	
	queue_free()
