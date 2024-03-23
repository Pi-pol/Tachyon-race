extends Node2D


# Called when the node enters the scene tree for the first time.
@onready var animation_intro = $AnimationPlayer

func _ready():
	animation_intro.play("Fade_in")
	get_tree().create_timer(3).timeout.connect(fade_out)
	
func fade_out():
	animation_intro.play("fade_out")
	get_tree().create_timer(3).timeout.connect(start_menu_scene)
	
func start_menu_scene():
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
	
func _input(event):
	if event is InputEvent and event.is_pressed():
		start_menu_scene()
	
