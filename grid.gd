class Grid:
	var valid_blocks
	var block_size
	func _init(size):
		self.block_size = size
		self.valid_blocks = []
	
	func get_cell(vect): #get the cell coordinates from these real coordinates
		x = vect.x / self.block_size
		x = floor(x)
		
		y = vect.y / self.block_size
		y = ceil(y)
		
		return Vector2(x,y)
	
	func get_coord(vect):
		#get real world coordinates of a cell
		offset = .5 * self.block_size
		x = vect.x * self.block_size
		x = x + offset
		
		y = vect.y * self.block_size
		y = y - offset
		
		return Vector2(x,y)