extends Node2D

@onready var in_zone = false



func _input(event):
	if not event is InputEventKey:
		return
	print(in_zone)
	print(event.keycode)
	if event.keycode == KEY_E and in_zone:
		var world = get_node(".")
		print("wololo")
		var scene = load("res://Scenes/wires.tscn")
		var instance = scene.instantiate()
		#instance.Transform2D(0,Vector2(0.6,0.6),0,instance.position)
		world.add_sibling(instance,false)
		print("wwohaha")




func _on_action_fild_area_entered(area):
	in_zone=area
	print(in_zone)
