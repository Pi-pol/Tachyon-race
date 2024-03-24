extends TileMap



func _on_action_fild_area_entered(area):
	#$AudioStreamPlayer2D.play()
	set_cell(0, Vector2(9, 5), 0, Vector2(0, 2))
	set_cell(0, Vector2(9, 6), 0, Vector2(0, 3))
	set_cell(0, Vector2(10, 5), 0, Vector2(1, 2))
	set_cell(0, Vector2(10, 6), 0, Vector2(1, 3))
	set_cell(0, Vector2(11, 5), 0, Vector2(2, 2))
	set_cell(0, Vector2(11, 6), 0, Vector2(2, 3))
	pass
