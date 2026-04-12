extends AudioStreamPlayer

var sounds = [
	preload("res://Audio/meows/meow0.ogg"),
	preload("res://Audio/meows/meow1.ogg"),
	preload("res://Audio/meows/meow2.ogg"),
	preload("res://Audio/meows/meow3.ogg"),
	preload("res://Audio/meows/meow4.ogg"),
	preload("res://Audio/meows/meow5.ogg"),
	preload("res://Audio/meows/meow6.ogg"),
	preload("res://Audio/meows/meow7.ogg"),
]

func _ready() -> void:
	while true:
		print("waiting")
		await get_tree().create_timer(randi_range(10,30)).timeout
		print("meow")
		stream = sounds.pick_random()
		play()
