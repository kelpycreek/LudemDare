extends Node2D


func _ready():
	get_node("mbuttona").set_animation(str(globals.mecha))
	get_node("mbuttonb").set_animation(str(globals.mechb))
	get_node("mbuttonc").set_animation(str(globals.mechc))
	get_node("mechspritea").set_animation(str(globals.mecha))
	get_node("mechspriteb").set_animation(str(globals.mechb))
	get_node("mechspritec").set_animation(str(globals.mechc))



func _on_mecha_pressed():
	if(globals.mecha == 'a'):
		globals.mecha = 'b'
	elif(globals.mecha == 'b'):
		globals.mecha = 'n'
	elif(globals.mecha == 'n'):
		globals.mecha = 'a'
	get_node("mbuttona").set_animation(str(globals.mecha))
	get_node("mechspritea").set_animation(str(globals.mecha))
#	globals.mecha = globals.mecha + 1
#	if(globals.mecha == globals.mechb or globals.mecha == globals.mechc):
#		globals.mecha = globals.mecha + 1
#	if(globals.mecha == globals.mechb or globals.mecha == globals.mechc):
#		globals.mecha = globals.mecha + 1
#	if(globals.mecha > mechpool.size() - 1):
#		globals.mecha = 0
#	get_node("mechspritea").set_animation(str(mechpool[globals.mecha]))
#	get_node("mbuttona").set_animation(str(mechpool[globals.mecha]))


func _on_mechb_pressed():
	if(globals.mechb == 'a'):
		globals.mechb = 'b'
	elif(globals.mechb == 'b'):
		globals.mechb = 'n'
	elif(globals.mechb == 'n'):
		globals.mechb = 'a'
	get_node("mbuttonb").set_animation(str(globals.mechb))
	get_node("mechspriteb").set_animation(str(globals.mechb))
#	globals.mechb = globals.mechb + 1
#	if(globals.mechb == globals.mecha or globals.mechb == globals.mechc):
#		globals.mechb = globals.mechb + 1
#	if(globals.mechb == globals.mecha or globals.mechb == globals.mechc):
#		globals.mechb = globals.mechb + 1
#	if(globals.mechb > mechpool.size() - 1):
#		globals.mechb = 0
#	get_node("mechspriteb").set_animation(str(mechpool[globals.mechb]))
#	get_node("mbuttonb").set_animation(str(mechpool[globals.mechb]))


func _on_mechc_pressed():
	if(globals.mechc == 'a'):
		globals.mechc = 'b'
	elif(globals.mechc == 'b'):
		globals.mechc = 'n'
	elif(globals.mechc == 'n'):
		globals.mechc = 'a'
	get_node("mbuttonc").set_animation(str(globals.mechc))
	get_node("mechspritec").set_animation(str(globals.mechc))
#	globals.mechc = globals.mechc + 1
#	if(globals.mechc == globals.mecha or globals.mechc == globals.mechb):
#		globals.mechc = globals.mechc + 1
#	if(globals.mechc == globals.mecha or globals.mechc == globals.mechb):
#		globals.mechc = globals.mechc + 1
#	if(globals.mechc > mechpool.size() - 1):
#		globals.mechc = 0
#	get_node("mechspritec").set_animation(str(mechpool[globals.mechc]))
#	get_node("mbuttonc").set_animation(str(mechpool[globals.mechc]))


func _on_back_pressed():
	get_tree().change_scene("res://overmap1.tscn")
