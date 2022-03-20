extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button1P_pressed():
	
	var code = [0,0,0,0,0]
	for i in range(5):
		code[i] = randi() % 8 + 1
	
	Global.code = code
	Global.game_mode = 1
	var main_scene = preload("res://Main.tscn")
	get_tree().change_scene_to(main_scene)
	


func _on_Button2P_pressed():
	Global.game_mode = 2
	var code_selector_scene = preload("res://Code_Selector.tscn")
	get_tree().change_scene_to(code_selector_scene)
