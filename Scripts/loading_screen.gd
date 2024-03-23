extends Node2D

@onready var animation_intro = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	animation_intro.play("clock_anim")
	animation_intro.play("fade_in_loading")
	
	get_tree().create_timer(3).timeout.connect(fade_out_anim)
	
	
func fade_out_anim():
	animation_intro.play("fade_out_anim")
	get_tree().create_timer(3).timeout.connect(start_game)
	
func start_game():
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
