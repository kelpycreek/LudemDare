extends Node2D


var grid
var mech1
var mech2
var turn # whose turn is it
var ai
var ui
var selected_unit
var ability_callback

func _ready():
	set_process_input(true)
	set_process(true)
	turn = 0
	ai = get_node("AI")
	grid = load("res://grid.gd").new(80)
	var collision_map = get_node("map/TileMap").get_used_cells()
	grid.load_collison_map(collision_map)
	ui = get_node("Camera")

	get_node("map/TileMap").set_opacity(0)
	
	#set up players team
	mech1 = get_node("Player/mech1")
	mech1.connect("new_selection", self, "_new_selection")
	
	#set up AI team
	mech2 = get_node("AI/mech2")
	grid.add_object(grid.get_cell(mech2.get_pos()), mech2)
	

func _input(ev):
	if turn == 1:
		return # player cant take actions off turn
	if (ev.type==InputEvent.MOUSE_BUTTON and ability_callback  != null):
		var square = grid.get_cell(ev.pos)
		if ability_callback == 0:
			selected_unit.move(grid.get_coord(square))
		else:
			selected_unit.use_ability(ability_callback, grid.get_object(square))
		ui.select_button(ability_callback, false)
		ability_callback = null
		
		
func pass_turn():
	turn = 1
	ai.take_turn()
	turn = 0

func refresh_ui():
	var ui = get_node("Camera")
	var abilities = selected_unit.abilities
	var i = [0,1,2,3]
	for button in i:
		if button < abilities.size():
			ui.set_ability(button, abilities[button])
		else:
			ui.set_ability(button, null)
	ui.set_portrait(selected_unit.portrait)


func _new_selection(object):
	selected_unit = object
	refresh_ui()

func ability_used(index):
	get_node("Camera").select_button(index, true)
	ability_callback = index

func _on_ability1_pressed():
	ability_used(0)


func _on_ability2_pressed():
	ability_used(1)

func _on_ability3_pressed():
	ability_used(2)

func _on_ability4_pressed():
	ability_used(3)
