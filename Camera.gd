extends Node2D


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func set_ui(object):
	set_portrait(object['portrait'])
	for ability in object['abilities']:
		set_ability(ability['index'], ability)
	set_hp(object['hp'])
	set_tu(object['tu'])

func set_ui_light(object):
	set_hp(object['hp'])
	set_tu(object['tu'])
	
func set_portrait(path):
	var area = get_node("ui/portrait")
	area.set_texture(load(path))
	
func set_ability(index, ability):
	var box = get_node("ui/abilities").get_children()[index]
	if ability != null:
		box.set_normal_texture(load(ability['texture']))
	else:
		box.set_normal_texture(null)

func select_button(index, value):
	var box = get_node("ui/abilities").get_children()[index]
	if value:
		box.set_modulate(Color(0.2,0.35,0.55, 1))
	else:
		box.set_modulate(Color(1,1,1,1))

func set_hp(hp):
	var box = get_node("ui/Health")
	box.set_bbcode("HP: " + str(hp))

func set_tu(tu):
	var box = get_node("ui/TU")
	box.set_bbcode("TU: " + str(tu))