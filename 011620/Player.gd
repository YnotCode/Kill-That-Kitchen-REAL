extends KinematicBody2D

const UP = Vector2(0, -1)
var motion = Vector2()
var GRAVITY = 50
const velocity = 100
const JUMP = -800
var sideFacing = "right"
var inAir = false
var knifing = false
var moving = false
const knifeFrames = 64
var knifeDelayCount = knifeFrames
var touchingKnife = false;

var knifePickedUp = false;
var fishingrodPickedUp = false;

var menuOpen = false;

var primary = ["", "", ""];
var primarySelected = 0;
var primaryRight = 1;
var primaryLeft = 2;


var secondary = [];
var secondarySelected = 0;
var util = [];
var utilSection = 0;

var fishingroding = false;

func _ready():
    #snap the window into fullscreen
	OS.window_fullscreen = true
	#pass
	
func _rotatePrimary():
	#rotate the inventory wheels
	
	#backward
	if get_node("../ui/inventory/inv1").flip_h:
		primarySelected+=1
		primaryRight+=1
		primaryLeft+=1
	#forward
	else:
		primarySelected-=1
		primaryRight-=1
		primaryLeft-=1
	if primarySelected == -1:
		primarySelected= primary.size()-1
	elif primarySelected == primary.size():
		primarySelected= 0
	if primaryLeft == -1:
		primaryLeft= primary.size()-1
	elif primaryLeft == primary.size():
		primaryLeft= 0
	if primaryRight == -1:
		primaryRight= primary.size()-1
	elif primaryRight == primary.size():
		primaryRight= 0
	
	print(String(primaryRight) +","+String(primarySelected))
func _physics_process(delta):
	
	var bodies = $knifeArea.get_overlapping_bodies()

	if Input.is_action_just_released("menu") || Input.is_action_just_pressed("inv"):
		menuOpen = !menuOpen

	if !menuOpen:
		if !get_parent().get_node("knifeItem").visible && !knifePickedUp:
			knifePickedUp = true
			if primary[0] == "":
				primary[0] = "knife"
			elif primary[1] == "":
				primary[1] = "knife"
			elif primary[2] == "":
				primary[2] = "knife"
			else:
				primary.push_back("knife")
		elif !get_parent().get_node("fishingrodItem").visible && !fishingrodPickedUp:
			fishingrodPickedUp = true		
			if primary[0] == "":
				primary[0] = "fishingrodItem"
			elif primary[1] == "":
				primary[1] = "fishingrodItem"
			elif primary[2] == "":
				primary[2] = "fishingrodItem"
			else:
				primary.push_back("fishingrodItem")

		motion.y += GRAVITY

		if (Input.is_action_just_pressed("ui_right") || Input.is_action_just_pressed("alt_right")):
			motion.x = velocity
		if Input.is_action_just_pressed("ui_left") || (Input.is_action_just_pressed("alt_left")):
			motion.x = 0 - velocity

		if Input.is_action_pressed("ui_right") || (Input.is_action_just_pressed("alt_left")):
			if not motion.x >= 460:
				motion.x += 30
			$Sprite.flip_h = true;
		elif Input.is_action_pressed("ui_left") || (Input.is_action_just_pressed("alt_left")):
			if not motion.x <= -460:
				motion.x += -30
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

		if Input.is_action_just_pressed("attack_1"):
			if (knifeDelayCount == knifeFrames) && knifePickedUp && (primary[primarySelected] == "knife"):
				knifing = true
			elif primarySelected == "fishingrod":
				fishingroding = true
		
		if knifeDelayCount < 0 && (primary[primarySelected] == "knife"):
			knifing = false
			knifeDelayCount = knifeFrames
				
		if knifing && knifePickedUp:
			$Sprite.play("knifeAttackRight")
			knifeDelayCount -= 1
		elif inAir:
			$Sprite.play("Jump")
		elif moving:
			$Sprite.play("run")
		else:
			$Sprite.play("idle")