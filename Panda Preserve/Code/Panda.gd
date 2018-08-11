extends RigidBody2D

const MOVE = 2
const JUMP = 100

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	
	
	if Input.is_action_pressed("ui_right"):
		if (linear_velocity.y > -12 && linear_velocity.y < 12):
			apply_impulse(Vector2(0,0),Vector2(MOVE,0))
		else:
			apply_impulse(Vector2(0,0),Vector2(MOVE/3,0))
		print ("right")
	
	if Input.is_action_pressed("ui_left"):
		if (linear_velocity.y > -12 && linear_velocity.y < 12):
			apply_impulse(Vector2(0,0),Vector2(-1 * MOVE,0))
		else:
			apply_impulse(Vector2(0,0),Vector2((-1 * MOVE)/3,0))
		print ("left")
	
	if Input.is_action_just_pressed("ui_up"):
		print ("up")
		if (linear_velocity.y > -12 && linear_velocity.y < 12):
			set_axis_velocity(Vector2(0,-1 * JUMP))
		
		
	#print ("coll?:" ,contacts_reported)
	#print ("force: ", applied_force)
	print ("applide torque: ", linear_velocity)
	
	pass
