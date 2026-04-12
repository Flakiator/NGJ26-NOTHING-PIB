extends AudioStreamPlayer

func fade_in():
	playing = true
	for i in range(20):
		volume_db += 1
		await get_tree().create_timer(.1).timeout
