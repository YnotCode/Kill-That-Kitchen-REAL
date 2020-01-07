extends Sprite

var pickedUp = false
var box = 0

var box1Node = 0
var box2Node = 0
var box3Node = 0

var moveprosess1x = [328,328,328,328,360,372]
var moveprosess1s = [0,0,0,2,5,9]
var moveprosess2x = [372,410,460,510,540,560]
var moveprosess2s = [9,11,12.5,14,14,14]
var moveprosess3x = [560,580,625,660,690,712]
var moveprosess3s = [14,10,9.5,9,9,9]
var moveprosess4x = [712,712,708,708,708,708]
var moveprosess4s = [9,2,0,0,0,0]

var inv;
var current;
var currentLeft;
var currentRight;

onready var player = get_node("../../../Player")

const y = 108;

func _ready():
	box = get_node("../../../Player").primary.find("knife")
	inv = get_node("../../../Player").primary

func _process(delta):
	#print(get_node("../inv1").frame)
	pickedUp = get_node("../../../knifeItem").pickedUp
	inv = get_node("../../../Player").primary
	
	current = inv[player.primarySelected]
	currentLeft = inv[player.primaryLeft]
	currentRight = inv[player.primaryRight]
	#box = get_node("../../../Player").primary.find("knife")
	if pickedUp:
		if get_node("../inv1").flip_h:
			
			if current == "knife":
				position.x = moveprosess2x[5 - get_node("../inv1").frame]
				scale.x = moveprosess2s[5 - get_node("../inv1").frame]
				scale.y = moveprosess2s[5 - get_node("../inv1").frame]
			elif currentLeft == "knife":
				position.x = moveprosess1x[5 - get_node("../inv1").frame]
				scale.x = moveprosess1s[5 - get_node("../inv1").frame]
				scale.y = moveprosess1s[5 - get_node("../inv1").frame]
			elif currentRight == "knife":
				position.x = moveprosess3x[5 - get_node("../inv1").frame]
				scale.x = moveprosess3s[5 - get_node("../inv1").frame]
				scale.y = moveprosess3s[5 - get_node("../inv1").frame]
		else:
			if current == "knife":
				position.x = moveprosess3x[get_node("../inv1").frame]
				scale.x = moveprosess3s[get_node("../inv1").frame]
				scale.y = moveprosess3s[get_node("../inv1").frame]
			elif currentLeft == "knife":
				position.x = moveprosess2x[get_node("../inv1").frame]
				scale.x = moveprosess2s[get_node("../inv1").frame]
				scale.y = moveprosess2s[get_node("../inv1").frame]
			elif currentRight == "knife":
				position.x = moveprosess4x[get_node("../inv1").frame]
				scale.x = moveprosess4s[get_node("../inv1").frame]
				scale.y = moveprosess4s[get_node("../inv1").frame]