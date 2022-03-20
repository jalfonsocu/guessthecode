extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var tilemap


# Called when the node enters the scene tree for the first time.
func _ready():
	tilemap = get_node( "TileMap")
	
	print(Global.code)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	
	if event is InputEventMouseButton: #or InputEventScreenTouch:
		if event.pressed:
			var mouse :Vector2 = get_global_mouse_position()
			var cell :Vector2 = tilemap.world_to_map(mouse)
		
			print(cell)
		
			var abc :int = tilemap.get_cellv(cell)
			var new_abc :int = (abc + 1) % 9 
			tilemap.set_cellv(cell, new_abc)
	
