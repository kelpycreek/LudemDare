extends "res://Mech.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var portrait = "res://art/tank1.png"
var abilities = [
			{"name":"move", "texture":"res://art/ability0.png"},
			{"name":"Punch", "texture":"res://art/ability1.png"},
			{"name":"Drill", "texture":"res://art/ability2.png"}
]


func _ready():
	health = 20
	tu_max = 12
	set_process(true)
	._ready() # call parent class

func _process(delta):
	._process(delta)

func use_ability(ability_number, target):
	if typeof(target) == TYPE_STRING:
		print( "invalid target")
		return "invalid target"
	if ability_number == 1:
		punch(target)
	elif ability_number == 2:
		drill(target)
		
func punch(target):
	if tu < 5:
		var message = "not enough tu!"
		print(message)
		return message
	var dist = self.get_pos().distance_to(target.get_pos())
	if dist > 100:
		var message = "out of range"
		print(message)
		return message
	target.hit(5)
	print(target.health)
	tu = tu - 5
	
func drill(target):
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
