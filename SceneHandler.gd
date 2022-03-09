extends Node

onready var menu = $MainMenu
export(PackedScene) var game

func _ready():
	get_node("MainMenu/Margin/ButonContainer/Game").connect("pressed",self,"on_new_game_pressed")
	get_node("MainMenu/Margin/ButonContainer/quit").connect("pressed",self,"on_quit_pressed")

func on_new_game_pressed():
	menu.hide()
	var game_instance = game.instance()
	add_child(game_instance)

func on_quit_pressed():
	get_tree().quit()
