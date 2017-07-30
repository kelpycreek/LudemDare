var valid_blocks
var block_size
var collision_map

func _init(size):
	block_size = size
	valid_blocks = []

func get_cell(vect): #get the cell coordinates from these real coordinates
	var x = vect.x / block_size
	x = floor(x)
	
	var y = vect.y / block_size
	y = ceil(y)
	
	return Vector2(x,y)

func get_coord(vect):
	#get real world coordinates of a cell
	var offset = .5 * block_size
	var x = vect.x * block_size
	x = x + offset
	
	var y = vect.y * block_size
	y = y - offset
	
	return Vector2(x,y)
	
func is_okay(cell):
	var result = cell in collision_map
	return result

func load_collison_map(map):
	collision_map = map
