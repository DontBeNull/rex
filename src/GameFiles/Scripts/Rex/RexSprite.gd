extends Sprite

var sprite_timer = 0

func _physics_process(delta):
	sprite_timer += delta
	if(sprite_timer > 0.10):
		self.frame += 1
		if(self.frame >= 4):
			self.frame = 0
		sprite_timer = 0
