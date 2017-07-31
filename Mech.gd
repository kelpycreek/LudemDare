extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var target = null
var health
var target_queue = []
var tu
var tu_max

signal new_selection(obj)

func _ready():
	set_process(true)
	target_queue = []
	tu = tu_max
	
func _process(delta):
	var pos = get_pos()
	if target == null:
		if target_queue.size() > 0:
			move(target_queue[0])
			target_queue.pop_front()
			return
		else:
			return
		
	var direction = (target - self.get_pos()).normalized()
	var speed = 80
	
	var motion = direction * speed * delta
	var new_pos = self.get_pos() + motion
	self.set_pos(new_pos)
	if (self.get_pos() - target).length() < 2.5:
		target = null

func move(new_target):
	if tu >= 1:
		target = new_target
		tu = tu - 1
	else:
		target = null
		print("out of tu!")

func turn_start():
	tu = tu_max
	
func hit(damage):
	health = health - damage


func move_path(path):
	target_queue = path

func alive():
	return health > 0

func _selected():
	emit_signal("new_selection", self)