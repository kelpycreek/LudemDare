extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var target = null
var health

signal new_selection(obj)

func _ready():
	set_process(true)
	
func _process(delta):
	var pos = get_pos()
	if target == null:
		return
		
	var direction = (target - self.get_pos()).normalized()
	var speed = 800
	
	var motion = direction * speed * delta
	var new_pos = self.get_pos() + motion
	self.set_pos(new_pos)
	print(new_pos)
	print(target)
	if (self.get_pos() - target).length() < 2.5:
		target = null
		
		
func move(new_target):
	target = new_target
	
func _selected():
	emit_signal("new_selection", self)