extends PathFollow2D

var heal = 5
var speed = 30


func _physics_process(delta):
	offset += speed * delta
	if offset >= 10000:
		queue_free()


func _on_body_area_entered(area:Area2D):
	if area.is_in_group("Proyectile"):
		area.queue_free()
		heal -= 1
		if heal <= 0:
			queue_free() 
