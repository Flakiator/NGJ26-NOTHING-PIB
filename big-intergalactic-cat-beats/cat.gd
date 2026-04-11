extends Polygon2D

var acc = 2
var speed : Vector2 = Vector2(2, 1)

var planet : Node2D = null

@export var feet : Node2D

var pressed = false

func dragged(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		speed += (get_global_mouse_position() - self.position).normalized()*delta
		
	speed = speed.limit_length(1)
	self.transform = self.transform.translated(speed)
	
func jump(delta):
	if Input.is_action_just_pressed("left_click"):
		pressed = true
	if Input.is_action_just_released("left_click") and pressed:
		reparent(get_parent().get_parent())
		speed = (global_position - planet.global_position).normalized()*2
		planet.free()
		planet = null
		pressed = false
		
		

func _process(delta: float) -> void:
	if not self.planet:
		self.dragged(delta)
	else:
		jump(delta)
	

	#else:
		#self.rotation = planet.rotation
		#self.position = self.position + ((planet.position - self.position + Vector2(0, 40))).rotated(planet.rotation) - (self.feet.global_position - self.global_position)
