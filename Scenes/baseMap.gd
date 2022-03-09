extends Node2D



func getPath(start:Vector2 ,end:Vector2):
	var route =$Route.get_simple_path($Position2D.position,$Position2D2.position,false)
	return route
	
