extends "res://Mech.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var portrait = "res://art/shooter1.png"
var abilities = [
			{"name":"move", "texture":"res://art/ability0.png"}
]


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	._ready() # call parent class
	health = 10

func attack(name, target):
	if name == "shoot":
		target.health = target.health - 5
		print(target.health)

func _selected():
	._selected()
