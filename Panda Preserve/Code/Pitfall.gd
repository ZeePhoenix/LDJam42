extends Area2D

var panda
var area

func _ready():
	
	panda = get_parent().get_parent().get_child(0)
	
	pass

func _process(delta):
	
	if overlaps_body(panda):
		panda.kill()
	
	pass
