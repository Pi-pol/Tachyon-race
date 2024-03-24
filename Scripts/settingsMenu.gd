extends Control

@onready var drop_down_menu = $containers/resolutionsOptionButton

func add_items():
	drop_down_menu.add_item("1280x720")
	drop_down_menu.add_item("1600x900")
	drop_down_menu.add_item("1920x1080")
# Called when the node enters the scene tree for the first time.
func _ready():
	add_items()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_back_to_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")


func _on_check_button_toggled(toggled_on):
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)



func _on_resolutions_option_button_item_selected(index):
	var current_selected = index
	
	if current_selected == 0:
		get_window().size = Vector2i(1280,720)
	elif current_selected == 1:
		get_window().size = Vector2i(1600,900)
	elif current_selected == 2:
		get_window().size = Vector2i(1920,1080)
