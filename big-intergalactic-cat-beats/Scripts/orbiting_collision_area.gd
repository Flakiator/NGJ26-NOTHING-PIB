extends Area2D


func _physics_process(delta: float) -> void:
	var idx = get_overlapping_areas().find_custom((func(a : CollisionObject2D) : return a.get_parent().is_in_group("player")))
	if  idx == -1:
		return
	var cat = get_overlapping_areas()[idx].get_parent()
	if not cat.planet:
		cat.rotation = (self.get_parent().global_position - cat.global_position).orthogonal().angle()
		cat.speed += (get_parent().global_position - cat.global_position).normalized() * delta * 100
