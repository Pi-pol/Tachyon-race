extends TileMap



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		pass


func _on_button_game_door_button_pressed():
	$AudioStreamPlayer2D.play()
	#print("Pressed")
	set_cell(0, Vector2(6, 2), 0, Vector2(0, 2))
	set_cell(0, Vector2(6, 3), 0, Vector2(0, 3))
	set_cell(0, Vector2(7, 2), 0, Vector2(1, 2))
	set_cell(0, Vector2(7, 3), 0, Vector2(1, 3))
	set_cell(0, Vector2(8, 2), 0, Vector2(2, 2))
	set_cell(0, Vector2(8, 3), 0, Vector2(2, 3))
	

	

func _on_button_game_2_door_button_2_pressed():
	$AudioStreamPlayer2D.play()
	set_cell(0, Vector2(16, 2), 0, Vector2(0, 2))
	set_cell(0, Vector2(16, 3), 0, Vector2(0, 3))
	set_cell(0, Vector2(17, 2), 0, Vector2(1, 2))
	set_cell(0, Vector2(17, 3), 0, Vector2(1, 3))
	set_cell(0, Vector2(18, 2), 0, Vector2(2, 2))
	set_cell(0, Vector2(18, 3), 0, Vector2(2, 3))
	pass
	
