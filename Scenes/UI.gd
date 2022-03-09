extends CanvasLayer

onready var tower_preview = $tower_preview
var isBuilding = false

func set_tower_preview(mouse_position):
	if not isBuilding:
		isBuilding = true
		var drag_tower = load("res://Scenes/Towers/torre.tscn").instance()
		drag_tower.set_name("DragTower")
		drag_tower.modulate = Color("8533d221")
		tower_preview.add_child(drag_tower,true)
		tower_preview.rect_position = mouse_position
		tower_preview.show()
		tower_preview.show_behind_parent = true

func update_tower_preview(mouse_position,color):
	tower_preview.rect_position = mouse_position
	if tower_preview.modulate != color:
		tower_preview.modulate = color

func freePreview():
	tower_preview.get_child(1).queue_free()
	tower_preview.hide()
	isBuilding = false
