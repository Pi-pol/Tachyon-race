extends Node

func _ready():
	var startButton = get_node("GridContainer/StartButton")
	startButton.pressed.connect(self._start_button_pressed)	
	var settingsButton = get_node("GridContainer/SettingsButton")
	settingsButton.pressed.connect(self._settings_button_pressed)
	
func _start_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/1stlevel.tscn")
	
func _settings_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/settings.tscn")
	

	
	
