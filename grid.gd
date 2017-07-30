var valid_blocks
var block_size
var collision_map
var objects

func _init(size):
	block_size = size
	valid_blocks = []
	objects = []

func get_cell(vect): #get the cell coordinates from these real coordinates
	var x = vect.x / block_size
	x = floor(x)
	
	var y = vect.y / block_size
	y = ceil(y)
	
	var position = Vector2(x,y)
	var object = get_object(position)
	return Vector2(x,y)

func get_coord(vect):
	#get real world coordinates of a cell
	var offset = .5 * block_size
	var x = vect.x * block_size
	x = x + offset
	
	var y = vect.y * block_size
	y = y - offset
	
	return Vector2(x,y)
	
func get_object(cell):
	for object in objects:
		if object["cell"] == cell:
			return object["object"]
	if cell in collision_map:
		return "floor"
	return "wall"

func add_object(cell, object):
	objects.append({"cell":cell, "object":object})
	
func move_object(start, end):
	for object in objects:
		if object['cell'] == start:
			object['cell'] = end
			return

func load_collison_map(map):
	collision_map = map
