extends KinematicBody2D

const UP = Vector2(0, -1)
var motion = Vector2()
var GRAVITY = 50
var velocity = 100
const JUMP = -800
var inAir = false

func _ready():
    #snap the window into fullscreen
	OS.window_fullscreen = true

func _physics_process(delta):
	if not inAir:
		motion.y += GRAVITY/2
	else:
		motion.y += GRAVITY
	
	if (Input.is_action_just_pressed("ui_right")) || (Input.is_action_just_pressed("alt_right")):
		motion.x = velocity
	if Input.is_action_just_pressed("ui_left") || (Input.is_action_just_pressed("alt_left")):
		motion.x = 0 - velocity

	if Input.is_action_pressed("ui_right") || (Input.is_action_just_pressed("alt_left")):
		if not motion.x >= 460:
			motion.x += 60

		
	elif Input.is_action_pressed("ui_left") || (Input.is_action_just_pressed("alt_left")):
		if not motion.x <= -460:
			motion.x += -60
		
	else:
		motion.x = 0
			
	#deal with the case where we fall off of an object
	#if (motion.y > 0 && inAir == false):
		#motion.y -= gravity
		
	if is_on_floor():	
		inAir = false;
		
		if Input.is_action_just_pressed("ui_up") || (Input.is_action_just_pressed("alt_up")):
			inAir = true;
			motion.y = JUMP
		
	move_and_slide(motion, UP)	