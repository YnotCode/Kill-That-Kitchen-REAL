extends AnimatedSprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
var pickedUp = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
var playerHasKnife = false
func _process(delta):
	playerHasKnife = get_node("../Player").get("knifePickedUp")
	var bodies = $StaticBody2D.get_overlapping_areas()
	#print(bodies)
	for body in bodies:
		if body.name == "knifeArea" and Input.is_action_just_pressed("attack_1") and playerHasKnife:
			self.play("death")
	if pickedUp:
		hide()
	else:
		show()