extends AnimationPlayer

@onready var fade_rect: ColorRect = get_parent()
@onready var fade_root: Control = fade_rect.get_parent()
@onready var end_sprite: Sprite2D = fade_root.get_node("Sprite2D")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fade_root.set_visible(false)
	_fit_to_viewport()
	if not get_viewport().size_changed.is_connected(_fit_to_viewport):
		get_viewport().size_changed.connect(_fit_to_viewport)
	play("fade_to_black")
	fade_root.set_visible(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _fit_to_viewport() -> void:
	var viewport_size: Vector2 = get_viewport().get_visible_rect().size
	fade_root.size = viewport_size
	fade_rect.position = Vector2.ZERO
	fade_rect.size = viewport_size
	end_sprite.position = viewport_size * 0.5
