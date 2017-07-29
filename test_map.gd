extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var grid
var mech1

func _ready():
	set_process_input(true)

	
func _input(ev):
	# Mouse in viewport coordinates

	if (ev.type==InputEvent.MOUSE_BUTTON):
		get_node("mech1").move(ev.pos)