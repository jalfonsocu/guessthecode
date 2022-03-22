extends Node2D

var tilemap :TileMap
var tilemap_puntos :TileMap
var game_enabled_row = 1
var code_to_evaluate = [0,0,0,0,0]



# Called when the node enters the scene tree for the first time.
func _ready():
	tilemap = get_node( "TileMap")
	tilemap_puntos = get_node("TileMapPuntos")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	
	if event is InputEventMouseButton: #or InputEventScreenTouch:
		if event.pressed:
			var mouse :Vector2 = get_global_mouse_position()
			var cell :Vector2 = tilemap.world_to_map(mouse)
		
			var abc :int = tilemap.get_cellv(cell)
			if abc > -1 and cell[1] == game_enabled_row:
				var new_abc :int = (abc + 1) % 9 
				code_to_evaluate[cell[0]] = new_abc
				tilemap.set_cellv(cell, new_abc)


func _on_ButtonProbar_pressed():
	print(code_to_evaluate)
	print(Global.code)
	
	if code_to_evaluate[0] != 0 and code_to_evaluate[1] != 0 and code_to_evaluate[2] != 0 and code_to_evaluate[3] != 0 and code_to_evaluate[4] != 0:
		if code_to_evaluate == Global.code:
			print("iguales") # dar estado ganador
		else:
			var blancas = 0
			var negras = 0
			var temporal_code = Global.code.duplicate(true)
			var temporal_evaluate = code_to_evaluate.duplicate(true)
			
			for i in range(5):
				for j in range(5):
					if temporal_code[i] == temporal_evaluate[j] && temporal_evaluate[j] != -1:
						if(i == j):
							negras = negras +1
						else:
							blancas = blancas + 1 
						temporal_code[i] = -1
						temporal_evaluate[j] = -1
			
			#var cx :Vector2 = [[game_enabled_row,5]]
			tilemap_puntos.set_cellv(Vector2(5, game_enabled_row), blancas )
			tilemap_puntos.set_cellv(Vector2(6, game_enabled_row), negras + 5 +1)
			
			game_enabled_row = game_enabled_row + 1
			code_to_evaluate = [0,0,0,0,0]
	else:
		print("falta completar") # reemplazar con algo
	
