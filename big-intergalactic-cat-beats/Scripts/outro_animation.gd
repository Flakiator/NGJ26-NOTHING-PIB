extends AnimatedSprite2D
func _ready() -> void:
	play("default")
	await get_tree().create_timer(10).timeout
	await animation_looped
	play("blink")
