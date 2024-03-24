extends Node2D

@onready var in_zone = false



func _input(event):
	if not event is InputEventKey:
		return
	if event.keycode == KEY_E and in_zone:
		var world = get_node(".")
		print("wololo")
		var pause = load("res://Scenes/wires.gtscn")
		var object = pause.instantiate()
		world.add_child(object)

func _on_action_fild_area_entered(area):
	in_zone=area
	print(in_zone)
