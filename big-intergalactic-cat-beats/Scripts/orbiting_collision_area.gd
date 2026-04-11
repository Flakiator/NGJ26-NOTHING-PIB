extends Area2D


func _physics_process(delta: float) -> void:
	var idx = get_overlapping_areas().find_custom((func(a : CollisionObject2D) : return a.get_parent().is_in_group("player")))
	if  idx == -1:
		return
	var cat = get_overlapping_areas()[idx].get_parent()
	cat.rotation = (self.get_parent().position - cat.position).orthogonal().angle()
