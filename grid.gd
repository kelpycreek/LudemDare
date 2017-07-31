var block_size
var collision_map
var objects

func _init(size):
	block_size = size
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
			objects.remove(object)
			return

func load_collison_map(map):
	collision_map = map
	print(map.size())

func get_path(from, to, current=[]):
	var x1 = Vector2(1,0)
	var y1 = Vector2(0,1)
	var adjacent = [from + y1, from+x1, from-y1,from-x1] #up left down right
	var valid = []
	for square in adjacent:
		var object = get_object(square)
		if typeof(object) == TYPE_STRING and object == "floor" and not square in current:
			valid.append(square)
	var selection = null
	var min_dist = 9999999999
	for square in valid:
		var dist = (to - square).length()
		if dist < min_dist:
			min_dist = dist
			selection = square
	if valid.size() == 0:
		return []
	if min_dist == 0:
		return [selection]
	else:
		var temp = current
		temp.append(selection)
		var result = get_path(selection, to, temp)
		result.append(selection)
		print(result)
		return result
		
