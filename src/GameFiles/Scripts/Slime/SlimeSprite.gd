extends Sprite

var size_timer = -2.0
signal grow

func _physics_process(delta):
	size_timer += delta
	randomize()
	if(size_timer > randf()+2.0):
		emit_signal("grow")
		scale += Vector2(0.15, 0.15)
		position.y -= 6.0
		size_timer = 0
