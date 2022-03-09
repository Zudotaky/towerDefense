extends Area2D


var move:Vector2 = Vector2.ZERO
var speed = 3
var look_vec:Vector2
var target

func _ready():
	aim()

func _physics_process(delta):
	move = Vector2.ZERO
	move = move.move_toward(look_vec, delta)
	move = move.normalized() * speed
	global_position +=move

func aim():
	if target != null:
		$Sprite.look_at(target.global_position)
		print(global_position)
		look_vec = target.global_position - global_position
		$Timer.start()

func _on_Timer_timeout():
	queue_free()
