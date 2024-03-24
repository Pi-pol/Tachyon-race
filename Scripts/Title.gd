extends Node2D


# Called when the node enters the scene tree for the first time.
@onready var animation_intro = $AnimationPlayer
var settings_file = "settings.json"
var whole_settings = {"fullscreen": false, "volume": 1, "resolution": 0}

func _ready():
	var json_as_text = FileAccess.get_file_as_string(settings_file)
	if json_as_text:
		whole_settings = JSON.parse_string(json_as_text)
		
	if whole_settings["resolution"] == 0:
		get_window().size = Vector2i(1280,720)
	elif whole_settings["resolution"] == 1:
		get_window().size = Vector2i(1600,900)
	elif whole_settings["resolution"] == 2:
		get_window().size = Vector2i(1920,1080)
		
	if whole_settings["fullscreen"] == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	var volume = linear_to_db(whole_settings["volume"])
	AudioServer.set_bus_volume_db(0, whole_settings["volume"])
	AudioServer.set_bus_mute(0, whole_settings["volume"] < 0.05)
	
	animation_intro.play("Fade_in")
	get_tree().create_timer(3).timeout.connect(fade_out)
	
func fade_out():
	animation_intro.play("fade_out")
	get_tree().create_timer(3).timeout.connect(start_menu_scene)
	
func start_menu_scene():
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")
	
func _input(event):
	if event is InputEvent and event.is_pressed():
		start_menu_scene()
	
