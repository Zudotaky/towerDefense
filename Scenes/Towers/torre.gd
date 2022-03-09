extends Node2D

onready var weapon:Area2D = $Weapon
onready var area:CollisionShape2D = $Weapon/Area
onready var bulletHolder:YSort = $bulletHold
export(PackedScene) onready var bullet
var enemys:Array = []


func _ready():
	set_physics_process(false)

func _physics_process(delta):
	pass

func activate():
	weapon.show()
	$cadencia.start()
#	set_physics_process(true)

func shoot():
	var bulletNew = bullet.instance()
	bulletNew.target = enemys[0]
	bulletHolder.add_child(bulletNew)

func _on_Weapon_area_entered(area:Area2D):
	if area.is_in_group("Enemy") :
		enemys.append(area)

func _on_Weapon_area_exited(area:Area2D):
	if area.is_in_group("Enemy"):
		enemys.erase(area)

func _on_Timer_timeout():
	if enemys != []:
		shoot()

