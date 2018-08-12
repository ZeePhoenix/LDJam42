extends MarginContainer

onready var bar = $HBoxContainer/Bars/StomachBar/Gauge
onready var count = $HBoxContainer/Bars/StomachBar/Count/Number

func _ready():
	
	bar.max_value = $"../../Panda".full
	
	pass

func _process(delta):
	bar.value = $"../../Panda".stomach
	count.value = $"../../Panda".count
	
	pass
