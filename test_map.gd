extends Node2D


var grid
var mech1
var mech2
var turn # whose turn is it
var ai

func _ready():
	set_process_input(true)
	set_process(true)
	mech1 = get_node("Player/mech1")
	mech2 = get_node("AI/mech2")
	turn = 0
	ai = get_node("AI")
	grid = load("res://grid.gd").new(50)
	var collision_map = get_node("map/TileMap").get_used_cells()
	grid.load_collison_map(collision_map)
	

func _input(ev):
	if turn == 1:
		return # player cant take actions off turn
	if (ev.type==InputEvent.MOUSE_BUTTON):
		var square = grid.get_cell(ev.pos)
		if grid.is_okay(square):
			mech1.move(grid.get_coord(square))
	if (ev.type==InputEvent.KEY):
		mech1.attack("shoot", mech2)
		pass_turn()
		
func pass_turn():
	turn = 1
	ai.take_turn()
	turn = 0
	