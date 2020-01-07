extends Control

var shown = false
var currentSet = 1

var turnRight = false
var turnLeft = false

func _ready():
	$inv1.hide()
	$inv2.hide()
	$inv3.hide()
	$inv1.stop()
	$inv2.stop()
	$inv3.stop()
	#$inv1.get_child(0).hide()
	$inv2.get_child(0).hide()
	$inv3.get_child(0).hide()

func _process(delta):
	#IMPROVE THIS LINE! MANY POENTIAL BUGS!
	#IMPROVE THIS LINE! MANY POENTIAL BUGS!
	#IMPROVE THIS LINE! MANY POENTIAL BUGS!
	#IMPROVE THIS LINE! MANY POENTIAL BUGS!
	#IMPROVE THIS LINE! MANY POENTIAL BUGS!
	#IMPROVE THIS LINE! MANY POENTIAL BUGS!
	#IMPROVE THIS LINE! MANY POENTIAL BUGS!
	#IMPROVE THIS LINE! MANY POENTIAL BUGS!
	if Input.is_action_just_pressed("inv") && get_node("../menu").shown == false:
		shown = !shown
		
	if Input.is_action_just_pressed("menu"):
		shown = false
		
	if Input.is_action_just_pressed("ui_down") && shown:
		currentSet += 1
		if currentSet > 3:
			currentSet = 1
	elif Input.is_action_just_pressed("ui_up") && shown:
		currentSet -= 1
		if currentSet < 1:
			currentSet = 3
			
	if Input.is_action_just_pressed("ui_right") && shown:
		turnRight = true
		if currentSet == 1:
			$inv1.flip_h = false
			$inv1.play("play")
		elif currentSet == 2:
			$inv2.flip_h = false
			$inv2.play("play")
		elif currentSet == 3:
			$inv3.flip_h = false
			$inv3.play("play")
	elif Input.is_action_just_pressed("ui_left") && shown:
		turnLeft = true
		if currentSet == 1:
			$inv1.flip_h = true
			$inv1.play("play")
		elif currentSet == 2:
			$inv2.flip_h = true
			$inv2.play("play")
		elif currentSet == 3:
			$inv3.flip_h = true
			$inv3.play("play")	 
	
	if shown:
		$inv1.show()
		$inv2.show()
		$inv3.show()
		if currentSet == 1:
			$inv1.get_child(0).show()
			$inv2.get_child(0).hide()
			$inv3.get_child(0).hide()
		elif currentSet == 2:
			$inv1.get_child(0).hide()
			$inv2.get_child(0).show()
			$inv3.get_child(0).hide()
		elif currentSet == 3:
			$inv1.get_child(0).hide()
			$inv2.get_child(0).hide()
			$inv3.get_child(0).show()
	elif !shown:
		$inv1.hide()
		$inv2.hide()
		$inv3.hide()
		
	if $inv1.frame == 4:
		$inv1.stop()
		$inv1.frame = 0
		get_node("../../Player")._rotatePrimary()
	elif $inv2.frame == 4:
		$inv2.stop()
		$inv2.frame = 0
	elif $inv3.frame == 4:
		$inv3.stop()
		$inv3.frame = 0