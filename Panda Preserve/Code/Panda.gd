extends RigidBody2D

const MOVE = 2
const JUMP = 150
const eatCool = 10

var eatTime = 0
var isEating = false
var stomach = 0
var full = 10

var mouth
var spr
var col
var cam

var sz = 1
var mvU = 0


func _ready():
	mouth = get_child(0)
	spr = get_child(1)
	col = get_child(2)
	cam = get_child(3)
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
	
func eatBamboo():
	var val = false
	
	if eatTime == 0:
		if linear_velocity.x > -4 && linear_velocity.x < 4:
			eat()
			val = true
		
	if eatTime > 0:
		eatTime -= 1
	
	return val
	
func eat():
	mouth.emitting = true
	eatTime = eatCool
	stomach += 1
	
	if stomach%full == 0:
		eatTime = eatCool * 2
		grow()
	
	print("Eaten: ", stomach);
	
	pass
	
	
func grow():
	sz += 0.05
	mvU +=1
	#self.mass += sz/15
	full *= 2
	spr.apply_scale(Vector2(sz,sz))
	col.apply_scale(Vector2(sz,sz))
	cam.zoom = Vector2(cam.zoom.x + 0.025, cam.zoom.y + 0.025)
	pass
	

