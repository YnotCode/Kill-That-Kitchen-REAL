extends AnimatedSprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
var shown = false
var mode = 0
func _process(delta):
	if Input.is_action_just_released("menu"):
		print(shown)
		shown = !shown
		print(shown)
	if shown:
		print("here")
		visible = true
	else:
		visible = false
		
	if Input.is_action_just_released("navigate") && shown:
		mode += 1
		if mode == 4:
			mode = 1
		
	if mode == 0:
		play("default")
	elif mode == 1:
		play("options")
	elif mode == 2:
		play("resume")
	elif mode == 3:
		play("exit")
		
	if Input.is_action_just_released("ui_accept") && shown:
		if mode == 0:
			#do nothing
			play("default")
		elif mode == 1:
			#show the options menu
			play("options")
		elif mode == 2:
			#return to game
			shown = false
		elif mode == 3:
			get_tree().quit()