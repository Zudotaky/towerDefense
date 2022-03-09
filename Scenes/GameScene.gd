extends Node2D

onready var UI = $UI
onready var towers_node = $towers
onready var enemyPath:Path2D = $EnemyPath
onready var map = $Map

var color_valido = Color("e3d4f00e")
var color_invalido = Color("e3bb1717")

var map_node

var build_mode = false
var build_valid = false
var build_location
var build_type

var wave = 0

func _ready():
	map_node = map.get_node("Route").get_node("Mapa")
	var curve= Curve2D.new()
	for point in map.getPath(Vector2(56,56),Vector2(46,-48)):
		curve.add_point(point)
	enemyPath.curve=curve
	for button in $UI/Hud/CraftButtons.get_children():
		button.connect("pressed",self,"initiate_build_mode", [button.get_name()])
	$UI/Hud/NextButton.connect("pressed",self,"initiate_wave", [wave])

func _process(delta):
	if build_mode :
		update_tower_preview()

func _input(event):
	if event.is_action("cancel_build") and build_mode:
		cancel_build()
	if event.is_action("build_tower") and build_valid:
		verify_build()
		cancel_build()

func initiate_build_mode(tower_type):
	build_type = tower_type
	build_mode = true
	UI.set_tower_preview(get_global_mouse_position())

func update_tower_preview():
	var mouse_position = get_global_mouse_position()
	var current_tilte = map_node.world_to_map(map_node.to_local(mouse_position))
	var tilte_position = map_node.map_to_world(current_tilte)
	if  canBuildIn(current_tilte):
		UI.update_tower_preview(tilte_position,color_valido)
		build_valid = true
		build_location = tilte_position
	else:
		UI.update_tower_preview(tilte_position,color_invalido)
		build_valid = false

func verify_build():
	var tower = load("res://Scenes/Towers/torre.tscn").instance()
	tower.set_name(str(build_location.x) + " " + str(build_location.y))
	towers_node.add_child(tower)
	tower.global_position = build_location
	tower.activate()
	changeBuildGround(map_node.world_to_map(build_location))
	build_location = null

func cancel_build():
	build_mode = false
	build_valid = false
	UI.freePreview()

func canBuildIn(tilte:Vector2):
	var cellUp = map_node.get_cellv(tilte) == 0
	var cellLeft = map_node.get_cellv(tilte - Vector2(0,1)) == 0
	var cellRight = map_node.get_cellv(tilte - Vector2(1,0)) == 0
	var cellDown = map_node.get_cellv(tilte - Vector2(1,1)) == 0
	return cellDown and cellLeft and cellRight and cellUp

func changeBuildGround(tilte:Vector2):
	map_node.set_cellv(tilte ,2)
	map_node.set_cellv(tilte - Vector2(0,1) , 2)
	map_node.set_cellv(tilte - Vector2(1,0) , 2)
	map_node.set_cellv(tilte - Vector2(1,1) , 2)

func initiate_wave(wave):
	$EnemyPath.nextWave(wave)
