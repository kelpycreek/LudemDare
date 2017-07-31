extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var units
var player

func _ready():
	set_process(true)
	player = get_node("../Player")

func take_turn():
	for unit in get_children():
		if unit.alive():
			unit.turn_start()
			unit.use_ability(1, get_target(unit))
	
func get_target(unit):
	var current_target = null
	var min_dist = 9999999999999
	for enemy in player.get_children():
		if enemy.alive():
			var dist = enemy.get_pos() - unit.get_pos()
			dist = dist.length()
			if dist < min_dist:
				min_dist = dist
				current_target = enemy
	return current_target