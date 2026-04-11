extends Area2D

@export var cat : Polygon2D

func _physics_process(delta: float) -> void:
	if get_overlapping_areas().find_custom((func(a) : return a.get_parent() == cat)) == -1:
		return
	cat.rotation = (self.get_parent().position - cat.position).orthogonal().angle()
