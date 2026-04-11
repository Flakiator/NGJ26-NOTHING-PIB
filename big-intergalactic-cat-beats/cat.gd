extends Polygon2D

var acc = 2
var speed : Vector2 = Vector2(2, 1)
var temp_target = Vector2(200, 200)

func dragged(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		print("lol")
		speed += (get_global_mouse_position() - self.position).normalized()*delta
		
	speed = speed.limit_length(1)
	#print(speed)
	self.transform = self.transform.translated(speed)

func _process(delta: float) -> void:
	self.dragged(delta)
