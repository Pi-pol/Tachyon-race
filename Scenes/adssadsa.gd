extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_action_fild_area_entered(area): 
	set_cell(0, Vector2(6, 3), 0, Vector2(0, 2))
	set_cell(0, Vector2(6, 4), 0, Vector2(0, 3))
	set_cell(0, Vector2(7, 3), 0, Vector2(1, 2))
	set_cell(0, Vector2(7, 4), 0, Vector2(1, 3))
	set_cell(0, Vector2(8, 3), 0, Vector2(2, 2))
	set_cell(0, Vector2(8, 4), 0, Vector2(2, 3))
	(10, 12)
	set_cell(0, Vector2(6, 3), 0, Vector2(0, 2))
	set_cell(0, Vector2(6, 4), 0, Vector2(0, 3))
	set_cell(0, Vector2(7, 3), 0, Vector2(1, 2))
	set_cell(0, Vector2(7, 4), 0, Vector2(1, 3))
	set_cell(0, Vector2(8, 3), 0, Vector2(2, 2))
	set_cell(0, Vector2(8, 4), 0, Vector2(2, 3))
