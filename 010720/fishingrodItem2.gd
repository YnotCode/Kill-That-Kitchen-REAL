extends Sprite

var pickedUp = false
var box = 0

var box1Node = 0
var box2Node = 0
var box3Node = 0

var moveprosess1x = [328,328,328,328,360]
var moveprosess1s = [0,0,0,2,5]
var moveprosess2x = [372,410,460,510,540]
var moveprosess2s = [9,11,12.5,14,14]
var moveprosess3x = [560,580,625,660,690]
var moveprosess3s = [14,10,9.5,9,9]
var moveprosess4x = [712,712,708,708,708]
var moveprosess4s = [9,2,0,0,0]

var inv;
var current;
var currentLeft;
var currentRight;

const y = 108;

func _ready():
	box = get_node("../../../Player").primary.find("fishingrod")
	inv = get_node("../../../Player").primary

func _process(delta):
	#print(get_node("../inv1").frame)
	pickedUp = get_node("../../../fishingrodItem").pickedUp
	current = get_node("../../../Player").primarySelected
	currentLeft = get_node("../../../Player").leftPrimarySelected
	currentRight = get_node("../../../Player").rightPrimarySelected
	#box = get_node("../../../Player").primary.find("fishingrod")
	if pickedUp:
		#print("fishingrod pickedup")
		if get_node("../inv1").flip_h:
			#print("to the left")
			if current == "fishingrod":
				position.x = moveprosess2x[4 - get_node("../inv1").frame]
				scale.x = moveprosess2s[4 - get_node("../inv1").frame]
				scale.y = moveprosess2s[4 - get_node("../inv1").frame]
			elif currentLeft == "fishingrod":
				position.x = moveprosess1x[4 - get_node("../inv1").frame]
				scale.x = moveprosess1s[4 - get_node("../inv1").frame]
				scale.y = moveprosess1s[4 - get_node("../inv1").frame]
			elif currentRight == "fishingrod":
				position.x = moveprosess3x[4 - get_node("../inv1").frame]
				scale.x = moveprosess3s[4 - get_node("../inv1").frame]
				scale.y = moveprosess3s[4 - get_node("../inv1").frame]
		else:
			if current == "fishingrod":
				position.x = moveprosess3x[get_node("../inv1").frame]
				scale.x = moveprosess3s[get_node("../inv1").frame]
				scale.y = moveprosess3s[get_node("../inv1").frame]
			elif currentLeft == "fishingrod":
				position.x = moveprosess2x[get_node("../inv1").frame]
				scale.x = moveprosess2s[get_node("../inv1").frame]
				scale.y = moveprosess2s[get_node("../inv1").frame]
			elif currentRight == "fishingrod":
				position.x = moveprosess4x[get_node("../inv1").frame]
				scale.x = moveprosess4s[get_node("../inv1").frame]
				scale.y = moveprosess4s[get_node("../inv1").frame]
#				position.x = moveprosess1x[get_node("../inv1").frame]
#				scale.x = moveprosess1s[get_node("../inv1").frame]
#				scale.y = moveprosess1s[get_node("../inv1").frame]