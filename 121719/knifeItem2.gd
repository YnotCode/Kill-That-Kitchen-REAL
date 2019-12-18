extends Sprite

# Declare member variables here. Examples:
# var a = 2
var pickedUp = false
var box = 0
var moveprosess1x = [328,328,328,328,360]
var moveprosess1s = [0,0,0,2,5]
var moveprosess2x = [372,410,460,510,540]
var moveprosess2s = [9,11,12.5,14,14]
var moveprosess3x = [560,580,625,660,690]
var moveprosess3s = [14,10,9.5,9,9]
var moveprosess4x = [712,712,708,708,708]
var moveprosess4s = [9,2,0,0,0]

func _process(delta):
	pickedUp = get_node("../../../knifeItem").pickedUp