extends RigidBody2D

# Constants
const MOVE = 2
const JUMP = 150
const EATCOOL = 10

# Eating Vars
var eatTime = 0
var isEating = false
var stomach = 0
var full = 10

# Part Vars
var mouth
var spr
var col
var cam
var ear

# Growth Vars
var sz = 1
var mvU = 0


func _ready():
	# Declares the parts of the panda
	mouth = get_child(0)
	spr = get_child(1)
	col = get_child(2)
	cam = get_child(3)
	ear = get_child(4)
	pass


func _physics_process(delta):
	#mouth.hide()
	var move = MOVE + mvU
	
	if Input.is_action_pressed("ui_right"):
		if (linear_velocity.y > -12 && linear_velocity.y < 12):
			apply_impulse(Vector2(0,0),Vector2(move,0))
		else:
			apply_impulse(Vector2(0,0),Vector2(MOVE/3,0))
	
	if Input.is_action_pressed("ui_left"):
		if (linear_velocity.y > -12 && linear_velocity.y < 12):
			apply_impulse(Vector2(0,0),Vector2(-1 * move,0))
		else:
			apply_impulse(Vector2(0,0),Vector2((-1 * MOVE)/3,0))
	
	if Input.is_action_just_pressed("ui_up"):
		if (linear_velocity.y > -12 && linear_velocity.y < 12):
			set_axis_velocity(Vector2(0,-1 * JUMP))
			
	
	pass

# Determines if the panda can eat
func eatBamboo():
	var val = false
	
	if eatTime == 0:
		if linear_velocity.x > -4 && linear_velocity.x < 4:
			eat()
			val = true
		
	if eatTime > 0:
		eatTime -= 1
	
	return val

# The panda actually eats
func eat():
	mouth.emitting = true
	ear.play()
	eatTime = EATCOOL
	stomach += 1
	
	if stomach%full == 0:
		eatTime = EATCOOL * 2
		grow()
	
	#print("Eaten: ", stomach);
	
	pass
	
# Grows the Panda
func grow():
	sz += 0.05
	mvU +=1
	#self.mass += sz/15
	full *= 2
	spr.apply_scale(Vector2(sz,sz))
	col.apply_scale(Vector2(sz,sz))
	cam.zoom = Vector2(cam.zoom.x + 0.005, cam.zoom.y + 0.005)
	pass

# Kills the panda
func kill():
	get_tree().reload_current_scene()
	pass

