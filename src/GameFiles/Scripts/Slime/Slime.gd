extends RigidBody2D
class_name Slime

var color = "None"

func _physics_process(delta):
	if get_child(0).scale.x >= 2.0:
		explode()
	rotation = 0
	var bodies = get_colliding_bodies()
	for body in bodies:
		if body.name == color+"Map":
			burst()
				
func burst():
	get_parent().score += 1
	queue_free()
	
func explode():
	var level = get_parent()
	var slime_scene = load("res://GameFiles/Scenes/Slime/"+color+"Slime.tscn")
	var slime_instance1 = slime_scene.instance()
	var slime_instance2 = slime_scene.instance()
	slime_instance1.set_name("Slime")
	slime_instance1.position = position
	slime_instance2.position = position
	slime_instance1.set_linear_velocity(Vector2(300.0, 1000.0))
	slime_instance2.set_linear_velocity(Vector2(-300.0, 1000.0))
	level.add_child(slime_instance1)
	level.add_child(slime_instance2)
	level.lives -= 1
	queue_free()
