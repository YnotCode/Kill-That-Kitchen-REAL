extends Position2D

var grid_size = Vector2()
var grid_position = Vector2()
onready var parent = get_parent()
# Called when the node enters the scene tree for the first time.
func _ready():
	grid_size = OS.get_screen_size()
	update_grid_position()
	
func _physics_process(delta):
	update_grid_position()
	set_as_toplevel(true)
	
func update_grid_position():
	var currentX = round(parent.position.x/grid_size.x)
	var currentY = round(parent.position.y/grid_size.y)
	var new_pos = Vector2(currentX, currentY)
	if grid_position == new_pos:
		pass
	else:
		grid_position = new_pos
		position = grid_position + grid_size
