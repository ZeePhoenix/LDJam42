extends KinematicBody2D

# Variables about self
var fire
var area

# Variables about world
var panda

# Movement
var spd

func _ready():
	# Declare Self
	area = get_child(0)
	fire = area.get_child(1)
	
	# Learn about scene
	panda = get_parent().get_child(0)
	
	# Var Declaration
	spd = 0.25
	pass

func _process(delta):
	
	if area.overlaps_body(panda):
		panda.kill()
	
	move_and_collide(Vector2(spd, 0))
	
	pass
