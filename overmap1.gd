extends Node2D
var canmove = true

func _ready():
	get_node("UI/launcher").show()
	if(globals.currentnode == 1):
		get_node("UI/launcher").hide()
		get_node("bg/reticle").set_pos(get_node("bg/node1").get_pos())
	if(globals.currentnode == 2):
		get_node("bg/reticle").set_pos(get_node("bg/node2").get_pos())
	if(globals.currentnode == 3):
		get_node("bg/reticle").set_pos(get_node("bg/node3").get_pos())
	if(globals.currentnode == 4):
		get_node("bg/reticle").set_pos(get_node("bg/node4").get_pos())
	if(globals.currentnode == 5):
		get_node("bg/reticle").set_pos(get_node("bg/node5").get_pos())
	if(globals.currentnode == 6):
		get_node("bg/reticle").set_pos(get_node("bg/node6").get_pos())
	if(globals.currentnode == 7):
		get_node("bg/reticle").set_pos(get_node("bg/node7").get_pos())
	if(globals.currentnode == 8):
		get_node("bg/reticle").set_pos(get_node("bg/node8").get_pos())
	if(globals.currentnode == 9):
		get_node("bg/reticle").set_pos(get_node("bg/node8").get_pos())
		get_node("UI/launcher").hide()
	launcherswitch()
	hidenodes()
	canmove = true

func launcherswitch():
	if(globals.currentnode == 1 and globals.node1dead == true):
		get_node("UI/launcher").hide()
	if(globals.currentnode == 2 and globals.node2dead == true):
		get_node("UI/launcher").hide()
	if(globals.currentnode == 3 and globals.node3dead == true):
		get_node("UI/launcher").hide()
	if(globals.currentnode == 4 and globals.node4dead == true):
		get_node("UI/launcher").hide()
	if(globals.currentnode == 5 and globals.node5dead == true):
		get_node("UI/launcher").hide()
	if(globals.currentnode == 6 and globals.node6dead == true):
		get_node("UI/launcher").hide()
	if(globals.currentnode == 7 and globals.node7dead == true):
		get_node("UI/launcher").hide()
	if(globals.currentnode == 8 and globals.node8dead == true):
		get_node("UI/launcher").hide()


func killnodes():
	if(globals.currentnode == 1):
		globals.node1dead = true
	if(globals.currentnode == 2):
		globals.node2dead = true
	if(globals.currentnode == 3):
		globals.node3dead = true
	if(globals.currentnode == 4):
		globals.node4dead = true
	if(globals.currentnode == 5):
		globals.node5dead = true
	if(globals.currentnode == 6):
		globals.node6dead = true
	if(globals.currentnode == 7):
		globals.node7dead = true
	if(globals.currentnode == 8):
		globals.node8dead = true
	if(globals.currentnode == 9):
		globals.node8dead = true

func hidenodes():
	if(globals.node1dead == true):
		get_node("bg/node1").hide()
	if(globals.node2dead == true):
		get_node("bg/node2").hide()
	if(globals.node3dead == true):
		get_node("bg/node3").hide()
	if(globals.node4dead == true):
		get_node("bg/node4").hide()
	if(globals.node5dead == true):
		get_node("bg/node5").hide()
	if(globals.node6dead == true):
		get_node("bg/node6").hide()
	if(globals.node7dead == true):
		get_node("bg/node7").hide()
	if(globals.node8dead == true):
		get_node("bg/node8").hide()

func _on_hbutton_pressed():
	get_tree().change_scene("res://hangar.tscn")

func _on_node1_pressed():
	if(canmove == true and globals.currentnode == 2):
		get_node("bg/reticle").set_pos(get_node("bg/node1").get_pos())
		killnodes()
		hidenodes()
		globals.currentnode = 1
		get_node("UI/launcher").hide()
		if(globals.node1dead == false):
			get_node("UI/launcher").show()


func _on_node7_pressed():
	if(canmove == true and globals.currentnode == 2 or globals.currentnode == 3 or globals.currentnode == 4 or globals.currentnode == 5 or globals.currentnode == 6):
		get_node("bg/reticle").set_pos(get_node("bg/node7").get_pos())
		killnodes()
		hidenodes()
		globals.currentnode = 7
		get_node("UI/launcher").hide()
		if(globals.node7dead == false):
			get_node("UI/launcher").show()

func _on_node3_pressed():
	if(canmove == true and globals.currentnode == 2 or globals.currentnode == 7):
		get_node("bg/reticle").set_pos(get_node("bg/node3").get_pos())
		killnodes()
		hidenodes()
		globals.currentnode = 3
		get_node("UI/launcher").hide()
		if(globals.node3dead == false):
			get_node("UI/launcher").show()

func _on_node4_pressed():
	if(canmove == true and globals.currentnode == 2 or globals.currentnode == 7 or globals.currentnode == 5):
		get_node("bg/reticle").set_pos(get_node("bg/node4").get_pos())
		killnodes()
		hidenodes()
		globals.currentnode = 4
		get_node("UI/launcher").hide()
		if(globals.node4dead == false):
			get_node("UI/launcher").show()

func _on_node5_pressed():
	if(canmove == true and globals.currentnode == 4 or globals.currentnode == 7 or globals.currentnode == 8):
		get_node("bg/reticle").set_pos(get_node("bg/node5").get_pos())
		killnodes()
		hidenodes()
		globals.currentnode = 5
		get_node("UI/launcher").hide()
		if(globals.node5dead == false):
			get_node("UI/launcher").show()

func _on_node6_pressed():
	if(canmove == true and globals.currentnode == 7 or globals.currentnode == 8 ):
		get_node("bg/reticle").set_pos(get_node("bg/node6").get_pos())
		killnodes()
		hidenodes()
		globals.currentnode = 6
		get_node("UI/launcher").hide()
		if(globals.node6dead == false):
			get_node("UI/launcher").show()

func _on_node8_pressed():
	if(canmove == true and globals.currentnode == 5 or globals.currentnode == 6 ):
		get_node("bg/reticle").set_pos(get_node("bg/node8").get_pos())
		killnodes()
		hidenodes()
		globals.currentnode = 8
		get_node("UI/launcher").hide()
		if(globals.node8dead == false):
			get_node("UI/launcher").show()

func _on_node2_pressed():
	if(canmove == true and globals.currentnode == 1 or globals.currentnode == 4 or globals.currentnode == 7 or globals.currentnode == 3):
		get_node("bg/reticle").set_pos(get_node("bg/node2").get_pos())
		killnodes()
		hidenodes()
		globals.currentnode = 2
		get_node("UI/launcher").hide()
		if(globals.node2dead == false):
			get_node("UI/launcher").show()

func _on_star1_pressed():
	if(canmove == true and globals.currentnode == 8 or globals.currentnode == 6):
		get_node("bg/reticle").set_pos(get_node("bg/star1").get_pos())
		get_tree().change_scene("res://win.tscn")
	#	killnodes()
	#	hidenodes()
		globals.currentnode = 9


func _on_launcher_pressed():
	if(globals.currentnode == 1 and globals.node1dead == false):
		globals.node1dead = true
		get_tree().change_scene("res://hangar.tscn")
	if(globals.currentnode == 2 and globals.node2dead == false):
		globals.node2dead = true
		get_tree().change_scene("res://combat8.tscn")
	if(globals.currentnode == 3 and globals.node3dead == false):
		globals.node3dead = true
		get_tree().change_scene("res://combat7.tscn")
	if(globals.currentnode == 4 and globals.node4dead == false):
		globals.node4dead = true
		get_tree().change_scene("res://combat6.tscn")
	if(globals.currentnode == 5 and globals.node5dead == false):
		globals.node5dead = true
		get_tree().change_scene("res://combat5.tscn")
	if(globals.currentnode == 6 and globals.node6dead == false):
		globals.node6dead = true
		get_tree().change_scene("res://combat4.tscn")
	if(globals.currentnode == 7 and globals.node7dead == false):
		globals.node7dead = true
		get_tree().change_scene("res://combat3.tscn")
	if(globals.currentnode == 8 and globals.node8dead == false):
		globals.node8dead = true
		get_tree().change_scene("res://combat2.tscn")
	if(globals.currentnode == 9):
		get_tree().change_scene("res://win.tscn")