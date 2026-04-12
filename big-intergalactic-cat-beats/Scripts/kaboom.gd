extends Node2D
@export var animation : AnimatedSprite2D

func _ready() -> void:
	animation.play()

func _process(delta: float) -> void:
	if animation.is_playing():
		return
	self.queue_free()
