extends KinematicBody2D

const UP = Vector2(0, -1)
var motion = Vector2()
var GRAVITY = 50
var velocity = 100
const JUMP = -800
var sideFacing = "right"
var inAir = false
var knifing = false
var moving = false
const knifeFrames = 64
var knifeDelayCount = knifeFrames
var hasKnife = false;
var touchingKnife = false;
var pickedUp = false;

#onready var isKnifeHiddden = get_node("knifeItem").is_visible()
func _ready():
    #snap the window into fullscreen
	OS.window_fullscreen = true
	#pass
func _physics_process(delta):
	print (get_node("knifeItem"))
	motion.y += GRAVITY;
	
	if (Input.is_action_just_pressed("camera")):
		$Camera2D.current = true
		$Camera2D.current = false
			
		
	if (Input.is_action_just_pressed("ui_right")) || (Input.is_action_just_pressed("alt_right")):
		motion.x = velocity
	
	if Input.is_action_just_pressed("ui_left") || (Input.is_action_just_pressed("alt_left")):
		motion.x = 0 - velocity
	if Input.is_action_pressed("ui_right") || (Input.is_action_just_pressed("alt_left")):
		if not motion.x >= 460:
			motion.x += 60
		$Sprite.flip_h = true;
	elif Input.is_action_pressed("ui_left") || (Input.is_action_just_pressed("alt_left")):
		if not motion.x <= -460:
			motion.x += -60
		$Sprite.flip_h = false
	elif (not inAir) && (not knifing):

		motion.x = 0
	else:
		motion.x = 0
		
	if is_on_floor():	
		inAir = false;
		
		if Input.is_action_just_pressed("ui_up") || (Input.is_action_just_pressed("alt_up")):
			inAir = true
			motion.y = JUMP
			
	#execuate the move				
	motion = move_and_slide(motion, UP)
	
	if Input.is_action_pressed("ui_right") || Input.is_action_pressed("ui_left"):
		moving = true
	else:
		moving = false
		
	if (Input.is_action_just_pressed("attack_1")) && (knifeDelayCount == knifeFrames) && pickedUp:
		knifing = true
	elif knifeDelayCount < 0:		
		knifing = false
		knifeDelayCount = knifeFrames
	
	if knifing && hasKnife:
		$Sprite.play("knifeAttackRight")
		#indicate that a knife animation frame has passed
		knifeDelayCount -= 1
	elif inAir:
		$Sprite.play("Jump")
	elif moving:
		$Sprite.play("run")
	else: 
		$Sprite.play("idle")