extends Camera2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_process(true)
	pass


func _process(delta):
	var mousepos = get_viewport().get_mouse_pos()
	var camposx = get_pos().x
	var camposy = get_pos().y
	#print(camposx, camposy)
	
	
	#if(mousepos.x < 100 and mousepos.y < 900 and camposx < 700):
	#	set_pos(get_pos() + Vector2(-150,0) * delta)
	#	
	#elif(mousepos.x > 1400 and mousepos.y < 900 and camposx > 900):
	#	set_pos(get_pos() + Vector2(150,0) * delta)
	#
	#if(mousepos.y < 100 and mousepos.y < 900 and camposx > 500):
	#	set_pos(get_pos() + Vector2(0,-150) * delta)
	#	
	#elif(mousepos.y > 1400 and mousepos.y < 900 and camposx < 700):
	#	set_pos(get_pos() + Vector2(0,150) * delta)