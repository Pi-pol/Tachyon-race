extends Control

@onready var drop_down_menu = $containers/resolutionsOptionButton
@onready var MASTER_BUS_ID = AudioServer.get_bus_index("Master")

var settings_file = "settings.json"
var whole_settings = {"fullscreen": false, "volume": 1, "resolution": 0}


func add_items():
	drop_down_menu.add_item("1280x720")
	drop_down_menu.add_item("1600x900")
	drop_down_menu.add_item("1920x1080")
# Called when the node enters the scene tree for the first time.
func _ready():
	var slider = get_node("containers/master")
	var json_as_text = FileAccess.get_file_as_string(settings_file)
	if json_as_text:
		whole_settings = JSON.parse_string(json_as_text)
	print(whole_settings)
	slider.value = whole_settings["volume"]
	_on_master_value_changed(whole_settings["volume"])
	_on_resolutions_option_button_item_selected(whole_settings["resolution"])
	if whole_settings["fullscreen"]:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	print(whole_settings)
	add_items()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_back_to_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")
	var json_as_text = JSON.stringify(whole_settings)
	var settings_as_file = FileAccess.open(settings_file, FileAccess.WRITE)
	settings_as_file.store_string(json_as_text)
	


func _on_check_button_toggled(toggled_on):
	if toggled_on == true:
		whole_settings["fullscreen"] = true 
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		whole_settings["fullscreen"] = false
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)



func _on_resolutions_option_button_item_selected(index):
	var current_selected = index
	
	if current_selected == 0:
		whole_settings["resolution"] = 0
		get_window().size = Vector2i(1280,720)
	elif current_selected == 1:
		whole_settings["resolution"] = 1
		get_window().size = Vector2i(1600,900)
	elif current_selected == 2:
		whole_settings["resolution"] = 2
		get_window().size = Vector2i(1920,1080)


func _on_master_value_changed(value):
	whole_settings["volume"] = value
	var volume = linear_to_db(value)
	AudioServer.set_bus_volume_db(0, volume)
	AudioServer.set_bus_mute(0, value < 0.05)
	
	
