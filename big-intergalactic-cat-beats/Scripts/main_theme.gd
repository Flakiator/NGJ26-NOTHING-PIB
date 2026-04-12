extends AudioStreamPlayer

func _ready() -> void:
	fade_in()

func fade_in():
	playing = true
	for i in range(20):
		volume_db += 1
		await get_tree().create_timer(.1).timeout

func fade_out():
	for i in range(20):
		volume_db -= 1
		await get_tree().create_timer(.1).timeout
	playing = false
