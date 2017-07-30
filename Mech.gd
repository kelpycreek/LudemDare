extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var target = null
var health

func _ready():
	set_process(true)
	
func _process(delta):
	var pos = get_pos()
	if target == null:
		return
		
	var direction = (target - self.get_pos()).normalized()
	var speed = 100
	
	var motion = direction * speed * delta
	var new_pos = self.get_pos() + motion
	self.set_pos(new_pos)
	
	if (self.get_pos() - target).length() < 2:
		target = null
		
		
func move(new_target):
	target = new_target