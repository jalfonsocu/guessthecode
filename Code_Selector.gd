extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var tilemap :TileMap
var label_error :Label
var code = [0,0,0,0,0]

# Called when the node enters the scene tree for the first time.
func _ready():
	tilemap = get_node( "TileMap")
	label_error = get_node( "Label2")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if event is InputEventMouseButton: #or InputEventScreenTouch:
		if event.pressed:
			var mouse :Vector2 = get_global_mouse_position()
			var cell :Vector2 = tilemap.world_to_map(mouse)
			
			var abc :int = tilemap.get_cellv(cell)
			if(abc != -1):
				var new_abc :int = (abc + 1) % 9 # verificar esto, no da correcto
				code[cell[0] -1 ] = new_abc
				tilemap.set_cellv(cell, new_abc)


func _on_Button_pressed():
	if code[0] == 0 or code[1] == 0 or code[2] == 0 or code[3] == 0 or code[4] == 0:
		label_error.text = "Debes escoger un color en cada casilla"
	else:
		Global.code = code
		var main_scene = preload("res://Main.tscn")
		get_tree().change_scene_to(main_scene)
