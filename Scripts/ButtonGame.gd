extends Node2D

signal door_button_pressed

func _on_action_fild_area_entered(area):
	door_button_pressed.emit()
	queue_free()
