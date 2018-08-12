extends MarginContainer

onready var bar = $HBoxContainer/Bars/StomachBar/Gauge
onready var count = $HBoxContainer/Bars/StomachBar/Count/Number

onready var dist = $HBoxContainer/HSplitContainer/Distance

func _ready():
	
	bar.max_value = $"../../Panda".full
	
	pass

func _process(delta):
	bar.value = $"../../Panda".stomach
	count.text = str($"../../Panda".stomach)
	dist.text = str($"../../Panda".dist)
	pass
