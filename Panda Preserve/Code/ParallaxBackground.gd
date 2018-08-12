extends ParallaxBackground

var track

var back
var front

var scrollX = 0
var scrollY = 0

func _ready():
	
	back = get_child(0)
	back.show()
	front = get_child(1)
	front.show()
	track = get_parent().get_child(0)
	
	#bkg.motion_scale = Vector2(0,0)
	
	back.motion_offset = Vector2(-1024,0)
	back.motion_scale = Vector2(2,1.2);
	front.motion_offset = Vector2(-1024,80)
	front.motion_scale = Vector2(1.2,0.8);

	pass

func _process(delta):
	
	scrollX += track.linear_velocity.x / 200
	scrollY += track.linear_velocity.y / 200
	scroll_offset -= Vector2(scrollX, scrollY)
	
	pass
