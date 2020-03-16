extends Node2D

func _on_PlayButton_button_up():
	var level_scene = load("res://GameFiles/Scenes/Level.tscn")
	var level_instance = level_scene.instance()
	get_parent().add_child(level_instance)
	queue_free()
