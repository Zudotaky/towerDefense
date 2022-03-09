extends Node2D

# arriva, izquierda , abajo , derecha
var connectPoints = [Vector2(5,0),Vector2(0,5),Vector2(10,5),Vector2(5,10)]

var Paths = []

func _ready():
	randomize()
	
func _input(event):
	var points = connectPoints.duplicate()
	var start = points.pop_at(randi() % points.size())
	var end = points.pop_at(randi() % points.size())
	var camino = randi() % 9
	if camino > 3:
		camino = randi() % 9
	if camino > 6:
		camino = randi() % 9
	if event.is_action("ui_accept"):
		connectPoints(start,end, camino)

func connectPoints(start ,end, path):
	var cordinates = []
	match path:
		0:
			cordinates.append(start)
			cordinates.append(Vector2(5,5))
			cordinates.append(end)
#			dirrect path
		1:
			pass
#			circular path
		2:
			pass
#			zigzag path
		3:
			pass
#			doble rect exit
		4:
			pass
#			doble circular exit
		5:
			pass
#			doble zigzag exit
		6:
			pass
#			tiple rect exit
		7:
			pass
#			tiple circular exit
		8:
			pass
#			tiple zigzag exit

func pickSecondExit(start,end):
	pass

func rectPath(start,end):
	var path = []
	var miny = min(start.y,end.y)
	var maxy = max(start.y,end.y)
	
	for x in abs(start.x - end.x):
		pass
