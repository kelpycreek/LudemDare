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
	# Called every time the node is added to the scene.
	# Initialization here
	._ready() # call parent class
	health = 10
	tu = 12
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
	target.health = target.health - 5
	print(target.health)
	tu = tu - 5
	
func burst_fire(target):
	if tu < 7:
		var message = "not enough tu!"
		print(message)
		return message
	target.health = target.health - 10
	print(target.health)
	tu = tu - 7
	
	
func _selected():
	._selected()
