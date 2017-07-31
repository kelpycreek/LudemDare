extends Node2D

var shooter = preload("res://shooter.tscn")
var tank = preload("res://tank.tscn")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func add_mech(type, start):
	var new_mech
	if type == "n":
		return
	elif type == "a": #gunner
		new_mech = shooter.instance()
	elif type == "b":
		new_mech = tank.instance()
	add_child(new_mech)
	new_mech.set_pos(start)
	return new_mech
	
func get_mechs():
	return get_children()