extends KinematicBody2D

var velocity: = Vector2(0.0, 0.0)
var speed: = Vector2(300.0, 1150.0)
export var gravity = 49
export var inertia = 100

func _physics_process(delta):
	var horizontal = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var vertical = -1.0 if Input.is_action_just_pressed("move_up") and (is_on_floor() or is_on_wall()) else 0.0
	if(horizontal == -1.0): $RexSprite.set_flip_h(true)
	elif(horizontal == 1.0): $RexSprite.set_flip_h(false)
	velocity.x = horizontal * speed.x
	if(vertical == -1.0):
		velocity.y = vertical * speed.y
	else:
		velocity.y += gravity
	velocity = move_and_slide(velocity, Vector2(0, -1), false, 4, 3.14/4, false)
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if(collision.collider.get_class() == "RigidBody2D"):
			if(collision.normal == Vector2(0, -1)):
				collision.collider.apply_central_impulse(velocity/10)
			else: collision.collider.apply_central_impulse(-collision.normal*inertia)
