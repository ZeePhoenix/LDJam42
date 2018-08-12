extends ParallaxBackground

var track

var back
var front

var scroll =0

func _ready():
	back = get_child(0)
	front = get_child(1)
	track = get_parent().get_child(0)
	
	back.motion_offset = Vector2(2,0)
	back.motion_scale = Vector2(2,0);
	front.motion_offset = Vector2(512,80)
	front.motion_scale = Vector2(1.2,0);

	pass

func _process(delta):
	
	scroll += track.linear_velocity.x / 200
	scroll_offset -= Vector2(scroll, 0)
	
	pass
