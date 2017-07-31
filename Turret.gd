extends "res://Mech.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var portrait = "res://art/turret1.png"
var abilities = []


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	health = 10
	tu_max = 5
	._ready() # call parent class
	set_process(true)

func _process(delta):
	._process(delta)

func use_ability(ability_number, target):
	if typeof(target) == TYPE_STRING:
		return "invalid target"
	if ability_number == 1:
		shoot(target)
	elif ability_number == 2:
		burst_fire(target)
		
func shoot(target):
	if tu < 5:
		var message = "not enough tu!"
		print(message)
		return message
	var dist = self.get_pos().distance_to(target.get_pos())
	if dist > 800:
		var message = "out of range"
		print(message)
		return message
	target.hit(5)
	print(target.health)
	tu = tu - 5
	
func burst_fire(target):
	if tu < 7:
		var message = "not enough tu!"
		print(message)
		return message
	var dist = self.get_pos().distance_to(target.get_pos())
	if dist > 100:
		var message = "out of range"
		print(message)
		return message
	target.hit(10)
	print(target.health)
	tu = tu - 7
	
func get_ui_inf():
	var result = {'portrait': portrait, 'abilities':abilities, 'hp':health, 'tu': tu}
	return result
	
	
func _selected():
	._selected()
