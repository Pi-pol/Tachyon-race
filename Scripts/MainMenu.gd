extends Node

func _ready():
	var startButton = get_node("StartButton")
	startButton.pressed.connect(self._on_button_pressed)
	
func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/1stlevel.tscn")
	
