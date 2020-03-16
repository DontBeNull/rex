extends Node2D

var level_timer = 0
var colors = ["Yellow", "Red", "Blue"]
var score = 0
var lives = 10
var slime_wait = 2.0
var slime_count = 0
var threshold = 5
signal game_over

func _physics_process(delta):
	level_timer += delta
	if(level_timer > 2.0):
		randomize()
		var color = colors[randi()%3]
		var slime_scene = load("res://GameFiles/Scenes/Slime/"+color+"Slime.tscn")
		var slime_instance = slime_scene.instance()
		slime_instance.set_name("Slime")
		slime_instance.position = Vector2(randi()%825+75, -100)
		add_child(slime_instance)
		level_timer = 0
		if(slime_count > threshold and slime_wait > 0.5):
			threshold += 5
			slime_wait -= 0.1
	$Score.text = "Score: "+str(score)
	$Lives.text = "Lives: "+str(lives)
	if(lives <= 0):
		emit_signal("game_over")
		var menu_scene = load("res://GameFiles/Scenes/Menu.tscn")
		var menu_instance = menu_scene.instance()
		menu_instance.get_child(1).text = "Score: "+str(score)
		get_parent().add_child(menu_instance)
		queue_free()
	
