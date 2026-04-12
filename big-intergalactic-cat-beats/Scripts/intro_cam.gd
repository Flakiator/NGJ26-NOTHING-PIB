extends Camera2D

@export var zoom_to : Node2D

@export var audio : AudioStreamPlayer

@export var game : PackedScene 

func _ready() -> void:
	await get_tree().create_timer(8).timeout
	var zooming = .0002
	while global_position != zoom_to.global_position or zoom.length() < Vector2(50,50).length():
		global_position += (zoom_to.global_position - global_position).limit_length(.35)
		zoom += Vector2(zooming,zooming)
		zooming += .0002
		await get_tree().create_timer(.01).timeout
	for i in range(20):
		audio.volume_db -= 1
		await get_tree().create_timer(.1).timeout
	audio.playing = false
	get_tree().change_scene_to_packed(game)
	
