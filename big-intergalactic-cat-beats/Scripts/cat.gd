extends Sprite2D

var acc = 150
var speed : Vector2 = Vector2(2, 1)

var planet : Node2D = null
@export var feet : Node2D

@export var explosion : PackedScene

var pressed = false
var charge_timer : int
func dragged(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		speed += (get_global_mouse_position() - self.global_position).normalized()*delta*acc
		
	speed = speed.limit_length(200)
	self.transform = self.transform.translated(speed*delta)


func jump(delta):
	if Input.is_action_just_pressed("left_click"):
		pressed = true
		charge_timer = Time.get_ticks_msec()
		change_texture("res://Sprites/Player_Nemotito/Nemo_Stand.PNG")
	if Input.is_action_just_released("left_click") and pressed:
		var charge = min((Time.get_ticks_msec() - charge_timer) / 4, 1000)
		reparent(get_parent().get_parent())
		speed = (global_position - planet.global_position).normalized()*charge
		var kaboom = explosion.instantiate()
		kaboom.global_position = planet.global_position
		kaboom.rotation = rotation
		kaboom.scale = (planet.scale) * 2
		planet.get_parent().get_parent().add_child(kaboom)
		planet.free()
		planet = null
		pressed = false
		var countdown = get_tree().get_first_node_in_group("UI")
		countdown.increase_score()
		
		change_texture("res://Sprites/Player_Nemotito/Nemo_Jump.PNG")
		rotate((-PI/2) * .5)
		await get_tree().create_timer(1).timeout
		change_texture("res://Sprites/Player_Nemotito/Nemo_Float_Reach.PNG")

		
		

func _process(delta: float) -> void:
	if not self.planet:
		self.dragged(delta)
	else:
		jump(delta)
	
func change_texture(s: String):
	texture = load(s)
	#else:
		#self.rotation = planet.rotation
		#self.position = self.position + ((planet.position - self.position + Vector2(0, 40))).rotated(planet.rotation) - (self.feet.global_position - self.global_position)
