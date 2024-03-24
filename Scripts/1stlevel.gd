extends Node2D


@onready var finished = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer2D.play()
	get_tree().create_timer(5).timeout
	

func _input(event):
	if finished:
		if event is InputEventKey:
			if event.keycode == KEY_ENTER and event.pressed:
				get_tree().change_scene_to_file("res://Scenes/Rooms/Room1.tscn")
	



func _on_button_game_4_reactor_full():
	var node = get_node("TileMap/Player/RichTextLabel")
	node.position = Vector2(0, 0)
	finished = true
	
