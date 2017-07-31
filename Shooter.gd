extends "res://Mech.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var portrait = "res://art/shooter1.png"
var abilities = [
			{"name":"move", "texture":"res://art/ability0.png"},
			{"name":"Shoot", "texture":"res://art/ability4.png"},
			{"name":"Burst Fire", "texture":"res://art/ability3.png"}
]


func _ready():
	health = 10
	tu_max = 10
	set_process(true)
	._ready() # call parent class

func _process(delta):
	._process(delta)

func use_ability(ability_number, target):
	if typeof(target) == TYPE_STRING:
		print( "invalid target")
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
	if dist > 650:
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
	if dist > 650:
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
