extends Node2D

var bamboo
var panda

var timer = 20
var curTime = 0

var maxHeight = 8
var curHeight = 0

var x
var y
var area

func _ready():
	bamboo = load("res://Scene/bambooSection.tscn")
	panda = get_parent().get_parent().get_child(0)
	x = global_position.x
	y = global_position.y
	area = get_child(0).get_child(0)
	
	maxHeight = int(rand_range(6,12))
	timer = int(rand_range(15,40))
	
	pass

func _process(delta):
	curTime += 1
	
	if curTime >= timer && curHeight <= maxHeight:
		if rand_range(1,10) < 2:
			add_child(bamboo.instance())
			curHeight += 1
			var b = get_child(curHeight)
			b.move_local_y((-1 * ((curHeight + 1) * 64)) + 64)
			curTime = 0
	
	#Check for collision??
	#print(area.get_overlapping_bodies())
	if (area.overlaps_body(panda)):
		if panda.eatBamboo():
			if curHeight == 0:
				queue_free()
			if curHeight > 0:
				curHeight -= 1
				curTime = 0
				var n = get_child_count()
				var c = get_child(n - 1)
				c.queue_free()
	
	pass
