extends Sprite

# Declare member variables here. Examples:
# var a = 2
var pickedUp = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var bodies = $Area2D.get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player" and Input.is_action_pressed("Interact"):
			pickedUp = true
	if pickedUp:
		hide()
	else:
		show()
