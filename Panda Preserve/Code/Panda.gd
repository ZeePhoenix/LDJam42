extends KinematicBody2D

const GRV = 200.0
var vel = Vector2()

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	vel.y += delta * GRV
	
	var motion = vel * delta
	move_and_collide(motion)
	
	pass
