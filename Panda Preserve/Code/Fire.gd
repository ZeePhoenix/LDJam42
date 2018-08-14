extends KinematicBody2D

# Variables about self
var fire
var area

# Variables about world
var panda
var bamboo

# Movement
var spd
var wait = 60

func _ready():
	# Declare Self
	area = get_child(0)
	fire = area.get_child(1)
	
	# Learn about scene
	panda = get_parent().get_child(0)
	bamboo = get_parent().get_child(1).get_child(0)
	
	# Var Declaration
	spd = 0.8
	pass

func _process(delta):
	show()
	
	# Detect Panda
	if area.overlaps_body(panda):
		panda.kill()
	
	if wait > 0:
		wait -= 1
	else:
		move_and_collide(Vector2(spd, 0))
	
	pass
