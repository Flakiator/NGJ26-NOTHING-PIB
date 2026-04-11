extends Area2D

@export var cat : Sprite2D

func _physics_process(delta: float) -> void:
	if get_overlapping_areas().find_custom((func(a) : return a.get_parent() == cat)) == -1:
		return
	if not cat.planet:
		cat.planet = self.get_parent()
		cat.reparent(self.get_parent())
