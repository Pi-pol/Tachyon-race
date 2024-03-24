extends Node2D

signal itemCollected(Name)


func _on_action_fild_area_entered(area):
	itemCollected.emit("res://Scenes/item.tscn")
	queue_free()
