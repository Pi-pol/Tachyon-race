extends Node2D

signal ItemPickupArea()

func _on_action_fild_area_entered(area):
	print("pick up area")
	ItemPickupArea.emit()
