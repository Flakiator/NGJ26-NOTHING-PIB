extends Camera2D

func _process(delta: float) -> void:
	var cat_pos = get_tree().get_first_node_in_group("player").global_position
	var d_cat_pos = cat_pos - global_position
	
	if (d_cat_pos.x > 250):
		global_position.x = cat_pos.x - 250
	elif (d_cat_pos.x < -250):
		global_position.x = cat_pos.x + 250
	
	if (d_cat_pos.y > 100):
		global_position.y = cat_pos.y - 100
	elif (d_cat_pos.y < -100):
		global_position.y = cat_pos.y + 100
	#global_position = get_tree().get_first_node_in_group("player").global_position
