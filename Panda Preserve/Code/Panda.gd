extends RigidBody2D

# Constants
const MOVE = 2
const JUMP = 150
const JUMPCOST = 5
const EATCOOL = 5
const MINEAT = 22

# Eating Vars
var eatTime = 0
var isEating = false
var stomach = 0
var full = 100

# Part Vars
var mouth
var ear
var spr
var col
var camera
var gui

# Growth Vars
var sz = 1
var mvU = 0

var fire
var dist
var start

func _ready():
	# Declares the parts of the panda
	mouth = get_child(0)
	spr = get_child(1)
	col = get_child(2)
	ear = get_child(3)
	gui = get_parent().get_child(4).get_child(0)
	camera = get_child(4)
	fire = $"../Fire/Node2D"
	start = global_position.x
	print(start)
	pass

func _physics_process(delta):
	var move = MOVE + mvU
	
	camera.limit_right = fire.global_position.x + 220
	dist = global_position.x - start
	
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
	
	if Input.is_action_just_pressed("ui_up") && stomach > JUMPCOST:
		if (linear_velocity.y > -12 && linear_velocity.y < 12):
			set_axis_velocity(Vector2(0,-1 * JUMP))
			stomach -= JUMPCOST
			
	
	pass

# Determines if the panda can eat
func eatBamboo():
	var val = false
	
	# If we havent eaten recently
	if eatTime == 0 && stomach < full:
		# If we're slow enough
		if linear_velocity.x > -MINEAT && linear_velocity.x < MINEAT:
			eat()
			val = true
	
	# If we ate recently
	if eatTime > 0:
		eatTime -= 1
	
	return val

# The panda actually eats
func eat():
	mouth.emitting = true
	ear.play()
	eatTime = EATCOOL
	stomach += 1
	
	# How full are we?
	var p = stomach%full
	mvU = int(p/10)
	pass
	
# Grows the Panda
func grow():
	#sz += 0.02
	mvU +=1
	#self.mass += sz/15
	full *= 2
	spr.apply_scale(Vector2(sz,sz))
	col.apply_scale(Vector2(sz,sz))
	pass

# Kills the panda
func kill():
	get_tree().reload_current_scene()
	pass
