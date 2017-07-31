extends Node2D

#map specific config
var start = [Vector2(0,4), Vector2(0,5), Vector2(0,6)]

#regular variables
var grid
var player_mechs
var turn # whose turn is it
var ai
var ui
var selected_unit
var ability_callback
var player


func _ready():
	set_process_input(true)
	set_process(true)
	turn = 0
	grid = load("res://grid.gd").new(80)
	var collision_map = get_node("map/TileMap").get_used_cells()
	grid.load_collison_map(collision_map)
	ui = get_node("Camera")

	get_node("map/TileMap").set_opacity(0)
	
	#set up players team
	player = get_node("Player")
	player.add_mech(globals.mecha, grid.get_coord(start[0]))
	player.add_mech(globals.mechb, grid.get_coord(start[1]))
	player.add_mech(globals.mechc, grid.get_coord(start[2]))
	player_mechs = player.get_mechs()
	for mech in player_mechs:
		grid.add_object(grid.get_cell(mech.get_pos()), mech)
		mech.connect("new_selection", self, "_new_selection")

	#set up AI team
	ai = get_node("AI")
	var turrets = ai.get_children()
	for turret in turrets:
		grid.add_object(grid.get_cell(turret.get_pos()), turret)
	
func _process(delta):
	if selected_unit:
		ui.set_ui_light(selected_unit.get_ui_inf())
	

func _input(ev):
	if turn == 1:
		return # player cant take actions off turn
	if (ev.type==InputEvent.MOUSE_BUTTON and ability_callback  != null):
		var square = grid.get_cell(ev.pos)
		if ability_callback == 0:
			movement(selected_unit, square)
		else:
			selected_unit.use_ability(ability_callback, grid.get_object(square))
		ui.select_button(ability_callback, false)
		ability_callback = null
		
		
func pass_turn():
	turn = 1
	ai.take_turn()
	turn = 0

func movement(mech, target):
	if grid.get_object(target) != "floor":
		return "invalid target"
	var path = grid.get_path(grid.get_cell(selected_unit.get_pos()), target)
	var coord_path = []
	for node in path:
		coord_path.append(grid.get_coord(node))
	grid.move_object(grid.get_cell(selected_unit.get_pos()), target)
	coord_path.invert()
	mech.move_path(coord_path)

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


func _on_EndTurn_pressed():
	pass_turn()


func _on_Flee_pressed():
	pass # Needs to return to overmap
