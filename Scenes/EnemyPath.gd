extends Path2D

onready var speed = $WaveSpeed
onready var enemyContainer = $enemys 
var enemis = load("res://Scenes/Enemy/Enemy.tscn")


func nextWave(number:int):
	var enemy
	for x in 10:
		enemy = enemis.instance()
		add_child(enemy)
		speed.start()
		yield(speed, "timeout")
